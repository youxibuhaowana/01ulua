-- 存储窗口的数据的类
local DialogData = Class("DialogData", Object);
local M = DialogData;

function M:Ctor()
	self.name = "";						-- 窗口名字
	self.layer = 0;						-- 属于那一层
	self.life = 0;						-- 生命周期
	self.isUsePool = false;				-- 是否使用池子
end

function M:SetName(name)
	self.name = name;
end

function M:GetName()
	return self.name;
end

function M:SetLayer(layer)
	self.layer = layer;
end

function M:GetLayer()
	return self.layer
end

return M;