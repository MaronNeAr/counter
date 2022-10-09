<template>
  <div class="sidebar">
    <el-menu
      class="sidebar-el-menu"
      background-color="#ffffff"
      active-text-color="#30a4fc"
      default-active="counter"
      router
      :collapse="collapse"
    >
    <el-menu-item index="hall">
      <el-icon><Headset /></el-icon>
      <span>餐厅</span>
    </el-menu-item>
      <el-menu-item index="counter">
        <el-icon><Menu /></el-icon>
        <span>计算器</span>
      </el-menu-item>
      <el-menu-item index="rate">
        <el-icon><calendar /></el-icon>
        <span>汇率换算</span>
      </el-menu-item>
      <el-menu-item index="base">
        <el-icon><Notification /></el-icon>
        <span>进制转换</span>
      </el-menu-item>
      <!-- <el-menu-item index="financial">
        <el-icon><Document /></el-icon>
        <span>理财计算</span>
      </el-menu-item> -->
      <el-menu-item index="unit">
        <el-icon><ScaleToOriginal /></el-icon>
        <span>单位换算</span>
      </el-menu-item>
      <el-menu-item index="function">
        <el-icon><DataLine /></el-icon>
        <span>函数图像</span>
      </el-menu-item>
      <el-menu-item index="financial">
        <el-icon><Document /></el-icon>
        <span>商品计价</span>
      </el-menu-item>
      <el-menu-item index="healthy">
        <el-icon><Document /></el-icon>
        <span>健康数据</span>
      </el-menu-item>
      <el-menu-item index="evaluation">
        <el-icon><Document /></el-icon>
        <span>综合测评</span>
      </el-menu-item>
    </el-menu>
  </div>
</template>

<script lang="ts" setup>
import { ref } from "vue";
import { Headset, ScaleToOriginal, Menu, Mic, Document, DataLine, Calendar, Notification, ChatDotRound } from "@element-plus/icons-vue";
import emitter from "@/utils/emitter";

const collapse = ref(false);
emitter.on("collapse", (msg) => {
  collapse.value = msg as boolean;
});
</script>

<style scoped>
.sidebar {
  display: block;
  position: absolute;
  left: 0;
  top: 6%;
  bottom: 0;
  overflow-y: scroll;
}

.sidebar::-webkit-scrollbar {
  width: 0;
}

.sidebar > ul {
  height: 100%;
}

.sidebar > ul >li {
  transition:all .5s;
}

.sidebar > ul >li:hover {
  transform:scale(1.5);
}

.sidebar-el-menu:not(.el-menu--collapse) {
  width: 100%;
}
</style>
