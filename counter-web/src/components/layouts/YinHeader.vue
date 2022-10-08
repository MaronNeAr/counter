<template>
<div class="header">
    <!-- <div class="collapse-btn" @click="collapseChage">
      <el-icon v-if="!collapse"><expand /></el-icon>
      <el-icon v-else><fold /></el-icon>
    </div> -->
    <div class="logo" align="center">{{ musicName }}——{{ subTitle }}</div>
    <!-- <div class="header-right">
      <div class="header-user-con">
        <div class="user-avator">
          <img :src="attachImageUrl(userPic)" />
        </div>
        <el-dropdown class="user-name" trigger="click" @command="handleCommand">
          <span class="el-dropdown-link">
            {{ username }}
            <i class="el-icon-caret-bottom"></i>
          </span>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item command="loginout">退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </div> -->
</div>
</template>

<script lang="ts">
import {
    defineComponent,
    computed,
    ref,
    onMounted,
    watch
} from "vue";
import {
    useStore
} from "vuex";
import {
    useRouter
} from 'vue-router';
import mixin from "@/mixins/mixin";
import {
    Expand,
    Fold
} from "@element-plus/icons-vue";
import emitter from "@/utils/emitter";
import {
    HttpManager
} from "@/api";
import {
    RouterName,
    MUSICNAME
} from "@/enums";

export default defineComponent({
    components: {
        // Expand,
        // Fold,
    },
    setup() {
        const {
            routerManager
        } = mixin();
        const store = useStore();

        const collapse = ref(true);
        const username = ref("admin");
        const userPic = computed(() => store.getters.userPic);
        const musicName = ref(MUSICNAME);

        const subTitle = computed(() => {
            switch (useRouter().currentRoute.value.path.substring(1)) {
                case "" || "counter":
                    return "主页";
                case "rate":
                    return "汇率计算";
                case "base":
                    return "进制换算";
                case "unit":
                    return "单位换算";
                case "function":
                    return "函数图像";
                case "commodity":
                    return "大学牲滴一周开销";
                case "healthy":
                    return "健康计算";
                case "evaluation":
                    return "综测计算";
                default:
                    return "主页";
            }
        });

        onMounted(() => {
            if (document.body.clientWidth < 1500) {
                collapseChage();
            }
        });

        // 侧边栏折叠
        function collapseChage() {
            collapse.value = !collapse.value;
            emitter.emit("collapse", collapse.value);
        }
        // 用户名下拉菜单选择事件
        function handleCommand(command) {
            if (command === "loginout") {
                routerManager(RouterName.SignIn, {
                    path: RouterName.SignIn
                });
            }
        }
        return {
            musicName,
            subTitle,
            username,
            userPic,
            collapse,
            collapseChage,
            handleCommand,
            attachImageUrl: HttpManager.attachImageUrl,
        };
    },
});
</script>

<style scoped>
.header {
    position: absolute;
    z-index: 100;
    width: 100%;
    height: 8%;
    display: flex;
    align-items: center;
    font-size: 20px;
    color: #2c3e50;
    background: #ffff;
    box-shadow: 0px 0px 8px 2px rgba(0, 0, 0, 0.3);
}

.collapse-btn {
    display: flex;
    padding: 0 21px;
    cursor: pointer;
}

.header .logo {
    width: 100%;
    font-weight: bold;
}

.header-right {
    position: absolute;
    right: 0;
    padding-right: 30px;
}

.header-user-con {
    display: flex;
    align-items: center;
}

.user-name {
    margin-left: 10px;
}

.user-avator img {
    display: block;
    width: 40px;
    height: 40px;
    border-radius: 50%;
}

.el-dropdown-link {
    cursor: pointer;
}

.el-dropdown-menu__item {
    text-align: center;
}

.subtitle {}
</style>
