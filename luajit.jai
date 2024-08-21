//
// This file was auto-generated using the following command:
//
// jai /Users/judah/Main/cod/jai/luajit/generate.jai
//



LUA_VERSION :: "Lua 5.1";
LUA_RELEASE :: "Lua 5.1.4";
LUA_VERSION_NUM :: 501;
LUA_COPYRIGHT :: "Copyright (C) 1994-2008 Lua.org, PUC-Rio";
LUA_AUTHORS :: "R. Ierusalimschy, L. H. de Figueiredo & W. Celes";

LUA_SIGNATURE :: "\033Lua";

LUA_MULTRET :: -1;

LUA_REGISTRYINDEX :: -10000;
LUA_ENVIRONINDEX :: -10001;
LUA_GLOBALSINDEX :: -10002;

LUA_OK :: 0;
LUA_YIELD :: 1;
LUA_ERRRUN :: 2;
LUA_ERRSYNTAX :: 3;
LUA_ERRMEM :: 4;
LUA_ERRERR :: 5;

LUA_TNONE :: -1;

LUA_TNIL :: 0;
LUA_TBOOLEAN :: 1;
LUA_TLIGHTUSERDATA :: 2;
LUA_TNUMBER :: 3;
LUA_TSTRING :: 4;
LUA_TTABLE :: 5;
LUA_TFUNCTION :: 6;
LUA_TUSERDATA :: 7;
LUA_TTHREAD :: 8;

LUA_MINSTACK :: 20;

LUA_GCSTOP :: 0;
LUA_GCRESTART :: 1;
LUA_GCCOLLECT :: 2;
LUA_GCCOUNT :: 3;
LUA_GCCOUNTB :: 4;
LUA_GCSTEP :: 5;
LUA_GCSETPAUSE :: 6;
LUA_GCSETSTEPMUL :: 7;
LUA_GCISRUNNING :: 9;

lua_Chunkreader :: Reader;
lua_Chunkwriter :: Writer;

LUA_HOOKCALL :: 0;
LUA_HOOKRET :: 1;
LUA_HOOKLINE :: 2;
LUA_HOOKCOUNT :: 3;
LUA_HOOKTAILRET :: 4;

LUA_MASKCALL :: 1 << LUA_HOOKCALL;
LUA_MASKRET :: 1 << LUA_HOOKRET;
LUA_MASKLINE :: 1 << LUA_HOOKLINE;
LUA_MASKCOUNT :: 1 << LUA_HOOKCOUNT;

LUAJIT_VERSION :: "LuaJIT 2.1.1724232689";
LUAJIT_VERSION_NUM :: 20199;
LUAJIT_VERSION_SYM :: luaJIT_version_2_1_1724232689;
LUAJIT_COPYRIGHT :: "Copyright (C) 2005-2023 Mike Pall";
LUAJIT_URL :: "https://luajit.org/";

LUAJIT_MODE_MASK :: 0x00ff;

LUAJIT_MODE_OFF :: 0x0000;
LUAJIT_MODE_ON :: 0x0100;
LUAJIT_MODE_FLUSH :: 0x0200;

LUA_ERRFILE :: LUA_ERRERR+1;

LUA_NOREF :: -2;
LUA_REFNIL :: -1;

LUA_FILEHANDLE :: "FILE*";

LUA_COLIBNAME :: "coroutine";
LUA_MATHLIBNAME :: "math";
LUA_STRLIBNAME :: "string";
LUA_TABLIBNAME :: "table";
LUA_IOLIBNAME :: "io";
LUA_OSLIBNAME :: "os";
LUA_LOADLIBNAME :: "package";
LUA_DBLIBNAME :: "debug";
LUA_BITLIBNAME :: "bit";
LUA_JITLIBNAME :: "jit";
LUA_FFILIBNAME :: "ffi";

State :: struct {}

CFunction :: #type (L: *State) -> s32 #c_call;

/*
** functions that read/write blocks when loading/dumping Lua chunks
*/
Reader :: #type (L: *State, ud: *void, sz: *u64) -> *u8 #c_call;

Writer :: #type (L: *State, p: *void, sz: u64, ud: *void) -> s32 #c_call;

/*
** prototype for memory-allocation functions
*/
Alloc :: #type (ud: *void, ptr: *void, osize: u64, nsize: u64) -> *void #c_call;

