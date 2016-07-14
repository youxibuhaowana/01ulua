-- wxb 窗口统一管理
UIManager = Class("UIManager", Singleton);
local M = UIManager;

function M:Ctor()
	Singleton.Ctor(self);

	self.dlgList = {};
end

-- 添加窗口
function M:AddDlg()
end

function M:Open(m, args)
end

function M:Close()
end

return M;

--[[
	Q: 
]]