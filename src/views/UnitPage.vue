<template>
  <div>
    <el-form>
      <el-row>
        <el-col :span="12">
          <el-select v-model="formData" placeholder="长度">
            <el-option label="长度" value="长度"></el-option>
            <el-option label="面积" value="面积"></el-option>
            <el-option label="体积" value="体积"></el-option>
            <el-option label="质量" value="质量"></el-option>
            <el-option label="温度" value="温度"></el-option>
            <el-option label="压力" value="压力"></el-option>
            <el-option label="功率" value="功率"></el-option>
          </el-select>
        </el-col>
      </el-row>
    
      <br/>

      <el-row>
        <el-col :span="10">
          <el-input v-model="src" placeholder="请输入数值"></el-input>
        </el-col>
        &nbsp;&nbsp;&nbsp;
        <el-col :span="12">
          <el-select v-model="form_src" placeholder="请选择单位">
            <el-option label="千米" value="千米"></el-option>
            <el-option label="米" value="米"></el-option>
          </el-select>
        </el-col>
      </el-row>

      <br/>

      <el-row>
        <el-col :span="10">
          <el-input v-model="dst" placeholder="请输入数值"></el-input>
        </el-col>
        &nbsp;&nbsp;&nbsp;
        <el-col :span="12">
          <el-select v-model="form_dst" placeholder="请选择单位">
            <el-option label="千米" value="千米"></el-option>
            <el-option label="米" value="米"></el-option>
          </el-select>
        </el-col>
      </el-row>
    </el-form>
  </div>
</template>

<script>
import { defineComponent, ref, computed, watch } from "vue";

export default defineComponent({
  setup() {
    const src = ref();
    const dst = ref();
    const form_src = ref([]);
    const form_dst = ref([]);
    const formData = ref([]);

    return {
      src,
      dst,
      form_src,
      form_dst,
      formData
    }
  }
});
</script>

<style>

</style>