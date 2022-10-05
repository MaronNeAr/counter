<template>
  <div>
	<br />
    <el-form>
      <el-row>
        <el-col :span="10">
          <el-input v-model="func_string" placeholder="请输入函数表达式"></el-input>
        </el-col>
        &nbsp;&nbsp;
		<el-col :span="2">
			<el-input placeholder="区间起点" v-model="left"></el-input>
		</el-col>
        &nbsp;&nbsp;
		<el-col :span="2">
			<el-input placeholder="区间终点" v-model="right"></el-input>
		</el-col>
        &nbsp;&nbsp;
		<el-col :span="3">
			<el-button type="primary" @click="getGraph()">导出函数图像</el-button>
		</el-col>
	</el-row>
	<br />
	<el-row>
		<el-col :span="3">
			<el-button type="success" @click="drow('sin', -1)" round>正弦函数图像</el-button>
		</el-col>
		<el-col :span="3">
			<el-button type="danger" @click="drow('cos', -1)" round>余弦函数图像</el-button>
		</el-col>
		<el-col :span="3">
			<el-button type="primary" @click="drow('tan', -1)" round>正切函数图像</el-button>
		</el-col>
		<el-col :span="4">
			<el-button type="info" @click="drow('ex', exParam)" round>
				指数函数图像
				<el-input placeholder="参数" v-model="exParam"></el-input>
			</el-button>
		</el-col>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<el-col :span="4">
			<el-button type="warning" @click="drow('log', lnxParam)" round>
				对数函数图像
				<el-input placeholder="参数" v-model="lnxParam"></el-input>
			</el-button>
		</el-col>
	</el-row>
    </el-form>
	<br />
	<el-card id="graph" class="cav-info" shadow="hover" :body-style="{ padding: '0px' }"></el-card>
  </div>
</template>

<script lang="ts" setup>
import { defineComponent, ref, computed, watch, reactive, getCurrentInstance } from "vue";
import * as echarts from "echarts";

const { proxy } = getCurrentInstance();
const func_string = ref("y=0.01*x^3+0.1*x^2+3");
const dataX = ref([]);
const dataY = ref([]);
const left = ref(-10);
const right = ref(10);
const exParam = ref();
const lnxParam = ref();

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

	for (let i = Number(left.value); i <= right.value; i += (right.value - left.value) / 1000) {
		dataX.value.push(i);
		let s = ref(func);
		while (s.value.indexOf('x') != -1) {
			s.value = s.value.replace('x', '(' + i + ')');
		}
		dataY.value.push(calc(s.value));
	}
	const graphData = reactive({
	xAxis: {
		type: "category",
		data: dataX.value,
	},
	yAxis: {
		type: "value",
		axisLine:{
			show: true
		}
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

	const graph = echarts.init(document.getElementById("graph"));
	graph.setOption(graphData);
}

function drow(func, param) {
	dataX.value = [];
	dataY.value = [];
	if (func == "ex" || func == "log") {
		if (typeof param == "undefined" || param == null || param == "") {
			(proxy as any).$message({
				message:"请输入参数",
				type:"error"
			});
			return;
		}
	}


	if (func == "log" && left.value <= 0) left.value = 0.001;
	else if (func != "log" && left.value > 0) left.value = -10;

	for (let i = Number(left.value); i <= right.value; i += (right.value - left.value) / 1000) {
		dataX.value.push(i);
		if (func == "sin") dataY.value.push(Math.sin(i));
		else if (func == "cos") dataY.value.push(Math.cos(i));
		else if (func == "tan") dataY.value.push(Math.tan(i));
		else if (func == "ex") dataY.value.push(Math.pow(param, i));
		else if (func == "log") dataY.value.push(Math.log(i) / Math.log(param));
	}
	let graphData = {
	xAxis: {
		type: "category",
		data: dataX.value,
	},
	yAxis: {
		type: "value",
		axisLine:{
			show: true
		},
		min:null,
		max:null
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
	};

	if (func == "tan") {
		graphData.yAxis.min = -10;
		graphData.yAxis.max = 10;
	}

	const graph = echarts.init(document.getElementById("graph"));
	graph.setOption(reactive(graphData));
}
</script>

<style>
	.cav-info {
		border-radius: 6px;
		overflow: hidden;
		height: 500px;
		background-color: white;
	}
</style>