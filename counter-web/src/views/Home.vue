<template>
  <div class="main-block">
    <yin-header></yin-header>
    <div class="content-box" :class="{ 'content-collapse': collapse }">
      <router-view class="main"></router-view>
    </div>
    <!-- <yin-aside></yin-aside> -->
    <yin-footer class="footer"></yin-footer>
  </div>
</template>

<script lang="ts" setup>
import { ref } from "vue";
import YinHeader from "@/components/layouts/YinHeader.vue";
import YinAudio from "@/components/layouts/YinAudio.vue";
import YinAside from "@/components/layouts/YinAside.vue";
import YinFooter from "@/components/layouts/YinFooter.vue";
import emitter from "@/utils/emitter";

const collapse = ref(false);
emitter.on("collapse", (msg) => {
  collapse.value = msg as boolean;
});
</script>

<style scoped>
div {
  animation: fadeInAnimation ease-in 0.5s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}
.main-block {
  width: auto;
}
.content-box {
  width:100%;
  transform: translateX(-50%);
  position: absolute;
  left: 50%;
  right: 0;
  top: 5%;
  bottom: 5%;
  overflow-y: scroll;
  transition: left 0.3s ease-in-out;
  padding: 20px;
  background-image: url(../assets/images/bg.png);
}

.main {
  position: relative;
  width:80%;
  left:50%;
  transform: translateX(-50%);
}

.content-collapse {
  left: 65px;
}

.footer {
  position:fixed;
  bottom:0;
  height:8%;
  width:100%;
  margin: 0%;
}
</style>
