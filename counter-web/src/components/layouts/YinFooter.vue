<template>
<el-card>
    <div align="center" class="footer-box">
        <el-menu class="el-menu-demo" mode="horizontal" router>
            <!-- <el-menu-item index="index" title="主页">
                <el-icon><House /></el-icon>
            </el-menu-item> -->
            <el-menu-item index="counter" title="计算器">
                <el-icon>
                    <Menu />
                </el-icon>
                <!-- <span>计算器</span> -->
            </el-menu-item>
            <el-menu-item index="evaluation" title="综合测评">
                <el-icon>
                    <calendar />
                </el-icon>
                <!-- <span>综合测评</span> -->
            </el-menu-item>
            <el-menu-item index="function" title="函数图像">
                <el-icon>
                    <DataLine />
                </el-icon>
                <!-- <span>函数图像</span> -->
            </el-menu-item>
            <el-menu-item index="healthy" title="健康数据">
                <el-icon>
                    <Document />
                </el-icon>
                <!-- <span>商品计价</span> -->
            </el-menu-item>
            <el-menu-item index="commodity" title="商品计价">
                <el-icon>
                    <ShoppingCart />
                </el-icon>
                <!-- <span>健康数据</span> -->
            </el-menu-item>
        </el-menu>
    </div>
    <h6 align="right" class="record">上海财经大学 | 联系我们 | <a style="text-decoration" href="https://beian.miit.gov.cn/">宁ICP备2022000586号</a></h6>
</el-card>
</template>

<script lang="ts" setup>
import {
    ref
} from "vue";
import {
    Headset,
    ScaleToOriginal,
    Menu,
    Mic,
    Document,
    DataLine,
    Calendar,
    Notification,
    ChatDotRound
} from "@element-plus/icons-vue";
import emitter from "@/utils/emitter";

const collapse = ref(false);
emitter.on("collapse", (msg) => {
    collapse.value = msg as boolean;
});
</script>

<style lang="scss" scoped>
.el-menu {
    justify-content: center;
    /* 水平居中 */
}

.el-menu-item:hover {
    .el-icon {
        transform: scale(2.5);
    }
}

.el-icon:hover {
    transition: all 0.1s;
}

.el-icon {
    transition: all 0.2s;
    height: 30px;
    align-items: center;
}
.record {
    position:absolute;
    right: 20px;
    bottom: 10%;
}
</style>
