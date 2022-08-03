<template>
  <div class="container">
    <div class="handle-box">
        <el-button @click="goSingerCoursePage">查看个人课表</el-button>
        <el-button @click="choiceAll">一键选/退课</el-button>
        <el-input v-model="searchWord" placeholder="筛选课程"></el-input>
    </div>

    <el-table height="550px" border size="small" :data="data" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="60" align="center"></el-table-column>
      <el-table-column label="课程代码" prop="code" width="120" align="center"></el-table-column>
      <el-table-column label="课程序号" prop="number" width="120" align="center"></el-table-column>
      <el-table-column label="课程名称" prop="name" align="center"></el-table-column>
      <el-table-column label="课程类别" prop="type" width="180" align="center"></el-table-column>
      <el-table-column label="周内课次" prop="dayOfWeek" width="180" align="center"></el-table-column>
      <el-table-column label="课程时间" prop="timeBegin" width="180" align="center"></el-table-column>
      <el-table-column label="选课" width="120" align="center">
        <template v-slot="scope">
          <el-button v-if="!scope.row.checked" type="primary" @click="choiceCourse(scope.row.id)">选课</el-button>
          <el-button v-if="scope.row.checked" type="danger" @click="choiceCourse(scope.row.id)">退课</el-button>
        </template>
      </el-table-column>
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

  <!-- 选课提示框 -->
  <select-dialog :delVisible="choiceVisible" @confirm="confirm" @cancelRow="choiceVisible = $event"></select-dialog>
</template>

<script lang="ts">
import { defineComponent, getCurrentInstance, watch, ref, reactive, computed } from "vue";
import mixin from "@/mixins/mixin";
import { HttpManager } from "@/api";
import { RouterName } from "@/enums";
import selectDialog from "@/components/dialog/SelectDialog.vue";
import { getBirth } from "@/utils";

export default defineComponent({
  components: {
    selectDialog
},
  setup() {
    const { proxy } = getCurrentInstance();
    const { changeSex, routerManager } = mixin();

    const tableData = ref([]); // 记录歌曲，用于显示
    const tempDate = ref([]); // 记录歌曲，用于搜索时能临时记录一份歌曲列表
    const pageSize = ref(10); // 页数
    const currentPage = ref(1); // 当前页

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
    }
    // 获取当前页
    function handleCurrentChange(val) {
      currentPage.value = val;
    }

    /**
     * 路由
     */
    
    function goSingerCoursePage(id) {
      const breadcrumbList = reactive([
        {
          path: RouterName.Course,
          name: "选课系统",
        },
        {
          path: "",
          name: "个人课表",
        },
      ]);
      proxy.$store.commit("setBreadcrumbList", breadcrumbList);
      routerManager(RouterName.SingerCourse, { path: RouterName.SingerCourse, query: { id } });
    }

    const idx = ref(-1); // 记录当选的课所在行
    const multipleSelection = ref([]); // 记录当前要选的课
    const choiceVisible = ref(false); // 显示选课框

    /**
     * 选课
     */

    async function confirm() {
      const result = (await HttpManager.selectCourse(idx.value)) as ResponseBody;
      (proxy as any).$message({
        message: result.message,
        type: result.type,
      });
      if (result) getData();
      choiceVisible.value = false;
    }

    function choiceCourse(id) {
      idx.value = id;
      choiceVisible.value = true;
    //   delVisible.value = true;
    }

    function handleSelectionChange(val) {
      multipleSelection.value = val;
    }
    function choiceAll() {
      for (let item of multipleSelection.value) {
        choiceCourse(item.id);
        confirm();
      }
      multipleSelection.value = [];
    }

    return {
      choiceCourse,
      goSingerCoursePage,
      searchWord,
      data,
      tableData,
      choiceVisible,
      pageSize,
      currentPage,
      choiceAll,
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
