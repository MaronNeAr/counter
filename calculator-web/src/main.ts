import { createApp } from "vue";
import ElementPlus from "element-plus";
import App from "./App.vue";
import router from "./router";
import store from "./store";
import axios from "axios";
import "element-plus/dist/index.css";
import "./assets/css/main.css";
import "./assets/icons/iconfont.js";
import "./assets/fonts/iconfont.css";
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

import { Store } from "vuex";
declare module "@vue/runtime-core" {
  interface State {
    count: number;
  }

  interface ComponentCustomProperties {
    $store: Store<State>;
  }
}

const app = createApp(App);
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}
app.use(store).use(router).use(ElementPlus).mount("#app");
