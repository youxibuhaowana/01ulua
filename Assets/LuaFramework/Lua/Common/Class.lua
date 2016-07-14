function Clone(object)
    local lookup_table = {}
    local function _copy(object)
        if type(object) ~= "table" then
            return object
        elseif lookup_table[object] then
            return lookup_table[object]
        end
        local new_table = {}
        lookup_table[object] = new_table
        for key, value in pairs(object) do
            new_table[_copy(key)] = _copy(value)
        end
        return setmetatable(new_table, getmetatable(object))
    end
    return _copy(object)
end

function Class(classname, super)
    local cls
    if super then
        cls = Clone(super)
        cls.super = super
        if not cls.Ctor then
            cls.Ctor = function() end
        end
    else
        cls = {Ctor = function() end}
    end

    cls.__cname = classname
    cls.__ctype = 2 -- lua
    cls.__index = cls
    
    function cls.New(...)
        local instance = setmetatable({}, cls)
        instance.class = cls
        instance:Ctor(...)
        return instance
    end
    function cls.Create(...)
        return cls.New(...)
    end
    return cls
end

--[[ 
** Q: 函数本质: 划地为函
   函数调用: 中断法, 函数调用会创建一块空间, 函数变量缓存这片空间

下面代码理解闭包
function create_a_counter()
    local count=0
    return function()
        count = count + 1
        return count
    end
end
 
print(create_a_counter())
print(create_a_counter())

c1 = create_a_counter()
print(c1())
print(c1())

结果如下:
function: 000000000FA58BF0
function: 000000000FA59330
1
2

** 函数空间 和 文件代码代码空间是相同的处理
Q: 为什么 通过class创建出来的类，构造函数地址相同
Q: 地址空间开辟了, SonClass 继承 FatherClass
    A = SonClass.New();
    B = SonClass.New();
    这里A 和 B 有相同的原表FatherClass, 原表数据公共了.
** 使用时注意:
(1) 子类构造函数中，需要调用父类构造函数, 这样通过self父类成员直接传递到子类对象中
(2)  函数成员需要写到Ctor中定义, 否则没有调用就不会有该成员
]]