/* type of numbers in Lua */
Number :: float64;

/* type for integer functions */
Integer :: s64;

/*
** state manipulation
*/
newstate :: (f: Alloc, ud: *void) -> *State #foreign libluajit "lua_newstate";
close :: (L: *State) -> void #foreign libluajit "lua_close";
newthread :: (L: *State) -> *State #foreign libluajit "lua_newthread";

atpanic :: (L: *State, panicf: CFunction) -> CFunction #foreign libluajit "lua_atpanic";

/*
** basic stack manipulation
*/
gettop :: (L: *State) -> s32 #foreign libluajit "lua_gettop";
settop :: (L: *State, idx: s32) -> void #foreign libluajit "lua_settop";
pushvalue :: (L: *State, idx: s32) -> void #foreign libluajit "lua_pushvalue";
_remove :: (L: *State, idx: s32) -> void #foreign libluajit "lua_remove";
insert :: (L: *State, idx: s32) -> void #foreign libluajit "lua_insert";
replace :: (L: *State, idx: s32) -> void #foreign libluajit "lua_replace";
checkstack :: (L: *State, sz: s32) -> s32 #foreign libluajit "lua_checkstack";

xmove :: (from: *State, to: *State, n: s32) -> void #foreign libluajit "lua_xmove";

/*
** access functions (stack -> C)
*/
isnumber :: (L: *State, idx: s32) -> s32 #foreign libluajit "lua_isnumber";
isstring :: (L: *State, idx: s32) -> s32 #foreign libluajit "lua_isstring";
iscfunction :: (L: *State, idx: s32) -> s32 #foreign libluajit "lua_iscfunction";
isuserdata :: (L: *State, idx: s32) -> s32 #foreign libluajit "lua_isuserdata";
type :: (L: *State, idx: s32) -> s32 #foreign libluajit "lua_type";
typename :: (L: *State, tp: s32) -> *u8 #foreign libluajit "lua_typename";

equal :: (L: *State, idx1: s32, idx2: s32) -> s32 #foreign libluajit "lua_equal";
rawequal :: (L: *State, idx1: s32, idx2: s32) -> s32 #foreign libluajit "lua_rawequal";
lessthan :: (L: *State, idx1: s32, idx2: s32) -> s32 #foreign libluajit "lua_lessthan";

tonumber :: (L: *State, idx: s32) -> Number #foreign libluajit "lua_tonumber";
tointeger :: (L: *State, idx: s32) -> Integer #foreign libluajit "lua_tointeger";
toboolean :: (L: *State, idx: s32) -> s32 #foreign libluajit "lua_toboolean";
tolstring :: (L: *State, idx: s32, len: *u64) -> *u8 #foreign libluajit "lua_tolstring";
objlen :: (L: *State, idx: s32) -> u64 #foreign libluajit "lua_objlen";
tocfunction :: (L: *State, idx: s32) -> CFunction #foreign libluajit "lua_tocfunction";
touserdata :: (L: *State, idx: s32) -> *void #foreign libluajit "lua_touserdata";
tothread :: (L: *State, idx: s32) -> *State #foreign libluajit "lua_tothread";
topointer :: (L: *State, idx: s32) -> *void #foreign libluajit "lua_topointer";

/*
** push functions (C -> stack)
*/
pushnil :: (L: *State) -> void #foreign libluajit "lua_pushnil";
pushnumber :: (L: *State, n: Number) -> void #foreign libluajit "lua_pushnumber";
pushinteger :: (L: *State, n: Integer) -> void #foreign libluajit "lua_pushinteger";
pushlstring :: (L: *State, s: *u8, l: u64) -> void #foreign libluajit "lua_pushlstring";
pushstring :: (L: *State, s: *u8) -> void #foreign libluajit "lua_pushstring";

pushfstring_CFormat :: (L: *State, fmt: *u8, __args: ..Any) -> *u8 #foreign libluajit "lua_pushfstring";
pushfstring :: (L: *State, fmt: string, __args: ..Any) -> *u8 {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return pushfstring_CFormat(L, "%s", formatted_text.data);
} @PrintLike
pushcclosure :: (L: *State, fn: CFunction, n: s32) -> void #foreign libluajit "lua_pushcclosure";
pushboolean :: (L: *State, b: s32) -> void #foreign libluajit "lua_pushboolean";
pushlightuserdata :: (L: *State, p: *void) -> void #foreign libluajit "lua_pushlightuserdata";
pushthread :: (L: *State) -> s32 #foreign libluajit "lua_pushthread";

