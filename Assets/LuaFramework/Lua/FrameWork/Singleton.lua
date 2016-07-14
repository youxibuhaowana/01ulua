-- wxb 单利模式
Singleton = Class("Singleton", Object)

function Singleton:Ctor( ... )
end

function Singleton:Destroy()
	local metatable = getmetatable(self);
	if metatable ~= nil then	
		metatable._instance = nil;
	end	
end

function Singleton:HasInstance()
	return self._instance;
end

function Singleton:GetInstance(...)
	if self._instance == nil then
		self._instance = self.New(...)
	end 
	return self._instance	
end 

return Singleton    	

-- 原表本质: 操作指南
-- 自己没有的属性查找原表的__index