UISkin = Class("UISkin", Object);
local M = UISkin;

function M:Ctor()
end

-- public 生成皮肤 复写此方法
function M:GenSkin(transform)
end

return M;