/*
** get functions (Lua -> stack)
*/
gettable :: (L: *State, idx: s32) -> void #foreign libluajit "lua_gettable";
getfield :: (L: *State, idx: s32, k: *u8) -> void #foreign libluajit "lua_getfield";
rawget :: (L: *State, idx: s32) -> void #foreign libluajit "lua_rawget";
rawgeti :: (L: *State, idx: s32, n: s32) -> void #foreign libluajit "lua_rawgeti";
createtable :: (L: *State, narr: s32, nrec: s32) -> void #foreign libluajit "lua_createtable";
newuserdata :: (L: *State, sz: u64) -> *void #foreign libluajit "lua_newuserdata";
getmetatable :: (L: *State, objindex: s32) -> s32 #foreign libluajit "lua_getmetatable";
getfenv :: (L: *State, idx: s32) -> void #foreign libluajit "lua_getfenv";

/*
** set functions (stack -> Lua)
*/
settable :: (L: *State, idx: s32) -> void #foreign libluajit "lua_settable";
setfield :: (L: *State, idx: s32, k: *u8) -> void #foreign libluajit "lua_setfield";
rawset :: (L: *State, idx: s32) -> void #foreign libluajit "lua_rawset";
rawseti :: (L: *State, idx: s32, n: s32) -> void #foreign libluajit "lua_rawseti";
setmetatable :: (L: *State, objindex: s32) -> s32 #foreign libluajit "lua_setmetatable";
setfenv :: (L: *State, idx: s32) -> s32 #foreign libluajit "lua_setfenv";

/*
** `load' and `call' functions (load and run Lua code)
*/
call :: (L: *State, nargs: s32, nresults: s32) -> void #foreign libluajit "lua_call";
pcall :: (L: *State, nargs: s32, nresults: s32, errfunc: s32) -> s32 #foreign libluajit "lua_pcall";
cpcall :: (L: *State, func: CFunction, ud: *void) -> s32 #foreign libluajit "lua_cpcall";
load :: (L: *State, reader: Reader, dt: *void, chunkname: *u8) -> s32 #foreign libluajit "lua_load";

dump :: (L: *State, writer: Writer, data: *void) -> s32 #foreign libluajit "lua_dump";

/*
** coroutine functions
*/
yield :: (L: *State, nresults: s32) -> s32 #foreign libluajit "lua_yield";
resume :: (L: *State, narg: s32) -> s32 #foreign libluajit "lua_resume";
status :: (L: *State) -> s32 #foreign libluajit "lua_status";

gc :: (L: *State, what: s32, data: s32) -> s32 #foreign libluajit "lua_gc";

/*
** miscellaneous functions
*/
error :: (L: *State) -> s32 #foreign libluajit "lua_error";

next :: (L: *State, idx: s32) -> s32 #foreign libluajit "lua_next";

concat :: (L: *State, n: s32) -> void #foreign libluajit "lua_concat";

getallocf :: (L: *State, ud: **void) -> Alloc #foreign libluajit "lua_getallocf";
setallocf :: (L: *State, f: Alloc, ud: *void) -> void #foreign libluajit "lua_setallocf";

/* Functions to be called by the debuger in specific events */
Hook :: #type (L: *State, ar: *Debug) -> void #c_call;

getstack :: (L: *State, level: s32, ar: *Debug) -> s32 #foreign libluajit "lua_getstack";
getinfo :: (L: *State, what: *u8, ar: *Debug) -> s32 #foreign libluajit "lua_getinfo";
getlocal :: (L: *State, ar: *Debug, n: s32) -> *u8 #foreign libluajit "lua_getlocal";
setlocal :: (L: *State, ar: *Debug, n: s32) -> *u8 #foreign libluajit "lua_setlocal";
getupvalue :: (L: *State, funcindex: s32, n: s32) -> *u8 #foreign libluajit "lua_getupvalue";
setupvalue :: (L: *State, funcindex: s32, n: s32) -> *u8 #foreign libluajit "lua_setupvalue";
sethook :: (L: *State, func: Hook, mask: s32, count: s32) -> s32 #foreign libluajit "lua_sethook";
gethook :: (L: *State) -> Hook #foreign libluajit "lua_gethook";
gethookmask :: (L: *State) -> s32 #foreign libluajit "lua_gethookmask";
gethookcount :: (L: *State) -> s32 #foreign libluajit "lua_gethookcount";

