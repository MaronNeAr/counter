<template>
<div>
    <el-dialog title="录入成绩" v-model="centerDialogVisible">

        <el-form ref="dataAddForm" :model="formData" :rules="rules" label-position="right" label-width="100px">

            <el-row>

                <el-col :span="12">

                    <el-form-item label="课程名称" prop="name">

                        <el-input v-model="formData.name" />

                    </el-form-item>

                </el-col>

                <el-col :span="12">

                    <el-form-item label="课程类型" prop="type">

                        <!-- <el-input v-model="formData.type" /> -->
                        <el-select v-model="formData.type" placeholder="请选择课程类型">
                            <el-option label="必修课" value="必修课"></el-option>
                            <el-option label="选修课" value="选修课"></el-option>
                            <el-option label="通识模块一" value="通识模块一"></el-option>
                            <el-option label="通识模块二" value="通识模块二"></el-option>
                            <el-option label="通识模块三" value="通识模块三"></el-option>
                            <el-option label="通识模块四" value="通识模块四"></el-option>
                            <el-option label="通识模块五" value="通识模块五"></el-option>
                            <el-option label="通识模块六" value="通识模块六"></el-option>
                            <el-option label="英语模块Ⅰ" value="英语模块Ⅰ"></el-option>
                            <el-option label="英语模块Ⅱ" value="英语模块Ⅱ"></el-option>
                            <el-option label="英语模块Ⅲ" value="英语模块Ⅲ"></el-option>
                            <el-option label="英语模块Ⅳ" value="英语模块Ⅳ"></el-option>
                            <el-option label="通识选修课" value="通识选修课"></el-option>
                            <el-option label="通识模块一（经典阅读与历史文化传承）" value="通识模块一（经典阅读与历史文化传承）"></el-option>
                            <el-option label="通识模块二（哲学思辨与伦理规范）" value="通识模块二（哲学思辨与伦理规范）"></el-option>
                            <el-option label="通识模块三（艺术与运动健康）" value="通识模块三（艺术与运动健康）"></el-option>
                            <el-option label="通识模块四（经济分析与数学思维）" value="通识模块四（经济分析与数学思维）"></el-option>
                            <el-option label="通识模块五（社会分析与公民素养）" value="通识模块五（社会分析与公民素养）"></el-option>
                            <el-option label="通识模块六（科技进步与科学精神）" value="通识模块六（科技进步与科学精神）"></el-option>
                            <el-option label="通识模块七（语言与跨文化沟通）" value="通识模块七（语言与跨文化沟通）"></el-option>
                        </el-select>

                    </el-form-item>

                </el-col>

            </el-row>

            <el-row>

                <el-col :span="12">

                    <el-form-item label="课程代码" prop="code">

                        <el-input v-model="formData.code" />

                    </el-form-item>

                </el-col>

                <el-col :span="12">

                    <el-form-item label="课程序号" prop="number">

                        <el-input v-model="formData.number" type="" />

                    </el-form-item>

                </el-col>

            </el-row>

            <el-row>

                <el-col :span="12">

                    <el-form-item label="任课教师" prop="teacher">

                        <el-input v-model="formData.teacher" />

                    </el-form-item>

                </el-col>

                <el-col :span="12">

                    <el-form-item label="上课地点" prop="classroom">

                        <el-input v-model="formData.classroom" type="" />

                    </el-form-item>

                </el-col>

            </el-row>

            <el-row>

                <el-col :span="12">

                    <el-form-item label="课程学分" prop="credits">

                        <el-input v-model="formData.credits" type="" />

                    </el-form-item>

                </el-col>

                <el-col :span="12">

                    <el-form-item label="总评成绩" prop="score">

                        <el-input v-model="formData.score" type="" />

                    </el-form-item>

                </el-col>

            </el-row>

            <el-row>

                <el-col :span="12">

                    <el-form-item label="学年学期" prop="term">

                        <el-select v-model="formData.term" placeholder="请选择学年学期">
                            <el-option label="2022-2023" value="2022-2023"></el-option>
                            <el-option label="2021-2022" value="2021-2022"></el-option>
                            <el-option label="2020-2021" value="2020-2021"></el-option>
                            <el-option label="2019-2020" value="2019-2020"></el-option>
                            <el-option label="2018-2019" value="2018-2019"></el-option>
                        </el-select>

                    </el-form-item>

                </el-col>

                <el-col :span="12">

                    <el-form-item label="周内课次" prop="dayOfWeek">

                        <el-select v-model="formData.dayOfWeek" placeholder="请选择周内课次">
                            <el-option label="星期一" value="星期一"></el-option>
                            <el-option label="星期二" value="星期二"></el-option>
                            <el-option label="星期三" value="星期三"></el-option>
                            <el-option label="星期四" value="星期四"></el-option>
                            <el-option label="星期五" value="星期五"></el-option>
                            <el-option label="星期六" value="星期六"></el-option>
                            <el-option label="星期日" value="星期日"></el-option>
                        </el-select>

                    </el-form-item>

                </el-col>

            </el-row>

            <el-row>

                <el-col :span="12">

                    <el-form-item label="课程时间" prop="timeBegin">

                        <el-select v-model="formData.timeBegin" placeholder="请选择课程时间">
                            <el-option label="1" value="1"></el-option>
                            <el-option label="2" value="2"></el-option>
                            <el-option label="3" value="3"></el-option>
                            <el-option label="4" value="4"></el-option>
                            <el-option label="5" value="5"></el-option>
                            <el-option label="6" value="6"></el-option>
                            <el-option label="7" value="7"></el-option>
                            <el-option label="8" value="8"></el-option>
                            <el-option label="9" value="9"></el-option>
                            <el-option label="10" value="10"></el-option>
                            <el-option label="11" value="11"></el-option>
                        </el-select>
                    </el-form-item>

                </el-col>

                <el-col :span="12">

                    <el-form-item label="课程时长" prop="timeLong">

                        <el-select v-model="formData.timeLong" placeholder="请选择课程时长">
                            <el-option label="2" value="2"></el-option>
                            <el-option label="3" value="3"></el-option>
                            <el-option label="4" value="4"></el-option>
                        </el-select>

                    </el-form-item>

                </el-col>

            </el-row>

        </el-form>

        <div class="dialog-footer" align="right" router>

            <el-button @click="cancelRow">取消</el-button>

            <el-button type="primary" @click="confirm" index="score">确定</el-button>

        </div>

    </el-dialog>
