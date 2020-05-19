(module
 (type $i32_i32_=>_i32 (func (param i32 i32) (result i32)))
 (type $i32_=>_none (func (param i32)))
 (type $none_=>_none (func))
 (type $i32_=>_i32 (func (param i32) (result i32)))
 (type $i32_i32_=>_none (func (param i32 i32)))
 (type $i32_i32_i32_=>_none (func (param i32 i32 i32)))
 (type $i32_i32_i32_=>_i32 (func (param i32 i32 i32) (result i32)))
 (type $i32_i32_i32_i32_=>_none (func (param i32 i32 i32 i32)))
 (type $none_=>_i32 (func (result i32)))
 (type $i32_i64_i32_=>_i32 (func (param i32 i64 i32) (result i32)))
 (type $i32_f64_f64_f64_=>_i32 (func (param i32 f64 f64 f64) (result i32)))
 (type $i32_i32_i32_i32_i32_i32_=>_i32 (func (param i32 i32 i32 i32 i32 i32) (result i32)))
 (type $i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_i32_=>_i32 (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (type $i32_i32_i32_i32_f64_=>_i32 (func (param i32 i32 i32 i32 f64) (result i32)))
 (type $i64_i32_=>_i32 (func (param i64 i32) (result i32)))
 (type $f32_i32_=>_i32 (func (param f32 i32) (result i32)))
 (type $f64_i32_=>_i32 (func (param f64 i32) (result i32)))
 (import "env" "memory" (memory $0 1))
 (data (i32.const 16) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00t\00l\00s\00f\00.\00t\00s\00")
 (data (i32.const 64) "(\00\00\00\01\00\00\00\01\00\00\00(\00\00\00a\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e\00")
 (data (i32.const 128) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00p\00u\00r\00e\00.\00t\00s\00")
 (data (i32.const 176) "6\00\00\00\01\00\00\00\01\00\00\006\00\00\00b\00e\00f\00o\00r\00e\00 \00a\00l\00l\00 \00o\00u\00t\00s\00i\00d\00e\00 \00d\00e\00s\00c\00r\00i\00b\00e\00")
 (data (i32.const 256) "\0c\00\00\00\01\00\00\00\01\00\00\00\0c\00\00\00S\00t\00r\00i\00n\00g\00")
 (data (i32.const 288) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00K\00e\00y\00 \00d\00o\00e\00s\00 \00n\00o\00t\00 \00e\00x\00i\00s\00t\00")
 (data (i32.const 352) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00~\00l\00i\00b\00/\00m\00a\00p\00.\00t\00s\00")
 (data (i32.const 400) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h\00")
 (data (i32.const 448) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s\00")
 (data (i32.const 512) "4\00\00\00\01\00\00\00\01\00\00\004\00\00\00a\00f\00t\00e\00r\00 \00a\00l\00l\00 \00o\00u\00t\00s\00i\00d\00e\00 \00d\00e\00s\00c\00r\00i\00b\00e\00")
 (data (i32.const 592) "\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00l\00o\00g\00s\00")
 (data (i32.const 624) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00B\00e\00f\00o\00r\00e\00 \00A\00l\00l\00")
 (data (i32.const 672) "\12\00\00\00\01\00\00\00\01\00\00\00\12\00\00\00A\00f\00t\00e\00r\00 \00A\00l\00l\00")
 (data (i32.const 720) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00B\00e\00f\00o\00r\00e\00 \00E\00a\00c\00h\00")
 (data (i32.const 768) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00A\00f\00t\00e\00r\00 \00E\00a\00c\00h\00")
 (data (i32.const 816) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00l\00o\00g\00 \00a\00 \00s\00t\00r\00i\00n\00g\00")
 (data (i32.const 864) "\"\00\00\00\01\00\00\00\01\00\00\00\"\00\00\00S\00o\00m\00e\00 \00s\00t\00r\00i\00n\00g\00 \00v\00a\00l\00u\00e\00")
 (data (i32.const 928) "\18\00\00\00\01\00\00\00\01\00\00\00\18\00\00\00l\00o\00g\00 \00a\00 \00n\00u\00m\00b\00e\00r\00")
 (data (i32.const 976) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00i\003\002\00")
 (data (i32.const 1008) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00l\00o\00g\00 \00a\00n\00 \00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00")
 (data (i32.const 1072) "\16\00\00\00\01\00\00\00\01\00\00\00\16\00\00\00A\00r\00r\00a\00y\00B\00u\00f\00f\00e\00r\00")
 (data (i32.const 1120) "\04\00\00\00\01\00\00\00\01\00\00\00\04\00\00\00u\008\00")
 (data (i32.const 1152) "\1e\00\00\00\01\00\00\00\01\00\00\00\1e\00\00\00l\00o\00g\00 \00a\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00")
 (data (i32.const 1200) "\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00V\00e\00c\003\00")
 (data (i32.const 1232) "\00\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00")
 (data (i32.const 1248) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00x\00")
 (data (i32.const 1280) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00f\006\004\00")
 (data (i32.const 1312) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00y\00")
 (data (i32.const 1344) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00z\00")
 (data (i32.const 1376) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00l\00o\00g\00 \00a\00 \00n\00u\00l\00l\00")
 (data (i32.const 1424) "\00\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00")
 (data (i32.const 1440) "2\00\00\00\01\00\00\00\01\00\00\002\00\00\00l\00o\00g\00 \00a\00n\00 \00a\00n\00o\00n\00y\00m\00o\00u\00s\00 \00f\00u\00n\00c\00t\00i\00o\00n\00")
 (data (i32.const 1520) "\10\00\00\00\01\00\00\00\01\00\00\00\10\00\00\00F\00u\00n\00c\00t\00i\00o\00n\00")
 (data (i32.const 1552) "(\00\00\00\01\00\00\00\01\00\00\00(\00\00\00l\00o\00g\00 \00a\00 \00n\00a\00m\00e\00d\00 \00f\00u\00n\00c\00t\00i\00o\00n\00")
 (data (i32.const 1616) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00l\00o\00g\00 \00a\00 \00n\00e\00s\00t\00e\00d\00 \00c\00l\00a\00s\00s\00")
 (data (i32.const 1680) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00A\00")
 (data (i32.const 1712) "\00\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00")
 (data (i32.const 1728) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00a\00")
 (data (i32.const 1760) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00b\00")
 (data (i32.const 1792) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00B\00")
 (data (i32.const 1824) "\00\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00")
 (data (i32.const 1840) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00i\001\006\00")
 (data (i32.const 1872) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00c\00")
 (data (i32.const 1904) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00u\003\002\00")
 (data (i32.const 1936) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00d\00")
 (data (i32.const 1968) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00i\006\004\00")
 (data (i32.const 2000) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00e\00")
 (data (i32.const 2032) "\00\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00")
 (data (i32.const 2048) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00f\00")
 (data (i32.const 2080) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00f\003\002\00")
 (data (i32.const 2112) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00g\00")
 (data (i32.const 2144) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00h\00")
 (data (i32.const 2176) "\10\00\00\00\01\00\00\00\01\00\00\00\10\00\00\00l\00o\00g\00 \00t\00r\00u\00e\00")
 (data (i32.const 2208) "\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00b\00o\00o\00l\00")
 (data (i32.const 2240) "\12\00\00\00\01\00\00\00\01\00\00\00\12\00\00\00l\00o\00g\00 \00f\00a\00l\00s\00e\00")
 (data (i32.const 2288) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00c\00i\00r\00c\00u\00l\00a\00r\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00")
 (data (i32.const 2352) "J\00\00\00\01\00\00\00\01\00\00\00J\00\00\00l\00o\00g\00 \00c\00l\00a\00s\00s\00 \00w\00i\00t\00h\00 \00u\00n\00i\00t\00i\00a\00l\00i\00z\00e\00d\00 \00r\00e\00f\00e\00r\00e\00n\00c\00e\00s\00")
 (data (i32.const 2448) "\n\00\00\00\01\00\00\00\01\00\00\00\n\00\00\00E\00m\00p\00t\00y\00")
 (data (i32.const 2480) "\00\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00")
 (data (i32.const 2496) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00s\00")
 (data (i32.const 2528) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00t\00")
 (data (i32.const 2560) "J\00\00\00\01\00\00\00\01\00\00\00J\00\00\00A\00r\00r\00a\00y\00<\00a\00s\00s\00e\00m\00b\00l\00y\00/\00_\00_\00t\00e\00s\00t\00s\00_\00_\00/\00l\00o\00g\00s\00.\00s\00p\00e\00c\00/\00A\00>\00")
 (data (i32.const 2656) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\00m\00")
 (data (i32.const 2688) "\8c\00\00\00\01\00\00\00\01\00\00\00\8c\00\00\00M\00a\00p\00<\00a\00s\00s\00e\00m\00b\00l\00y\00/\00_\00_\00t\00e\00s\00t\00s\00_\00_\00/\00l\00o\00g\00s\00.\00s\00p\00e\00c\00/\00B\00,\00a\00s\00s\00e\00m\00b\00l\00y\00/\00_\00_\00t\00e\00s\00t\00s\00_\00_\00/\00l\00o\00g\00s\00.\00s\00p\00e\00c\00/\00E\00m\00p\00t\00y\00>\00")
 (data (i32.const 2848) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s\00")
 (data (i32.const 2896) "$\00\00\00\01\00\00\00\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e\00")
 (data (i32.const 2960) "\1a\00\00\00\01\00\00\00\01\00\00\00\1a\00\00\00l\00o\00g\00 \00u\00n\00m\00a\00n\00a\00g\00e\00d\00")
 (data (i32.const 3008) "\1c\00\00\00\01\00\00\00\01\00\00\00\1c\00\00\00U\00n\00m\00a\00n\00a\00g\00e\00d\00C\00l\00a\00s\00s\00")
 (data (i32.const 3056) "\00\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00")
 (data (i32.const 3072) "t\00\00\00\01\00\00\00\01\00\00\00t\00\00\00l\00o\00g\00 \00c\00l\00a\00s\00s\00 \00w\00i\00t\00h\00 \00c\00u\00s\00t\00o\00m\00 \00d\00i\00s\00p\00l\00a\00y\00 \00m\00e\00t\00h\00o\00d\00 \00t\00h\00a\00t\00 \00r\00e\00t\00u\00r\00n\00s\00 \00a\00 \00s\00t\00r\00i\00n\00g\00")
 (data (i32.const 3216) "\06\00\00\00\01\00\00\00\01\00\00\00\06\00\00\00j\00o\00e\00")
 (data (i32.const 3248) "0\00\00\00\01\00\00\00\01\00\00\000\00\00\00C\00u\00s\00t\00o\00m\00D\00i\00s\00p\00l\00a\00y\00S\00t\00r\00i\00n\00g\00C\00l\00a\00s\00s\00")
 (data (i32.const 3312) "\n\00\00\00\01\00\00\00\01\00\00\00\n\00\00\00 \00h\00a\00s\00 \00")
 (data (i32.const 3344) "\08\00\00\00\01\00\00\00\01\00\00\00\08\00\00\00n\00u\00l\00l\00")
 (data (i32.const 3376) "\00\00\00\00\01\00\00\00\01\00\00\00\00\00\00\00")
 (data (i32.const 3392) "\02\00\00\00\01\00\00\00\01\00\00\00\02\00\00\000\00")
 (data (i32.const 3412) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\00")
 (data (i32.const 3824) "\10\00\00\00\01\00\00\00\01\00\00\00\10\00\00\00 \00c\00o\00o\00k\00i\00e\00s\00")
 (data (i32.const 3856) "x\00\00\00\01\00\00\00\01\00\00\00x\00\00\00l\00o\00g\00 \00c\00l\00a\00s\00s\00 \00w\00i\00t\00h\00 \00c\00u\00s\00t\00o\00m\00 \00d\00i\00s\00p\00l\00a\00y\00 \00m\00e\00t\00h\00o\00d\00 \00t\00h\00a\00t\00 \00r\00e\00t\00u\00r\00n\00s\00 \00a\00n\00 \00i\00n\00t\00e\00g\00e\00r\00")
 (data (i32.const 4000) "0\00\00\00\01\00\00\00\01\00\00\000\00\00\00C\00u\00s\00t\00o\00m\00D\00i\00s\00p\00l\00a\00y\00N\00u\00m\00b\00e\00r\00C\00l\00a\00s\00s\00")
 (data (i32.const 4064) ",\00\00\00\01\00\00\00\01\00\00\00,\00\00\00l\00o\00g\00 \00a\00 \00n\00a\00m\00e\00s\00p\00a\00c\00e\00d\00 \00c\00l\00a\00s\00s\00")
 (data (i32.const 4128) "&\00\00\00\01\00\00\00\01\00\00\00&\00\00\00E\00x\00a\00m\00p\00l\00e\00N\00e\00s\00t\00e\00d\00V\00e\00c\00t\00o\00r\00")
 (data (i32.const 4192) "\00\00\00\00\01\00\00\00\06\00\00\00\00\00\00\00")
 (data (i32.const 4208) "8\00\00\00\01\00\00\00\01\00\00\008\00\00\00T\00h\00i\00s\00 \00s\00h\00o\00u\00l\00d\00 \00b\00e\00 \00a\00 \00v\00a\00l\00i\00d\00 \00t\00o\00d\00o\00.\00")
 (data (i32.const 4288) "\14\00\00\00\01\00\00\00\01\00\00\00\14\00\00\00~\00l\00i\00b\00/\00r\00t\00.\00t\00s\00")
 (data (i32.const 4336) "\11\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\000\t\02\00\00\00\00\00a\00\00\00\02\00\00\00 \00\00\00\00\00\00\00$\n\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\"A\00\00\00\00\00\00\10A\82\00\00\00\00\00\"A\00\00\00\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00 \00\00\00\00\00\00\00\"\01\00\00\00\00\00\00")
 (import "env" "abort" (func $~lib/builtins/abort (param i32 i32 i32 i32)))
 (import "rtrace" "onalloc" (func $~lib/rt/rtrace/onalloc (param i32)))
 (import "rtrace" "onincrement" (func $~lib/rt/rtrace/onincrement (param i32)))
 (import "__aspect" "createReflectedValue" (func $assembly/internal/Reflect/createReflectedValue (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
 (import "__aspect" "attachStackTraceToReflectedValue" (func $assembly/internal/Reflect/attachStackTraceToReflectedValue (param i32)))
 (import "__aspect" "logReflectedValue" (func $assembly/internal/log/logReflectedValue (param i32)))
 (import "__aspect" "beforeAll" (func $assembly/internal/Test/beforeAll (param i32)))
 (import "__aspect" "afterAll" (func $assembly/internal/Test/afterAll (param i32)))
 (import "__aspect" "beforeEach" (func $assembly/internal/Test/beforeEach (param i32)))
 (import "__aspect" "afterEach" (func $assembly/internal/Test/afterEach (param i32)))
 (import "__aspect" "reportTestTypeNode" (func $assembly/internal/Test/test (param i32 i32)))
 (import "__aspect" "createReflectedNumber" (func $assembly/internal/Reflect/createReflectedNumber (param i32 i32 i32 i32 f64) (result i32)))
 (import "__aspect" "pushReflectedObjectValue" (func $assembly/internal/Reflect/__aspectPushReflectedObjectValue (param i32 i32)))
 (import "__aspect" "pushReflectedObjectKey" (func $assembly/internal/Reflect/__aspectPushReflectedObjectKey (param i32 i32)))
 (import "__aspect" "createReflectedLong" (func $assembly/internal/Reflect/createReflectedLong (param i32 i32 i32 i32 i32 i32) (result i32)))
 (import "rtrace" "onrealloc" (func $~lib/rt/rtrace/onrealloc (param i32 i32)))
 (import "rtrace" "onfree" (func $~lib/rt/rtrace/onfree (param i32)))
 (import "__aspect" "reportTodo" (func $assembly/internal/Test/todo (param i32)))
 (import "__aspect" "reportGroupTypeNode" (func $assembly/internal/Test/describe (param i32 i32)))
 (import "rtrace" "ondecrement" (func $~lib/rt/rtrace/ondecrement (param i32)))
 (table $0 27 funcref)
 (elem (i32.const 1) $start:assembly/__tests__/logs.spec~anonymous|0 $start:assembly/__tests__/logs.spec~anonymous|1 $start:assembly/__tests__/logs.spec~anonymous|2 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|0 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|1 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|2 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|3 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|4 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|5 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|6 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|7 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|8 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|9 $assembly/__tests__/logs.spec/IDFunc $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|10 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|11 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|12 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|13 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|14 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|15 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|16 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|17 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|18 $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|19 $start:assembly/__tests__/logs.spec~anonymous|3 $start:assembly/internal/noOp~anonymous|0)
 (global $~lib/rt/tlsf/ROOT (mut i32) (i32.const 0))
 (global $~lib/ASC_LOW_MEMORY_LIMIT i32 (i32.const 0))
 (global $~lib/rt/tlsf/collectLock (mut i32) (i32.const 0))
 (global $~lib/gc/gc.auto (mut i32) (i32.const 1))
 (global $assembly/__tests__/logs.spec/anonIDFunc i32 (i32.const 1))
 (global $assembly/internal/log/ignoreLogs (mut i32) (i32.const 0))
 (global $assembly/internal/Reflect/Reflect.FAILED_MATCH i32 (i32.const 0))
 (global $assembly/internal/Reflect/Reflect.SUCCESSFUL_MATCH i32 (i32.const 1))
 (global $assembly/internal/Reflect/Reflect.DEFER_MATCH i32 (i32.const 2))
 (global $~lib/ASC_SHRINK_LEVEL i32 (i32.const 0))
 (global $~argumentsLength (mut i32) (i32.const 0))
 (global $assembly/internal/RTrace/RTrace.enabled (mut i32) (i32.const 1))
 (global $assembly/__tests__/setup/Test.include/meaningOfLife i32 (i32.const 42))
 (global $assembly/internal/noOp/noOp i32 (i32.const 26))
 (global $~started (mut i32) (i32.const 0))
 (global $~lib/rt/pure/ROOTS (mut i32) (i32.const 0))
 (global $~lib/rt/pure/CUR (mut i32) (i32.const 0))
 (global $~lib/rt/pure/END (mut i32) (i32.const 0))
 (global $~lib/rt/__rtti_base i32 (i32.const 4336))
 (global $~lib/heap/__heap_base i32 (i32.const 4476))
 (export "_start" (func $~start))
 (export "memory" (memory $0))
 (export "table" (table $0))
 (export "__alloc" (func $~lib/rt/tlsf/__alloc))
 (export "__retain" (func $~lib/rt/pure/__retain))
 (export "__release" (func $~lib/rt/pure/__release))
 (export "__collect" (func $~lib/rt/pure/__collect))
 (export "__rtti_base" (global $~lib/rt/__rtti_base))
 (export "meaningOfLife" (global $assembly/__tests__/setup/Test.include/meaningOfLife))
 (export "__call" (func $assembly/internal/call/__call))
 (export "__ignoreLogs" (func $assembly/internal/log/__ignoreLogs))
 (export "__disableRTrace" (func $assembly/internal/RTrace/__disableRTrace))
 (export "__getUsizeArrayId" (func $assembly/internal/RTrace/__getUsizeArrayId))
 (func $~lib/rt/tlsf/removeBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  local.get $1
  i32.load
  local.set $2
  i32.const 1
  drop
  local.get $2
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 277
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $3
  i32.const 1
  drop
  local.get $3
  i32.const 16
  i32.ge_u
  if (result i32)
   local.get $3
   i32.const 1073741808
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 279
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $4
   local.get $3
   i32.const 4
   i32.shr_u
   local.set $5
  else
   i32.const 31
   local.get $3
   i32.clz
   i32.sub
   local.set $4
   local.get $3
   local.get $4
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $5
   local.get $4
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $4
  end
  i32.const 1
  drop
  local.get $4
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $5
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 292
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load offset=16
  local.set $6
  local.get $1
  i32.load offset=20
  local.set $7
  local.get $6
  if
   local.get $6
   local.get $7
   i32.store offset=20
  end
  local.get $7
  if
   local.get $7
   local.get $6
   i32.store offset=16
  end
  local.get $1
  local.get $0
  local.set $10
  local.get $4
  local.set $9
  local.get $5
  local.set $8
  local.get $10
  local.get $9
  i32.const 4
  i32.shl
  local.get $8
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  i32.eq
  if
   local.get $0
   local.set $11
   local.get $4
   local.set $10
   local.get $5
   local.set $9
   local.get $7
   local.set $8
   local.get $11
   local.get $10
   i32.const 4
   i32.shl
   local.get $9
   i32.add
   i32.const 2
   i32.shl
   i32.add
   local.get $8
   i32.store offset=96
   local.get $7
   i32.eqz
   if
    local.get $0
    local.set $9
    local.get $4
    local.set $8
    local.get $9
    local.get $8
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    local.set $9
    local.get $0
    local.set $8
    local.get $4
    local.set $11
    local.get $9
    i32.const 1
    local.get $5
    i32.shl
    i32.const -1
    i32.xor
    i32.and
    local.tee $9
    local.set $10
    local.get $8
    local.get $11
    i32.const 2
    i32.shl
    i32.add
    local.get $10
    i32.store offset=4
    local.get $9
    i32.eqz
    if
     local.get $0
     local.get $0
     i32.load
     i32.const 1
     local.get $4
     i32.shl
     i32.const -1
     i32.xor
     i32.and
     i32.store
    end
   end
  end
 )
 (func $~lib/rt/tlsf/insertBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  i32.const 1
  drop
  local.get $1
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 205
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.load
  local.set $2
  i32.const 1
  drop
  local.get $2
  i32.const 1
  i32.and
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 207
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.set $3
  local.get $3
  i32.const 16
  i32.add
  local.get $3
  i32.load
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.add
  local.set $4
  local.get $4
  i32.load
  local.set $5
  local.get $5
  i32.const 1
  i32.and
  if
   local.get $2
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.add
   local.get $5
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.set $3
   local.get $3
   i32.const 1073741808
   i32.lt_u
   if
    local.get $0
    local.get $4
    call $~lib/rt/tlsf/removeBlock
    local.get $1
    local.get $2
    i32.const 3
    i32.and
    local.get $3
    i32.or
    local.tee $2
    i32.store
    local.get $1
    local.set $6
    local.get $6
    i32.const 16
    i32.add
    local.get $6
    i32.load
    i32.const 3
    i32.const -1
    i32.xor
    i32.and
    i32.add
    local.set $4
    local.get $4
    i32.load
    local.set $5
   end
  end
  local.get $2
  i32.const 2
  i32.and
  if
   local.get $1
   local.set $6
   local.get $6
   i32.const 4
   i32.sub
   i32.load
   local.set $6
   local.get $6
   i32.load
   local.set $3
   i32.const 1
   drop
   local.get $3
   i32.const 1
   i32.and
   i32.eqz
   if
    i32.const 0
    i32.const 32
    i32.const 228
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $3
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.add
   local.get $2
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.set $7
   local.get $7
   i32.const 1073741808
   i32.lt_u
   if
    local.get $0
    local.get $6
    call $~lib/rt/tlsf/removeBlock
    local.get $6
    local.get $3
    i32.const 3
    i32.and
    local.get $7
    i32.or
    local.tee $2
    i32.store
    local.get $6
    local.set $1
   end
  end
  local.get $4
  local.get $5
  i32.const 2
  i32.or
  i32.store
  local.get $2
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.set $8
  i32.const 1
  drop
  local.get $8
  i32.const 16
  i32.ge_u
  if (result i32)
   local.get $8
   i32.const 1073741808
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 243
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  i32.const 1
  drop
  local.get $1
  i32.const 16
  i32.add
  local.get $8
  i32.add
  local.get $4
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 244
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 4
  i32.sub
  local.get $1
  i32.store
  local.get $8
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $9
   local.get $8
   i32.const 4
   i32.shr_u
   local.set $10
  else
   i32.const 31
   local.get $8
   i32.clz
   i32.sub
   local.set $9
   local.get $8
   local.get $9
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $10
   local.get $9
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $9
  end
  i32.const 1
  drop
  local.get $9
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $10
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 260
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.set $7
  local.get $9
  local.set $3
  local.get $10
  local.set $6
  local.get $7
  local.get $3
  i32.const 4
  i32.shl
  local.get $6
  i32.add
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=96
  local.set $11
  local.get $1
  i32.const 0
  i32.store offset=16
  local.get $1
  local.get $11
  i32.store offset=20
  local.get $11
  if
   local.get $11
   local.get $1
   i32.store offset=16
  end
  local.get $0
  local.set $12
  local.get $9
  local.set $7
  local.get $10
  local.set $3
  local.get $1
  local.set $6
  local.get $12
  local.get $7
  i32.const 4
  i32.shl
  local.get $3
  i32.add
  i32.const 2
  i32.shl
  i32.add
  local.get $6
  i32.store offset=96
  local.get $0
  local.get $0
  i32.load
  i32.const 1
  local.get $9
  i32.shl
  i32.or
  i32.store
  local.get $0
  local.set $13
  local.get $9
  local.set $12
  local.get $0
  local.set $3
  local.get $9
  local.set $6
  local.get $3
  local.get $6
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const 1
  local.get $10
  i32.shl
  i32.or
  local.set $7
  local.get $13
  local.get $12
  i32.const 2
  i32.shl
  i32.add
  local.get $7
  i32.store offset=4
 )
 (func $~lib/rt/tlsf/addMemory (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  i32.const 1
  drop
  local.get $1
  local.get $2
  i32.le_u
  if (result i32)
   local.get $1
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $2
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 386
   i32.const 5
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.set $3
  local.get $3
  i32.load offset=1568
  local.set $4
  i32.const 0
  local.set $5
  local.get $4
  if
   i32.const 1
   drop
   local.get $1
   local.get $4
   i32.const 16
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 32
    i32.const 396
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   local.get $1
   i32.const 16
   i32.sub
   local.get $4
   i32.eq
   if
    local.get $1
    i32.const 16
    i32.sub
    local.set $1
    local.get $4
    i32.load
    local.set $5
   else
    nop
   end
  else
   i32.const 1
   drop
   local.get $1
   local.get $0
   i32.const 1572
   i32.add
   i32.ge_u
   i32.eqz
   if
    i32.const 0
    i32.const 32
    i32.const 408
    i32.const 5
    call $~lib/builtins/abort
    unreachable
   end
  end
  local.get $2
  local.get $1
  i32.sub
  local.set $6
  local.get $6
  i32.const 16
  i32.const 16
  i32.add
  i32.const 16
  i32.add
  i32.lt_u
  if
   i32.const 0
   return
  end
  local.get $6
  i32.const 16
  i32.const 1
  i32.shl
  i32.sub
  local.set $7
  local.get $1
  local.set $8
  local.get $8
  local.get $7
  i32.const 1
  i32.or
  local.get $5
  i32.const 2
  i32.and
  i32.or
  i32.store
  local.get $8
  i32.const 0
  i32.store offset=16
  local.get $8
  i32.const 0
  i32.store offset=20
  local.get $1
  local.get $6
  i32.add
  i32.const 16
  i32.sub
  local.set $4
  local.get $4
  i32.const 0
  i32.const 2
  i32.or
  i32.store
  local.get $0
  local.set $9
  local.get $4
  local.set $3
  local.get $9
  local.get $3
  i32.store offset=1568
  local.get $0
  local.get $8
  call $~lib/rt/tlsf/insertBlock
  i32.const 1
 )
 (func $~lib/rt/tlsf/maybeInitialize (result i32)
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  global.get $~lib/rt/tlsf/ROOT
  local.set $0
  local.get $0
  i32.eqz
  if
   global.get $~lib/heap/__heap_base
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   local.set $1
   memory.size
   local.set $2
   local.get $1
   i32.const 1572
   i32.add
   i32.const 65535
   i32.add
   i32.const 65535
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.shr_u
   local.set $3
   local.get $3
   local.get $2
   i32.gt_s
   if (result i32)
    local.get $3
    local.get $2
    i32.sub
    memory.grow
    i32.const 0
    i32.lt_s
   else
    i32.const 0
   end
   if
    unreachable
   end
   local.get $1
   local.set $0
   local.get $0
   i32.const 0
   i32.store
   local.get $0
   local.set $5
   i32.const 0
   local.set $4
   local.get $5
   local.get $4
   i32.store offset=1568
   i32.const 0
   local.set $5
   loop $for-loop|0
    local.get $5
    i32.const 23
    i32.lt_u
    local.set $4
    local.get $4
    if
     local.get $0
     local.set $8
     local.get $5
     local.set $7
     i32.const 0
     local.set $6
     local.get $8
     local.get $7
     i32.const 2
     i32.shl
     i32.add
     local.get $6
     i32.store offset=4
     i32.const 0
     local.set $8
     loop $for-loop|1
      local.get $8
      i32.const 16
      i32.lt_u
      local.set $7
      local.get $7
      if
       local.get $0
       local.set $11
       local.get $5
       local.set $10
       local.get $8
       local.set $9
       i32.const 0
       local.set $6
       local.get $11
       local.get $10
       i32.const 4
       i32.shl
       local.get $9
       i32.add
       i32.const 2
       i32.shl
       i32.add
       local.get $6
       i32.store offset=96
       local.get $8
       i32.const 1
       i32.add
       local.set $8
       br $for-loop|1
      end
     end
     local.get $5
     i32.const 1
     i32.add
     local.set $5
     br $for-loop|0
    end
   end
   local.get $1
   i32.const 1572
   i32.add
   i32.const 15
   i32.add
   i32.const 15
   i32.const -1
   i32.xor
   i32.and
   local.set $5
   i32.const 0
   drop
   local.get $0
   local.get $5
   memory.size
   i32.const 16
   i32.shl
   call $~lib/rt/tlsf/addMemory
   drop
   local.get $0
   global.set $~lib/rt/tlsf/ROOT
  end
  local.get $0
 )
 (func $~lib/rt/tlsf/prepareSize (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.const 1073741808
  i32.ge_u
  if
   i32.const 80
   i32.const 32
   i32.const 461
   i32.const 30
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  i32.const 15
  i32.add
  i32.const 15
  i32.const -1
  i32.xor
  i32.and
  local.tee $1
  i32.const 16
  local.tee $2
  local.get $1
  local.get $2
  i32.gt_u
  select
 )
 (func $~lib/rt/tlsf/searchBlock (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  local.get $1
  i32.const 256
  i32.lt_u
  if
   i32.const 0
   local.set $2
   local.get $1
   i32.const 4
   i32.shr_u
   local.set $3
  else
   local.get $1
   i32.const 536870904
   i32.lt_u
   if (result i32)
    local.get $1
    i32.const 1
    i32.const 27
    local.get $1
    i32.clz
    i32.sub
    i32.shl
    i32.add
    i32.const 1
    i32.sub
   else
    local.get $1
   end
   local.set $4
   i32.const 31
   local.get $4
   i32.clz
   i32.sub
   local.set $2
   local.get $4
   local.get $2
   i32.const 4
   i32.sub
   i32.shr_u
   i32.const 1
   i32.const 4
   i32.shl
   i32.xor
   local.set $3
   local.get $2
   i32.const 8
   i32.const 1
   i32.sub
   i32.sub
   local.set $2
  end
  i32.const 1
  drop
  local.get $2
  i32.const 23
  i32.lt_u
  if (result i32)
   local.get $3
   i32.const 16
   i32.lt_u
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 338
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.set $5
  local.get $2
  local.set $4
  local.get $5
  local.get $4
  i32.const 2
  i32.shl
  i32.add
  i32.load offset=4
  i32.const 0
  i32.const -1
  i32.xor
  local.get $3
  i32.shl
  i32.and
  local.set $6
  i32.const 0
  local.set $7
  local.get $6
  i32.eqz
  if
   local.get $0
   i32.load
   i32.const 0
   i32.const -1
   i32.xor
   local.get $2
   i32.const 1
   i32.add
   i32.shl
   i32.and
   local.set $5
   local.get $5
   i32.eqz
   if
    i32.const 0
    local.set $7
   else
    local.get $5
    i32.ctz
    local.set $2
    local.get $0
    local.set $8
    local.get $2
    local.set $4
    local.get $8
    local.get $4
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=4
    local.set $6
    i32.const 1
    drop
    local.get $6
    i32.eqz
    if
     i32.const 0
     i32.const 32
     i32.const 351
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
    local.get $0
    local.set $9
    local.get $2
    local.set $8
    local.get $6
    i32.ctz
    local.set $4
    local.get $9
    local.get $8
    i32.const 4
    i32.shl
    local.get $4
    i32.add
    i32.const 2
    i32.shl
    i32.add
    i32.load offset=96
    local.set $7
   end
  else
   local.get $0
   local.set $9
   local.get $2
   local.set $8
   local.get $6
   i32.ctz
   local.set $4
   local.get $9
   local.get $8
   i32.const 4
   i32.shl
   local.get $4
   i32.add
   i32.const 2
   i32.shl
   i32.add
   i32.load offset=96
   local.set $7
  end
  local.get $7
 )
 (func $~lib/rt/tlsf/growMemory (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  i32.const 0
  drop
  local.get $1
  i32.const 536870904
  i32.lt_u
  if
   local.get $1
   i32.const 1
   i32.const 27
   local.get $1
   i32.clz
   i32.sub
   i32.shl
   i32.const 1
   i32.sub
   i32.add
   local.set $1
  end
  memory.size
  local.set $2
  local.get $1
  i32.const 16
  local.get $2
  i32.const 16
  i32.shl
  i32.const 16
  i32.sub
  local.get $0
  local.set $3
  local.get $3
  i32.load offset=1568
  i32.ne
  i32.shl
  i32.add
  local.set $1
  local.get $1
  i32.const 65535
  i32.add
  i32.const 65535
  i32.const -1
  i32.xor
  i32.and
  i32.const 16
  i32.shr_u
  local.set $4
  local.get $2
  local.tee $3
  local.get $4
  local.tee $5
  local.get $3
  local.get $5
  i32.gt_s
  select
  local.set $6
  local.get $6
  memory.grow
  i32.const 0
  i32.lt_s
  if
   local.get $4
   memory.grow
   i32.const 0
   i32.lt_s
   if
    unreachable
   end
  end
  memory.size
  local.set $7
  local.get $0
  local.get $2
  i32.const 16
  i32.shl
  local.get $7
  i32.const 16
  i32.shl
  call $~lib/rt/tlsf/addMemory
  drop
 )
 (func $~lib/rt/tlsf/prepareBlock (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  i32.load
  local.set $3
  i32.const 1
  drop
  local.get $2
  i32.const 15
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 365
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $2
  i32.sub
  local.set $4
  local.get $4
  i32.const 16
  i32.const 16
  i32.add
  i32.ge_u
  if
   local.get $1
   local.get $2
   local.get $3
   i32.const 2
   i32.and
   i32.or
   i32.store
   local.get $1
   i32.const 16
   i32.add
   local.get $2
   i32.add
   local.set $5
   local.get $5
   local.get $4
   i32.const 16
   i32.sub
   i32.const 1
   i32.or
   i32.store
   local.get $0
   local.get $5
   call $~lib/rt/tlsf/insertBlock
  else
   local.get $1
   local.get $3
   i32.const 1
   i32.const -1
   i32.xor
   i32.and
   i32.store
   local.get $1
   local.set $5
   local.get $5
   i32.const 16
   i32.add
   local.get $5
   i32.load
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.get $1
   local.set $5
   local.get $5
   i32.const 16
   i32.add
   local.get $5
   i32.load
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   i32.load
   i32.const 2
   i32.const -1
   i32.xor
   i32.and
   i32.store
  end
 )
 (func $~lib/rt/tlsf/allocateBlock (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 1
  drop
  global.get $~lib/rt/tlsf/collectLock
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 501
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  call $~lib/rt/tlsf/prepareSize
  local.set $3
  local.get $0
  local.get $3
  call $~lib/rt/tlsf/searchBlock
  local.set $4
  local.get $4
  i32.eqz
  if
   global.get $~lib/gc/gc.auto
   if
    i32.const 1
    drop
    i32.const 1
    global.set $~lib/rt/tlsf/collectLock
    call $~lib/rt/pure/__collect
    i32.const 1
    drop
    i32.const 0
    global.set $~lib/rt/tlsf/collectLock
    local.get $0
    local.get $3
    call $~lib/rt/tlsf/searchBlock
    local.set $4
    local.get $4
    i32.eqz
    if
     local.get $0
     local.get $3
     call $~lib/rt/tlsf/growMemory
     local.get $0
     local.get $3
     call $~lib/rt/tlsf/searchBlock
     local.set $4
     i32.const 1
     drop
     local.get $4
     i32.eqz
     if
      i32.const 0
      i32.const 32
      i32.const 513
      i32.const 20
      call $~lib/builtins/abort
      unreachable
     end
    end
   else
    local.get $0
    local.get $3
    call $~lib/rt/tlsf/growMemory
    local.get $0
    local.get $3
    call $~lib/rt/tlsf/searchBlock
    local.set $4
    i32.const 1
    drop
    local.get $4
    i32.eqz
    if
     i32.const 0
     i32.const 32
     i32.const 518
     i32.const 18
     call $~lib/builtins/abort
     unreachable
    end
   end
  end
  i32.const 1
  drop
  local.get $4
  i32.load
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  local.get $3
  i32.ge_u
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 521
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.const 0
  i32.store offset=4
  local.get $4
  local.get $2
  i32.store offset=8
  local.get $4
  local.get $1
  i32.store offset=12
  local.get $0
  local.get $4
  call $~lib/rt/tlsf/removeBlock
  local.get $0
  local.get $4
  local.get $3
  call $~lib/rt/tlsf/prepareBlock
  i32.const 1
  drop
  local.get $4
  call $~lib/rt/rtrace/onalloc
  local.get $4
 )
 (func $~lib/rt/tlsf/__alloc (param $0 i32) (param $1 i32) (result i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/allocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/rt/pure/increment (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 268435455
  i32.const -1
  i32.xor
  i32.and
  local.get $1
  i32.const 1
  i32.add
  i32.const 268435455
  i32.const -1
  i32.xor
  i32.and
  i32.eq
  i32.eqz
  if
   i32.const 0
   i32.const 144
   i32.const 109
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $0
  local.get $1
  i32.const 1
  i32.add
  i32.store offset=4
  i32.const 1
  drop
  local.get $0
  call $~lib/rt/rtrace/onincrement
  i32.const 1
  drop
  local.get $0
  i32.load
  i32.const 1
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 144
   i32.const 112
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
 )
 (func $~lib/rt/pure/__retain (param $0 i32) (result i32)
  local.get $0
  global.get $~lib/heap/__heap_base
  i32.gt_u
  if
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/pure/increment
  end
  local.get $0
 )
 (func $~lib/rt/pure/__release (param $0 i32)
  local.get $0
  global.get $~lib/heap/__heap_base
  i32.gt_u
  if
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/pure/decrement
  end
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|0 (param $0 i32) (result i32)
  local.get $0
 )
 (func $~lib/util/hash/hash32 (param $0 i32) (result i32)
  (local $1 i32)
  i32.const -2128831035
  local.set $1
  local.get $1
  local.get $0
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
  local.get $0
  i32.const 8
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
  local.get $0
  i32.const 16
  i32.shr_u
  i32.const 255
  i32.and
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
  local.get $0
  i32.const 24
  i32.shr_u
  i32.xor
  i32.const 16777619
  i32.mul
  local.set $1
  local.get $1
 )
 (func $~lib/map/Map<usize,i32>#find (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  loop $while-continue|0
   local.get $3
   local.set $4
   local.get $4
   if
    local.get $3
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $3
     i32.load
     local.get $1
     i32.eq
    else
     i32.const 0
    end
    if
     local.get $3
     return
    end
    local.get $3
    i32.load offset=8
    i32.const 1
    i32.const -1
    i32.xor
    i32.and
    local.set $3
    br $while-continue|0
   end
  end
  i32.const 0
 )
 (func $~lib/map/Map<usize,i32>#has (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<usize>|inlined.0 (result i32)
   local.get $1
   local.set $2
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 4
   i32.const 1
   i32.eq
   drop
   i32.const 4
   i32.const 2
   i32.eq
   drop
   i32.const 4
   i32.const 4
   i32.eq
   drop
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<usize>|inlined.0
  end
  call $~lib/map/Map<usize,i32>#find
  i32.const 0
  i32.ne
 )
 (func $~lib/map/Map<usize,i32>#get (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<usize>|inlined.1 (result i32)
   local.get $1
   local.set $2
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 4
   i32.const 1
   i32.eq
   drop
   i32.const 4
   i32.const 2
   i32.eq
   drop
   i32.const 4
   i32.const 4
   i32.eq
   drop
   local.get $2
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<usize>|inlined.1
  end
  call $~lib/map/Map<usize,i32>#find
  local.set $3
  local.get $3
  i32.eqz
  if
   i32.const 304
   i32.const 368
   i32.const 111
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $3
  i32.load offset=4
 )
 (func $~lib/string/String#get:length (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 1
  i32.shr_u
 )
 (func $~lib/memory/memory.fill (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i64)
  (local $10 i32)
  block $~lib/util/memory/memset|inlined.0
   local.get $0
   local.set $5
   local.get $1
   local.set $4
   local.get $2
   local.set $3
   i32.const 0
   i32.const 1
   i32.gt_s
   drop
   local.get $3
   i32.eqz
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $3
   i32.add
   i32.const 4
   i32.sub
   local.set $6
   local.get $5
   local.get $4
   i32.store8
   local.get $6
   local.get $4
   i32.store8 offset=3
   local.get $3
   i32.const 2
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $4
   i32.store8 offset=1
   local.get $5
   local.get $4
   i32.store8 offset=2
   local.get $6
   local.get $4
   i32.store8 offset=2
   local.get $6
   local.get $4
   i32.store8 offset=1
   local.get $3
   i32.const 6
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $4
   i32.store8 offset=3
   local.get $6
   local.get $4
   i32.store8
   local.get $3
   i32.const 8
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   i32.const 0
   local.get $5
   i32.sub
   i32.const 3
   i32.and
   local.set $7
   local.get $5
   local.get $7
   i32.add
   local.set $5
   local.get $3
   local.get $7
   i32.sub
   local.set $3
   local.get $3
   i32.const -4
   i32.and
   local.set $3
   i32.const -1
   i32.const 255
   i32.div_u
   local.get $4
   i32.const 255
   i32.and
   i32.mul
   local.set $8
   local.get $5
   local.get $3
   i32.add
   i32.const 28
   i32.sub
   local.set $6
   local.get $5
   local.get $8
   i32.store
   local.get $6
   local.get $8
   i32.store offset=24
   local.get $3
   i32.const 8
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $8
   i32.store offset=4
   local.get $5
   local.get $8
   i32.store offset=8
   local.get $6
   local.get $8
   i32.store offset=16
   local.get $6
   local.get $8
   i32.store offset=20
   local.get $3
   i32.const 24
   i32.le_u
   if
    br $~lib/util/memory/memset|inlined.0
   end
   local.get $5
   local.get $8
   i32.store offset=12
   local.get $5
   local.get $8
   i32.store offset=16
   local.get $5
   local.get $8
   i32.store offset=20
   local.get $5
   local.get $8
   i32.store offset=24
   local.get $6
   local.get $8
   i32.store
   local.get $6
   local.get $8
   i32.store offset=4
   local.get $6
   local.get $8
   i32.store offset=8
   local.get $6
   local.get $8
   i32.store offset=12
   i32.const 24
   local.get $5
   i32.const 4
   i32.and
   i32.add
   local.set $7
   local.get $5
   local.get $7
   i32.add
   local.set $5
   local.get $3
   local.get $7
   i32.sub
   local.set $3
   local.get $8
   i64.extend_i32_u
   local.get $8
   i64.extend_i32_u
   i64.const 32
   i64.shl
   i64.or
   local.set $9
   loop $while-continue|0
    local.get $3
    i32.const 32
    i32.ge_u
    local.set $10
    local.get $10
    if
     local.get $5
     local.get $9
     i64.store
     local.get $5
     local.get $9
     i64.store offset=8
     local.get $5
     local.get $9
     i64.store offset=16
     local.get $5
     local.get $9
     i64.store offset=24
     local.get $3
     i32.const 32
     i32.sub
     local.set $3
     local.get $5
     i32.const 32
     i32.add
     local.set $5
     br $while-continue|0
    end
   end
  end
 )
 (func $~lib/arraybuffer/ArrayBuffer#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  i32.const 1073741808
  i32.gt_u
  if
   i32.const 416
   i32.const 464
   i32.const 49
   i32.const 43
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.set $2
  local.get $2
  i32.const 0
  local.get $1
  call $~lib/memory/memory.fill
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $3
  local.get $0
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $~lib/map/Map<usize,i32>#rehash (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  local.get $1
  i32.const 1
  i32.add
  local.set $2
  i32.const 0
  local.get $2
  i32.const 4
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $3
  local.get $2
  i32.const 8
  i32.mul
  i32.const 3
  i32.div_s
  local.set $4
  i32.const 0
  local.get $4
  i32.const 12
  i32.mul
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $5
  local.get $0
  i32.load offset=8
  local.set $6
  local.get $6
  local.get $0
  i32.load offset=16
  i32.const 12
  i32.mul
  i32.add
  local.set $7
  local.get $5
  local.set $8
  loop $while-continue|0
   local.get $6
   local.get $7
   i32.ne
   local.set $9
   local.get $9
   if
    local.get $6
    local.set $10
    local.get $10
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $8
     local.set $11
     local.get $11
     local.get $10
     i32.load
     i32.store
     local.get $11
     local.get $10
     i32.load offset=4
     i32.store offset=4
     block $~lib/util/hash/HASH<usize>|inlined.3 (result i32)
      local.get $10
      i32.load
      local.set $12
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 0
      drop
      i32.const 4
      i32.const 1
      i32.eq
      drop
      i32.const 4
      i32.const 2
      i32.eq
      drop
      i32.const 4
      i32.const 4
      i32.eq
      drop
      local.get $12
      call $~lib/util/hash/hash32
      br $~lib/util/hash/HASH<usize>|inlined.3
     end
     local.get $1
     i32.and
     local.set $12
     local.get $3
     local.get $12
     i32.const 4
     i32.mul
     i32.add
     local.set $13
     local.get $11
     local.get $13
     i32.load
     i32.store offset=8
     local.get $13
     local.get $8
     i32.store
     local.get $8
     i32.const 12
     i32.add
     local.set $8
    end
    local.get $6
    i32.const 12
    i32.add
    local.set $6
    br $while-continue|0
   end
  end
  local.get $0
  local.tee $11
  local.get $3
  local.tee $12
  local.get $11
  i32.load
  local.tee $9
  i32.ne
  if
   local.get $12
   call $~lib/rt/pure/__retain
   local.set $12
   local.get $9
   call $~lib/rt/pure/__release
  end
  local.get $12
  i32.store
  local.get $0
  local.get $1
  i32.store offset=4
  local.get $0
  local.tee $13
  local.get $5
  local.tee $9
  local.get $13
  i32.load offset=8
  local.tee $11
  i32.ne
  if
   local.get $9
   call $~lib/rt/pure/__retain
   local.set $9
   local.get $11
   call $~lib/rt/pure/__release
  end
  local.get $9
  i32.store offset=8
  local.get $0
  local.get $4
  i32.store offset=12
  local.get $0
  local.get $0
  i32.load offset=20
  i32.store offset=16
  local.get $3
  call $~lib/rt/pure/__release
  local.get $5
  call $~lib/rt/pure/__release
 )
 (func $~lib/map/Map<usize,i32>#set (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  block $~lib/util/hash/HASH<usize>|inlined.2 (result i32)
   local.get $1
   local.set $3
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 0
   drop
   i32.const 4
   i32.const 1
   i32.eq
   drop
   i32.const 4
   i32.const 2
   i32.eq
   drop
   i32.const 4
   i32.const 4
   i32.eq
   drop
   local.get $3
   call $~lib/util/hash/hash32
   br $~lib/util/hash/HASH<usize>|inlined.2
  end
  local.set $4
  local.get $0
  local.get $1
  local.get $4
  call $~lib/map/Map<usize,i32>#find
  local.set $5
  local.get $5
  if
   i32.const 0
   drop
   local.get $5
   local.get $2
   i32.store offset=4
  else
   local.get $0
   i32.load offset=16
   local.get $0
   i32.load offset=12
   i32.eq
   if
    local.get $0
    local.get $0
    i32.load offset=20
    local.get $0
    i32.load offset=12
    i32.const 3
    i32.mul
    i32.const 4
    i32.div_s
    i32.lt_s
    if (result i32)
     local.get $0
     i32.load offset=4
    else
     local.get $0
     i32.load offset=4
     i32.const 1
     i32.shl
     i32.const 1
     i32.or
    end
    call $~lib/map/Map<usize,i32>#rehash
   end
   local.get $0
   i32.load offset=8
   call $~lib/rt/pure/__retain
   local.set $3
   local.get $3
   local.get $0
   local.get $0
   i32.load offset=16
   local.tee $6
   i32.const 1
   i32.add
   i32.store offset=16
   local.get $6
   i32.const 12
   i32.mul
   i32.add
   local.set $5
   local.get $5
   local.get $1
   i32.store
   local.get $5
   local.get $2
   i32.store offset=4
   local.get $0
   local.get $0
   i32.load offset=20
   i32.const 1
   i32.add
   i32.store offset=20
   local.get $0
   i32.load
   local.get $4
   local.get $0
   i32.load offset=4
   i32.and
   i32.const 4
   i32.mul
   i32.add
   local.set $6
   local.get $5
   local.get $6
   i32.load
   i32.store offset=8
   local.get $6
   local.get $5
   i32.store
   local.get $3
   call $~lib/rt/pure/__release
  end
  local.get $0
  call $~lib/rt/pure/__retain
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 1
   i32.const 272
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 1
  drop
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $0
  i32.const 0
  local.get $0
  call $~lib/string/String#get:length
  i32.const 2
  i32.const 1
  i32.const 272
  local.get $0
  i32.const 0
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $2
  local.set $3
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $~lib/map/Map<usize,i32>#clear (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  local.tee $1
  i32.const 0
  i32.const 16
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $2
  local.get $1
  i32.load
  call $~lib/rt/pure/__release
  local.get $2
  i32.store
  local.get $0
  i32.const 4
  i32.const 1
  i32.sub
  i32.store offset=4
  local.get $0
  local.tee $2
  i32.const 0
  i32.const 48
  call $~lib/arraybuffer/ArrayBuffer#constructor
  local.set $1
  local.get $2
  i32.load offset=8
  call $~lib/rt/pure/__release
  local.get $1
  i32.store offset=8
  local.get $0
  i32.const 4
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
 )
 (func $~lib/map/Map<usize,i32>#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
   i32.const 3
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $0
  i32.const 0
  i32.store offset=16
  local.get $0
  i32.const 0
  i32.store offset=20
  local.get $0
  call $~lib/map/Map<usize,i32>#clear
  local.get $0
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/Reflect/Reflect.attachStackTrace (param $0 i32)
  local.get $0
  call $assembly/internal/Reflect/attachStackTraceToReflectedValue
 )
 (func $assembly/internal/log/log<~lib/string/String> (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  global.get $assembly/internal/log/ignoreLogs
  if
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|1
  i32.const 192
  call $assembly/internal/log/log<~lib/string/String>
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|2
  i32.const 528
  call $assembly/internal/log/log<~lib/string/String>
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|0
  i32.const 640
  call $assembly/internal/log/log<~lib/string/String>
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|1
  i32.const 688
  call $assembly/internal/log/log<~lib/string/String>
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|2
  i32.const 736
  call $assembly/internal/log/log<~lib/string/String>
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|3
  i32.const 784
  call $assembly/internal/log/log<~lib/string/String>
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|4
  i32.const 880
  call $assembly/internal/log/log<~lib/string/String>
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<i32> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  drop
  i32.const 2
  i32.const 3
  i32.eq
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  drop
  i32.const 1
  i32.const 4
  i32.const 7
  i32.const 992
  local.get $0
  f64.convert_i32_s
  call $assembly/internal/Reflect/createReflectedNumber
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<i32>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<i32>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/log/log<i32> (param $0 i32)
  (local $1 i32)
  global.get $assembly/internal/log/ignoreLogs
  if
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<i32>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|5
  i32.const 42
  call $assembly/internal/log/log<i32>
 )
 (func $~lib/arraybuffer/ArrayBufferView#constructor (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 2
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $1
  i32.const 1073741808
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   i32.const 416
   i32.const 464
   i32.const 18
   i32.const 57
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  local.get $2
  i32.shl
  local.tee $1
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.set $3
  local.get $3
  i32.const 0
  local.get $1
  call $~lib/memory/memory.fill
  local.get $0
  local.tee $4
  local.get $3
  local.tee $5
  local.get $4
  i32.load
  local.tee $6
  i32.ne
  if
   local.get $5
   call $~lib/rt/pure/__retain
   local.set $5
   local.get $6
   call $~lib/rt/pure/__release
  end
  local.get $5
  i32.store
  local.get $0
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $1
  i32.store offset=8
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#constructor (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 4
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  local.get $1
  i32.const 0
  call $~lib/arraybuffer/ArrayBufferView#constructor
  local.set $0
  local.get $0
 )
 (func $~lib/typedarray/Uint8Array#__uset (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.add
  local.get $2
  i32.store8
 )
 (func $~lib/arraybuffer/ArrayBuffer#get:byteLength (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<u8> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  drop
  i32.const 0
  i32.const 3
  i32.eq
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  drop
  i32.const 0
  i32.const 1
  i32.const 7
  i32.const 1136
  local.get $0
  f64.convert_i32_u
  call $assembly/internal/Reflect/createReflectedNumber
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/arraybuffer/ArrayBuffer> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 0
   i32.const 1088
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 1
  drop
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $0
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  local.get $0
  i32.const 0
  local.get $0
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  i32.const 3
  i32.const 0
  i32.const 1088
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/arraybuffer/ArrayBuffer#get:byteLength
  local.set $3
  i32.const 0
  local.set $4
  loop $for-loop|0
   local.get $4
   local.get $3
   i32.lt_s
   local.set $5
   local.get $5
   if
    local.get $2
    local.get $0
    local.get $4
    i32.add
    i32.load8_u
    local.get $1
    call $assembly/internal/Reflect/Reflect.toReflectedValue<u8>
    call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $2
  local.set $4
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/arraybuffer/ArrayBuffer>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/arraybuffer/ArrayBuffer>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/log/log<~lib/arraybuffer/ArrayBuffer> (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  global.get $assembly/internal/log/ignoreLogs
  if
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/arraybuffer/ArrayBuffer>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|6
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  i32.const 0
  i32.const 8
  call $~lib/typedarray/Uint8Array#constructor
  local.set $0
  i32.const 0
  local.set $1
  loop $for-loop|0
   local.get $1
   i32.const 8
   i32.lt_s
   local.set $2
   local.get $2
   if
    local.get $0
    local.get $1
    local.get $1
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__uset
    local.get $1
    i32.const 1
    i32.add
    local.set $1
    br $for-loop|0
   end
  end
  local.get $0
  i32.load
  call $assembly/internal/log/log<~lib/arraybuffer/ArrayBuffer>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#constructor (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
   i32.const 5
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  local.get $1
  f64.store
  local.get $0
  local.get $2
  f64.store offset=8
  local.get $0
  local.get $3
  f64.store offset=16
  local.get $0
 )
 (func $assembly/internal/RTrace/RTrace.sizeOf (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
 )
 (func $~lib/util/memory/memcpy (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  loop $while-continue|0
   local.get $2
   if (result i32)
    local.get $1
    i32.const 3
    i32.and
   else
    i32.const 0
   end
   local.set $5
   local.get $5
   if
    local.get $0
    local.tee $6
    i32.const 1
    i32.add
    local.set $0
    local.get $6
    local.get $1
    local.tee $6
    i32.const 1
    i32.add
    local.set $1
    local.get $6
    i32.load8_u
    i32.store8
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    br $while-continue|0
   end
  end
  local.get $0
  i32.const 3
  i32.and
  i32.const 0
  i32.eq
  if
   loop $while-continue|1
    local.get $2
    i32.const 16
    i32.ge_u
    local.set $5
    local.get $5
    if
     local.get $0
     local.get $1
     i32.load
     i32.store
     local.get $0
     i32.const 4
     i32.add
     local.get $1
     i32.const 4
     i32.add
     i32.load
     i32.store
     local.get $0
     i32.const 8
     i32.add
     local.get $1
     i32.const 8
     i32.add
     i32.load
     i32.store
     local.get $0
     i32.const 12
     i32.add
     local.get $1
     i32.const 12
     i32.add
     i32.load
     i32.store
     local.get $1
     i32.const 16
     i32.add
     local.set $1
     local.get $0
     i32.const 16
     i32.add
     local.set $0
     local.get $2
     i32.const 16
     i32.sub
     local.set $2
     br $while-continue|1
    end
   end
   local.get $2
   i32.const 8
   i32.and
   if
    local.get $0
    local.get $1
    i32.load
    i32.store
    local.get $0
    i32.const 4
    i32.add
    local.get $1
    i32.const 4
    i32.add
    i32.load
    i32.store
    local.get $0
    i32.const 8
    i32.add
    local.set $0
    local.get $1
    i32.const 8
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 4
   i32.and
   if
    local.get $0
    local.get $1
    i32.load
    i32.store
    local.get $0
    i32.const 4
    i32.add
    local.set $0
    local.get $1
    i32.const 4
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 2
   i32.and
   if
    local.get $0
    local.get $1
    i32.load16_u
    i32.store16
    local.get $0
    i32.const 2
    i32.add
    local.set $0
    local.get $1
    i32.const 2
    i32.add
    local.set $1
   end
   local.get $2
   i32.const 1
   i32.and
   if
    local.get $0
    local.tee $5
    i32.const 1
    i32.add
    local.set $0
    local.get $5
    local.get $1
    local.tee $5
    i32.const 1
    i32.add
    local.set $1
    local.get $5
    i32.load8_u
    i32.store8
   end
   return
  end
  local.get $2
  i32.const 32
  i32.ge_u
  if
   block $break|2
    block $case2|2
     block $case1|2
      block $case0|2
       local.get $0
       i32.const 3
       i32.and
       local.set $5
       local.get $5
       i32.const 1
       i32.eq
       br_if $case0|2
       local.get $5
       i32.const 2
       i32.eq
       br_if $case1|2
       local.get $5
       i32.const 3
       i32.eq
       br_if $case2|2
       br $break|2
      end
      local.get $1
      i32.load
      local.set $3
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.load8_u
      i32.store8
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.load8_u
      i32.store8
      local.get $0
      local.tee $5
      i32.const 1
      i32.add
      local.set $0
      local.get $5
      local.get $1
      local.tee $5
      i32.const 1
      i32.add
      local.set $1
      local.get $5
      i32.load8_u
      i32.store8
      local.get $2
      i32.const 3
      i32.sub
      local.set $2
      loop $while-continue|3
       local.get $2
       i32.const 17
       i32.ge_u
       local.set $5
       local.get $5
       if
        local.get $1
        i32.const 1
        i32.add
        i32.load
        local.set $4
        local.get $0
        local.get $3
        i32.const 24
        i32.shr_u
        local.get $4
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 5
        i32.add
        i32.load
        local.set $3
        local.get $0
        i32.const 4
        i32.add
        local.get $4
        i32.const 24
        i32.shr_u
        local.get $3
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 9
        i32.add
        i32.load
        local.set $4
        local.get $0
        i32.const 8
        i32.add
        local.get $3
        i32.const 24
        i32.shr_u
        local.get $4
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 13
        i32.add
        i32.load
        local.set $3
        local.get $0
        i32.const 12
        i32.add
        local.get $4
        i32.const 24
        i32.shr_u
        local.get $3
        i32.const 8
        i32.shl
        i32.or
        i32.store
        local.get $1
        i32.const 16
        i32.add
        local.set $1
        local.get $0
        i32.const 16
        i32.add
        local.set $0
        local.get $2
        i32.const 16
        i32.sub
        local.set $2
        br $while-continue|3
       end
      end
      br $break|2
     end
     local.get $1
     i32.load
     local.set $3
     local.get $0
     local.tee $5
     i32.const 1
     i32.add
     local.set $0
     local.get $5
     local.get $1
     local.tee $5
     i32.const 1
     i32.add
     local.set $1
     local.get $5
     i32.load8_u
     i32.store8
     local.get $0
     local.tee $5
     i32.const 1
     i32.add
     local.set $0
     local.get $5
     local.get $1
     local.tee $5
     i32.const 1
     i32.add
     local.set $1
     local.get $5
     i32.load8_u
     i32.store8
     local.get $2
     i32.const 2
     i32.sub
     local.set $2
     loop $while-continue|4
      local.get $2
      i32.const 18
      i32.ge_u
      local.set $5
      local.get $5
      if
       local.get $1
       i32.const 2
       i32.add
       i32.load
       local.set $4
       local.get $0
       local.get $3
       i32.const 16
       i32.shr_u
       local.get $4
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 6
       i32.add
       i32.load
       local.set $3
       local.get $0
       i32.const 4
       i32.add
       local.get $4
       i32.const 16
       i32.shr_u
       local.get $3
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 10
       i32.add
       i32.load
       local.set $4
       local.get $0
       i32.const 8
       i32.add
       local.get $3
       i32.const 16
       i32.shr_u
       local.get $4
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 14
       i32.add
       i32.load
       local.set $3
       local.get $0
       i32.const 12
       i32.add
       local.get $4
       i32.const 16
       i32.shr_u
       local.get $3
       i32.const 16
       i32.shl
       i32.or
       i32.store
       local.get $1
       i32.const 16
       i32.add
       local.set $1
       local.get $0
       i32.const 16
       i32.add
       local.set $0
       local.get $2
       i32.const 16
       i32.sub
       local.set $2
       br $while-continue|4
      end
     end
     br $break|2
    end
    local.get $1
    i32.load
    local.set $3
    local.get $0
    local.tee $5
    i32.const 1
    i32.add
    local.set $0
    local.get $5
    local.get $1
    local.tee $5
    i32.const 1
    i32.add
    local.set $1
    local.get $5
    i32.load8_u
    i32.store8
    local.get $2
    i32.const 1
    i32.sub
    local.set $2
    loop $while-continue|5
     local.get $2
     i32.const 19
     i32.ge_u
     local.set $5
     local.get $5
     if
      local.get $1
      i32.const 3
      i32.add
      i32.load
      local.set $4
      local.get $0
      local.get $3
      i32.const 8
      i32.shr_u
      local.get $4
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 7
      i32.add
      i32.load
      local.set $3
      local.get $0
      i32.const 4
      i32.add
      local.get $4
      i32.const 8
      i32.shr_u
      local.get $3
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 11
      i32.add
      i32.load
      local.set $4
      local.get $0
      i32.const 8
      i32.add
      local.get $3
      i32.const 8
      i32.shr_u
      local.get $4
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 15
      i32.add
      i32.load
      local.set $3
      local.get $0
      i32.const 12
      i32.add
      local.get $4
      i32.const 8
      i32.shr_u
      local.get $3
      i32.const 24
      i32.shl
      i32.or
      i32.store
      local.get $1
      i32.const 16
      i32.add
      local.set $1
      local.get $0
      i32.const 16
      i32.add
      local.set $0
      local.get $2
      i32.const 16
      i32.sub
      local.set $2
      br $while-continue|5
     end
    end
    br $break|2
   end
  end
  local.get $2
  i32.const 16
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 8
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 4
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 2
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
  local.get $2
  i32.const 1
  i32.and
  if
   local.get $0
   local.tee $5
   i32.const 1
   i32.add
   local.set $0
   local.get $5
   local.get $1
   local.tee $5
   i32.const 1
   i32.add
   local.set $1
   local.get $5
   i32.load8_u
   i32.store8
  end
 )
 (func $~lib/memory/memory.copy (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  block $~lib/util/memory/memmove|inlined.0
   local.get $0
   local.set $5
   local.get $1
   local.set $4
   local.get $2
   local.set $3
   local.get $5
   local.get $4
   i32.eq
   if
    br $~lib/util/memory/memmove|inlined.0
   end
   i32.const 0
   i32.const 1
   i32.lt_s
   drop
   local.get $4
   local.get $3
   i32.add
   local.get $5
   i32.le_u
   if (result i32)
    i32.const 1
   else
    local.get $5
    local.get $3
    i32.add
    local.get $4
    i32.le_u
   end
   if
    local.get $5
    local.get $4
    local.get $3
    call $~lib/util/memory/memcpy
    br $~lib/util/memory/memmove|inlined.0
   end
   local.get $5
   local.get $4
   i32.lt_u
   if
    i32.const 0
    i32.const 2
    i32.lt_s
    drop
    local.get $4
    i32.const 7
    i32.and
    local.get $5
    i32.const 7
    i32.and
    i32.eq
    if
     loop $while-continue|0
      local.get $5
      i32.const 7
      i32.and
      local.set $6
      local.get $6
      if
       local.get $3
       i32.eqz
       if
        br $~lib/util/memory/memmove|inlined.0
       end
       local.get $3
       i32.const 1
       i32.sub
       local.set $3
       local.get $5
       local.tee $7
       i32.const 1
       i32.add
       local.set $5
       local.get $7
       local.get $4
       local.tee $7
       i32.const 1
       i32.add
       local.set $4
       local.get $7
       i32.load8_u
       i32.store8
       br $while-continue|0
      end
     end
     loop $while-continue|1
      local.get $3
      i32.const 8
      i32.ge_u
      local.set $6
      local.get $6
      if
       local.get $5
       local.get $4
       i64.load
       i64.store
       local.get $3
       i32.const 8
       i32.sub
       local.set $3
       local.get $5
       i32.const 8
       i32.add
       local.set $5
       local.get $4
       i32.const 8
       i32.add
       local.set $4
       br $while-continue|1
      end
     end
    end
    loop $while-continue|2
     local.get $3
     local.set $6
     local.get $6
     if
      local.get $5
      local.tee $7
      i32.const 1
      i32.add
      local.set $5
      local.get $7
      local.get $4
      local.tee $7
      i32.const 1
      i32.add
      local.set $4
      local.get $7
      i32.load8_u
      i32.store8
      local.get $3
      i32.const 1
      i32.sub
      local.set $3
      br $while-continue|2
     end
    end
   else
    i32.const 0
    i32.const 2
    i32.lt_s
    drop
    local.get $4
    i32.const 7
    i32.and
    local.get $5
    i32.const 7
    i32.and
    i32.eq
    if
     loop $while-continue|3
      local.get $5
      local.get $3
      i32.add
      i32.const 7
      i32.and
      local.set $6
      local.get $6
      if
       local.get $3
       i32.eqz
       if
        br $~lib/util/memory/memmove|inlined.0
       end
       local.get $5
       local.get $3
       i32.const 1
       i32.sub
       local.tee $3
       i32.add
       local.get $4
       local.get $3
       i32.add
       i32.load8_u
       i32.store8
       br $while-continue|3
      end
     end
     loop $while-continue|4
      local.get $3
      i32.const 8
      i32.ge_u
      local.set $6
      local.get $6
      if
       local.get $3
       i32.const 8
       i32.sub
       local.set $3
       local.get $5
       local.get $3
       i32.add
       local.get $4
       local.get $3
       i32.add
       i64.load
       i64.store
       br $while-continue|4
      end
     end
    end
    loop $while-continue|5
     local.get $3
     local.set $6
     local.get $6
     if
      local.get $5
      local.get $3
      i32.const 1
      i32.sub
      local.tee $3
      i32.add
      local.get $4
      local.get $3
      i32.add
      i32.load8_u
      i32.store8
      br $while-continue|5
     end
    end
   end
  end
 )
 (func $~lib/rt/__allocBuffer (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/__alloc
  local.set $3
  local.get $2
  if
   local.get $3
   local.get $2
   local.get $0
   call $~lib/memory/memory.copy
  end
  local.get $3
 )
 (func $~lib/staticarray/StaticArray<i64>#get:length (param $0 i32) (result i32)
  local.get $0
  i32.const 16
  i32.sub
  i32.load offset=12
  i32.const 3
  i32.shr_u
 )
 (func $~lib/staticarray/StaticArray<i64>#indexOf (param $0 i32) (param $1 i64) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  call $~lib/staticarray/StaticArray<i64>#get:length
  local.set $3
  local.get $3
  i32.const 0
  i32.eq
  if (result i32)
   i32.const 1
  else
   local.get $2
   local.get $3
   i32.ge_s
  end
  if
   i32.const -1
   return
  end
  local.get $2
  i32.const 0
  i32.lt_s
  if
   local.get $3
   local.get $2
   i32.add
   local.tee $4
   i32.const 0
   local.tee $5
   local.get $4
   local.get $5
   i32.gt_s
   select
   local.set $2
  end
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_s
   local.set $4
   local.get $4
   if
    local.get $0
    local.get $2
    i32.const 3
    i32.shl
    i32.add
    i64.load
    local.get $1
    i64.eq
    if
     local.get $2
     return
    end
    local.get $2
    i32.const 1
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
  i32.const -1
 )
 (func $~lib/staticarray/StaticArray<i64>#includes (param $0 i32) (param $1 i64) (param $2 i32) (result i32)
  i32.const 0
  drop
  local.get $0
  local.get $1
  local.get $2
  call $~lib/staticarray/StaticArray<i64>#indexOf
  i32.const 0
  i32.ge_s
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<f64> (param $0 f64) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  drop
  i32.const 3
  i32.const 3
  i32.eq
  if (result i32)
   i32.const 0
  else
   i32.const 0
  end
  drop
  i32.const 1
  i32.const 8
  i32.const 8
  i32.const 1296
  local.get $0
  call $assembly/internal/Reflect/createReflectedNumber
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/__tests__/setup/Vec3/Vec3#__aspectAddReflectedValueKeyValuePairs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  drop
  local.get $3
  i64.const 4685345497827770368
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1264
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685345532187508736
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1328
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load offset=8
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685345566547247104
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1360
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load offset=16
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 5
   i32.const 1216
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  i32.const 1
  i32.const 0
  i32.const 24
  local.get $0
  i32.const 0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  i32.const 1
  i32.const 5
  i32.const 1216
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  local.get $2
  local.get $1
  i32.const 0
  i32.const 6
  i32.const 1248
  call $~lib/rt/__allocBuffer
  call $~lib/rt/pure/__retain
  local.tee $3
  call $assembly/__tests__/setup/Vec3/Vec3#__aspectAddReflectedValueKeyValuePairs
  local.get $2
  local.set $4
  local.get $3
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/log/log<assembly/__tests__/setup/Vec3/Vec3> (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  global.get $assembly/internal/log/ignoreLogs
  if
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|7
  (local $0 i32)
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/setup/Vec3/Vec3#constructor
  local.tee $0
  call $assembly/internal/log/log<assembly/__tests__/setup/Vec3/Vec3>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3 | null> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 5
   i32.const 1216
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  i32.const 1
  i32.const 1
  i32.const 24
  local.get $0
  i32.const 0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  i32.const 1
  i32.const 5
  i32.const 1216
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  local.get $2
  local.get $1
  i32.const 0
  i32.const 6
  i32.const 1440
  call $~lib/rt/__allocBuffer
  call $~lib/rt/pure/__retain
  local.tee $3
  call $assembly/__tests__/setup/Vec3/Vec3#__aspectAddReflectedValueKeyValuePairs
  local.get $2
  local.set $4
  local.get $3
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3 | null>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3 | null>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/log/log<assembly/__tests__/setup/Vec3/Vec3 | null> (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  global.get $assembly/internal/log/ignoreLogs
  if
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/setup/Vec3/Vec3 | null>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|8
  i32.const 0
  call $assembly/internal/log/log<assembly/__tests__/setup/Vec3/Vec3 | null>
 )
 (func "$assembly/internal/Reflect/Reflect.toReflectedValue<(i: i32) => i32>" (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 6
   i32.const 0
   i32.const 1536
   i32.const 0
   i32.const 0
   i32.const 0
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 1
  i32.eqz
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 1
  drop
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $0
  i32.const 0
  i32.const 0
  i32.const 6
  i32.const 31
  i32.const 1536
  local.get $0
  i32.const 0
  i32.const 0
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func "$assembly/internal/Reflect/Reflect.toReflectedValue<(i: i32) => i32>@varargs" (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call "$assembly/internal/Reflect/Reflect.toReflectedValue<(i: i32) => i32>"
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func "$assembly/internal/log/log<(i: i32) => i32>" (param $0 i32)
  (local $1 i32)
  global.get $assembly/internal/log/ignoreLogs
  if
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call "$assembly/internal/Reflect/Reflect.toReflectedValue<(i: i32) => i32>@varargs"
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|9
  global.get $assembly/__tests__/logs.spec/anonIDFunc
  call "$assembly/internal/log/log<(i: i32) => i32>"
 )
 (func $assembly/__tests__/logs.spec/IDFunc (param $0 i32) (result i32)
  local.get $0
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|10
  i32.const 14
  call "$assembly/internal/log/log<(i: i32) => i32>"
 )
 (func $assembly/__tests__/logs.spec/B#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 36
   i32.const 8
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 1
  i32.store8
  local.get $0
  i32.const 2
  i32.store16 offset=2
  local.get $0
  i32.const 3
  i32.store offset=4
  local.get $0
  i64.const 4
  i64.store offset=8
  local.get $0
  i32.const 0
  call $~lib/rt/pure/__retain
  i32.store offset=16
  local.get $0
  f32.const 5
  f32.store offset=20
  local.get $0
  f64.const 6
  f64.store offset=24
  local.get $0
  i32.const 7
  i32.store offset=32
  local.get $0
 )
 (func $assembly/__tests__/logs.spec/A#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 16
   i32.const 7
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  f64.const 1
  f64.store
  local.get $0
  i32.const 0
  call $assembly/__tests__/logs.spec/B#constructor
  i32.store offset=8
  local.get $0
  i32.const 3
  i32.store offset=12
  local.get $0
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<i16> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  drop
  i32.const 1
  i32.const 3
  i32.eq
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  drop
  i32.const 1
  i32.const 2
  i32.const 7
  i32.const 1856
  local.get $0
  f64.convert_i32_s
  call $assembly/internal/Reflect/createReflectedNumber
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<u32> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  drop
  i32.const 2
  i32.const 3
  i32.eq
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  drop
  i32.const 0
  i32.const 4
  i32.const 7
  i32.const 1920
  local.get $0
  f64.convert_i32_u
  call $assembly/internal/Reflect/createReflectedNumber
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<i64> (param $0 i64) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  drop
  i32.const 3
  i32.const 3
  i32.eq
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  drop
  i32.const 1
  i32.const 8
  i32.const 7
  i32.const 1984
  local.get $0
  i64.const 4294967295
  i64.and
  i32.wrap_i64
  local.get $0
  i64.const 32
  i64.shr_u
  i32.wrap_i64
  call $assembly/internal/Reflect/createReflectedLong
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/A | null> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 7
   i32.const 1696
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  i32.const 1
  i32.const 1
  i32.const 16
  local.get $0
  i32.const 0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  i32.const 1
  i32.const 7
  i32.const 1696
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  local.get $2
  local.get $1
  i32.const 0
  i32.const 6
  i32.const 2048
  call $~lib/rt/__allocBuffer
  call $~lib/rt/pure/__retain
  local.tee $3
  call $assembly/__tests__/logs.spec/A#__aspectAddReflectedValueKeyValuePairs
  local.get $2
  local.set $4
  local.get $3
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<f32> (param $0 f32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  drop
  i32.const 2
  i32.const 3
  i32.eq
  if (result i32)
   i32.const 0
  else
   i32.const 0
  end
  drop
  i32.const 1
  i32.const 4
  i32.const 8
  i32.const 2096
  local.get $0
  f64.promote_f32
  call $assembly/internal/Reflect/createReflectedNumber
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/__tests__/logs.spec/B#__aspectAddReflectedValueKeyValuePairs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  drop
  local.get $3
  i64.const 4685344707553787904
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1744
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   i32.load8_u
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<u8>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685344741913526272
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1776
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   i32.load16_s offset=2
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<i16>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685344776273264640
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1888
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   i32.load offset=4
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<u32>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685344810633003008
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1952
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   i64.load offset=8
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<i64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685344844992741376
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 2016
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   i32.load offset=16
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/A | null>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685344879352479744
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 2064
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f32.load offset=20
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f32>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685344913712218112
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 2128
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load offset=24
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685344948071956480
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 2160
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   i32.load offset=32
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<i32>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/B> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 8
   i32.const 1808
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  i32.const 1
  i32.const 0
  i32.const 36
  local.get $0
  i32.const 0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  i32.const 1
  i32.const 8
  i32.const 1808
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  local.get $2
  local.get $1
  i32.const 0
  i32.const 6
  i32.const 1840
  call $~lib/rt/__allocBuffer
  call $~lib/rt/pure/__retain
  local.tee $3
  call $assembly/__tests__/logs.spec/B#__aspectAddReflectedValueKeyValuePairs
  local.get $2
  local.set $4
  local.get $3
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/__tests__/logs.spec/A#__aspectAddReflectedValueKeyValuePairs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  drop
  local.get $3
  i64.const 4685344707553787904
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1744
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685344741913526272
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1776
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   i32.load offset=8
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/B>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685344776273264640
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1888
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   i32.load offset=12
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<i32>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/A> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 7
   i32.const 1696
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  i32.const 1
  i32.const 0
  i32.const 16
  local.get $0
  i32.const 0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  i32.const 1
  i32.const 7
  i32.const 1696
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  local.get $2
  local.get $1
  i32.const 0
  i32.const 6
  i32.const 1728
  call $~lib/rt/__allocBuffer
  call $~lib/rt/pure/__retain
  local.tee $3
  call $assembly/__tests__/logs.spec/A#__aspectAddReflectedValueKeyValuePairs
  local.get $2
  local.set $4
  local.get $3
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/A>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/A>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/log/log<assembly/__tests__/logs.spec/A> (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  global.get $assembly/internal/log/ignoreLogs
  if
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/A>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|11
  (local $0 i32)
  i32.const 0
  call $assembly/__tests__/logs.spec/A#constructor
  local.set $0
  local.get $0
  call $assembly/internal/log/log<assembly/__tests__/logs.spec/A>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<bool> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 0
  drop
  i32.const 0
  i32.const 3
  i32.eq
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  drop
  i32.const 0
  i32.const 1
  i32.const 9
  i32.const 2224
  local.get $0
  f64.convert_i32_u
  call $assembly/internal/Reflect/createReflectedNumber
  local.set $2
  local.get $2
  local.set $3
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<bool>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<bool>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/log/log<bool> (param $0 i32)
  (local $1 i32)
  global.get $assembly/internal/log/ignoreLogs
  if
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<bool>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|12
  i32.const 1
  call $assembly/internal/log/log<bool>
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|13
  i32.const 0
  call $assembly/internal/log/log<bool>
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|14
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  i32.const 0
  call $assembly/__tests__/logs.spec/A#constructor
  local.set $0
  i32.const 0
  call $assembly/__tests__/logs.spec/B#constructor
  local.set $1
  local.get $1
  local.tee $2
  local.get $0
  local.tee $3
  local.get $2
  i32.load offset=16
  local.tee $4
  i32.ne
  if
   local.get $3
   call $~lib/rt/pure/__retain
   local.set $3
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $3
  i32.store offset=16
  local.get $0
  local.tee $4
  local.get $1
  local.tee $3
  local.get $4
  i32.load offset=8
  local.tee $2
  i32.ne
  if
   local.get $3
   call $~lib/rt/pure/__retain
   local.set $3
   local.get $2
   call $~lib/rt/pure/__release
  end
  local.get $3
  i32.store offset=8
  local.get $0
  call $assembly/internal/log/log<assembly/__tests__/logs.spec/A>
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/logs.spec/Empty#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 12
   i32.const 9
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
 )
 (func $~lib/array/Array<assembly/__tests__/logs.spec/A>#get:length (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $~lib/array/Array<assembly/__tests__/logs.spec/A>#__uget (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<assembly/__tests__/logs.spec/A>> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 10
   i32.const 2576
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 1
  drop
  local.get $0
  call $~lib/array/Array<assembly/__tests__/logs.spec/A>#get:length
  local.set $2
  i32.const 0
  i32.const 0
  i32.const 0
  i32.const 0
  local.get $0
  i32.const 0
  local.get $2
  i32.const 10
  i32.const 10
  i32.const 2576
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $3
  local.get $1
  local.get $0
  local.get $3
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  i32.const 0
  local.set $4
  loop $for-loop|0
   local.get $4
   local.get $2
   i32.lt_s
   local.set $5
   local.get $5
   if
    local.get $0
    local.get $4
    call $~lib/array/Array<assembly/__tests__/logs.spec/A>#__uget
    local.tee $6
    call $~lib/rt/pure/__retain
    local.set $7
    local.get $7
    local.get $1
    call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/A>
    local.set $8
    local.get $3
    local.get $8
    call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
    local.get $6
    call $~lib/rt/pure/__release
    local.get $7
    call $~lib/rt/pure/__release
    local.get $4
    i32.const 1
    i32.add
    local.set $4
    br $for-loop|0
   end
  end
  local.get $3
  local.set $4
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>#get:size (param $0 i32) (result i32)
  local.get $0
  i32.load offset=20
 )
 (func $~lib/array/Array<assembly/__tests__/logs.spec/B>#constructor (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.eqz
  if
   i32.const 16
   i32.const 12
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 0
  i32.store
  local.get $0
  i32.const 0
  i32.store offset=4
  local.get $0
  i32.const 0
  i32.store offset=8
  local.get $0
  i32.const 0
  i32.store offset=12
  local.get $1
  i32.const 1073741808
  i32.const 2
  i32.shr_u
  i32.gt_u
  if
   i32.const 416
   i32.const 2864
   i32.const 57
   i32.const 60
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 2
  i32.shl
  local.set $2
  local.get $2
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.set $3
  local.get $3
  i32.const 0
  local.get $2
  call $~lib/memory/memory.fill
  local.get $0
  local.tee $4
  local.get $3
  local.tee $5
  local.get $4
  i32.load
  local.tee $6
  i32.ne
  if
   local.get $5
   call $~lib/rt/pure/__retain
   local.set $5
   local.get $6
   call $~lib/rt/pure/__release
  end
  local.get $5
  i32.store
  local.get $0
  local.get $3
  i32.store offset=4
  local.get $0
  local.get $2
  i32.store offset=8
  local.get $0
  local.get $1
  i32.store offset=12
  local.get $0
 )
 (func $~lib/rt/tlsf/checkUsedBlock (param $0 i32) (result i32)
  (local $1 i32)
  local.get $0
  i32.const 16
  i32.sub
  local.set $1
  local.get $0
  i32.const 0
  i32.ne
  if (result i32)
   local.get $0
   i32.const 15
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $1
   i32.load
   i32.const 1
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   local.get $1
   i32.load offset=4
   i32.const 268435455
   i32.const -1
   i32.xor
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  i32.eqz
  if
   i32.const 0
   i32.const 32
   i32.const 581
   i32.const 3
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
 )
 (func $~lib/rt/tlsf/freeBlock (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $1
  i32.load
  local.set $2
  local.get $1
  local.get $2
  i32.const 1
  i32.or
  i32.store
  local.get $0
  local.get $1
  call $~lib/rt/tlsf/insertBlock
  i32.const 1
  drop
  local.get $1
  call $~lib/rt/rtrace/onfree
 )
 (func $~lib/rt/tlsf/reallocateBlock (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $2
  call $~lib/rt/tlsf/prepareSize
  local.set $3
  local.get $1
  i32.load
  local.set $4
  local.get $3
  local.get $4
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.le_u
  if
   local.get $0
   local.get $1
   local.get $3
   call $~lib/rt/tlsf/prepareBlock
   local.get $1
   local.get $2
   i32.store offset=12
   local.get $1
   return
  end
  local.get $1
  local.set $5
  local.get $5
  i32.const 16
  i32.add
  local.get $5
  i32.load
  i32.const 3
  i32.const -1
  i32.xor
  i32.and
  i32.add
  local.set $6
  local.get $6
  i32.load
  local.set $7
  local.get $7
  i32.const 1
  i32.and
  if
   local.get $4
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.const 16
   i32.add
   local.get $7
   i32.const 3
   i32.const -1
   i32.xor
   i32.and
   i32.add
   local.set $5
   local.get $5
   local.get $3
   i32.ge_u
   if
    local.get $0
    local.get $6
    call $~lib/rt/tlsf/removeBlock
    local.get $1
    local.get $4
    i32.const 3
    i32.and
    local.get $5
    i32.or
    i32.store
    local.get $1
    local.get $2
    i32.store offset=12
    local.get $0
    local.get $1
    local.get $3
    call $~lib/rt/tlsf/prepareBlock
    local.get $1
    return
   end
  end
  local.get $0
  local.get $2
  local.get $1
  i32.load offset=8
  call $~lib/rt/tlsf/allocateBlock
  local.set $8
  local.get $8
  local.get $1
  i32.load offset=4
  i32.store offset=4
  local.get $8
  i32.const 16
  i32.add
  local.get $1
  i32.const 16
  i32.add
  local.get $2
  call $~lib/memory/memory.copy
  local.get $1
  global.get $~lib/heap/__heap_base
  i32.ge_u
  if
   i32.const 1
   drop
   local.get $1
   local.get $8
   call $~lib/rt/rtrace/onrealloc
   local.get $0
   local.get $1
   call $~lib/rt/tlsf/freeBlock
  end
  local.get $8
 )
 (func $~lib/rt/tlsf/__realloc (param $0 i32) (param $1 i32) (result i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  call $~lib/rt/tlsf/checkUsedBlock
  local.get $1
  call $~lib/rt/tlsf/reallocateBlock
  i32.const 16
  i32.add
 )
 (func $~lib/array/ensureSize (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load offset=8
  local.set $3
  local.get $1
  local.get $3
  local.get $2
  i32.shr_u
  i32.gt_u
  if
   local.get $1
   i32.const 1073741808
   local.get $2
   i32.shr_u
   i32.gt_u
   if
    i32.const 416
    i32.const 2864
    i32.const 14
    i32.const 48
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   i32.load
   local.set $4
   local.get $1
   local.get $2
   i32.shl
   local.set $5
   local.get $4
   local.get $5
   call $~lib/rt/tlsf/__realloc
   local.set $6
   local.get $6
   local.get $3
   i32.add
   i32.const 0
   local.get $5
   local.get $3
   i32.sub
   call $~lib/memory/memory.fill
   local.get $6
   local.get $4
   i32.ne
   if
    local.get $0
    local.get $6
    i32.store
    local.get $0
    local.get $6
    i32.store offset=4
   end
   local.get $0
   local.get $5
   i32.store offset=8
  end
 )
 (func $~lib/array/Array<assembly/__tests__/logs.spec/B>#__uset (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  i32.const 1
  drop
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  local.get $3
  i32.load
  local.set $4
  local.get $2
  local.get $4
  i32.ne
  if
   local.get $3
   local.get $2
   call $~lib/rt/pure/__retain
   i32.store
   local.get $4
   call $~lib/rt/pure/__release
  end
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $~lib/array/Array<assembly/__tests__/logs.spec/B>#__set (param $0 i32) (param $1 i32) (param $2 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $1
  local.get $0
  i32.load offset=12
  i32.ge_u
  if
   local.get $1
   i32.const 0
   i32.lt_s
   if
    i32.const 2912
    i32.const 2864
    i32.const 120
    i32.const 22
    call $~lib/builtins/abort
    unreachable
   end
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   i32.const 2
   call $~lib/array/ensureSize
   local.get $0
   local.get $1
   i32.const 1
   i32.add
   i32.store offset=12
  end
  local.get $0
  local.get $1
  local.get $2
  call $~lib/array/Array<assembly/__tests__/logs.spec/B>#__uset
  local.get $2
  call $~lib/rt/pure/__release
 )
 (func $~lib/array/Array<assembly/__tests__/logs.spec/B>#set:length (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.load offset=12
  local.set $2
  i32.const 1
  drop
  local.get $2
  local.get $1
  i32.gt_s
  if
   local.get $0
   i32.load offset=4
   local.set $3
   local.get $3
   local.get $1
   i32.const 2
   i32.shl
   i32.add
   local.set $4
   local.get $3
   local.get $2
   i32.const 2
   i32.shl
   i32.add
   local.set $5
   loop $do-continue|0
    local.get $4
    i32.load
    call $~lib/rt/pure/__release
    local.get $4
    i32.const 4
    i32.add
    local.tee $4
    local.get $5
    i32.lt_u
    local.set $6
    local.get $6
    br_if $do-continue|0
   end
  else
   local.get $0
   local.get $1
   i32.const 2
   call $~lib/array/ensureSize
  end
  local.get $0
  local.get $1
  i32.store offset=12
 )
 (func $~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>#keys (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  local.get $0
  i32.load offset=8
  local.set $1
  local.get $0
  i32.load offset=16
  local.set $2
  i32.const 0
  local.get $2
  call $~lib/array/Array<assembly/__tests__/logs.spec/B>#constructor
  local.set $3
  i32.const 0
  local.set $4
  i32.const 0
  local.set $5
  loop $for-loop|0
   local.get $5
   local.get $2
   i32.lt_s
   local.set $6
   local.get $6
   if
    local.get $1
    local.get $5
    i32.const 12
    i32.mul
    i32.add
    local.set $7
    local.get $7
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     local.get $3
     local.get $4
     local.tee $8
     i32.const 1
     i32.add
     local.set $4
     local.get $8
     local.get $7
     i32.load
     call $~lib/array/Array<assembly/__tests__/logs.spec/B>#__set
    end
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
  local.get $3
  local.get $4
  call $~lib/array/Array<assembly/__tests__/logs.spec/B>#set:length
  local.get $3
 )
 (func $~lib/array/Array<assembly/__tests__/logs.spec/B>#get:length (param $0 i32) (result i32)
  local.get $0
  i32.load offset=12
 )
 (func $~lib/array/Array<assembly/__tests__/logs.spec/B>#__uget (param $0 i32) (param $1 i32) (result i32)
  local.get $0
  i32.load offset=4
  local.get $1
  i32.const 2
  i32.shl
  i32.add
  i32.load
  call $~lib/rt/pure/__retain
 )
 (func $~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>#find (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.load
  local.get $2
  local.get $0
  i32.load offset=4
  i32.and
  i32.const 4
  i32.mul
  i32.add
  i32.load
  local.set $3
  loop $while-continue|0
   local.get $3
   local.set $4
   local.get $4
   if
    local.get $3
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if (result i32)
     local.get $3
     i32.load
     local.get $1
     i32.eq
    else
     i32.const 0
    end
    if
     local.get $3
     local.set $5
     local.get $1
     call $~lib/rt/pure/__release
     local.get $5
     return
    end
    local.get $3
    i32.load offset=8
    i32.const 1
    i32.const -1
    i32.xor
    i32.and
    local.set $3
    br $while-continue|0
   end
  end
  i32.const 0
  local.set $4
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
 )
 (func $~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>#get (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  local.get $1
  block $~lib/util/hash/HASH<assembly/__tests__/logs.spec/B>|inlined.0 (result i32)
   local.get $1
   call $~lib/rt/pure/__retain
   local.set $2
   i32.const 0
   drop
   i32.const 1
   drop
   i32.const 4
   i32.const 4
   i32.eq
   drop
   local.get $2
   call $~lib/util/hash/hash32
   local.set $3
   local.get $2
   call $~lib/rt/pure/__release
   local.get $3
   br $~lib/util/hash/HASH<assembly/__tests__/logs.spec/B>|inlined.0
  end
  call $~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>#find
  local.set $4
  local.get $4
  i32.eqz
  if
   i32.const 304
   i32.const 368
   i32.const 111
   i32.const 17
   call $~lib/builtins/abort
   unreachable
  end
  local.get $4
  i32.load offset=4
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 11
   i32.const 2704
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 1
  drop
  i32.const 0
  i32.const 1
  i32.const 0
  i32.const 0
  local.get $0
  i32.const 0
  local.get $0
  call $~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>#get:size
  i32.const 4
  i32.const 11
  i32.const 2704
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>#keys
  local.set $3
  local.get $3
  call $~lib/array/Array<assembly/__tests__/logs.spec/B>#get:length
  local.set $4
  i32.const 0
  local.set $5
  loop $for-loop|0
   local.get $5
   local.get $4
   i32.lt_s
   local.set $6
   local.get $6
   if
    local.get $3
    local.get $5
    call $~lib/array/Array<assembly/__tests__/logs.spec/B>#__uget
    local.tee $7
    call $~lib/rt/pure/__retain
    local.set $8
    local.get $8
    local.get $1
    call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/B>
    local.set $9
    local.get $2
    local.get $9
    call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
    local.get $0
    local.get $8
    call $~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>#get
    local.set $10
    local.get $10
    local.get $1
    call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/Empty>
    local.set $11
    local.get $2
    local.get $11
    call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
    local.get $7
    call $~lib/rt/pure/__release
    local.get $8
    call $~lib/rt/pure/__release
    local.get $10
    call $~lib/rt/pure/__release
    local.get $5
    i32.const 1
    i32.add
    local.set $5
    br $for-loop|0
   end
  end
  local.get $2
  local.set $5
  local.get $3
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $5
  return
 )
 (func $assembly/__tests__/logs.spec/Empty#__aspectAddReflectedValueKeyValuePairs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  drop
  local.get $3
  i64.const 4685345326029078528
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 2512
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   i32.load
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685345360388816896
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 2544
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   i32.load offset=4
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/array/Array<assembly/__tests__/logs.spec/A>>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685345119870648320
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 2672
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   i32.load offset=8
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/Empty> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 9
   i32.const 2464
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  i32.const 1
  i32.const 0
  i32.const 12
  local.get $0
  i32.const 0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  i32.const 1
  i32.const 9
  i32.const 2464
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  local.get $2
  local.get $1
  i32.const 0
  i32.const 6
  i32.const 2496
  call $~lib/rt/__allocBuffer
  call $~lib/rt/pure/__retain
  local.tee $3
  call $assembly/__tests__/logs.spec/Empty#__aspectAddReflectedValueKeyValuePairs
  local.get $2
  local.set $4
  local.get $3
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/Empty>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/Empty>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/log/log<assembly/__tests__/logs.spec/Empty> (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  global.get $assembly/internal/log/ignoreLogs
  if
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/Empty>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|15
  (local $0 i32)
  i32.const 0
  call $assembly/__tests__/logs.spec/Empty#constructor
  local.set $0
  local.get $0
  call $assembly/internal/log/log<assembly/__tests__/logs.spec/Empty>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/logs.spec/UnmanagedClass#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
   i32.const 0
   call $~lib/rt/tlsf/__alloc
   local.set $0
  end
  local.get $0
  f64.const 1
  f64.store
  local.get $0
  f64.const 2
  f64.store offset=8
  local.get $0
  f64.const 3
  f64.store offset=16
  local.get $0
 )
 (func $assembly/__tests__/logs.spec/UnmanagedClass#__aspectAddReflectedValueKeyValuePairs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  drop
  local.get $3
  i64.const 4685344707553787904
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1744
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685344741913526272
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1776
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load offset=8
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685344776273264640
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1888
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load offset=16
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/UnmanagedClass> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 0
   i32.const 3024
   i32.const 0
   i32.const 0
   i32.const 0
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  i32.const 1
  i32.const 0
  i32.const 24
  local.get $0
  i32.const 0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  i32.const 1
  i32.const 0
  i32.const 3024
  i32.const 0
  i32.const 1
  i32.const 0
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  local.get $2
  local.get $1
  i32.const 0
  i32.const 6
  i32.const 3072
  call $~lib/rt/__allocBuffer
  call $~lib/rt/pure/__retain
  local.tee $3
  call $assembly/__tests__/logs.spec/UnmanagedClass#__aspectAddReflectedValueKeyValuePairs
  local.get $2
  local.set $4
  local.get $3
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/UnmanagedClass>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/UnmanagedClass>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/log/log<assembly/__tests__/logs.spec/UnmanagedClass> (param $0 i32)
  (local $1 i32)
  global.get $assembly/internal/log/ignoreLogs
  if
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/UnmanagedClass>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
 )
 (func $~lib/rt/tlsf/__free (param $0 i32)
  call $~lib/rt/tlsf/maybeInitialize
  local.get $0
  call $~lib/rt/tlsf/checkUsedBlock
  call $~lib/rt/tlsf/freeBlock
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|16
  (local $0 i32)
  i32.const 0
  call $assembly/__tests__/logs.spec/UnmanagedClass#constructor
  local.set $0
  local.get $0
  call $assembly/internal/log/log<assembly/__tests__/logs.spec/UnmanagedClass>
  local.get $0
  call $~lib/rt/tlsf/__free
 )
 (func $assembly/__tests__/logs.spec/CustomDisplayStringClass#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 8
   i32.const 13
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 2
  i32.store
  local.get $0
  i32.const 3232
  i32.store offset=4
  local.get $0
 )
 (func $~lib/string/String#concat (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $1
  i32.const 0
  i32.eq
  if
   i32.const 3360
   local.tee $2
   local.get $1
   local.tee $3
   i32.ne
   if
    local.get $2
    call $~lib/rt/pure/__retain
    local.set $2
    local.get $3
    call $~lib/rt/pure/__release
   end
   local.get $2
   local.set $1
  end
  local.get $0
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $4
  local.get $1
  call $~lib/string/String#get:length
  i32.const 1
  i32.shl
  local.set $5
  local.get $4
  local.get $5
  i32.add
  local.set $6
  local.get $6
  i32.const 0
  i32.eq
  if
   i32.const 3392
   call $~lib/rt/pure/__retain
   local.set $2
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  local.get $6
  i32.const 1
  call $~lib/rt/tlsf/__alloc
  call $~lib/rt/pure/__retain
  local.set $7
  local.get $7
  local.get $0
  local.get $4
  call $~lib/memory/memory.copy
  local.get $7
  local.get $4
  i32.add
  local.get $1
  local.get $5
  call $~lib/memory/memory.copy
  local.get $7
  local.set $2
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $~lib/string/String.__concat (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  local.get $0
  i32.const 3360
  local.get $0
  i32.const 0
  i32.ne
  select
  local.get $1
  call $~lib/string/String#concat
  local.set $2
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
 )
 (func $~lib/util/number/decimalCount32 (param $0 i32) (result i32)
  local.get $0
  i32.const 100000
  i32.lt_u
  if
   local.get $0
   i32.const 100
   i32.lt_u
   if
    i32.const 1
    local.get $0
    i32.const 10
    i32.ge_u
    i32.add
    return
   else
    i32.const 3
    local.get $0
    i32.const 10000
    i32.ge_u
    i32.add
    local.get $0
    i32.const 1000
    i32.ge_u
    i32.add
    return
   end
   unreachable
  else
   local.get $0
   i32.const 10000000
   i32.lt_u
   if
    i32.const 6
    local.get $0
    i32.const 1000000
    i32.ge_u
    i32.add
    return
   else
    i32.const 8
    local.get $0
    i32.const 1000000000
    i32.ge_u
    i32.add
    local.get $0
    i32.const 100000000
    i32.ge_u
    i32.add
    return
   end
   unreachable
  end
  unreachable
 )
 (func $~lib/util/number/utoa32_lut (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i64)
  (local $9 i64)
  (local $10 i32)
  (local $11 i32)
  loop $while-continue|0
   local.get $1
   i32.const 10000
   i32.ge_u
   local.set $3
   local.get $3
   if
    local.get $1
    i32.const 10000
    i32.div_u
    local.set $4
    local.get $1
    i32.const 10000
    i32.rem_u
    local.set $5
    local.get $4
    local.set $1
    local.get $5
    i32.const 100
    i32.div_u
    local.set $6
    local.get $5
    i32.const 100
    i32.rem_u
    local.set $7
    i32.const 3412
    local.get $6
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $8
    i32.const 3412
    local.get $7
    i32.const 2
    i32.shl
    i32.add
    i64.load32_u
    local.set $9
    local.get $2
    i32.const 4
    i32.sub
    local.set $2
    local.get $0
    local.get $2
    i32.const 1
    i32.shl
    i32.add
    local.get $8
    local.get $9
    i64.const 32
    i64.shl
    i64.or
    i64.store
    br $while-continue|0
   end
  end
  local.get $1
  i32.const 100
  i32.ge_u
  if
   local.get $1
   i32.const 100
   i32.div_u
   local.set $3
   local.get $1
   i32.const 100
   i32.rem_u
   local.set $10
   local.get $3
   local.set $1
   local.get $2
   i32.const 2
   i32.sub
   local.set $2
   i32.const 3412
   local.get $10
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $11
   local.get $0
   local.get $2
   i32.const 1
   i32.shl
   i32.add
   local.get $11
   i32.store
  end
  local.get $1
  i32.const 10
  i32.ge_u
  if
   local.get $2
   i32.const 2
   i32.sub
   local.set $2
   i32.const 3412
   local.get $1
   i32.const 2
   i32.shl
   i32.add
   i32.load
   local.set $11
   local.get $0
   local.get $2
   i32.const 1
   i32.shl
   i32.add
   local.get $11
   i32.store
  else
   local.get $2
   i32.const 1
   i32.sub
   local.set $2
   i32.const 48
   local.get $1
   i32.add
   local.set $11
   local.get $0
   local.get $2
   i32.const 1
   i32.shl
   i32.add
   local.get $11
   i32.store16
  end
 )
 (func $~lib/util/number/itoa32 (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  local.get $0
  i32.eqz
  if
   i32.const 3408
   return
  end
  local.get $0
  i32.const 31
  i32.shr_u
  local.set $1
  local.get $1
  if
   i32.const 0
   local.get $0
   i32.sub
   local.set $0
  end
  local.get $0
  call $~lib/util/number/decimalCount32
  local.get $1
  i32.add
  local.set $2
  local.get $2
  i32.const 1
  i32.shl
  i32.const 1
  call $~lib/rt/tlsf/__alloc
  local.set $3
  local.get $3
  local.set $6
  local.get $0
  local.set $5
  local.get $2
  local.set $4
  i32.const 0
  i32.const 1
  i32.ge_s
  drop
  local.get $6
  local.get $5
  local.get $4
  call $~lib/util/number/utoa32_lut
  local.get $1
  if
   local.get $3
   i32.const 45
   i32.store16
  end
  local.get $3
  call $~lib/rt/pure/__retain
 )
 (func $~lib/util/number/itoa<i32> (param $0 i32) (result i32)
  i32.const 1
  i32.eqz
  drop
  i32.const 1
  drop
  i32.const 4
  i32.const 4
  i32.le_u
  drop
  local.get $0
  call $~lib/util/number/itoa32
  return
 )
 (func $~lib/number/I32#toString (param $0 i32) (result i32)
  local.get $0
  call $~lib/util/number/itoa<i32>
 )
 (func $assembly/__tests__/logs.spec/CustomDisplayStringClass#__aspectReflectAs (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  local.get $0
  i32.load offset=4
  i32.const 3328
  call $~lib/string/String.__concat
  local.tee $1
  local.get $0
  i32.load
  call $~lib/number/I32#toString
  local.tee $2
  call $~lib/string/String.__concat
  local.tee $3
  i32.const 3840
  call $~lib/string/String.__concat
  local.tee $4
  local.set $5
  local.get $1
  call $~lib/rt/pure/__release
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
  local.get $5
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/CustomDisplayStringClass> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 13
   i32.const 3264
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 1
  drop
  local.get $0
  call $assembly/__tests__/logs.spec/CustomDisplayStringClass#__aspectReflectAs
  local.set $2
  i32.const 0
  i32.eqz
  if (result i32)
   i32.const 0
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   i32.const 1
   i32.eqz
  else
   i32.const 0
  end
  drop
  local.get $2
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/CustomDisplayStringClass>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/CustomDisplayStringClass>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/log/log<assembly/__tests__/logs.spec/CustomDisplayStringClass> (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  global.get $assembly/internal/log/ignoreLogs
  if
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/CustomDisplayStringClass>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|17
  (local $0 i32)
  i32.const 0
  call $assembly/__tests__/logs.spec/CustomDisplayStringClass#constructor
  local.set $0
  local.get $0
  call $assembly/internal/log/log<assembly/__tests__/logs.spec/CustomDisplayStringClass>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/logs.spec/CustomDisplayNumberClass#constructor (param $0 i32) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 8
   i32.const 14
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  i32.const 2
  i32.store
  local.get $0
  i32.const 3232
  i32.store offset=4
  local.get $0
 )
 (func $assembly/__tests__/logs.spec/CustomDisplayNumberClass#__aspectReflectAs (param $0 i32) (result i32)
  local.get $0
  i32.load offset=4
  call $~lib/string/String#get:length
  local.get $0
  i32.load
  i32.add
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/CustomDisplayNumberClass> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 14
   i32.const 4016
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 1
  drop
  local.get $0
  call $assembly/__tests__/logs.spec/CustomDisplayNumberClass#__aspectReflectAs
  local.set $2
  i32.const 1
  i32.eqz
  if (result i32)
   i32.const 0
   i32.eqz
  else
   i32.const 0
  end
  if (result i32)
   i32.const 0
   i32.eqz
  else
   i32.const 0
  end
  drop
  local.get $2
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<i32>
  local.set $3
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $3
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/CustomDisplayNumberClass>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/CustomDisplayNumberClass>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/log/log<assembly/__tests__/logs.spec/CustomDisplayNumberClass> (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  global.get $assembly/internal/log/ignoreLogs
  if
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/CustomDisplayNumberClass>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|18
  (local $0 i32)
  i32.const 0
  call $assembly/__tests__/logs.spec/CustomDisplayNumberClass#constructor
  local.set $0
  local.get $0
  call $assembly/internal/log/log<assembly/__tests__/logs.spec/CustomDisplayNumberClass>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $assembly/__tests__/logs.spec/ExampleNamespace.ExampleNestedVector#constructor (param $0 i32) (param $1 f64) (param $2 f64) (param $3 f64) (result i32)
  local.get $0
  i32.eqz
  if
   i32.const 24
   i32.const 15
   call $~lib/rt/tlsf/__alloc
   call $~lib/rt/pure/__retain
   local.set $0
  end
  local.get $0
  local.get $1
  f64.store
  local.get $0
  local.get $2
  f64.store offset=8
  local.get $0
  local.get $3
  f64.store offset=16
  local.get $0
 )
 (func $assembly/__tests__/logs.spec/ExampleNamespace.ExampleNestedVector#__aspectAddReflectedValueKeyValuePairs (param $0 i32) (param $1 i32) (param $2 i32) (param $3 i32)
  local.get $2
  call $~lib/rt/pure/__retain
  local.set $2
  local.get $3
  call $~lib/rt/pure/__retain
  local.set $3
  i32.const 0
  drop
  local.get $3
  i64.const 4685345497827770368
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1264
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685345532187508736
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1328
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load offset=8
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $3
  i64.const 4685345566547247104
  i32.const 0
  call $~lib/staticarray/StaticArray<i64>#includes
  i32.eqz
  if
   local.get $1
   i32.const 1360
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<~lib/string/String>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectKey
   local.get $1
   local.get $0
   f64.load offset=16
   local.get $2
   call $assembly/internal/Reflect/Reflect.toReflectedValue<f64>
   call $assembly/internal/Reflect/__aspectPushReflectedObjectValue
  end
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
  call $~lib/rt/pure/__release
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/ExampleNamespace.ExampleNestedVector> (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  local.get $1
  call $~lib/rt/pure/__retain
  local.set $1
  i32.const 1
  drop
  local.get $0
  i32.const 0
  i32.eq
  if
   i32.const 1
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 0
   i32.const 4
   i32.const 1
   i32.const 15
   i32.const 4144
   i32.const 0
   i32.const 0
   i32.const 1
   call $assembly/internal/Reflect/createReflectedValue
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  i32.eqz
  drop
  local.get $1
  local.get $0
  call $~lib/map/Map<usize,i32>#has
  if
   local.get $1
   local.get $0
   call $~lib/map/Map<usize,i32>#get
   local.set $2
   local.get $0
   call $~lib/rt/pure/__release
   local.get $1
   call $~lib/rt/pure/__release
   local.get $2
   return
  end
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  drop
  i32.const 0
  i32.const 1
  i32.const 0
  i32.const 24
  local.get $0
  i32.const 0
  local.get $0
  call $assembly/internal/RTrace/RTrace.sizeOf
  i32.const 1
  i32.const 15
  i32.const 4144
  i32.const 0
  i32.const 1
  i32.const 1
  call $assembly/internal/Reflect/createReflectedValue
  local.set $2
  local.get $1
  local.get $0
  local.get $2
  call $~lib/map/Map<usize,i32>#set
  call $~lib/rt/pure/__release
  local.get $0
  local.get $2
  local.get $1
  i32.const 0
  i32.const 6
  i32.const 4208
  call $~lib/rt/__allocBuffer
  call $~lib/rt/pure/__retain
  local.tee $3
  call $assembly/__tests__/logs.spec/ExampleNamespace.ExampleNestedVector#__aspectAddReflectedValueKeyValuePairs
  local.get $2
  local.set $4
  local.get $3
  call $~lib/rt/pure/__release
  local.get $0
  call $~lib/rt/pure/__release
  local.get $1
  call $~lib/rt/pure/__release
  local.get $4
  return
 )
 (func $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/ExampleNamespace.ExampleNestedVector>@varargs (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  block $1of1
   block $0of1
    block $outOfRange
     global.get $~argumentsLength
     i32.const 1
     i32.sub
     br_table $0of1 $1of1 $outOfRange
    end
    unreachable
   end
   i32.const 0
   call $~lib/map/Map<usize,i32>#constructor
   local.tee $2
   local.set $1
  end
  local.get $0
  local.get $1
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/ExampleNamespace.ExampleNestedVector>
  local.set $3
  local.get $2
  call $~lib/rt/pure/__release
  local.get $3
 )
 (func $assembly/internal/log/log<assembly/__tests__/logs.spec/ExampleNamespace.ExampleNestedVector> (param $0 i32)
  (local $1 i32)
  local.get $0
  call $~lib/rt/pure/__retain
  local.set $0
  global.get $assembly/internal/log/ignoreLogs
  if
   local.get $0
   call $~lib/rt/pure/__release
   return
  end
  local.get $0
  i32.const 1
  global.set $~argumentsLength
  i32.const 0
  call $assembly/internal/Reflect/Reflect.toReflectedValue<assembly/__tests__/logs.spec/ExampleNamespace.ExampleNestedVector>@varargs
  local.set $1
  local.get $1
  call $assembly/internal/Reflect/Reflect.attachStackTrace
  local.get $1
  call $assembly/internal/log/logReflectedValue
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3~anonymous|19
  (local $0 i32)
  i32.const 0
  f64.const 1
  f64.const 2
  f64.const 3
  call $assembly/__tests__/logs.spec/ExampleNamespace.ExampleNestedVector#constructor
  local.set $0
  local.get $0
  call $assembly/internal/log/log<assembly/__tests__/logs.spec/ExampleNamespace.ExampleNestedVector>
  local.get $0
  call $~lib/rt/pure/__release
 )
 (func $start:assembly/__tests__/logs.spec~anonymous|3
  i32.const 4
  call $assembly/internal/Test/beforeAll
  i32.const 5
  call $assembly/internal/Test/afterAll
  i32.const 6
  call $assembly/internal/Test/beforeEach
  i32.const 7
  call $assembly/internal/Test/afterEach
  i32.const 832
  i32.const 8
  call $assembly/internal/Test/test
  i32.const 944
  i32.const 9
  call $assembly/internal/Test/test
  i32.const 1024
  i32.const 10
  call $assembly/internal/Test/test
  i32.const 1168
  i32.const 11
  call $assembly/internal/Test/test
  i32.const 1392
  i32.const 12
  call $assembly/internal/Test/test
  i32.const 1456
  i32.const 13
  call $assembly/internal/Test/test
  i32.const 1568
  i32.const 15
  call $assembly/internal/Test/test
  i32.const 1632
  i32.const 16
  call $assembly/internal/Test/test
  i32.const 2192
  i32.const 17
  call $assembly/internal/Test/test
  i32.const 2256
  i32.const 18
  call $assembly/internal/Test/test
  i32.const 2304
  i32.const 19
  call $assembly/internal/Test/test
  i32.const 2368
  i32.const 20
  call $assembly/internal/Test/test
  i32.const 2976
  i32.const 21
  call $assembly/internal/Test/test
  i32.const 3088
  i32.const 22
  call $assembly/internal/Test/test
  i32.const 3872
  i32.const 23
  call $assembly/internal/Test/test
  i32.const 4080
  i32.const 24
  call $assembly/internal/Test/test
  i32.const 4224
  call $assembly/internal/Test/todo
 )
 (func $start:assembly/__tests__/logs.spec
  i32.const 2
  call $assembly/internal/Test/beforeAll
  i32.const 3
  call $assembly/internal/Test/afterAll
  i32.const 608
  i32.const 25
  call $assembly/internal/Test/describe
 )
 (func $start:assembly/internal/noOp~anonymous|0
  nop
 )
 (func $assembly/internal/call/__call (param $0 i32)
  i32.const 0
  global.set $~argumentsLength
  local.get $0
  call_indirect (type $none_=>_none)
 )
 (func $assembly/internal/log/__ignoreLogs (param $0 i32)
  local.get $0
  i32.const 0
  i32.ne
  global.set $assembly/internal/log/ignoreLogs
 )
 (func $assembly/internal/RTrace/__disableRTrace
  i32.const 0
  global.set $assembly/internal/RTrace/RTrace.enabled
 )
 (func $assembly/internal/RTrace/__getUsizeArrayId (result i32)
  i32.const 16
 )
 (func $~start
  global.get $~started
  if
   return
  else
   i32.const 1
   global.set $~started
  end
  call $start:assembly/__tests__/logs.spec
 )
 (func $~lib/rt/pure/markGray (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 1879048192
  i32.and
  i32.const 268435456
  i32.ne
  if
   local.get $0
   local.get $1
   i32.const 1879048192
   i32.const -1
   i32.xor
   i32.and
   i32.const 268435456
   i32.or
   i32.store offset=4
   local.get $0
   i32.const 16
   i32.add
   i32.const 2
   call $~lib/rt/__visit_members
  end
 )
 (func $~lib/rt/pure/scanBlack (param $0 i32)
  local.get $0
  local.get $0
  i32.load offset=4
  i32.const 1879048192
  i32.const -1
  i32.xor
  i32.and
  i32.const 0
  i32.or
  i32.store offset=4
  local.get $0
  i32.const 16
  i32.add
  i32.const 4
  call $~lib/rt/__visit_members
 )
 (func $~lib/rt/pure/scan (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 1879048192
  i32.and
  i32.const 268435456
  i32.eq
  if
   local.get $1
   i32.const 268435455
   i32.and
   i32.const 0
   i32.gt_u
   if
    local.get $0
    call $~lib/rt/pure/scanBlack
   else
    local.get $0
    local.get $1
    i32.const 1879048192
    i32.const -1
    i32.xor
    i32.and
    i32.const 536870912
    i32.or
    i32.store offset=4
    local.get $0
    i32.const 16
    i32.add
    i32.const 3
    call $~lib/rt/__visit_members
   end
  end
 )
 (func $~lib/rt/pure/collectWhite (param $0 i32)
  (local $1 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 1879048192
  i32.and
  i32.const 536870912
  i32.eq
  if (result i32)
   local.get $1
   i32.const -2147483648
   i32.and
   i32.eqz
  else
   i32.const 0
  end
  if
   local.get $0
   local.get $1
   i32.const 1879048192
   i32.const -1
   i32.xor
   i32.and
   i32.const 0
   i32.or
   i32.store offset=4
   local.get $0
   i32.const 16
   i32.add
   i32.const 5
   call $~lib/rt/__visit_members
   global.get $~lib/rt/tlsf/ROOT
   local.get $0
   call $~lib/rt/tlsf/freeBlock
  end
 )
 (func $~lib/rt/pure/__collect
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  i32.const 0
  drop
  global.get $~lib/rt/pure/ROOTS
  local.set $0
  local.get $0
  local.set $1
  local.get $1
  local.set $2
  global.get $~lib/rt/pure/CUR
  local.set $3
  loop $for-loop|0
   local.get $2
   local.get $3
   i32.lt_u
   local.set $4
   local.get $4
   if
    local.get $2
    i32.load
    local.set $5
    local.get $5
    i32.load offset=4
    local.set $6
    local.get $6
    i32.const 1879048192
    i32.and
    i32.const 805306368
    i32.eq
    if (result i32)
     local.get $6
     i32.const 268435455
     i32.and
     i32.const 0
     i32.gt_u
    else
     i32.const 0
    end
    if
     local.get $5
     call $~lib/rt/pure/markGray
     local.get $1
     local.get $5
     i32.store
     local.get $1
     i32.const 4
     i32.add
     local.set $1
    else
     local.get $6
     i32.const 1879048192
     i32.and
     i32.const 0
     i32.eq
     if (result i32)
      local.get $6
      i32.const 268435455
      i32.and
      i32.eqz
     else
      i32.const 0
     end
     if
      global.get $~lib/rt/tlsf/ROOT
      local.get $5
      call $~lib/rt/tlsf/freeBlock
     else
      local.get $5
      local.get $6
      i32.const -2147483648
      i32.const -1
      i32.xor
      i32.and
      i32.store offset=4
     end
    end
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    br $for-loop|0
   end
  end
  local.get $1
  global.set $~lib/rt/pure/CUR
  local.get $0
  local.set $3
  loop $for-loop|1
   local.get $3
   local.get $1
   i32.lt_u
   local.set $2
   local.get $2
   if
    local.get $3
    i32.load
    call $~lib/rt/pure/scan
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    br $for-loop|1
   end
  end
  local.get $0
  local.set $3
  loop $for-loop|2
   local.get $3
   local.get $1
   i32.lt_u
   local.set $2
   local.get $2
   if
    local.get $3
    i32.load
    local.set $4
    local.get $4
    local.get $4
    i32.load offset=4
    i32.const -2147483648
    i32.const -1
    i32.xor
    i32.and
    i32.store offset=4
    local.get $4
    call $~lib/rt/pure/collectWhite
    local.get $3
    i32.const 4
    i32.add
    local.set $3
    br $for-loop|2
   end
  end
  local.get $0
  global.set $~lib/rt/pure/CUR
 )
 (func $~lib/rt/__typeinfo (param $0 i32) (result i32)
  (local $1 i32)
  global.get $~lib/rt/__rtti_base
  local.set $1
  local.get $0
  local.get $1
  i32.load
  i32.gt_u
  if
   i32.const 2912
   i32.const 4304
   i32.const 22
   i32.const 28
   call $~lib/builtins/abort
   unreachable
  end
  local.get $1
  i32.const 4
  i32.add
  local.get $0
  i32.const 8
  i32.mul
  i32.add
  i32.load
 )
 (func $~lib/rt/pure/growRoots
  (local $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  global.get $~lib/rt/pure/ROOTS
  local.set $0
  global.get $~lib/rt/pure/CUR
  local.get $0
  i32.sub
  local.set $1
  local.get $1
  i32.const 2
  i32.mul
  local.tee $2
  i32.const 64
  i32.const 2
  i32.shl
  local.tee $3
  local.get $2
  local.get $3
  i32.gt_u
  select
  local.set $4
  local.get $4
  i32.const 0
  call $~lib/rt/tlsf/__alloc
  local.set $5
  i32.const 1
  drop
  local.get $5
  i32.const 16
  i32.sub
  call $~lib/rt/rtrace/onfree
  local.get $5
  local.get $0
  local.get $1
  call $~lib/memory/memory.copy
  local.get $0
  if
   i32.const 1
   drop
   local.get $0
   i32.const 16
   i32.sub
   call $~lib/rt/rtrace/onalloc
   local.get $0
   call $~lib/rt/tlsf/__free
  end
  local.get $5
  global.set $~lib/rt/pure/ROOTS
  local.get $5
  local.get $1
  i32.add
  global.set $~lib/rt/pure/CUR
  local.get $5
  local.get $4
  i32.add
  global.set $~lib/rt/pure/END
 )
 (func $~lib/rt/pure/appendRoot (param $0 i32)
  (local $1 i32)
  global.get $~lib/rt/pure/CUR
  local.set $1
  local.get $1
  global.get $~lib/rt/pure/END
  i32.ge_u
  if
   call $~lib/rt/pure/growRoots
   global.get $~lib/rt/pure/CUR
   local.set $1
  end
  local.get $1
  local.get $0
  i32.store
  local.get $1
  i32.const 4
  i32.add
  global.set $~lib/rt/pure/CUR
 )
 (func $~lib/rt/pure/decrement (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  local.get $0
  i32.load offset=4
  local.set $1
  local.get $1
  i32.const 268435455
  i32.and
  local.set $2
  i32.const 1
  drop
  local.get $0
  call $~lib/rt/rtrace/ondecrement
  i32.const 1
  drop
  local.get $0
  i32.load
  i32.const 1
  i32.and
  i32.eqz
  i32.eqz
  if
   i32.const 0
   i32.const 144
   i32.const 122
   i32.const 14
   call $~lib/builtins/abort
   unreachable
  end
  local.get $2
  i32.const 1
  i32.eq
  if
   local.get $0
   i32.const 16
   i32.add
   i32.const 1
   call $~lib/rt/__visit_members
   i32.const 0
   drop
   local.get $1
   i32.const -2147483648
   i32.and
   i32.eqz
   if
    global.get $~lib/rt/tlsf/ROOT
    local.get $0
    call $~lib/rt/tlsf/freeBlock
   else
    local.get $0
    i32.const -2147483648
    i32.const 0
    i32.or
    i32.const 0
    i32.or
    i32.store offset=4
   end
  else
   i32.const 1
   drop
   local.get $2
   i32.const 0
   i32.gt_u
   i32.eqz
   if
    i32.const 0
    i32.const 144
    i32.const 136
    i32.const 16
    call $~lib/builtins/abort
    unreachable
   end
   i32.const 0
   drop
   local.get $0
   i32.load offset=8
   call $~lib/rt/__typeinfo
   i32.const 32
   i32.and
   i32.eqz
   if
    local.get $0
    i32.const -2147483648
    i32.const 805306368
    i32.or
    local.get $2
    i32.const 1
    i32.sub
    i32.or
    i32.store offset=4
    local.get $1
    i32.const -2147483648
    i32.and
    i32.eqz
    if
     local.get $0
     call $~lib/rt/pure/appendRoot
    end
   else
    local.get $0
    local.get $1
    i32.const 268435455
    i32.const -1
    i32.xor
    i32.and
    local.get $2
    i32.const 1
    i32.sub
    i32.or
    i32.store offset=4
   end
  end
 )
 (func $~lib/rt/pure/__visit (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  local.get $0
  global.get $~lib/heap/__heap_base
  i32.lt_u
  if
   return
  end
  i32.const 0
  drop
  local.get $0
  i32.const 16
  i32.sub
  local.set $2
  block $break|0
   block $case5|0
    block $case4|0
     block $case3|0
      block $case2|0
       block $case1|0
        block $case0|0
         local.get $1
         local.set $3
         local.get $3
         i32.const 1
         i32.eq
         br_if $case0|0
         local.get $3
         i32.const 2
         i32.eq
         br_if $case1|0
         local.get $3
         i32.const 3
         i32.eq
         br_if $case2|0
         local.get $3
         i32.const 4
         i32.eq
         br_if $case3|0
         local.get $3
         i32.const 5
         i32.eq
         br_if $case4|0
         br $case5|0
        end
        local.get $2
        call $~lib/rt/pure/decrement
        br $break|0
       end
       i32.const 1
       drop
       local.get $2
       i32.load offset=4
       i32.const 268435455
       i32.and
       i32.const 0
       i32.gt_u
       i32.eqz
       if
        i32.const 0
        i32.const 144
        i32.const 79
        i32.const 20
        call $~lib/builtins/abort
        unreachable
       end
       local.get $2
       local.get $2
       i32.load offset=4
       i32.const 1
       i32.sub
       i32.store offset=4
       local.get $2
       call $~lib/rt/pure/markGray
       br $break|0
      end
      local.get $2
      call $~lib/rt/pure/scan
      br $break|0
     end
     local.get $2
     i32.load offset=4
     local.set $3
     local.get $3
     i32.const 268435455
     i32.const -1
     i32.xor
     i32.and
     local.get $3
     i32.const 1
     i32.add
     i32.const 268435455
     i32.const -1
     i32.xor
     i32.and
     i32.eq
     i32.eqz
     if
      i32.const 0
      i32.const 144
      i32.const 90
      i32.const 9
      call $~lib/builtins/abort
      unreachable
     end
     local.get $2
     local.get $3
     i32.const 1
     i32.add
     i32.store offset=4
     local.get $3
     i32.const 1879048192
     i32.and
     i32.const 0
     i32.ne
     if
      local.get $2
      call $~lib/rt/pure/scanBlack
     end
     br $break|0
    end
    local.get $2
    call $~lib/rt/pure/collectWhite
    br $break|0
   end
   i32.const 1
   drop
   i32.const 0
   i32.eqz
   if
    i32.const 0
    i32.const 144
    i32.const 101
    i32.const 27
    call $~lib/builtins/abort
    unreachable
   end
  end
 )
 (func $~lib/map/Map<usize,i32>#__visit_impl (param $0 i32) (param $1 i32)
  (local $2 i32)
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/pure/__visit
  local.get $0
  i32.load offset=8
  local.set $2
  i32.const 0
  if (result i32)
   i32.const 1
  else
   i32.const 0
  end
  drop
  local.get $2
  local.get $1
  call $~lib/rt/pure/__visit
 )
 (func $~lib/staticarray/StaticArray<i64>#__visit_impl (param $0 i32) (param $1 i32)
  i32.const 0
  drop
 )
 (func $~lib/array/Array<assembly/__tests__/logs.spec/A>#__visit_impl (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 1
  drop
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $2
  local.get $0
  i32.load offset=12
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_u
   local.set $4
   local.get $4
   if
    local.get $2
    i32.load
    local.set $5
    local.get $5
    if
     local.get $5
     local.get $1
     call $~lib/rt/pure/__visit
    end
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/pure/__visit
 )
 (func $~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>#__visit_impl (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/pure/__visit
  local.get $0
  i32.load offset=8
  local.set $2
  i32.const 1
  if (result i32)
   i32.const 1
  else
   i32.const 1
  end
  drop
  local.get $2
  local.set $3
  local.get $3
  local.get $0
  i32.load offset=16
  i32.const 12
  i32.mul
  i32.add
  local.set $4
  loop $while-continue|0
   local.get $3
   local.get $4
   i32.lt_u
   local.set $5
   local.get $5
   if
    local.get $3
    local.set $6
    local.get $6
    i32.load offset=8
    i32.const 1
    i32.and
    i32.eqz
    if
     i32.const 1
     drop
     local.get $6
     i32.load
     local.set $7
     i32.const 0
     drop
     local.get $7
     local.get $1
     call $~lib/rt/pure/__visit
     i32.const 1
     drop
     local.get $6
     i32.load offset=4
     local.set $7
     i32.const 0
     drop
     local.get $7
     local.get $1
     call $~lib/rt/pure/__visit
    end
    local.get $3
    i32.const 12
    i32.add
    local.set $3
    br $while-continue|0
   end
  end
  local.get $2
  local.get $1
  call $~lib/rt/pure/__visit
 )
 (func $~lib/array/Array<assembly/__tests__/logs.spec/B>#__visit_impl (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  i32.const 1
  drop
  local.get $0
  i32.load offset=4
  local.set $2
  local.get $2
  local.get $0
  i32.load offset=12
  i32.const 2
  i32.shl
  i32.add
  local.set $3
  loop $while-continue|0
   local.get $2
   local.get $3
   i32.lt_u
   local.set $4
   local.get $4
   if
    local.get $2
    i32.load
    local.set $5
    local.get $5
    if
     local.get $5
     local.get $1
     call $~lib/rt/pure/__visit
    end
    local.get $2
    i32.const 4
    i32.add
    local.set $2
    br $while-continue|0
   end
  end
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/pure/__visit
 )
 (func $~lib/array/Array<usize>#__visit_impl (param $0 i32) (param $1 i32)
  i32.const 0
  drop
  local.get $0
  i32.load
  local.get $1
  call $~lib/rt/pure/__visit
 )
 (func $~lib/rt/__visit_members (param $0 i32) (param $1 i32)
  (local $2 i32)
  block $switch$1$default
   block $switch$1$case$18
    block $switch$1$case$15
     block $switch$1$case$14
      block $switch$1$case$13
       block $switch$1$case$12
        block $switch$1$case$11
         block $switch$1$case$10
          block $switch$1$case$9
           block $switch$1$case$8
            block $switch$1$case$5
             block $switch$1$case$4
              block $switch$1$case$2
               local.get $0
               i32.const 8
               i32.sub
               i32.load
               br_table $switch$1$case$2 $switch$1$case$2 $switch$1$case$4 $switch$1$case$5 $switch$1$case$4 $switch$1$case$2 $switch$1$case$8 $switch$1$case$9 $switch$1$case$10 $switch$1$case$11 $switch$1$case$12 $switch$1$case$13 $switch$1$case$14 $switch$1$case$15 $switch$1$case$15 $switch$1$case$2 $switch$1$case$18 $switch$1$default
              end
              return
             end
             local.get $0
             i32.load
             local.tee $2
             if
              local.get $2
              local.get $1
              call $~lib/rt/pure/__visit
             end
             return
            end
            local.get $0
            local.get $1
            call $~lib/map/Map<usize,i32>#__visit_impl
            return
           end
           local.get $0
           local.get $1
           call $~lib/staticarray/StaticArray<i64>#__visit_impl
           return
          end
          local.get $0
          i32.load offset=8
          local.tee $2
          if
           local.get $2
           local.get $1
           call $~lib/rt/pure/__visit
          end
          return
         end
         local.get $0
         i32.load offset=16
         local.tee $2
         if
          local.get $2
          local.get $1
          call $~lib/rt/pure/__visit
         end
         return
        end
        local.get $0
        i32.load
        local.tee $2
        if
         local.get $2
         local.get $1
         call $~lib/rt/pure/__visit
        end
        local.get $0
        i32.load offset=4
        local.tee $2
        if
         local.get $2
         local.get $1
         call $~lib/rt/pure/__visit
        end
        local.get $0
        i32.load offset=8
        local.tee $2
        if
         local.get $2
         local.get $1
         call $~lib/rt/pure/__visit
        end
        return
       end
       local.get $0
       local.get $1
       call $~lib/array/Array<assembly/__tests__/logs.spec/A>#__visit_impl
       return
      end
      local.get $0
      local.get $1
      call $~lib/map/Map<assembly/__tests__/logs.spec/B,assembly/__tests__/logs.spec/Empty>#__visit_impl
      return
     end
     local.get $0
     local.get $1
     call $~lib/array/Array<assembly/__tests__/logs.spec/B>#__visit_impl
     return
    end
    local.get $0
    i32.load offset=4
    local.tee $2
    if
     local.get $2
     local.get $1
     call $~lib/rt/pure/__visit
    end
    return
   end
   local.get $0
   local.get $1
   call $~lib/array/Array<usize>#__visit_impl
   return
  end
  unreachable
 )
)