/* From Lua 5.2. */
upvalueid :: (L: *State, idx: s32, n: s32) -> *void #foreign libluajit "lua_upvalueid";
upvaluejoin :: (L: *State, idx1: s32, n1: s32, idx2: s32, n2: s32) -> void #foreign libluajit "lua_upvaluejoin";
loadx :: (L: *State, reader: Reader, dt: *void, chunkname: *u8, mode: *u8) -> s32 #foreign libluajit "lua_loadx";

version :: (L: *State) -> *Number #foreign libluajit "lua_version";
copy :: (L: *State, fromidx: s32, toidx: s32) -> void #foreign libluajit "lua_copy";
tonumberx :: (L: *State, idx: s32, isnum: *s32) -> Number #foreign libluajit "lua_tonumberx";
tointegerx :: (L: *State, idx: s32, isnum: *s32) -> Integer #foreign libluajit "lua_tointegerx";

/* From Lua 5.3. */
isyieldable :: (L: *State) -> s32 #foreign libluajit "lua_isyieldable";

Debug :: struct {
    event:           s32;
    name:            *u8; /* (n) */
    namewhat:        *u8; /* (n) `global', `local', `field', `method' */
    what:            *u8; /* (S) `Lua', `C', `main', `tail' */
    source:          *u8; /* (S) */
    currentline:     s32; /* (l) */
    nups:            s32; /* (u) number of upvalues */
    linedefined:     s32; /* (S) */
    lastlinedefined: s32; /* (S) */
    short_src:       [60] u8; /* (S) */

    i_ci:            s32; /* active function */
}

LUAJIT_MODE :: enum u32 {
    ENGINE     :: 0;
    DEBUG      :: 1;

    FUNC       :: 2;
    ALLFUNC    :: 3;
    ALLSUBFUNC :: 4;

    TRACE      :: 5;

    WRAPCFUNC  :: 16;

    MAX        :: 17;

    LUAJIT_MODE_ENGINE     :: ENGINE;
    LUAJIT_MODE_DEBUG      :: DEBUG;

    LUAJIT_MODE_FUNC       :: FUNC;
    LUAJIT_MODE_ALLFUNC    :: ALLFUNC;
    LUAJIT_MODE_ALLSUBFUNC :: ALLSUBFUNC;

    LUAJIT_MODE_TRACE      :: TRACE;

    LUAJIT_MODE_WRAPCFUNC  :: WRAPCFUNC;

    LUAJIT_MODE_MAX        :: MAX;
}

/* Control the JIT engine. */
luaJIT_setmode :: (L: *State, idx: s32, mode: s32) -> s32 #foreign libluajit;

/* Low-overhead profiling API. */
luaJIT_profile_callback :: #type (data: *void, L: *State, samples: s32, vmstate: s32) -> void #c_call;

luaJIT_profile_start :: (L: *State, mode: *u8, cb: luaJIT_profile_callback, data: *void) -> void #foreign libluajit;

luaJIT_profile_stop :: (L: *State) -> void #foreign libluajit;
luaJIT_profile_dumpstack :: (L: *State, fmt: *u8, depth: s32, len: *u64) -> *u8 #foreign libluajit;

luaJIT_version_2_1_1724232689 :: () -> void #foreign libluajit;

luaL_Reg :: struct {
    name: *u8;
    func: CFunction;
}

luaL_openlib :: (L: *State, libname: *u8, l: *luaL_Reg, nup: s32) -> void #foreign libluajit;

luaL_register :: (L: *State, libname: *u8, l: *luaL_Reg) -> void #foreign libluajit;

luaL_getmetafield :: (L: *State, obj: s32, e: *u8) -> s32 #foreign libluajit;
luaL_callmeta :: (L: *State, obj: s32, e: *u8) -> s32 #foreign libluajit;
luaL_typerror :: (L: *State, narg: s32, tname: *u8) -> s32 #foreign libluajit;
luaL_argerror :: (L: *State, numarg: s32, extramsg: *u8) -> s32 #foreign libluajit;
luaL_checklstring :: (L: *State, numArg: s32, l: *u64) -> *u8 #foreign libluajit;

