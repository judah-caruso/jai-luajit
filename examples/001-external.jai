main :: () {
   L := lua.luaL_newstate();
   defer lua.close(L);

   lua.luaL_openlibs(L);

   {
      lua.pushcclosure(L, hello_from_jai, 0);
      lua.setfield(L, lua.LUA_GLOBALSINDEX, "hello_from_jai");
   }

   lua.luaL_loadstring(L, SOURCE);
   lua.call(L, 0, lua.LUA_MULTRET);
}

c_ctx: Context;
hello_from_jai :: (L: *lua.State) -> s32 #c_call {
   push_context c_ctx {
      print("hello, from jai!\n");
      lua.pushstring(L, "it worked!");
      return 1;
   }
}

SOURCE :: #string END
assert(pcall(require, 'ffi') and pcall(require, 'jit'), 'LuaJIT is required')

print("hello, from LuaJIT!")
print("Value from jai:", hello_from_jai())
END;

#import "Basic";
lua :: #import,file "../module.jai";
