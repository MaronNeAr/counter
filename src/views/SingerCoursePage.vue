<template lang="ts">
<el-breadcrumb class="crumbs" separator="/">
    <el-breadcrumb-item v-for="item in breadcrumbList" :key="item.name" :to="{ path: item.path, query: item.query }">
        {{ item.name }}
    </el-breadcrumb-item>
</el-breadcrumb>

<el-table :data="tableData" style="width: 100%;" 
    :header-cell-style="{'text-align':'center','font-size':'12px'}"
    :cell-style="{'text-align':'center','font-size':'12px'}">
    <el-table-column prop="sections" :label="'节次\n星期    '" width="80"></el-table-column>
    <el-table-column prop="class1" :label="'第一节\n8:00-8:45'"></el-table-column>
    <el-table-column prop="class2" :label="'第二节\n8:55-9:40'"></el-table-column>
    <el-table-column prop="class3" :label="'第三节\n10:05-10:50'"></el-table-column>
    <el-table-column prop="class4" :label="'第四节\n11:00-11:45'"></el-table-column>
    <el-table-column prop="class5" :label="'第五节\n11:55-12:40'"></el-table-column>
    <el-table-column prop="class6" :label="'第六节\n13:20-14:05'"></el-table-column>
    <el-table-column prop="class7" :label="'第七节\n14:15-15:00'"></el-table-column>
    <el-table-column prop="class8" :label="'第八节\n15:25-16:10'"></el-table-column>
    <el-table-column prop="class9" :label="'第九节\n16:20-17:05'"></el-table-column>
    <el-table-column prop="class10" :label="'第十节\n17:15-18:00'"></el-table-column>
    <el-table-column prop="class11" :label="'第十一节\n18:00-18:45'"></el-table-column>
    <el-table-column prop="class12" :label="'第十二节\n18:55-19:40'"></el-table-column>
    <el-table-column prop="class13" :label="'第十三节\n19:50-20:35'"></el-table-column>
</el-table>
</template>

<script lang="ts">
    import {
        defineComponent,
        computed,
        ref
    } from "vue";
    import {
        useStore
    } from "vuex";
    import {
        HttpManager
    } from "@/api";
    import YinDelDialog from "@/components/dialog/YinDelDialog.vue";

    export default defineComponent({
        components: {},
        setup() {
            const store = useStore();
            const breadcrumbList = computed(() => store.getters.breadcrumbList);
            const tableData = ref([]);
            const data = computed(()=>{
                return tableData;
            })

            getData();

            async function getData() {
                tableData.value = [];
                const result = (await HttpManager.getAllCourse()) as ResponseBody;
                let tempDate = [{sections:"星期一"}, 
                                {sections:"星期二"}, 
                                {sections:"星期三"}, 
                                {sections:"星期四"}, 
                                {sections:"星期五"}, 
                                {sections:"星期六"}, 
                                {sections:"星期日"}];
                let weekMap = {"星期一":0, "星期二":1, "星期三":2, "星期四":3, "星期五":4, "星期六":5, "星期日":6}
                console.log(result.data);
                result.data.forEach((item)=>{
                    if (item.checked) {
                        let idx = weekMap[item.dayOfWeek];
                        tempDate[idx]['class' + item.timeBegin] = item.name;
                        tempDate[idx]['class' + (item.timeBegin + 1)] = item.teacher + '\n(' + item.classroom + ')';
                    }
                });
                tableData.value = tempDate;
                console.log(tempDate);
            }

            return {
                breadcrumbList,
                // eslint-disable-next-line vue/no-dupe-keys
                tableData,
                data,
            };
        },
    });
</script>

<style>
.el-table .cell {
  white-space: pre-line;
}
</style>