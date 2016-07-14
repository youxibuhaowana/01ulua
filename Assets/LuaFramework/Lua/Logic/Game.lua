require "3rd/pblua/login_pb"
require "3rd/pbc/protobuf"

local lpeg = require "lpeg"

local json = require "cjson"
local util = require "3rd/cjson/util"

local sproto = require "3rd/sproto/sproto"
local core = require "sproto.core"
local print_r = require "3rd/sproto/print_r"

-- 创建类
require "Common/Class"
require "Common/Object"
require "FrameWork/Singleton"

require "Logic/LuaClass"
require "Common/functions"
require "FrameWork/Layer/LayerManager"
require "Logic/CtrlManager"
require "Controller/PromptCtrl"


--管理器--
Game = {};
local M = Game;

local game; 
local transform;
local gameObject;
local WWW = UnityEngine.WWW;

function Game.InitViewPanels()
	for i = 1, #PanelNames do
		require ("View/"..tostring(PanelNames[i]))
	end
end

--初始化完成，发送链接服务器信息--
function Game.OnInitOK()
    Game.ExcuteTestCode();
    
    -- Game.CreateUILayer(); 
end

function Game.ExcuteTestCode()
    AppConst.SocketPort = 2012;
    AppConst.SocketAddress = "127.0.0.1";
    networkMgr:SendConnect();

    -- 注册LuaView--
    M.InitViewPanels();

    -- 功能测试
    M.test_class_func();
    M.test_pblua_func();
    M.test_cjson_func();
    M.test_pbc_func();
    M.test_lpeg_func();
    M.test_sproto_func();
    coroutine.start(M.test_coroutine);

    CtrlManager.Init();
    local ctrl = CtrlManager.GetCtrl(CtrlNames.Prompt);
    if ctrl ~= nil and AppConst.ExampleMode then
        ctrl:Awake();
    end
       
    logWarn('LuaFramework InitOK--->>>');
end

-- 创建UI层
function Game.CreateUILayer()
    print("create ui layer !");
    -- 找到UI的总节点
    Game.uiRoot = GameObject.FindWithTag("UiRoot");
    if not Game.uiRoot then
        print("In Game, not find UiRoot");
        return;
    end
    LayerManager.Init();
end

--测试协同--
function Game.test_coroutine()    
    logWarn("1111");
    coroutine.wait(1);	
    logWarn("2222");
	
    local www = WWW("http://bbs.ulua.org/readme.txt");
    coroutine.www(www);
    logWarn(www.text);    	
end

--测试sproto--
function Game.test_sproto_func()
    logWarn("test_sproto_func-------->>");
    local sp = sproto.parse [[
    .Person {
        name 0 : string
        id 1 : integer
        email 2 : string

        .PhoneNumber {
            number 0 : string
            type 1 : integer
        }

        phone 3 : *PhoneNumber
    }

    .AddressBook {
        person 0 : *Person(id)
        others 1 : *Person
    }
    ]]

    local ab = {
        person = {
            [10000] = {
                name = "Alice",
                id = 10000,
                phone = {
                    { number = "123456789" , type = 1 },
                    { number = "87654321" , type = 2 },
                }
            },
            [20000] = {
                name = "Bob",
                id = 20000,
                phone = {
                    { number = "01234567890" , type = 3 },
                }
            }
        },
        others = {
            {
                name = "Carol",
                id = 30000,
                phone = {
                    { number = "9876543210" },
                }
            },
        }
    }
    local code = sp:encode("AddressBook", ab)
    local addr = sp:decode("AddressBook", code)
    print_r(addr)
end

--测试lpeg--
function Game.test_lpeg_func()
	logWarn("test_lpeg_func-------->>");
	-- matches a word followed by end-of-string
	local p = lpeg.R"az"^1 * -1

	print(p:match("hello"))        --> 6
	print(lpeg.match(p, "hello"))  --> 6
	print(p:match("1 hello"))      --> nil
end

--测试lua类--
function Game.test_class_func()
    LuaClass:New(10, 20):test();
end

--测试pblua--
function Game.test_pblua_func()
    local login = login_pb.LoginRequest();
    login.id = 2000;
    login.name = 'game';
    login.email = 'jarjin@163.com';
    
    local msg = login:SerializeToString();
    LuaHelper.OnCallLuaFunc(msg, M.OnPbluaCall);
end

--pblua callback--
function Game.OnPbluaCall(data)
    local msg = login_pb.LoginRequest();
    msg:ParseFromString(data);
    print(msg);
    print(msg.id..' '..msg.name);
end

--测试pbc--
function Game.test_pbc_func()
    local path = Util.DataPath.."lua/3rd/pbc/addressbook.pb";
    log('io.open--->>>'..path);

    local addr = io.open(path, "rb")
    local buffer = addr:read "*a"
    addr:close()
    protobuf.register(buffer)

    local addressbook = {
        name = "Alice",
        id = 12345,
        phone = {
            { number = "1301234567" },
            { number = "87654321", type = "WORK" },
        }
    }
    local code = protobuf.encode("tutorial.Person", addressbook)
    LuaHelper.OnCallLuaFunc(code, M.OnPbcCall)
end

--pbc callback--
function Game.OnPbcCall(data)
    local path = Util.DataPath.."lua/3rd/pbc/addressbook.pb";

    local addr = io.open(path, "rb")
    local buffer = addr:read "*a"
    addr:close()
    protobuf.register(buffer)
    local decode = protobuf.decode("tutorial.Person" , data)

    print(decode.name)
    print(decode.id)
    for _,v in ipairs(decode.phone) do
        print("\t"..v.number, v.type)
    end
end

--测试cjson--
function Game.test_cjson_func()
    local path = Util.DataPath.."lua/3rd/cjson/example2.json";
    local text = util.file_load(path);
    LuaHelper.OnJsonCallFunc(text, M.OnJsonCall);
end

--cjson callback--
function Game.OnJsonCall(data)
    local obj = json.decode(data);
    print(obj['menu']['id']);
end

--销毁--
function Game.OnDestroy()
	--logWarn('OnDestroy--->>>');
end
