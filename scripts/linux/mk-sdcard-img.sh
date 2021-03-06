#!/bin/bash

# Return uncompressed size for the given tar.xz file
# $1: XZ file path
getUncompressedFileSize() {
    lsize=$(xz --robot --list "${1}" | grep -E '^totals' | cut -d $'\t' -f5,5)
    if test -z "${lsize}"
    then
	return 1
    fi

    # add a 1.5 ratio for future updates
    let lsize=${lsize}*15/10

    # minimize the size (it's difficult to tell how /boot will be in the future)
    #lfat32_minimum=33548800 = 32mb, but i suggest a minimum oof 64mb
    lminimum=67108864

    if test "${lsize}" -lt "${lminimum}"
    then
	lsize=${lminimum}
    fi

    echo ${lsize}
    return 0
}

cleanExit() {
    test -n "${SDCARD_BOOT_PWD}" && umount "${SDCARD_BOOT_PWD}"
    test -n "${SDCARD_ROOT_PWD}" && umount "${SDCARD_ROOT_PWD}"
    test -n "${LOOP}"            && losetup -d "${LOOP}"
    exit 1
}

print_usage() {
    echo "${1} [--help|-h] [-z] -o FILE -ad DIRECTORY"
    echo "--help -h: print this help"
    echo "-o FILE: output file (.zip is added if -z is set)"
    echo "-ad DIRECTORY: directory containing the boot and root archives"
    echo "-z: compress the output image"
}

### MAIN ###
# clean when badly killed
trap cleanExit SIGINT

if [ "${USER}" != "root" ]; then
    echo "This script must be runned as root user."
    exit 1
fi

# 1) parameters
# 1.1) parse arguments
IMGCOMPRESS=0
SDCARD_IMG_FILE_PATH=
ARIMAGES_PWD=
while test "${#}" -gt 0
do
    case "${1}" in
	"--help"|"-h")
	    print_usage "${0}"
	    exit 0
	    ;;
	"-o")
	    SDCARD_IMG_FILE_PATH=${2}
	    shift
	    ;;
	"-ad")
	    ARIMAGES_PWD=${2}
	    shift
	    ;;
	"-z")
	    IMGCOMPRESS=1
	    ;;
	*)
	    print_usage "${0}"
	    exit 0
    esac
    shift
done

# 1.2) initialize parameters if not done by options
# find the *.tar.xz directory
if test -z "${ARIMAGES_PWD}"
then
    echo >&2
    echo "Error: Please set the archive directory path" >&2
    ScriptDir=$(dirname ${0})
    echo "Hint: -ad ${ScriptDir}/../../output/images/recalbox" >&2
    echo >&2
    print_usage
    exit 1
fi

# define the img output file
if test -z "${SDCARD_IMG_FILE_PATH}"
then
    echo >&2
    echo "Error: Please set the output image file" >&2
    ScriptDir=$(dirname ${0})
    echo "Hint: -o ${ScriptDir}/../../output/sdimg/recalbox.img" >&2
    echo >&2
    print_usage
    exit 1
fi

# 1.3) check the parameters

# check that root.tar.xz and boot.tar.xz are here
for FILE in "boot.tar.xz" "root.tar.xz"
do
    if ! test -e "${ARIMAGES_PWD}/${FILE}"
    then
	echo "The file ${ARIMAGES_PWD}/${FILE} is missing" >&2
	exit 1
    fi
done

# 2) Prerequisites : directories and sizes
SDCARD_PWD="/tmp/recalbox_mksdcard${$}"
SDCARD_BOOT_PWD="${SDCARD_PWD}/boot"
SDCARD_ROOT_PWD="${SDCARD_PWD}/root"
SDCARD_BOOT_SIZE=$(getUncompressedFileSize "${ARIMAGES_PWD}/boot.tar.xz")
SDCARD_ROOT_SIZE=$(getUncompressedFileSize "${ARIMAGES_PWD}/root.tar.xz")

if test -z "${SDCARD_BOOT_SIZE}" -o -z "${SDCARD_ROOT_SIZE}"
then
    echo "Unable to determine archive sizes" >&2
    exit 1
fi

let SDCARD_SIZE=${SDCARD_BOOT_SIZE}+${SDCARD_ROOT_SIZE}

echo "* Build Root images directory: ${ARIMAGES_PWD}"
echo "* SD Card image file path: ${SDCARD_IMG_FILE_PATH}"
echo "* SD Card temporary: ${SDCARD_PWD}"
echo "* SD Card guessed size: $((${SDCARD_SIZE}/1024/1024)) MiB ("$((${SDCARD_BOOT_SIZE}/1024/1024))" MiB + "$((${SDCARD_ROOT_SIZE}/1024/1024))" MiB)"
echo

