<template>
  <div>
    <el-form>
      <el-row>
        <el-col :span="10">
          <el-input v-model="src"></el-input>
        </el-col>
        &nbsp;&nbsp;&nbsp;
        <el-col :span="12">
          <el-select placeholder="美元（USD）">
            
          </el-select>
        </el-col>
      </el-row>
    
      <br/>

      <el-row>
        <el-col :span="10">
          <el-input v-model="dst"></el-input>
        </el-col>
        &nbsp;&nbsp;&nbsp;
        <el-col :span="12">
          <el-select placeholder="人民币（CNY）">
            
          </el-select>
        </el-col>
      </el-row>
    </el-form>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref, computed, watch } from "vue";

export default defineComponent({
  setup() {
    const src = ref(0);
    const dst = ref(0);

    watch(src, () => {
      dst.value = src.value / 6;
    });
    watch(dst, () => {
      src.value = dst.value * 6;
    });
    return {
      src,
      dst
    }
  }
});
</script>

<style>

</style>