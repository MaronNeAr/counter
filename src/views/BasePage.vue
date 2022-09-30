<template>
  <div>
    <el-form>
      <el-row>
        <el-col :span="10">
          <el-input v-model="dec" placeholder="请输入十进制数"></el-input>
        </el-col>
        &nbsp;&nbsp;&nbsp;
        <el-col :span="12">
          <el-button>十进制</el-button>
        </el-col>
      </el-row>
      <br/>
      <el-row>
        <el-col :span="10">
          <el-input v-model="bin" placeholder="请输入二进制数"></el-input>
        </el-col>
        &nbsp;&nbsp;&nbsp;
        <el-col :span="12">
          <el-button>二进制</el-button>
        </el-col>
      </el-row>
      <br/>
      <el-row>
        <el-col :span="10">
          <el-input v-model="oct" placeholder="请输入八进制数"></el-input>
        </el-col>
        &nbsp;&nbsp;&nbsp;
        <el-col :span="12">
          <el-button>八进制</el-button>
        </el-col>
      </el-row>
      <br/>
      <el-row>
        <el-col :span="10">
          <el-input v-model="hex" placeholder="请输入十六进制数"></el-input>
        </el-col>
        &nbsp;&nbsp;&nbsp;
        <el-col :span="12">
          <el-button>十六进制</el-button>
        </el-col>
      </el-row>
    </el-form>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, computed, watch } from "vue";

export default defineComponent({
  setup() {
    const dec = ref();
    const bin = ref();
    const oct = ref();
    const hex = ref();

    watch(dec, () => {
      bin.value = parseInt(dec.value).toString(2);
      oct.value = parseInt(dec.value).toString(8);
      hex.value = parseInt(dec.value).toString(16);
    });
    return {
      dec,
      bin,
      oct,
      hex
    }
  }
});
</script>

<style>

</style>