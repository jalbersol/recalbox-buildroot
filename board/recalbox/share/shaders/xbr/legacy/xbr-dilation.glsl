// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying 
#define COMPAT_ATTRIBUTE attribute 
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec4 _t7;
COMPAT_VARYING     vec4 _t6;
COMPAT_VARYING     vec4 _t5;
COMPAT_VARYING     vec4 _t4;
COMPAT_VARYING     vec4 _t3;
COMPAT_VARYING     vec4 _t2;
COMPAT_VARYING     vec4 _t1;
COMPAT_VARYING     vec2 _texCoord2;
COMPAT_VARYING     vec4 _color1;
COMPAT_VARYING     vec4 _position1;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
};
struct out_vertex {
    vec4 _position1;
    vec4 _color1;
    vec2 _texCoord2;
    vec4 _t1;
    vec4 _t2;
    vec4 _t3;
    vec4 _t4;
    vec4 _t5;
    vec4 _t6;
    vec4 _t7;
};
out_vertex _ret_0;
input_dummy _IN1;
vec4 _r0008;
COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 COLOR;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 COL0;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
COMPAT_VARYING vec4 TEX3;
COMPAT_VARYING vec4 TEX4;
COMPAT_VARYING vec4 TEX5;
COMPAT_VARYING vec4 TEX6;
COMPAT_VARYING vec4 TEX7;
 