</div>
</template>

<script lang="ts">
import {
    HttpManager
} from "@/api";
import {
    defineComponent,
    getCurrentInstance,
    toRefs,
    watch,
    ref
} from "vue";

export default defineComponent({
    data() {
        return {
            dataList: [], //当前页要展示的列表数据
            dialogFormVisible: false, //添加表单是否可见
            dialogFormVisible4Edit: false, //编辑表单是否可见
            rules: { //校验规则
                name: [{
                    required: true,
                    message: '课程名称为必填项',
                    trigger: 'blur'
                }],
                type: [{
                    required: true,
                    message: '课程类型为必填项',
                    trigger: 'blur'
                }],
                term: [{
                    required: true,
                    message: '学年学期为必填项',
                    trigger: 'blur'
                }],
                code: [{
                    required: true,
                    message: '课程代码为必填项',
                    trigger: 'blur'
                }],
                number: [{
                    required: true,
                    message: '课程序号为必填项',
                    trigger: 'blur'
                }],
                teacher: [{
                    required: true,
                    message: '任课教师为必填项',
                    trigger: 'blur'
                }],
                classroom: [{
                    required: true,
                    message: '上课地点为必填项',
                    trigger: 'blur'
                }],
                timeBegin: [{
                    required: true,
                    message: '课程时间为必填项',
                    trigger: 'blur'
                }],
                timeLong: [{
                    required: true,
                    message: '课程时长为必填项',
                    trigger: 'blur'
                }],
                dayOfWeek: [{
                    required: true,
                    message: '课程类型为必填项',
                    trigger: 'blur'
                }],
                credits: [{
                    required: true,
                    message: '课程学分为必填项',
                    trigger: 'blur'
                }],
                score: [{
                    required: true,
                    message: '总评成绩为必填项',
                    trigger: 'blur'
                }],
            },
            pagination: { //分页相关模型数据
                currentPage: 1, //当前页码
                pageSize: 8, //每页显示的记录数
                total: 0, //总记录数
                type: "",
                name: "",
                description: ""
            }
        }
    },
    props: {
        addVisible: Boolean,
    },
    emits: ["cancelRow", "confirm"],
    setup(props) {
        const {
            proxy
        } = getCurrentInstance();

        const {
            addVisible
        } = toRefs(props);
        const centerDialogVisible = ref(addVisible.value);

        const formData =  ref({
            name: "",
            type: "",
            term:"",
            code: "",
            number:"",
            teacher:"",
            classroom:"",
            timeBegin:"",
            timeLong:"",
            dayOfWeek:"",
            credits:"",
            score:""
        });

        watch(addVisible, (value) => {
            centerDialogVisible.value = value;
        });

        function cancelRow() {
            proxy.$emit("cancelRow", false);
        }

        async function confirm() {
            let params = new URLSearchParams();
            params.append("name", formData.value.name);
            params.append("type", formData.value.type);
            params.append("term", formData.value.term);
            params.append("code", formData.value.code);
            params.append("number", formData.value.number);
            params.append("teacher", formData.value.teacher);
            params.append("classroom", formData.value.classroom);
            params.append("timeBegin", formData.value.timeBegin);
            params.append("timeLong", formData.value.timeLong);
            params.append("dayOfWeek", formData.value.dayOfWeek);
            params.append("credits", formData.value.credits);
            params.append("score", formData.value.score);
            const result = (await HttpManager.addCourse(params)) as ResponseBody;
            (proxy as any).$message({
                message: result.message,
                type: result.type,
            });

            if (result.success) {
                console.log(result);
                window.location.reload();
            }
            centerDialogVisible.value = false;
        }

        return {
            formData,
            centerDialogVisible,
            cancelRow,
            confirm
        };
    },
});
</script>

<style>

</style>
