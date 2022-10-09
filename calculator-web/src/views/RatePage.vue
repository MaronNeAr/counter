<template>
  <div>
    <el-form>
      <el-row>
        <el-col :span="10">
          <el-input v-model="src" placeholder="请输入数值"></el-input>
        </el-col>
        &nbsp;&nbsp;&nbsp;
        <el-col :span="12">
          <el-select v-model="form_src" placeholder="美元（USD）">
            <el-option v-for="item in rateData" :label="item.name" :value="item.name" :key="item.id"></el-option>
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
          <el-select v-model="form_dst" placeholder="人民币（CNY）">
            <el-option v-for="item in rateData" :label="item.name" :value="item.name" :key="item.id"></el-option>
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
    const src = ref();
    const dst = ref();
    const form_src = ref("美元（USD）");
    const form_dst = ref("人民币（CNY）");

    const dict = {
      '人民币（CNY）':1,
      '美元（USD）':7.1284,
      '欧元（EUR）':6.9332,
      '日元（JPY）':0.0498,
      '英镑（GBP）':7.7971,
      '韩元（KRW）':0.005,
      '港币（HKD）':0.9081
    }

    const rateData = ref([{
      id:1,
      name:'人民币（CNY）',
      rate:1
    },
    {
      id:2,
      name:'美元（USD）',
      rate:7.1284
    },
    {
      id:3,
      name:'欧元（EUR）',
      rate:6.9332
    },
    {
      id:4,
      name:'日元（JPY）',
      rate:0.0498
    },
    {
      id:5,
      name:'英镑（GBP）',
      rate:7.7971
    },
    {
      id:6,
      name:'韩元（KRW）',
      rate:0.005
    },
    {
      id:7,
      name:'港币（HKD）',
      rate:0.9081
    }])

    watch(src, () => {
      dst.value = src.value * dict[form_src.value] / dict[form_dst.value];
    });
    watch(dst, () => {
      src.value = dst.value * dict[form_dst.value] / dict[form_src.value];
    });
    return {
      src,
      dst,
      form_src,
      form_dst,
      rateData
    }
  }
});
</script>

<style>

</style>