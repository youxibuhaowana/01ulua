﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class LuaFramework_ResourceManagerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(LuaFramework.ResourceManager), typeof(Manager));
		L.RegFunction("Initialize", Initialize);
		L.RegFunction("LoadPrefab", LoadPrefab);
		L.RegFunction("UnloadAssetBundle", UnloadAssetBundle);
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", Lua_ToString);
		L.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Initialize(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 3);
			LuaFramework.ResourceManager obj = (LuaFramework.ResourceManager)ToLua.CheckObject(L, 1, typeof(LuaFramework.ResourceManager));
			string arg0 = ToLua.CheckString(L, 2);
			System.Action arg1 = null;
			LuaTypes funcType3 = LuaDLL.lua_type(L, 3);

			if (funcType3 != LuaTypes.LUA_TFUNCTION)
			{
				 arg1 = (System.Action)ToLua.CheckObject(L, 3, typeof(System.Action));
			}
			else
			{
				LuaFunction func = ToLua.ToLuaFunction(L, 3);
				arg1 = DelegateFactory.CreateDelegate(typeof(System.Action), func) as System.Action;
			}

			obj.Initialize(arg0, arg1);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int LoadPrefab(IntPtr L)
	{
		try
		{
			int count = LuaDLL.lua_gettop(L);

			if (count == 4 && TypeChecker.CheckTypes(L, 1, typeof(LuaFramework.ResourceManager), typeof(string), typeof(string[]), typeof(LuaInterface.LuaFunction)))
			{
				LuaFramework.ResourceManager obj = (LuaFramework.ResourceManager)ToLua.ToObject(L, 1);
				string arg0 = ToLua.ToString(L, 2);
				string[] arg1 = ToLua.CheckStringArray(L, 3);
				LuaFunction arg2 = ToLua.ToLuaFunction(L, 4);
				obj.LoadPrefab(arg0, arg1, arg2);
				return 0;
			}
			else if (count == 4 && TypeChecker.CheckTypes(L, 1, typeof(LuaFramework.ResourceManager), typeof(string), typeof(string[]), typeof(System.Action<UnityEngine.Object[]>)))
			{
				LuaFramework.ResourceManager obj = (LuaFramework.ResourceManager)ToLua.ToObject(L, 1);
				string arg0 = ToLua.ToString(L, 2);
				string[] arg1 = ToLua.CheckStringArray(L, 3);
				System.Action<UnityEngine.Object[]> arg2 = null;
				LuaTypes funcType4 = LuaDLL.lua_type(L, 4);

				if (funcType4 != LuaTypes.LUA_TFUNCTION)
				{
					 arg2 = (System.Action<UnityEngine.Object[]>)ToLua.ToObject(L, 4);
				}
				else
				{
					LuaFunction func = ToLua.ToLuaFunction(L, 4);
					arg2 = DelegateFactory.CreateDelegate(typeof(System.Action<UnityEngine.Object[]>), func) as System.Action<UnityEngine.Object[]>;
				}

				obj.LoadPrefab(arg0, arg1, arg2);
				return 0;
			}
			else if (count == 4 && TypeChecker.CheckTypes(L, 1, typeof(LuaFramework.ResourceManager), typeof(string), typeof(string), typeof(System.Action<UnityEngine.Object[]>)))
			{
				LuaFramework.ResourceManager obj = (LuaFramework.ResourceManager)ToLua.ToObject(L, 1);
				string arg0 = ToLua.ToString(L, 2);
				string arg1 = ToLua.ToString(L, 3);
				System.Action<UnityEngine.Object[]> arg2 = null;
				LuaTypes funcType4 = LuaDLL.lua_type(L, 4);

				if (funcType4 != LuaTypes.LUA_TFUNCTION)
				{
					 arg2 = (System.Action<UnityEngine.Object[]>)ToLua.ToObject(L, 4);
				}
				else
				{
					LuaFunction func = ToLua.ToLuaFunction(L, 4);
					arg2 = DelegateFactory.CreateDelegate(typeof(System.Action<UnityEngine.Object[]>), func) as System.Action<UnityEngine.Object[]>;
				}

				obj.LoadPrefab(arg0, arg1, arg2);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L, "invalid arguments to method: LuaFramework.ResourceManager.LoadPrefab");
			}
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int UnloadAssetBundle(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			LuaFramework.ResourceManager obj = (LuaFramework.ResourceManager)ToLua.CheckObject(L, 1, typeof(LuaFramework.ResourceManager));
			string arg0 = ToLua.CheckString(L, 2);
			obj.UnloadAssetBundle(arg0);
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int op_Equality(IntPtr L)
	{
		try
		{
			ToLua.CheckArgsCount(L, 2);
			UnityEngine.Object arg0 = (UnityEngine.Object)ToLua.ToObject(L, 1);
			UnityEngine.Object arg1 = (UnityEngine.Object)ToLua.ToObject(L, 2);
			bool o = arg0 == arg1;
			LuaDLL.lua_pushboolean(L, o);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int Lua_ToString(IntPtr L)
	{
		object obj = ToLua.ToObject(L, 1);

		if (obj != null)
		{
			LuaDLL.lua_pushstring(L, obj.ToString());
		}
		else
		{
			LuaDLL.lua_pushnil(L);
		}

		return 1;
	}
}

