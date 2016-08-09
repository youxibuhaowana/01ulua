-- wxb 窗口统一管理
UIManager = Class("UIManager", Singleton);
local M = UIManager;

function M:Ctor()
	Singleton.Ctor(self);
	self.dialogList = {};				-- 缓存所有dialog的key
	self.dialogDict = {};				-- 存储所有的dialog
	self.nameKeyDict = {};				-- 名字和key对应，加载完了只会返回obj, 通过obj找到对应key
end

function M:GetKey(m, dlgId)
	if not m then
		if error then error("UIManager M is essential Key"); end
		return;
	end
	local key = tostring(m);
	if dlgId then key = tostring(m) + tostring(dlgId); end
	return key;
end

function M:Add(m, dlgId)
	local instance = m.New();
	local config = instance:GetDialogConfig();
	local key = "";
	if config.isSingleton then
		key = tostring(m);
	else
		if not dlgId then
			if error then error("UIManager Unsingleton dlg must have dlgId, m = " .. tostring(m.__cname)); end
			return;
		end
		key = tostring(m) .. tostring(dlgId);
	end
	self.dialogDict[key] = instance;
	table.insert(self.dialogList, key)
end

function M:Remove(m, dlgId)
	local key = self:GetKey(m, dlgId);
	local instance = self.dialogDict[key];
	if not instance then
		if error then error("UIManager Remove a nil dialog, m = " .. tostring(m.__cname)); end
		return;
	end
	self.dialogDict[key] = nil;
	local removeIndex = 0;
	for k = 1, #self.dialogList do
		if self.dialogList[k] == key then removeIndex = k; break; end
	end
	if removeIndex > 0 then table.remove(self.dialogList, removeIndex); end
end

function M:Open(m, args, dlgId)
	if not m then
		if error then error("UIManager Open(M), M cannot be nil"); end
		return;
	end

	if self:IsExsit(m, dlgId) then
		local instance = self:GetDialog(m, dlgId);
		instance:Show();
		return instance;
	end

	self:Add(m, dlgId);
	local instance = self:GetDialog(m, dlgId);
	instance:SetDialogConfig();
	local config = instance:GetDialogConfig();

	instance:SetLoadedState(false);
	if not config.dialogName then
		if error then error("In UIManager, Not set dialogName"); end
		return;
	end
	if self.nameKeyDict[config.dialogName] then
		if error then error("In UIManager, Dialog Already exisit"); end
		return;
	end
	self.nameKeyDict[config.dialogName] = self:GetKey(m, dlgId);
	panelMgr:CreatePanel(config.dialogName, M.OnPrefabLoaded);
end

function M.OnPrefabLoaded(obj)
	local self = UIManager:GetInstance();
	local key = self.nameKeyDict[obj.name];
	if not key then
		if error then error("In UIManager, Oncreate not get right key"); end
		return;
	end

	local instance = self.dialogDict[key];
	if not instance then
		if error then error("In UIManager, Oncreate not get instance"); end
		return;
	end
	instance:SetTargetGo(obj);
	instance:SetLoadedState(true);
	instance:CreateView(obj.transform);
	instance:OnCreate();
	instance:Refresh();
end

function M:Close(m, dlgId)
	local instance = self:GetDialog(m);
	local config = instance:GetDialogConfig();
	-- ps: 提供两种方式, 如何销毁不会有内存泄漏
	if config.dialogLife == DialogLife.DestroyImmediate then
		self.nameKeyDict[config.dialogName] = nil;
	elseif config.dialogLife == dialogLife.DontDestroy then
	end
end

function M:Show()
end

function M:Hide()
end

-- public 某窗口是否存在?
function M:IsExsit(m, dlgId)
	local key = self:GetKey(m, dlgId);
	local instance = self.dialogDict[key];
	return (instance ~= nil);
end

function M:IsVisible()
end

function M:IsLoaded()
end

function M:GetDialog(m, dlgId)
	local key = self:GetKey(m, dlgId);
	local instance = self.dialogDict[key];
	if not instance then
		if error then error("UIManager GetDailog Failed, m = " .. tostring(m.__cname)); end
		return;
	end
	return instance;
end

return M;

--[[    ****** notice *******
(1) 单利模式 不要使用dlgId, 否则取不到实例
]]