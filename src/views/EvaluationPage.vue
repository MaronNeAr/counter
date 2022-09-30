<template>
  <div>
    <el-card>
        <el-row>
            <el-col :span="6">
                <el-input placeholder="课程代码"></el-input>
                <br />
                <br />
                <el-input placeholder="课程名称"></el-input>
            </el-col>
            <el-col :span="1"></el-col>
            <el-col :span="6">
                <el-table border height="200px">
                    <el-table-column label="课程名称" align="center"></el-table-column>
                </el-table>
            </el-col>
            <el-col :span="1"></el-col>
            <el-col :span="10">
                <el-table border height="200px" :data="courseData">
                    <el-table-column label="已选课程" prop="name" align="center"></el-table-column>
                    <el-table-column label="课程成绩" prop="score" align="center">
                        <el-input></el-input>
                    </el-table-column>
                </el-table>
            </el-col>
        </el-row>
        <br />
        <el-row align="right">
            <el-col :span="20"></el-col>
            <el-col :span="2">
                <h3>智育分</h3>
            </el-col>
            <el-col :span="2">
                <h3>60/70</h3>
            </el-col>
        </el-row>
        <br />
        <div class="top-line"></div>
        <br />
        <el-row>
            <el-col :span="9">
                <el-input placeholder="请填写第一学期体育成绩" v-model="height"></el-input>
            </el-col>
            <el-col :span="1"></el-col>
            <el-col :span="9">
                <el-input placeholder="请填写第二学期体育成绩" v-model="weight"></el-input>
            </el-col>
            <el-col :span="1"></el-col>
            <el-col :span="2">
                <h3>体育分</h3>
            </el-col>
            <el-col :span="2">
                <h3>10/10</h3>
            </el-col>
        </el-row>
        <br />
        <div class="top-line"></div>
        <br />
        <el-row>
            <el-col :span="3">
                <el-input placeholder="竞赛名称"></el-input>
            </el-col>
            <el-col :span="1"></el-col>
            <el-col :span="6">
                <el-table border height="200px">
                    <el-table-column label="竞赛名称" align="center"></el-table-column>
                </el-table>
            </el-col>
            <el-col :span="1"></el-col>
            <el-col :span="13">
                <el-table border height="200px" :data="contestData">
                    <el-table-column label="获奖竞赛" prop="name" align="center"></el-table-column>
                    <el-table-column label="竞赛等级" prop="score" align="center">
                        <el-select placeholder="请选择竞赛等级">
                            <el-option label="不评选等级"></el-option>
                            <el-option label="校级"></el-option>
                            <el-option label="市级"></el-option>
                            <el-option label="国家级"></el-option>
                        </el-select>
                    </el-table-column>
                    <el-table-column label="获奖等级" prop="score" align="center">
                        <el-select placeholder="请选择获奖等级">
                            <el-option label="不评选等级"></el-option>
                            <el-option label="一等奖"></el-option>
                            <el-option label="二等奖"></el-option>
                            <el-option label="三等奖"></el-option>
                        </el-select>
                    </el-table-column>
                </el-table>
            </el-col>
        </el-row>
        <br />
        <el-row align="right">
            <el-col :span="20"></el-col>
            <el-col :span="2">
                <h3>加分项</h3>
            </el-col>
            <el-col :span="2">
                <h3>8/8</h3>
            </el-col>
        </el-row>
        <br />
        <div class="top-line"></div>
        <br />
        <el-row>
            <el-col :span="20">
                <h4>*注：本学年互评分采取14.9-15中的随机数</h4>
            </el-col>
            <el-col :span="4">
                <el-button type="primary" @click="resDialog = !resDialog">计算综测得分</el-button>
            </el-col>
        </el-row>
        <el-dialog v-model="resDialog">
            <p>您的综合测评成绩为</p>
            <h1 align="center">伊伯昏</h1>
        </el-dialog>
    </el-card>
  </div>
</template>

<script>
import { ref, computed, watch } from "vue";

export default {
    setup() {
        const resDialog = ref(false);
        const courseData = ref([{
            name:"经管机",
            score:94
        },
        {
            name:"软件工程",
            score:76
        }]);
        const contestData = ref([{
            name:"高教社杯”全国大学生数学建模竞赛",
            score:94
        },
        {
            name:"全国计算机设计大赛",
            score:76
        }]);
        return {
            resDialog,
            courseData,
            contestData
        }
    }
}
</script>

<style>
    .top-line {
        border-top: 1px solid rgb(197, 197, 196);
    }
</style>