uniform mat4 MVPMatrix;
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    out_vertex _OUT;
    vec2 _ps;
    vec2 _texCoord;
    _r0008 = VertexCoord.x*MVPMatrix[0];
    _r0008 = _r0008 + VertexCoord.y*MVPMatrix[1];
    _r0008 = _r0008 + VertexCoord.z*MVPMatrix[2];
    _r0008 = _r0008 + VertexCoord.w*MVPMatrix[3];
    _ps = vec2(1.00000000E+00/TextureSize.x, 1.00000000E+00/TextureSize.y);
    _texCoord = TexCoord.xy + vec2( 1.00000001E-07, 1.00000001E-07);
    _OUT._t1 = _texCoord.xxxy + vec4(-_ps.x, 0.00000000E+00, _ps.x, -2.00000000E+00*_ps.y);
    _OUT._t2 = _texCoord.xxxy + vec4(-_ps.x, 0.00000000E+00, _ps.x, -_ps.y);
    _OUT._t3 = _texCoord.xxxy + vec4(-_ps.x, 0.00000000E+00, _ps.x, 0.00000000E+00);
    _OUT._t4 = _texCoord.xxxy + vec4(-_ps.x, 0.00000000E+00, _ps.x, _ps.y);
    _OUT._t5 = _texCoord.xxxy + vec4(-_ps.x, 0.00000000E+00, _ps.x, 2.00000000E+00*_ps.y);
    _OUT._t6 = _texCoord.xyyy + vec4(-2.00000000E+00*_ps.x, -_ps.y, 0.00000000E+00, _ps.y);
    _OUT._t7 = _texCoord.xyyy + vec4(2.00000000E+00*_ps.x, -_ps.y, 0.00000000E+00, _ps.y);
    _ret_0._position1 = _r0008;
    _ret_0._color1 = COLOR;
    _ret_0._texCoord2 = _texCoord;
    _ret_0._t1 = _OUT._t1;
    _ret_0._t2 = _OUT._t2;
    _ret_0._t3 = _OUT._t3;
    _ret_0._t4 = _OUT._t4;
    _ret_0._t5 = _OUT._t5;
    _ret_0._t6 = _OUT._t6;
    _ret_0._t7 = _OUT._t7;
    gl_Position = _r0008;
    COL0 = COLOR;
    TEX0.xy = _texCoord;
    TEX1 = _OUT._t1;
    TEX2 = _OUT._t2;
    TEX3 = _OUT._t3;
    TEX4 = _OUT._t4;
    TEX5 = _OUT._t5;
    TEX6 = _OUT._t6;
    TEX7 = _OUT._t7;
    return;
    COL0 = _ret_0._color1;
    TEX0.xy = _ret_0._texCoord2;
    TEX1 = _ret_0._t1;
    TEX2 = _ret_0._t2;
    TEX3 = _ret_0._t3;
    TEX4 = _ret_0._t4;
    TEX5 = _ret_0._t5;
    TEX6 = _ret_0._t6;
    TEX7 = _ret_0._t7;
} 
#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif
COMPAT_VARYING     vec4 _t7;
COMPAT_VARYING     vec4 _t6;
COMPAT_VARYING     vec4 _t5;
COMPAT_VARYING     vec4 _t4;
COMPAT_VARYING     vec4 _t3;
COMPAT_VARYING     vec4 _t2;
COMPAT_VARYING     vec4 _t1;
COMPAT_VARYING     vec2 _texCoord;
COMPAT_VARYING     vec4 _color;
struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
};
struct out_vertex {
    vec4 _color;
    vec2 _texCoord;
    vec4 _t1;
    vec4 _t2;
    vec4 _t3;
    vec4 _t4;
    vec4 _t5;
    vec4 _t6;
    vec4 _t7;
};
vec4 _ret_0;
float _TMP59;
float _TMP58;
float _TMP57;
vec3 _TMP49;
vec3 _TMP51;
vec3 _TMP53;
vec3 _TMP55;
vec3 _TMP56;
vec3 _TMP54;
vec3 _TMP52;
vec3 _TMP50;
vec3 _TMP41;
vec3 _TMP43;
vec3 _TMP45;
vec3 _TMP47;
vec3 _TMP48;
vec3 _TMP46;
vec3 _TMP44;
vec3 _TMP42;
vec4 _TMP40;
vec4 _TMP33;
vec4 _TMP32;
bvec4 _TMP31;
bvec4 _TMP30;
bvec4 _TMP29;
bvec4 _TMP28;
bvec4 _TMP27;
bvec4 _TMP26;
bvec4 _TMP25;
bvec4 _TMP24;
bvec4 _TMP23;
bvec4 _TMP22;
bvec4 _TMP21;
vec4 _TMP20;
vec4 _TMP19;
vec4 _TMP18;
vec4 _TMP17;
vec4 _TMP16;
vec4 _TMP15;
vec4 _TMP14;
vec4 _TMP13;
vec4 _TMP12;
vec4 _TMP11;
vec4 _TMP10;
vec4 _TMP9;
vec4 _TMP8;
vec4 _TMP7;
vec4 _TMP6;
vec4 _TMP5;
vec4 _TMP4;
vec4 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
vec4 _TMP0;
uniform sampler2D Texture;
input_dummy _IN1;
vec2 _x0079;
vec4 _r0123;
vec4 _r0133;
vec4 _r0143;
vec4 _r0153;
vec4 _r0163;
vec4 _r0173;
vec4 _TMP184;
vec4 _a0187;
vec4 _TMP190;
vec4 _a0193;
vec4 _TMP196;
vec4 _a0199;
vec4 _TMP202;
vec4 _a0205;
vec4 _TMP208;
vec4 _a0211;
vec4 _TMP214;
vec4 _a0217;
vec4 _TMP220;
vec4 _a0223;
vec4 _TMP226;
vec4 _a0229;
vec4 _TMP232;
vec4 _a0235;
vec4 _TMP238;
vec4 _a0241;
vec4 _TMP244;
vec4 _a0247;
vec4 _TMP250;
vec4 _a0253;
vec4 _TMP254;
vec4 _a0257;
vec4 _TMP258;
vec4 _a0261;
vec4 _TMP262;
vec4 _a0265;
vec4 _TMP266;
vec4 _a0269;
vec4 _TMP272;
vec4 _a0275;
vec4 _TMP276;
vec4 _a0279;
vec4 _TMP280;
vec4 _a0283;
vec4 _TMP284;
vec4 _a0287;
vec4 _TMP288;
vec4 _a0291;
vec4 _TMP292;
vec4 _a0295;
vec4 _TMP296;
vec4 _a0299;
vec4 _TMP300;
vec4 _a0303;
vec4 _TMP304;
vec4 _a0307;
vec4 _TMP308;
vec4 _a0311;
vec4 _TMP312;
vec4 _a0315;
vec4 _t0317;
vec3 _df0319;
vec3 _a0321;
vec3 _df0323;
vec3 _a0325;
COMPAT_VARYING vec4 TEX0;
COMPAT_VARYING vec4 TEX1;
COMPAT_VARYING vec4 TEX2;
COMPAT_VARYING vec4 TEX3;
COMPAT_VARYING vec4 TEX4;
COMPAT_VARYING vec4 TEX5;
COMPAT_VARYING vec4 TEX6;
COMPAT_VARYING vec4 TEX7;
 
