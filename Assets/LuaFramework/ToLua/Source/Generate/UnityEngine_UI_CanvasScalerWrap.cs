﻿//this source code was auto-generated by tolua#, do not modify it
using System;
using LuaInterface;

public class UnityEngine_UI_CanvasScalerWrap
{
	public static void Register(LuaState L)
	{
		L.BeginClass(typeof(UnityEngine.UI.CanvasScaler), typeof(UnityEngine.MonoBehaviour));
		L.RegFunction("__eq", op_Equality);
		L.RegFunction("__tostring", Lua_ToString);
		L.RegVar("uiScaleMode", get_uiScaleMode, set_uiScaleMode);
		L.RegVar("referencePixelsPerUnit", get_referencePixelsPerUnit, set_referencePixelsPerUnit);
		L.RegVar("scaleFactor", get_scaleFactor, set_scaleFactor);
		L.RegVar("referenceResolution", get_referenceResolution, set_referenceResolution);
		L.RegVar("screenMatchMode", get_screenMatchMode, set_screenMatchMode);
		L.RegVar("matchWidthOrHeight", get_matchWidthOrHeight, set_matchWidthOrHeight);
		L.RegVar("physicalUnit", get_physicalUnit, set_physicalUnit);
		L.RegVar("fallbackScreenDPI", get_fallbackScreenDPI, set_fallbackScreenDPI);
		L.RegVar("defaultSpriteDPI", get_defaultSpriteDPI, set_defaultSpriteDPI);
		L.RegVar("dynamicPixelsPerUnit", get_dynamicPixelsPerUnit, set_dynamicPixelsPerUnit);
		L.EndClass();
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

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_uiScaleMode(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			UnityEngine.UI.CanvasScaler.ScaleMode ret = obj.uiScaleMode;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index uiScaleMode on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_referencePixelsPerUnit(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float ret = obj.referencePixelsPerUnit;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index referencePixelsPerUnit on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_scaleFactor(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float ret = obj.scaleFactor;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index scaleFactor on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_referenceResolution(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			UnityEngine.Vector2 ret = obj.referenceResolution;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index referenceResolution on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_screenMatchMode(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			UnityEngine.UI.CanvasScaler.ScreenMatchMode ret = obj.screenMatchMode;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index screenMatchMode on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_matchWidthOrHeight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float ret = obj.matchWidthOrHeight;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index matchWidthOrHeight on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_physicalUnit(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			UnityEngine.UI.CanvasScaler.Unit ret = obj.physicalUnit;
			ToLua.Push(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index physicalUnit on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_fallbackScreenDPI(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float ret = obj.fallbackScreenDPI;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index fallbackScreenDPI on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_defaultSpriteDPI(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float ret = obj.defaultSpriteDPI;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index defaultSpriteDPI on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int get_dynamicPixelsPerUnit(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float ret = obj.dynamicPixelsPerUnit;
			LuaDLL.lua_pushnumber(L, ret);
			return 1;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index dynamicPixelsPerUnit on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_uiScaleMode(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			UnityEngine.UI.CanvasScaler.ScaleMode arg0 = (UnityEngine.UI.CanvasScaler.ScaleMode)ToLua.CheckObject(L, 2, typeof(UnityEngine.UI.CanvasScaler.ScaleMode));
			obj.uiScaleMode = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index uiScaleMode on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_referencePixelsPerUnit(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.referencePixelsPerUnit = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index referencePixelsPerUnit on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_scaleFactor(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.scaleFactor = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index scaleFactor on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_referenceResolution(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			UnityEngine.Vector2 arg0 = ToLua.ToVector2(L, 2);
			obj.referenceResolution = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index referenceResolution on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_screenMatchMode(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			UnityEngine.UI.CanvasScaler.ScreenMatchMode arg0 = (UnityEngine.UI.CanvasScaler.ScreenMatchMode)ToLua.CheckObject(L, 2, typeof(UnityEngine.UI.CanvasScaler.ScreenMatchMode));
			obj.screenMatchMode = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index screenMatchMode on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_matchWidthOrHeight(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.matchWidthOrHeight = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index matchWidthOrHeight on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_physicalUnit(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			UnityEngine.UI.CanvasScaler.Unit arg0 = (UnityEngine.UI.CanvasScaler.Unit)ToLua.CheckObject(L, 2, typeof(UnityEngine.UI.CanvasScaler.Unit));
			obj.physicalUnit = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index physicalUnit on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_fallbackScreenDPI(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.fallbackScreenDPI = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index fallbackScreenDPI on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_defaultSpriteDPI(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.defaultSpriteDPI = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index defaultSpriteDPI on a nil value" : e.Message);
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int set_dynamicPixelsPerUnit(IntPtr L)
	{
		object o = null;

		try
		{
			o = ToLua.ToObject(L, 1);
			UnityEngine.UI.CanvasScaler obj = (UnityEngine.UI.CanvasScaler)o;
			float arg0 = (float)LuaDLL.luaL_checknumber(L, 2);
			obj.dynamicPixelsPerUnit = arg0;
			return 0;
		}
		catch(Exception e)
		{
			return LuaDLL.toluaL_exception(L, e, o == null ? "attempt to index dynamicPixelsPerUnit on a nil value" : e.Message);
		}
	}
}

