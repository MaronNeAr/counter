<template>
  <div class="container">
    <div class="handle-box">
      <el-button @click="addCourse" style="primary">录入成绩</el-button>
      <el-input v-model="searchWord" placeholder="筛选课程"></el-input>
    </div>

    <el-table height="550px" border size="small" :data="data" @selection-change="handleSelectionChange">
      <!-- <el-table-column type="selection" width="60" align="center"></el-table-column> -->
      <el-table-column label="学年学期" prop="term" width="120" align="center"></el-table-column>
      <el-table-column label="课程代码" prop="code" width="120" align="center"></el-table-column>
      <el-table-column label="课程序号" prop="number" width="120" align="center"></el-table-column>
      <el-table-column label="课程名称" prop="name" align="center"></el-table-column>
      <el-table-column label="课程类别" prop="type" width="180" align="center"></el-table-column>
      <el-table-column label="学分" prop="credits" width="120" align="center"></el-table-column>
      <el-table-column label="总评成绩" prop="score" width="120" align="center"></el-table-column>
      <el-table-column label="绩点" prop="gpa" width="120" align="center"></el-table-column>
    </el-table>
    <el-pagination
      class="pagination"
      background
      layout="total, prev, pager, next"
      :current-page="currentPage"
      :page-size="pageSize"
      :total="tableData.length"
      @current-change="handleCurrentChange"
    >
    </el-pagination>
  </div>

  <!-- 添加提示框 -->
  <add-course-dialog :addVisible="addVisible" @confirm="confirm" @cancelRow="addVisible = $event"></add-course-dialog>
</template>

<script lang="ts">
import { defineComponent, getCurrentInstance, watch, ref, reactive, computed } from "vue";
import mixin from "@/mixins/mixin";
import { HttpManager } from "@/api";
import { RouterName } from "@/enums";
import AddCourseDialog from "@/components/dialog/AddCourseDialog.vue";
import { getBirth } from "@/utils";

export default defineComponent({
  components: {
    AddCourseDialog,
  },
  setup() {
    const { proxy } = getCurrentInstance();
    const { changeSex, routerManager } = mixin();

    const tableData = ref([]); // 记录歌曲，用于显示
    const tempDate = ref([]); // 记录歌曲，用于搜索时能临时记录一份歌曲列表
    const pageSize = ref(12); // 页数
    const currentPage = ref(1); // 当前页
    const addVisible = ref(false);
    const multipleSelection = ref([]);

    // 计算当前表格中的数据
    const data = computed(() => {
      return tableData.value.slice((currentPage.value - 1) * pageSize.value, currentPage.value * pageSize.value);
    });

    const searchWord = ref(""); // 记录输入框输入的内容
    watch(searchWord, () => {
      if (searchWord.value === "") {
        tableData.value = tempDate.value;
      } else {
        tableData.value = [];
        for (let item of tempDate.value) {
          if (item.name.includes(searchWord.value)) {
            tableData.value.push(item);
          }
        }
      }
    });

    getData();

    // 获取用户信息
    async function getData() {
      tableData.value = [];
      tempDate.value = [];
      const result = (await HttpManager.getAllCourse()) as ResponseBody;
      tableData.value = result.data;
      tempDate.value = result.data;
      currentPage.value = 1;
      // console.log(result);
    }
    // 获取当前页
    function handleCurrentChange(val) {
      currentPage.value = val;
    }

    function addCourse() {
      addVisible.value = true;
    }

    function handleSelectionChange(val) {
      multipleSelection.value = val;
    }

    function confirm() {
      getData();
    }

    return {
      searchWord,
      data,
      tableData,
      pageSize,
      currentPage,
      addCourse,
      addVisible,
      handleSelectionChange,
      handleCurrentChange,
      changeSex,
      getBirth,
      confirm,
      attachImageUrl: HttpManager.attachImageUrl,
    };
  },
});
</script>

<style scoped></style>
