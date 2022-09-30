<template>
  <div>
    <el-form>
      <el-row>
        <el-col :span="10">
          <el-input v-model="func_string" placeholder="请输入函数表达式"></el-input>
        </el-col>
        &nbsp;&nbsp;
        <el-col :span="12">
          <el-button type="primary" @click="getGraph()">导出函数图像</el-button>
        </el-col>
      </el-row>
    </el-form>
	<br />
	<el-card id="courseStyle" class="cav-info" shadow="hover" :body-style="{ padding: '0px' }"></el-card>
  </div>
</template>

<script lang="ts" setup>
import { defineComponent, ref, computed, watch, reactive } from "vue";
import * as echarts from "echarts";

const func_string = ref("y=0.01*x^3+0.1*x^2+3");
const dataX = ref([]);
const dataY = ref([]);

function calc(str) {
	let idx = str.indexOf('^');
	if (idx == -1) return eval(str);
	let i = str.substring(0, idx).lastIndexOf('('), j = idx + 1;
	while (j < str.length && str[j] >= '0' && str[j] <= '9') j++;
	let left = str.substring(i + 1, idx - 1),
		right = str.substring(idx + 1, j);
	return calc(str.substring(0, i) + Math.pow(left, right) + str.substring(j));
}

function getGraph() {
	if (func_string.value.length == 0) alert("请输入正确的函数");
	let idx = func_string.value.indexOf("=");
	if (idx == -1) {
		alert("请输入正确的函数");
		return;
	}
	let func = func_string.value.substring(idx + 1);
	dataX.value = [];
	dataY.value = [];

	for (let i = -10; i <= 10; i +=0.001) {
		dataX.value.push(i);
		let s = ref(func);
		while (s.value.indexOf('x') != -1) {
			s.value = s.value.replace('x', '(' + i + ')');
		}
		dataY.value.push(calc(s.value));
	}
	const courseStyle = reactive({
	xAxis: {
		type: "category",
		data: dataX.value,
	},
	yAxis: {
		type: "value",
	},
	series: [
		{
		data: dataY.value,
		type: "line",
		barWidth: "40%",
		smooth: true,
		},
	],
	grid: {
		x: 40,
		y: 20,
		x2: 40,
		y2: 20
	}
	});

	const songStyleChart = echarts.init(document.getElementById("courseStyle"));
	songStyleChart.setOption(courseStyle);
}
</script>

<style>
	.cav-info {
		border-radius: 6px;
		overflow: hidden;
		height: 400px;
		background-color: white;
	}
</style>