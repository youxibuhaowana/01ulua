local Layer = Class("Layer", Object);
local M = Layer;

local templateAsset = nil;

function M:Ctor(camera, layerName, layerIndex, layer, distance)

	self.camera = camera;
	self.layer  = layer;
	self.pfb    = nil;
	self.layerName     = layerName;
	self.layerIndex    = layerIndex;
	self.resolution    = nil;
	self.planeDistance = distance;
	self.isShow = true;

	if not templateAsset then
		templateAsset = GameObject.Find("UILayer");
		templateAsset:SetActive(false);
	end
	local pfb =  UnityEngine.Object.Instantiate(templateAsset);
	pfb:SetActive(true);
	self:OnPrefabLoad(pfb)
end

function M:OnPrefabLoad(pfb)
	if not pfb then
		print("In Layer Create templateAsset failed");
		return;
	end
	self.pfb = pfb;
	self.pfb.name = self.layerName;
	self.pfb.transform:SetParent(Game.uiRoot.transform, false);
	local comp = self.pfb.transform:GetComponent("Canvas");	
	comp.worldCamera   = self.camera;
	comp.sortingOrder  = self.layerIndex;
	comp.planeDistance = self.planeDistance;
	self:UpdateSceneLayer(self.pfb);
	self:Adaptation(self.pfb);
end

function M:GetCamera()
	return self.camera;
end

function M:GetLayer()
	return self.layer;
end

function M:GetLayerName()
	return self.layerName;
end

function M:GetLayerIndex()
	return self.layerIndex;
end

function M:GetGameObject()
	return self.pfb;
end

function M:UpdateSceneLayer(pfb)
	pfb.layer = self.layer;
	-- tolua# 没有反射 使用它typeof
	local components = pfb:GetComponentsInChildren(typeof(UnityEngine.Transform));
	AddComponent(typeof(UnityEngine.Text));
	local length = components.Length - 1;
	for i = 0, length do
		components[i].gameObject.layer = self.layer;
	end
end

function M:Adaptation(obj)
	local bizhi = 1.4;
	local  go = obj.transform:GetComponent("CanvasScaler").referenceResolution;
	local rato = UnityEngine.Screen.width / UnityEngine.Screen.height;
	if rato > bizhi then
            go = Vector2.New(960, 640);
        else
			go = Vector2.New(1024, 768);
	end
	obj.transform:GetComponent("CanvasScaler").referenceResolution = go;
	self.resolution = go;
end

function M:AddGameObjectToLayer(go)
	if not go then
		return;
	end

	go.transform:SetParent(self.pfb.transform, false);
	self:UpdateSceneLayer(go);
end

function M:GetLayerTransform()
	if not (self.pfb) then
		if error then error("Layer GetLayerTransform layer GameObject is nil ") end;
		return;
	end
	return self.pfb.transform;
end

function M:GetResolution()
	return self.resolution;
end

function M:GetPlaneDistance()
	return self.planeDistance;
end

function M:ShowHide(show)
	if self.isShow == show then
		return
	end
	self.isShow = show
	if self.pfb then
		self.pfb:SetActive(show)
	end
end

return M;