using UnityEngine;
using System.Collections;

namespace LuaFramework {

    /// <summary>
    /// </summary>
    public class Main : MonoBehaviour {

        void Start() {
        	// 外观模式(集合方法)
            AppFacade.Instance.StartUp();   //启动游戏
        }
    }
}