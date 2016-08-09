-- view = skin + config
UIView = Class("UIView", Object);
local M = UIView;

function M:Ctor()
end

-- public 复写该方法
function M:CreateSkin()
end

-- public 复写该方法
function M:CreateConfig()
end

return M;