# Create missing directories
mkdir -p $(dirname "${SDCARD_IMG_FILE_PATH}")
mkdir -p "${SDCARD_PWD}"
mkdir -p "${SDCARD_BOOT_PWD}"
mkdir -p "${SDCARD_ROOT_PWD}"

# 3) Create virtual sdcard
echo "Creating sdcard image..."
if ! dd if=/dev/zero of="${SDCARD_IMG_FILE_PATH}"  bs=${SDCARD_SIZE} count=1 >/dev/null 2>/dev/null
then
    exit 1
fi

echo "Creating partitions..."
let SDCARD_BOOT_KSIZE=${SDCARD_BOOT_SIZE}/1024
if ! (
    echo -e "o" ; # Erase partition table

    echo -e "n" ; # New partition
    echo -e "p" ; # Primary partition
    echo -e "1" ; # Partition 1 (Boot)
    echo -e ""  ; # default - Start after preceding partition
    echo -e "+${SDCARD_BOOT_KSIZE}K" ; # Boot partition size

    echo -e "n" ; # New partition
    echo -e "p" ; # Primary partition
    echo -e "2" ; # Partition 2 (Root)
    echo -e ""  ; # default - Start after preceding partition
    echo -e "" ; # default - Use all available space

    echo -e "a" ; # Make partition bootable
    echo -e "1" ; # Set partition 1 bootable

    echo -e "t" ; # Change partition type
    echo -e "1" ; # Of partition 1
    echo -e "b" ; # Set WIN95 / FAT 32

    echo -e "t" ; # Change partition type
    echo -e "2" ; # Of partition 2
    echo -e "83"; # Set Linux

    echo -e "p" ; # Print partition table
    echo -e "w" ; # Write partition table
    echo -e "q" ; # Quit
) | fdisk "${SDCARD_IMG_FILE_PATH}" >/dev/null 2>/dev/null
then
    exit 1
fi

EXITCODE=1
LOOP=$(losetup -f)
if test -z "${LOOP}"
then
    exit 1
fi

# add the -P while sometimes, partitions are not reread
if ! losetup -P "${LOOP}" "${SDCARD_IMG_FILE_PATH}"
then
    exit 1
fi

SDCARD_P1_FILE_PATH="${LOOP}p1"
SDCARD_P2_FILE_PATH="${LOOP}p2"

echo "Formatting partitions..."
if mkfs.vfat -F 32 -n "BOOT" "${SDCARD_P1_FILE_PATH}" > /dev/null
then
    if mkfs.ext4 -L "RECALBOX" "${SDCARD_P2_FILE_PATH}" > /dev/null
    then
	if mount -o loop "${SDCARD_P1_FILE_PATH}" "${SDCARD_BOOT_PWD}"
	then
	    if mount -o loop "${SDCARD_P2_FILE_PATH}" "${SDCARD_ROOT_PWD}"
	    then
		echo "Writing partitions..."
		if tar --no-same-permissions --no-same-owner -xf "${ARIMAGES_PWD}/boot.tar.xz" -C "${SDCARD_BOOT_PWD}"
		then
		    if tar -xf "${ARIMAGES_PWD}/root.tar.xz" -C "${SDCARD_ROOT_PWD}"
		    then
			sync
		    	EXITCODE=0
		    fi
		fi
		if ! umount "${SDCARD_ROOT_PWD}"
		then
		    EXITCODE=1
		fi
	    fi
	    if ! umount "${SDCARD_BOOT_PWD}"
	    then
		EXITCODE=1
	    fi
	fi
    fi
fi

echo "Syncing..."
sync

if ! losetup -d "${LOOP}"
then
    EXITCODE=1
fi

if test "${EXITCODE}" = 1
then
    rm "${SDCARD_IMG_FILE_PATH}"
    echo "Failed." >&2
    exit 1
fi

# compression
if test "${IMGCOMPRESS}" = 1
then
    echo "Compressing..."
    if ! zip -q "${SDCARD_IMG_FILE_PATH}.zip" "${SDCARD_IMG_FILE_PATH}"
    then
	rm "${SDCARD_IMG_FILE_PATH}"
	exit 1
    fi
    rm "${SDCARD_IMG_FILE_PATH}"
    SDCARD_IMG_FILE_PATH="${SDCARD_IMG_FILE_PATH}.zip"
fi
    
echo "Output: ${SDCARD_IMG_FILE_PATH}"
echo
echo "Done."