luaL_optlstring :: (L: *State, numArg: s32, def: *u8, l: *u64) -> *u8 #foreign libluajit;

luaL_checknumber :: (L: *State, numArg: s32) -> Number #foreign libluajit;
luaL_optnumber :: (L: *State, nArg: s32, def: Number) -> Number #foreign libluajit;

luaL_checkinteger :: (L: *State, numArg: s32) -> Integer #foreign libluajit;
luaL_optinteger :: (L: *State, nArg: s32, def: Integer) -> Integer #foreign libluajit;

luaL_checkstack :: (L: *State, sz: s32, msg: *u8) -> void #foreign libluajit;
luaL_checktype :: (L: *State, narg: s32, t: s32) -> void #foreign libluajit;
luaL_checkany :: (L: *State, narg: s32) -> void #foreign libluajit;

luaL_newmetatable :: (L: *State, tname: *u8) -> s32 #foreign libluajit;
luaL_checkudata :: (L: *State, ud: s32, tname: *u8) -> *void #foreign libluajit;

luaL_where :: (L: *State, lvl: s32) -> void #foreign libluajit;
luaL_error_CFormat :: (L: *State, fmt: *u8, __args: ..Any) -> s32 #foreign libluajit "luaL_error";
luaL_error :: (L: *State, fmt: string, __args: ..Any) -> s32 {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return luaL_error_CFormat(L, "%s", formatted_text.data);
} @PrintLike

luaL_checkoption :: (L: *State, narg: s32, def: *u8, lst: **u8) -> s32 #foreign libluajit;

luaL_ref :: (L: *State, t: s32) -> s32 #foreign libluajit;
luaL_unref :: (L: *State, t: s32, ref: s32) -> void #foreign libluajit;

luaL_loadfile :: (L: *State, filename: *u8) -> s32 #foreign libluajit;
luaL_loadbuffer :: (L: *State, buff: *u8, sz: u64, name: *u8) -> s32 #foreign libluajit;

luaL_loadstring :: (L: *State, s: *u8) -> s32 #foreign libluajit;

luaL_newstate :: () -> *State #foreign libluajit;

luaL_gsub :: (L: *State, s: *u8, p: *u8, r: *u8) -> *u8 #foreign libluajit;

luaL_findtable :: (L: *State, idx: s32, fname: *u8, szhint: s32) -> *u8 #foreign libluajit;

/* From Lua 5.2. */
luaL_fileresult :: (L: *State, stat: s32, fname: *u8) -> s32 #foreign libluajit;
luaL_execresult :: (L: *State, stat: s32) -> s32 #foreign libluajit;
luaL_loadfilex :: (L: *State, filename: *u8, mode: *u8) -> s32 #foreign libluajit;

luaL_loadbufferx :: (L: *State, buff: *u8, sz: u64, name: *u8, mode: *u8) -> s32 #foreign libluajit;

luaL_traceback :: (L: *State, L1: *State, msg: *u8, level: s32) -> void #foreign libluajit;

luaL_setfuncs :: (L: *State, l: *luaL_Reg, nup: s32) -> void #foreign libluajit;
luaL_pushmodule :: (L: *State, modname: *u8, sizehint: s32) -> void #foreign libluajit;

luaL_testudata :: (L: *State, ud: s32, tname: *u8) -> *void #foreign libluajit;
luaL_setmetatable :: (L: *State, tname: *u8) -> void #foreign libluajit;

/*
** {======================================================
** Generic Buffer manipulation
** =======================================================
*/
luaL_Buffer :: struct {
    p:      *u8; /* current position in buffer */
    lvl:    s32; /* number of strings in the stack (level) */
    L:      *State;
    buffer: [1024] u8;
}

luaL_buffinit :: (L: *State, B: *luaL_Buffer) -> void #foreign libluajit;
luaL_prepbuffer :: (B: *luaL_Buffer) -> *u8 #foreign libluajit;
luaL_addlstring :: (B: *luaL_Buffer, s: *u8, l: u64) -> void #foreign libluajit;
luaL_addstring :: (B: *luaL_Buffer, s: *u8) -> void #foreign libluajit;
luaL_addvalue :: (B: *luaL_Buffer) -> void #foreign libluajit;
luaL_pushresult :: (B: *luaL_Buffer) -> void #foreign libluajit;

