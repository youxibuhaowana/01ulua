using UnityEngine;
using LuaInterface;
using System.Collections;
using System.Collections.Generic;
using System;
using UnityEngine.UI;

namespace LuaFramework {
    public class LuaBehaviour : View {

        private Dictionary<string, LuaFunction> buttons = new Dictionary<string, LuaFunction>();

        // 添加单击事件
        public void AddClick(GameObject go) {
            if (go == null) return;
            string btnKey = go.name + go.GetInstanceID();
            buttons.Add(btnKey, go.name);
            go.GetComponent<Button>().onClick.AddListener(
                delegate() {
                    luaMgr.CallFunction("DialogClickEvent.OnClick", btnKey); 
                }
            );
        }

        public void RemoveClick(GameObject go) {
            if (go == null) return;
            string btnKey = go.name + go.GetInstanceID();
            if(buttons.ContainsKey(btnKey))
            {
                buttons.Remove(btnKey);
            }
            else
            {
               Debug.Log("Empty Operation: RemoveClick target is empty"); 
               return;
            }
            go.GetComponent<Button>().onClick.RemoveAllListeners();
        }

        protected void OnDestroy() {
            // 提示玩家内存泄漏
            foreach (var de in buttons) {
                if (de.Value != null) {
                    Debug.Log("Memory Leak: {0} not Remove Click Event Remove", de.Value);
                }
            }
            buttons.Clear();
#if ASYNC_MODE
            string abName = name.ToLower().Replace("panel", "");
            ResManager.UnloadAssetBundle(abName + AppConst.ExtName);
#endif
            Util.ClearMemory();
            // Debug.Log("~" + name + " was destroy!");
        }
    }
}