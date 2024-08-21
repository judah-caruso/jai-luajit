main :: () {
   L := lua.luaL_newstate();
   defer lua.close(L);

   lua.luaL_openlibs(L);
   lua.luaL_loadstring(L, SOURCE);

   lua.call(L, 0, 0);
}

SOURCE :: #string END
assert(pcall(require, 'ffi') and pcall(require, 'jit'), 'LuaJIT is required')

print("hello, from LuaJIT!")
END;

lua :: #import,file "../module.jai";
