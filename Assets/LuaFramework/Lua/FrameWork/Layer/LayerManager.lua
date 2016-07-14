-- 层管理 
LayerManager = {};
local M = LayerManager;

local Layer = require "FrameWork/Layer/Layer";

local UI_Layer = 5;
local BASE_ORDER = 100;	
local DISTANCE_DELTA = 100;	-- Panel距离差值
local GUI_CAMERA_POSITION = Vector3.New(0, 0, 100);

local LayerName = {
	PanelLayer = "PanelLayer",	
	SubPanelLayer = "SubPanelLayer",	
	InfoLayer = "InfoLayer",	
	TipsLayer = "TipsLayer",	
	SystemInfosLayer = "SystemInfosLayer",	
	TopLayer = "TopLayer",	
};

-- 渲染层级 
local LayerOrder = {
	Panel			 = 10,
	SubPanel 		 = 20,
	Info			 = 30,
	Tips 			 = 40,
	SystemInfo 		 = 50,
	Top				 = 60,
}

local LayerDistance = 
{
	Top 	  		= 1,
	SystemInfo 		= 2,
	Tips 	  		= 3,
	Info  	   		= 4,
	SubPanel   		= 5,
	Panel      		= 6,
}

function M.Init()

	-- 找到GuiTranform
    local guiTransform = Game.uiRoot.transform:FindChild("GuiCamera");
    if not guiTransform then 
    	print("In LayerManager, not found guiTransform"); 
    	return; 
    end

    -- find guicamera
	local guiCamera = guiTransform:GetComponent("Camera");
	if not guiCamera then
		print("In LayerManager, not found guiCamera");
		return;
	end
	guiCamera.transform.position = GUI_CAMERA_POSITION;
	M.guiCamera = guiCamera;

	-- 一级界面层
	M.CreateLayerName(M.guiCamera, LayerName.PanelLayer, LayerOrder.Panel, UI_Layer, DISTANCE_DELTA * (LayerDistance.Panel));
	-- 次级界面层  
	M.CreateLayerName(M.guiCamera, LayerName.SubPanelLayer, LayerOrder.SubPanel, UI_Layer, DISTANCE_DELTA * (LayerDistance.SubPanel));
	-- 确认信息层 
	M.CreateLayerName(M.guiCamera, LayerName.InfoLayer, LayerOrder.Info, UI_Layer, DISTANCE_DELTA * (LayerDistance.Info));
	-- tips层  
	M.CreateLayerName(M.guiCamera, LayerName.TipsLayer, LayerOrder.Tips, UI_Layer, DISTANCE_DELTA * (LayerDistance.Tips));
	-- 系统信息层   
	M.CreateLayerName(M.guiCamera, LayerName.SystemInfosLayer, LayerOrder.SystemInfo, UI_Layer, DISTANCE_DELTA * (LayerDistance.SystemInfo));
	-- UI界面中最先前的层 如Loading条
	M.CreateLayerName(M.guiCamera, LayerName.TopLayer,  LayerOrder.Top, UI_Layer, DISTANCE_DELTA *(LayerDistance.Top)); 
end

-- camera 表示相机
-- layerName 层的名称
-- 层的层级
function M.CreateLayerName(camera, layerName, layerOrder, layer, distance)
	if M[layerName] then
		print("** " .. layerName .. " already exists !");
		return;
	end
	M[layerName] = Layer.New(camera, layerName, (BASE_ORDER + layerOrder), layer, distance);
	return M[layerName];
end

function M.AddGameObjectToLayerName(go, LayerNameName)
	if (not go) or (not LayerNameName) then
		return;
	end

	local LayerName = M[LayerNameName];

	if not LayerName then
		if error then error("LayerNameManager AddGameObjectToLayerName LayerName " .. LayerNameName .. " is not exist") end;
		return;
	end
	LayerName:AddGameObjectToLayer(go);

end

function M.GetCamera(LayerNameName)
	if not LayerNameName then
		return;
	end
	local LayerName = M[LayerNameName];
	if not LayerName then
		return;
	end

	return LayerName:GetCamera();
end

function M.GetGUICamera()
	return M.guiCamera;
end

function M.GetBattleCamera()
	return M.battleCamera;
end

function M.GetLayerNameTransform(LayerNameName)
	if not LayerNameName then
		return;
	end

	local LayerName = M[LayerNameName];
	if LayerName then
		return LayerName:GetLayerTransform();
	end
end

function M.GetPanelLayerTransform()
	return M.GetLayerNameTransform(LayerName.PanelLayer);
end

function M.GetSubPanelLayerTransform()
	return M.GetLayerNameTransform(LayerName.SubPanelLayer);
end

function M.GetInfoLayerTransform()
	return M.GetLayerNameTransform(LayerName.InfoLayer);
end

function M.GetTipsLayerTransform()
	return M.GetLayerNameTransform(LayerName.TipsLayer);
end

function M.GetSystemInfoLayerTransform()
	return M.GetLayerNameTransform(LayerName.SystemInfosLayer);
end

function M.GetTopLayerTransform()
	return M.GetLayerNameTransform(LayerName.TopLayer);
end

function M.GetLayerNamePlaneDistance(LayerNameName)
	if not LayerNameName then
		return;
	end

	local  LayerName = M[LayerNameName];
	if not LayerName then
		return;
	end

	return LayerName:GetPlaneDistance();
end

function M.GetLayerNameSortingOrder(LayerNameName)
	if not LayerNameName then return 0 end

	local LayerName = M[LayerNameName];
	if not LayerName then 
		return 0;
	else
		return LayerName:GetLayerIndex();
	end
end

return M;