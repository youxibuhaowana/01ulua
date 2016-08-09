-- 窗口类, 没有采用单利
UIDialog = Class("UIDialog", Object);
local M = UIDialog;

require "FrameWork/UI/UICommon";

local ClickEventDict = {};				-- 单击事件存储

function M:Ctor()
	self.targeGo = nil;					-- 窗口目标gameobject
	self.luaScript = nil;				-- luaBehaviour脚本
	self.isLoaded = false;				-- 是否加载完
	self.view = nil;					-- view视图类
	self.config = {};					-- 窗口配置

	self:SetDefaultConfig();			-- 设置默认配置
end

-- private, 默认配置 
function M:SetDefaultConfig()
	self.config.isSingleton = true;
	self.config.dialogLife = DialogLife.DestroyImmediate;
end

-- private, 设置目标
function M:SetTargetGo(go)
	if not go then
		if error then error("UIDialog SetTargetGo error"); end
		return;
	end
	self.targeGo = go;
	self.luaScript = go:GetComponent('LuaBehaviour');
end

----------------------------------------- view load 加载部分 --------------------------------
function M:SetLoadedState(isLoaded)
	if isLoaded == nil then isLoaded = false; end
	self.isLoaded = isLoaded;
end

-- public 请覆写该方法
function M:GetViewClass()
end

function M:CreateView(transform)
	self.view = self:GetViewClass().New();
	self.view:GenSkin(transform); 			-- 生成皮肤
end


---------------------------------------------------------------------------------------------


----------------------------------------- config 窗口配置 ------------------------------------ 
-- public 获取窗口配置, 覆盖该方法
function M:SetDialogConfig()
end

-- public 获取窗口配置
function M:GetDialogConfig()
	return self.config;
end

function M:SetDialogName(name)
	if not name then
		if error then error("UIDialog SetDialogName Cannot nil"); end
		return;
	end
	self.config.dialogName = name;
end

-- public 窗口生命周期
function M:SetDialogLife(life)
	if (not life) or (life > 3) or (life < 1) then 
		if error then error("SetDialogLife life is not legal"); end
		return;
	end
	self.config.dialogLife = life;
end

-- public 是否使用单利
function M:SetUseSingleton(isUse)
	if isUse == nil then isUse = false; end
	self.config.isSingleton = isUse;
end
---------------------------------------------------------------------------------------------


---------------------------------------- func 通用窗口方法 ------------------------------------
-- public, override it
function M:OnCreate()
end

-- public, override it
function M:Refresh()
end

-- public, 当需在窗口显示出来做点事情的时候, 可以复写该方法
function M:OnShow()
end

-- public, 当需要在窗口隐藏时做点事情，可以复写该方法
function M:OnHide()
end

-- public, 窗口销毁时候调用
function M:OnDestroy()
end

-- private, don't use it
function M:Show()
	-- 直接改变位置
	self.targeGo:SetActive(true);
	self:Refresh();
	self:OnShow();
end

-- private,
function M:Hide()
	self.targeGo:SetActive(false);
	self:OnHide();
end

-- private
function M:Open()
end

-- private
function M:Close()
end

-- private
function M:Destroy()
	self:OnDestroy();
	-- 销毁资源
	self.luaScript:OnDestroy();
	-- 销毁类实例
	self.targeGo = nil;					-- 窗口目标gameobject
	self.luaScript = nil;				-- luaBehaviour脚本
	self.isLoaded = false;				-- 是否加载完
	self.view = nil;					-- view视图类
	self.config = nil;					-- 窗口配置

end
--------------------------------------------------------------------------------------------


---------------------------------------  事件注册  ------------------------------------------
-- public 添加单击事件 不能够传self, 防止内存泄漏
function M:AddClickEvent(go, callback, ...)
	if (not go) or (not callback) then
		if error then error("Not go or not callback cause AddClickEvent Error"); end
		return;
	end
	local btnKey = go.name .. go:GetInstanceID();
	local map = {};
	map.callback = callback;
	map.passdata = {...};
	ClickEventDict[btnKey] = map;
	self.luaScript:AddClick(go);
end

-- public 移除单击注册
function M:RemoveClickEvent(go)
	if not go then
		if error then error("UIDialog Not go, RemoveClickEvent Failed !"); end
		return;
	end
	local btnKey = go.name .. go:GetInstanceID();
	ClickEventDict[btnKey] = nil;
	self.luaScript:RemoveClick(go);
end

DialogClickEvent = {};
function DialogClickEvent.OnClick(btnKey)
	local map = ClickEventDict[btnKey];
	if not map then return; end
	if map.callback then
		if map.passdata then
			map.callback(unpack(map.passdata));
		else
			map.callback();
		end
	end
end
---------------------------------------------------------------------------------------------

return M;