uniform int FrameDirection;
uniform int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
void main()
{
    bvec4 _edr;
    bvec4 _edr_left;
    bvec4 _edr_up;
    bvec4 _px;
    bvec4 _interp_restriction_lv1;
    bvec4 _interp_restriction_lv2_left;
    bvec4 _interp_restriction_lv2_up;
    bvec4 _nc;
    bvec4 _fxd;
    bvec4 _fxd_left;
    bvec4 _fxd_up;
    bvec4 _fxe;
    bvec4 _fxe_left;
    bvec4 _fxe_up;
    vec2 _fp;
    bvec4 _dilation;
    vec3 _res;
    _x0079 = TEX0.xy*TextureSize;
    _fp = fract(_x0079);
    _TMP0 = COMPAT_TEXTURE(Texture, TEX1.xw);
    _TMP1 = COMPAT_TEXTURE(Texture, TEX1.yw);
    _TMP2 = COMPAT_TEXTURE(Texture, TEX1.zw);
    _TMP3 = COMPAT_TEXTURE(Texture, TEX2.xw);
    _TMP4 = COMPAT_TEXTURE(Texture, TEX2.yw);
    _TMP5 = COMPAT_TEXTURE(Texture, TEX2.zw);
    _TMP6 = COMPAT_TEXTURE(Texture, TEX3.xw);
    _TMP7 = COMPAT_TEXTURE(Texture, TEX3.yw);
    _TMP8 = COMPAT_TEXTURE(Texture, TEX3.zw);
    _TMP9 = COMPAT_TEXTURE(Texture, TEX4.xw);
    _TMP10 = COMPAT_TEXTURE(Texture, TEX4.yw);
    _TMP11 = COMPAT_TEXTURE(Texture, TEX4.zw);
    _TMP12 = COMPAT_TEXTURE(Texture, TEX5.xw);
    _TMP13 = COMPAT_TEXTURE(Texture, TEX5.yw);
    _TMP14 = COMPAT_TEXTURE(Texture, TEX5.zw);
    _TMP15 = COMPAT_TEXTURE(Texture, TEX6.xy);
    _TMP16 = COMPAT_TEXTURE(Texture, TEX6.xz);
    _TMP17 = COMPAT_TEXTURE(Texture, TEX6.xw);
    _TMP18 = COMPAT_TEXTURE(Texture, TEX7.xy);
    _TMP19 = COMPAT_TEXTURE(Texture, TEX7.xz);
    _TMP20 = COMPAT_TEXTURE(Texture, TEX7.xw);
    _r0123.x = dot(_TMP4.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0123.y = dot(_TMP6.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0123.z = dot(_TMP10.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0123.w = dot(_TMP8.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0133.x = dot(_TMP5.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0133.y = dot(_TMP3.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0133.z = dot(_TMP9.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0133.w = dot(_TMP11.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0143.x = dot(_TMP7.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0143.y = dot(_TMP7.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0143.z = dot(_TMP7.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0143.w = dot(_TMP7.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0153.x = dot(_TMP20.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0153.y = dot(_TMP2.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0153.z = dot(_TMP15.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0153.w = dot(_TMP12.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0163.x = dot(_TMP14.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0163.y = dot(_TMP18.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0163.z = dot(_TMP0.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0163.w = dot(_TMP17.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0173.x = dot(_TMP13.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0173.y = dot(_TMP19.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0173.z = dot(_TMP1.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _r0173.w = dot(_TMP16.xyz, vec3( 1.43519993E+01, 2.81760006E+01, 5.47200012E+00));
    _fxd = bvec4((vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 1.00000000E+00, 1.00000000E+00, -1.00000000E+00, -1.00000000E+00)*_fp.x).x > 1.29999995E+00, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 1.00000000E+00, 1.00000000E+00, -1.00000000E+00, -1.00000000E+00)*_fp.x).y > 3.00000012E-01, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 1.00000000E+00, 1.00000000E+00, -1.00000000E+00, -1.00000000E+00)*_fp.x).z > -6.99999988E-01, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 1.00000000E+00, 1.00000000E+00, -1.00000000E+00, -1.00000000E+00)*_fp.x).w > 3.00000012E-01);
    _fxd_left = bvec4((vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 5.00000000E-01, 2.00000000E+00, -5.00000000E-01, -2.00000000E+00)*_fp.x).x > 8.99999976E-01, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 5.00000000E-01, 2.00000000E+00, -5.00000000E-01, -2.00000000E+00)*_fp.x).y > 8.00000012E-01, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 5.00000000E-01, 2.00000000E+00, -5.00000000E-01, -2.00000000E+00)*_fp.x).z > -6.00000024E-01, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 5.00000000E-01, 2.00000000E+00, -5.00000000E-01, -2.00000000E+00)*_fp.x).w > -2.00000003E-01);
    _fxd_up = bvec4((vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 2.00000000E+00, 5.00000000E-01, -2.00000000E+00, -5.00000000E-01)*_fp.x).x > 1.79999995E+00, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 2.00000000E+00, 5.00000000E-01, -2.00000000E+00, -5.00000000E-01)*_fp.x).y > -1.00000001E-01, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 2.00000000E+00, 5.00000000E-01, -2.00000000E+00, -5.00000000E-01)*_fp.x).z > -1.20000005E+00, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 2.00000000E+00, 5.00000000E-01, -2.00000000E+00, -5.00000000E-01)*_fp.x).w > 4.00000006E-01);
    _fxe = bvec4((vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 1.00000000E+00, 1.00000000E+00, -1.00000000E+00, -1.00000000E+00)*_fp.x).x > 1.70000005E+00, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 1.00000000E+00, 1.00000000E+00, -1.00000000E+00, -1.00000000E+00)*_fp.x).y > 6.99999988E-01, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 1.00000000E+00, 1.00000000E+00, -1.00000000E+00, -1.00000000E+00)*_fp.x).z > -3.00000012E-01, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 1.00000000E+00, 1.00000000E+00, -1.00000000E+00, -1.00000000E+00)*_fp.x).w > 6.99999988E-01);
    _fxe_left = bvec4((vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 5.00000000E-01, 2.00000000E+00, -5.00000000E-01, -2.00000000E+00)*_fp.x).x > 1.10000002E+00, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 5.00000000E-01, 2.00000000E+00, -5.00000000E-01, -2.00000000E+00)*_fp.x).y > 1.20000005E+00, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 5.00000000E-01, 2.00000000E+00, -5.00000000E-01, -2.00000000E+00)*_fp.x).z > -4.00000006E-01, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 5.00000000E-01, 2.00000000E+00, -5.00000000E-01, -2.00000000E+00)*_fp.x).w > 2.00000003E-01);
    _fxe_up = bvec4((vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 2.00000000E+00, 5.00000000E-01, -2.00000000E+00, -5.00000000E-01)*_fp.x).x > 2.20000005E+00, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 2.00000000E+00, 5.00000000E-01, -2.00000000E+00, -5.00000000E-01)*_fp.x).y > 1.00000001E-01, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 2.00000000E+00, 5.00000000E-01, -2.00000000E+00, -5.00000000E-01)*_fp.x).z > -8.00000012E-01, (vec4( 1.00000000E+00, -1.00000000E+00, -1.00000000E+00, 1.00000000E+00)*_fp.y + vec4( 2.00000000E+00, 5.00000000E-01, -2.00000000E+00, -5.00000000E-01)*_fp.x).w > 6.00000024E-01);
    _a0187 = _r0123.wxyz - _r0123;
    _TMP184 = abs(_a0187);
    _TMP21 = bvec4(_TMP184.x < 1.50000000E+01, _TMP184.y < 1.50000000E+01, _TMP184.z < 1.50000000E+01, _TMP184.w < 1.50000000E+01);
    _a0193 = _r0123.wxyz - _r0133;
    _TMP190 = abs(_a0193);
    _TMP22 = bvec4(_TMP190.x < 1.50000000E+01, _TMP190.y < 1.50000000E+01, _TMP190.z < 1.50000000E+01, _TMP190.w < 1.50000000E+01);
    _a0199 = _r0123.zwxy - _r0123.yzwx;
    _TMP196 = abs(_a0199);
    _TMP23 = bvec4(_TMP196.x < 1.50000000E+01, _TMP196.y < 1.50000000E+01, _TMP196.z < 1.50000000E+01, _TMP196.w < 1.50000000E+01);
    _a0205 = _r0123.zwxy - _r0133.zwxy;
    _TMP202 = abs(_a0205);
    _TMP24 = bvec4(_TMP202.x < 1.50000000E+01, _TMP202.y < 1.50000000E+01, _TMP202.z < 1.50000000E+01, _TMP202.w < 1.50000000E+01);
    _a0211 = _r0143 - _r0133.wxyz;
    _TMP208 = abs(_a0211);
    _TMP25 = bvec4(_TMP208.x < 1.50000000E+01, _TMP208.y < 1.50000000E+01, _TMP208.z < 1.50000000E+01, _TMP208.w < 1.50000000E+01);
    _a0217 = _r0123.wxyz - _r0173.yzwx;
    _TMP214 = abs(_a0217);
    _TMP26 = bvec4(_TMP214.x < 1.50000000E+01, _TMP214.y < 1.50000000E+01, _TMP214.z < 1.50000000E+01, _TMP214.w < 1.50000000E+01);
    _a0223 = _r0123.wxyz - _r0153;
    _TMP220 = abs(_a0223);
    _TMP27 = bvec4(_TMP220.x < 1.50000000E+01, _TMP220.y < 1.50000000E+01, _TMP220.z < 1.50000000E+01, _TMP220.w < 1.50000000E+01);
    _a0229 = _r0123.zwxy - _r0173;
    _TMP226 = abs(_a0229);
    _TMP28 = bvec4(_TMP226.x < 1.50000000E+01, _TMP226.y < 1.50000000E+01, _TMP226.z < 1.50000000E+01, _TMP226.w < 1.50000000E+01);
    _a0235 = _r0123.zwxy - _r0163;
    _TMP232 = abs(_a0235);
    _TMP29 = bvec4(_TMP232.x < 1.50000000E+01, _TMP232.y < 1.50000000E+01, _TMP232.z < 1.50000000E+01, _TMP232.w < 1.50000000E+01);
    _a0241 = _r0143 - _r0133.zwxy;
    _TMP238 = abs(_a0241);
    _TMP30 = bvec4(_TMP238.x < 1.50000000E+01, _TMP238.y < 1.50000000E+01, _TMP238.z < 1.50000000E+01, _TMP238.w < 1.50000000E+01);
    _a0247 = _r0143 - _r0133;
    _TMP244 = abs(_a0247);
    _TMP31 = bvec4(_TMP244.x < 1.50000000E+01, _TMP244.y < 1.50000000E+01, _TMP244.z < 1.50000000E+01, _TMP244.w < 1.50000000E+01);
    _interp_restriction_lv1 = bvec4(_r0143.x != _r0123.w && _r0143.x != _r0123.z && (!_TMP21.x && !_TMP22.x || !_TMP23.x && !_TMP24.x || _TMP25.x && (!_TMP26.x && !_TMP27.x || !_TMP28.x && !_TMP29.x) || _TMP30.x || _TMP31.x), _r0143.y != _r0123.x && _r0143.y != _r0123.w && (!_TMP21.y && !_TMP22.y || !_TMP23.y && !_TMP24.y || _TMP25.y && (!_TMP26.y && !_TMP27.y || !_TMP28.y && !_TMP29.y) || _TMP30.y || _TMP31.y), _r0143.z != _r0123.y && _r0143.z != _r0123.x && (!_TMP21.z && !_TMP22.z || !_TMP23.z && !_TMP24.z || _TMP25.z && (!_TMP26.z && !_TMP27.z || !_TMP28.z && !_TMP29.z) || _TMP30.z || _TMP31.z), _r0143.w != _r0123.z && _r0143.w != _r0123.y && (!_TMP21.w && !_TMP22.w || !_TMP23.w && !_TMP24.w || _TMP25.w && (!_TMP26.w && !_TMP27.w || !_TMP28.w && !_TMP29.w) || _TMP30.w || _TMP31.w));
    _interp_restriction_lv2_left = bvec4(_r0143.x != _r0133.z && _r0123.y != _r0133.z, _r0143.y != _r0133.w && _r0123.z != _r0133.w, _r0143.z != _r0133.x && _r0123.w != _r0133.x, _r0143.w != _r0133.y && _r0123.x != _r0133.y);
    _interp_restriction_lv2_up = bvec4(_r0143.x != _r0133.x && _r0123.x != _r0133.x, _r0143.y != _r0133.y && _r0123.y != _r0133.y, _r0143.z != _r0133.z && _r0123.z != _r0133.z, _r0143.w != _r0133.w && _r0123.w != _r0133.w);
    _a0253 = _r0143 - _r0133;
    _TMP250 = abs(_a0253);
    _a0257 = _r0143 - _r0133.zwxy;
    _TMP254 = abs(_a0257);
    _a0261 = _r0133.wxyz - _r0173;
    _TMP258 = abs(_a0261);
    _a0265 = _r0133.wxyz - _r0173.yzwx;
    _TMP262 = abs(_a0265);
    _a0269 = _r0123.zwxy - _r0123.wxyz;
    _TMP266 = abs(_a0269);
    _TMP32 = _TMP250 + _TMP254 + _TMP258 + _TMP262 + 4.00000000E+00*_TMP266;
    _a0275 = _r0123.zwxy - _r0123.yzwx;
    _TMP272 = abs(_a0275);
    _a0279 = _r0123.zwxy - _r0163;
    _TMP276 = abs(_a0279);
    _a0283 = _r0123.wxyz - _r0153;
    _TMP280 = abs(_a0283);
    _a0287 = _r0123.wxyz - _r0123;
    _TMP284 = abs(_a0287);
    _a0291 = _r0143 - _r0133.wxyz;
    _TMP288 = abs(_a0291);
    _TMP33 = _TMP272 + _TMP276 + _TMP280 + _TMP284 + 4.00000000E+00*_TMP288;
    _edr = bvec4(_TMP32.x < _TMP33.x && _interp_restriction_lv1.x, _TMP32.y < _TMP33.y && _interp_restriction_lv1.y, _TMP32.z < _TMP33.z && _interp_restriction_lv1.z, _TMP32.w < _TMP33.w && _interp_restriction_lv1.w);
    _a0295 = _r0123.wxyz - _r0133.zwxy;
    _TMP292 = abs(_a0295);
    _a0299 = _r0123.zwxy - _r0133;
    _TMP296 = abs(_a0299);
    _edr_left = bvec4((2.00000000E+00*_TMP292).x <= _TMP296.x && _interp_restriction_lv2_left.x, (2.00000000E+00*_TMP292).y <= _TMP296.y && _interp_restriction_lv2_left.y, (2.00000000E+00*_TMP292).z <= _TMP296.z && _interp_restriction_lv2_left.z, (2.00000000E+00*_TMP292).w <= _TMP296.w && _interp_restriction_lv2_left.w);
    _a0303 = _r0123.wxyz - _r0133.zwxy;
    _TMP300 = abs(_a0303);
    _a0307 = _r0123.zwxy - _r0133;
    _TMP304 = abs(_a0307);
    _edr_up = bvec4(_TMP300.x >= (2.00000000E+00*_TMP304).x && _interp_restriction_lv2_up.x, _TMP300.y >= (2.00000000E+00*_TMP304).y && _interp_restriction_lv2_up.y, _TMP300.z >= (2.00000000E+00*_TMP304).z && _interp_restriction_lv2_up.z, _TMP300.w >= (2.00000000E+00*_TMP304).w && _interp_restriction_lv2_up.w);
    _a0311 = _r0143 - _r0123.wxyz;
    _TMP308 = abs(_a0311);
    _a0315 = _r0143 - _r0123.zwxy;
    _TMP312 = abs(_a0315);
    _px = bvec4(_TMP308.x <= _TMP312.x, _TMP308.y <= _TMP312.y, _TMP308.z <= _TMP312.z, _TMP308.w <= _TMP312.w);
    _t0317 = vec4(float(_px.x), float(_px.y), float(_px.z), float(_px.w));
    _TMP40 = _r0123.zwxy + _t0317*(_r0123.wxyz - _r0123.zwxy);
    _dilation = bvec4(_TMP40.x > _r0143.x, _TMP40.y > _r0143.y, _TMP40.z > _r0143.z, _TMP40.w > _r0143.w);
    _nc = bvec4(_dilation.x && _edr.x && (_fxd.x || _edr_left.x && _fxd_left.x || _edr_up.x && _fxd_up.x) || !_dilation.x && _edr.x && (_fxe.x || _edr_left.x && _fxe_left.x || _edr_up.x && _fxe_up.x), _dilation.y && _edr.y && (_fxd.y || _edr_left.y && _fxd_left.y || _edr_up.y && _fxd_up.y) || !_dilation.y && _edr.y && (_fxe.y || _edr_left.y && _fxe_left.y || _edr_up.y && _fxe_up.y), _dilation.z && _edr.z && (_fxd.z || _edr_left.z && _fxd_left.z || _edr_up.z && _fxd_up.z) || !_dilation.z && _edr.z && (_fxe.z || _edr_left.z && _fxe_left.z || _edr_up.z && _fxe_up.z), _dilation.w && _edr.w && (_fxd.w || _edr_left.w && _fxd_left.w || _edr_up.w && _fxd_up.w) || !_dilation.w && _edr.w && (_fxe.w || _edr_left.w && _fxe_left.w || _edr_up.w && _fxe_up.w));
    if (_nc.x) { 
        if (_px.x) { 
            _TMP42 = _TMP8.xyz;
        } else {
            _TMP42 = _TMP10.xyz;
        } 
        _TMP41 = _TMP42;
    } else {
        if (_nc.y) { 
            if (_px.y) { 
                _TMP44 = _TMP4.xyz;
            } else {
                _TMP44 = _TMP8.xyz;
            } 
            _TMP43 = _TMP44;
        } else {
            if (_nc.z) { 
                if (_px.z) { 
                    _TMP46 = _TMP6.xyz;
                } else {
                    _TMP46 = _TMP4.xyz;
                } 
                _TMP45 = _TMP46;
            } else {
                if (_nc.w) { 
                    if (_px.w) { 
                        _TMP48 = _TMP10.xyz;
                    } else {
                        _TMP48 = _TMP6.xyz;
                    } 
                    _TMP47 = _TMP48;
                } else {
                    _TMP47 = _TMP7.xyz;
                } 
                _TMP45 = _TMP47;
            } 
            _TMP43 = _TMP45;
        } 
        _TMP41 = _TMP43;
    } 
    if (_nc.w) { 
        if (_px.w) { 
            _TMP50 = _TMP10.xyz;
        } else {
            _TMP50 = _TMP6.xyz;
        } 
        _TMP49 = _TMP50;
    } else {
        if (_nc.z) { 
            if (_px.z) { 
                _TMP52 = _TMP6.xyz;
            } else {
                _TMP52 = _TMP4.xyz;
            } 
            _TMP51 = _TMP52;
        } else {
            if (_nc.y) { 
                if (_px.y) { 
                    _TMP54 = _TMP4.xyz;
                } else {
                    _TMP54 = _TMP8.xyz;
                } 
                _TMP53 = _TMP54;
            } else {
                if (_nc.x) { 
                    if (_px.x) { 
                        _TMP56 = _TMP8.xyz;
                    } else {
                        _TMP56 = _TMP10.xyz;
                    } 
                    _TMP55 = _TMP56;
                } else {
                    _TMP55 = _TMP7.xyz;
                } 
                _TMP53 = _TMP55;
            } 
            _TMP51 = _TMP53;
        } 
        _TMP49 = _TMP51;
    } 
    _a0321 = _TMP7.xyz - _TMP41;
    _df0319 = abs(_a0321);
    _TMP57 = _df0319.x + _df0319.y + _df0319.z;
    _a0325 = _TMP7.xyz - _TMP49;
    _df0323 = abs(_a0325);
    _TMP58 = _df0323.x + _df0323.y + _df0323.z;
    _TMP59 = float((_TMP58 >= _TMP57));
    _res = _TMP41 + _TMP59*(_TMP49 - _TMP41);
    _ret_0 = vec4(_res.x, _res.y, _res.z, 1.00000000E+00);
    FragColor = _ret_0;
    return;
} 
#endif