luaopen_base :: (L: *State) -> s32 #foreign libluajit;
luaopen_math :: (L: *State) -> s32 #foreign libluajit;
luaopen_string :: (L: *State) -> s32 #foreign libluajit;
luaopen_table :: (L: *State) -> s32 #foreign libluajit;
luaopen_io :: (L: *State) -> s32 #foreign libluajit;
luaopen_os :: (L: *State) -> s32 #foreign libluajit;
luaopen_package :: (L: *State) -> s32 #foreign libluajit;
luaopen_debug :: (L: *State) -> s32 #foreign libluajit;
luaopen_bit :: (L: *State) -> s32 #foreign libluajit;
luaopen_jit :: (L: *State) -> s32 #foreign libluajit;
luaopen_ffi :: (L: *State) -> s32 #foreign libluajit;
luaopen_string_buffer :: (L: *State) -> s32 #foreign libluajit;

luaL_openlibs :: (L: *State) -> void #foreign libluajit;

#scope_file

#import "Basic"; // For assert, push_context

libluajit :: #library "lib/mac/libluajit";

#run {
    {
        instance: Debug;
        assert(((cast(*void)(*instance.event)) - cast(*void)(*instance)) == 0, "Debug.event has unexpected offset % instead of 0", ((cast(*void)(*instance.event)) - cast(*void)(*instance)));
        assert(size_of(type_of(Debug.event)) == 4, "Debug.event has unexpected size % instead of 4", size_of(type_of(Debug.event)));
        assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 8, "Debug.name has unexpected offset % instead of 8", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
        assert(size_of(type_of(Debug.name)) == 8, "Debug.name has unexpected size % instead of 8", size_of(type_of(Debug.name)));
        assert(((cast(*void)(*instance.namewhat)) - cast(*void)(*instance)) == 16, "Debug.namewhat has unexpected offset % instead of 16", ((cast(*void)(*instance.namewhat)) - cast(*void)(*instance)));
        assert(size_of(type_of(Debug.namewhat)) == 8, "Debug.namewhat has unexpected size % instead of 8", size_of(type_of(Debug.namewhat)));
        assert(((cast(*void)(*instance.what)) - cast(*void)(*instance)) == 24, "Debug.what has unexpected offset % instead of 24", ((cast(*void)(*instance.what)) - cast(*void)(*instance)));
        assert(size_of(type_of(Debug.what)) == 8, "Debug.what has unexpected size % instead of 8", size_of(type_of(Debug.what)));
        assert(((cast(*void)(*instance.source)) - cast(*void)(*instance)) == 32, "Debug.source has unexpected offset % instead of 32", ((cast(*void)(*instance.source)) - cast(*void)(*instance)));
        assert(size_of(type_of(Debug.source)) == 8, "Debug.source has unexpected size % instead of 8", size_of(type_of(Debug.source)));
        assert(((cast(*void)(*instance.currentline)) - cast(*void)(*instance)) == 40, "Debug.currentline has unexpected offset % instead of 40", ((cast(*void)(*instance.currentline)) - cast(*void)(*instance)));
        assert(size_of(type_of(Debug.currentline)) == 4, "Debug.currentline has unexpected size % instead of 4", size_of(type_of(Debug.currentline)));
        assert(((cast(*void)(*instance.nups)) - cast(*void)(*instance)) == 44, "Debug.nups has unexpected offset % instead of 44", ((cast(*void)(*instance.nups)) - cast(*void)(*instance)));
        assert(size_of(type_of(Debug.nups)) == 4, "Debug.nups has unexpected size % instead of 4", size_of(type_of(Debug.nups)));
        assert(((cast(*void)(*instance.linedefined)) - cast(*void)(*instance)) == 48, "Debug.linedefined has unexpected offset % instead of 48", ((cast(*void)(*instance.linedefined)) - cast(*void)(*instance)));
        assert(size_of(type_of(Debug.linedefined)) == 4, "Debug.linedefined has unexpected size % instead of 4", size_of(type_of(Debug.linedefined)));
        assert(((cast(*void)(*instance.lastlinedefined)) - cast(*void)(*instance)) == 52, "Debug.lastlinedefined has unexpected offset % instead of 52", ((cast(*void)(*instance.lastlinedefined)) - cast(*void)(*instance)));
        assert(size_of(type_of(Debug.lastlinedefined)) == 4, "Debug.lastlinedefined has unexpected size % instead of 4", size_of(type_of(Debug.lastlinedefined)));
        assert(((cast(*void)(*instance.short_src)) - cast(*void)(*instance)) == 56, "Debug.short_src has unexpected offset % instead of 56", ((cast(*void)(*instance.short_src)) - cast(*void)(*instance)));
        assert(size_of(type_of(Debug.short_src)) == 60, "Debug.short_src has unexpected size % instead of 60", size_of(type_of(Debug.short_src)));
        assert(((cast(*void)(*instance.i_ci)) - cast(*void)(*instance)) == 116, "Debug.i_ci has unexpected offset % instead of 116", ((cast(*void)(*instance.i_ci)) - cast(*void)(*instance)));
        assert(size_of(type_of(Debug.i_ci)) == 4, "Debug.i_ci has unexpected size % instead of 4", size_of(type_of(Debug.i_ci)));
        assert(size_of(Debug) == 120, "Debug has size % instead of 120", size_of(Debug));
    }

    {
        instance: luaL_Reg;
        assert(((cast(*void)(*instance.name)) - cast(*void)(*instance)) == 0, "luaL_Reg.name has unexpected offset % instead of 0", ((cast(*void)(*instance.name)) - cast(*void)(*instance)));
        assert(size_of(type_of(luaL_Reg.name)) == 8, "luaL_Reg.name has unexpected size % instead of 8", size_of(type_of(luaL_Reg.name)));
        assert(((cast(*void)(*instance.func)) - cast(*void)(*instance)) == 8, "luaL_Reg.func has unexpected offset % instead of 8", ((cast(*void)(*instance.func)) - cast(*void)(*instance)));
        assert(size_of(type_of(luaL_Reg.func)) == 8, "luaL_Reg.func has unexpected size % instead of 8", size_of(type_of(luaL_Reg.func)));
        assert(size_of(luaL_Reg) == 16, "luaL_Reg has size % instead of 16", size_of(luaL_Reg));
    }

    {
        instance: luaL_Buffer;
        assert(((cast(*void)(*instance.p)) - cast(*void)(*instance)) == 0, "luaL_Buffer.p has unexpected offset % instead of 0", ((cast(*void)(*instance.p)) - cast(*void)(*instance)));
        assert(size_of(type_of(luaL_Buffer.p)) == 8, "luaL_Buffer.p has unexpected size % instead of 8", size_of(type_of(luaL_Buffer.p)));
        assert(((cast(*void)(*instance.lvl)) - cast(*void)(*instance)) == 8, "luaL_Buffer.lvl has unexpected offset % instead of 8", ((cast(*void)(*instance.lvl)) - cast(*void)(*instance)));
        assert(size_of(type_of(luaL_Buffer.lvl)) == 4, "luaL_Buffer.lvl has unexpected size % instead of 4", size_of(type_of(luaL_Buffer.lvl)));
        assert(((cast(*void)(*instance.L)) - cast(*void)(*instance)) == 16, "luaL_Buffer.L has unexpected offset % instead of 16", ((cast(*void)(*instance.L)) - cast(*void)(*instance)));
        assert(size_of(type_of(luaL_Buffer.L)) == 8, "luaL_Buffer.L has unexpected size % instead of 8", size_of(type_of(luaL_Buffer.L)));
        assert(((cast(*void)(*instance.buffer)) - cast(*void)(*instance)) == 24, "luaL_Buffer.buffer has unexpected offset % instead of 24", ((cast(*void)(*instance.buffer)) - cast(*void)(*instance)));
        assert(size_of(type_of(luaL_Buffer.buffer)) == 1024, "luaL_Buffer.buffer has unexpected size % instead of 1024", size_of(type_of(luaL_Buffer.buffer)));
        assert(size_of(luaL_Buffer) == 1048, "luaL_Buffer has size % instead of 1048", size_of(luaL_Buffer));
    }
}

