<template>
  <div>
    <el-card>
        <h3>BMI计算</h3>
        <br />
        <el-row>
          <el-col :span="2"></el-col>
          <el-col :span="9">
              <el-input placeholder="请填写您的身高（cm）" v-model="height"></el-input>
          </el-col>
          <el-col :span="1"></el-col>
          <el-col :span="9">
            <el-input placeholder="请填写您的体重（kg）" v-model="weight"></el-input>
          </el-col>
          <el-col :span="1"></el-col>
        </el-row>
        <br />
        <el-row>
          <el-col :span="19"></el-col>
          <el-col :span="2" align="right">
            <el-button type="primary" @click="show.bmi=!show.bmi">计算</el-button>
          </el-col>
        </el-row>
        <br />
        <el-row v-if="show.bmi" class="dialog">
          <el-col :span="8"></el-col>
          <el-col :span="4">
            <br />
            <div class="left">
              <div>&nbsp;BMI指数</div>
              <div>&nbsp;BMI建议</div>
            </div>
          </el-col>
          <el-col :span="4">
            <br />
            <div class="right" align="right">
              <div>{{bmi}}&nbsp;</div>
              <div>{{bmiAdvice}}&nbsp;</div>
            </div>
          </el-col>
          <el-col :span="8"></el-col>
        </el-row>
    </el-card>
    <br />
    <el-card>
        <h3>基础代谢</h3>
        <br />
        <el-row>
          <el-col :span="2"></el-col>
          <el-col :span="9">
              <el-select placeholder="请选择性别" v-model="sex">
                <el-option label="男" value="男"></el-option>
                <el-option label="女" value="女"></el-option>
              </el-select>
          </el-col>
          <el-col :span="1"></el-col>
          <el-col :span="9">
            <el-input placeholder="请填写您的年龄（岁）" v-model="age"></el-input>
          </el-col>
          <el-col :span="1"></el-col>
        </el-row>
        <br />
        <el-row>
          <el-col :span="2"></el-col>
          <el-col :span="9">
              <el-input placeholder="请填写您的身高（cm）" v-model="height"></el-input>
          </el-col>
          <el-col :span="1"></el-col>
          <el-col :span="9">
            <el-input placeholder="请填写您的体重（kg）" v-model="weight"></el-input>
          </el-col>
          <el-col :span="1"></el-col>
        </el-row>
        <br />
        <el-row>
          <el-col :span="19"></el-col>
          <el-col :span="2" align="right">
            <el-button type="primary" @click="show.kcal=!show.kcal">计算</el-button>
          </el-col>
        </el-row>
        <br />
        <el-row v-if="show.kcal" class="dialog">
          <el-col :span="8"></el-col>
          <el-col :span="4">
            <br />
            <div class="left">
              <div>&nbsp;基础代谢率</div>
            </div>
          </el-col>
          <el-col :span="4">
            <br />
            <div class="right" align="right">
              <div>{{kcal}}Kcal/kg.d&nbsp;</div>
            </div>
          </el-col>
          <el-col :span="8"></el-col>
        </el-row>
    </el-card>
    <br />
    <el-card>
      <h3>每日消耗卡路里</h3>
      <br />
      <el-row>
          <el-col :span="2"></el-col>
          <el-col :span="9">
            <el-select placeholder="请选择性别" v-model="sex">
              <el-option label="男" value="男"></el-option>
              <el-option label="女" value="女"></el-option>
            </el-select>
        </el-col>
        <el-col :span="1"></el-col>
        <el-col :span="9">
          <el-input placeholder="请填写您的年龄（岁）" v-model="age"></el-input>
        </el-col>
        <el-col :span="1"></el-col>
      </el-row>
      <br />
      <el-row>
          <el-col :span="2"></el-col>
          <el-col :span="9">
            <el-input placeholder="请填写您的身高（cm）" v-model="height"></el-input>
        </el-col>
        <el-col :span="1"></el-col>
        <el-col :span="9">
          <el-input placeholder="请填写您的体重（kg）" v-model="weight"></el-input>
        </el-col>
        <el-col :span="1"></el-col>
      </el-row>
      <br />
      <el-row>
          <el-col :span="2"></el-col>
          <el-col :span="17">
          <el-select placeholder="请选择今日活动系数" v-model="activeCoff">
            <el-option label="1.2-少量活动" value="1.2"></el-option>
            <el-option label="1.3-轻度活动" value="1.3"></el-option>
            <el-option label="1.6-中度活动" value="1.6"></el-option>
            <el-option label="2.0-剧烈活动" value="2.0"></el-option>
          </el-select>
        </el-col>
        <el-col :span="2" align="right">
          <el-button type="primary" @click="show.calorie = !show.calorie">计算</el-button>
        </el-col>
      </el-row>
      <br />
      <el-row v-if="show.calorie" class="dialog">
        <el-col :span="8"></el-col>
        <el-col :span="4">
          <br />
          <div class="left">
            <div>&nbsp;每日消耗</div>
          </div>
        </el-col>
        <el-col :span="4">
          <br />
          <div class="right" align="right">
            <div>{{calorie.toFixed(2)}}大卡&nbsp;</div>
          </div>
        </el-col>
        <el-col :span="8"></el-col>
      </el-row>
    </el-card>
  </div>
</template>
  
<script lang="ts">
import { ref, computed, getCurrentInstance } from "vue";

export default {
  setup(){
    const { proxy } = getCurrentInstance();
    const height = ref();
    const weight = ref();
    const sex = ref();
    const age = ref();
    const activeCoff = ref();
    const show = ref({
      bmi:false,
      kcal:false,
      calorie:false,
    });
    const bmi = computed(() => {
      return (weight.value / Math.pow(height.value / 100, 2)).toFixed(1);
    });
    const bmiAdvice = computed(() => {
      if (Number(bmi.value) < 18.5) return "体重过轻，需要增重";
      else if (Number(bmi.value) <= 24) return "体重正常";
      else if (Number(bmi.value) <= 28) return "超重，需要减重";
      else return "肥胖需要减重";
    });
    const kcal = computed(() => {
      if (sex.value == "男") return 66.5 + 13.8 * weight.value + 5.0 * height.value - 6.8 * age.value;
      else return 665.1 + 9.6 * weight.value + 1.8 * height.value - 4.7 * age.value;
    });
    const calorie = computed(() => {

      if (sex.value == "男") {
        if (age.value < 18) {
          (proxy as any).$message({
            message: "我想您的年龄应当至少为18岁",
            type:"error"
          });
          return 0;
        } else if (age.value < 30) return 15.2 * weight.value + 24 * activeCoff.value + 680;
        else if (age.value < 60) return 11.5 * weight.value + 24 * activeCoff.value + 830;
        else return 13.4 * weight.value + 24 * activeCoff.value + 490;
      } else {
        if (age.value < 18) {
          (proxy as any).$message({
            message: "我想您的年龄应当至少为18岁",
            type:"error"
          });
          return 0;
        } else if (age.value < 30) return 14.6 * weight.value + 24 * activeCoff.value + 450;
        else if (age.value < 60) return 8.6 * weight.value + 24 * activeCoff.value + 830;
        else return 10.4 * weight.value + 24 * activeCoff.value + 600;
      }
    })
    return {
      height,
      weight,
      sex,
      age,
      activeCoff,
      bmi,
      bmiAdvice,
      kcal,
      calorie,
      show
    }
  }
}
</script>

<style scoped>
  div {
    animation: fadeInAnimation ease-in 0.5s;
    animation-iteration-count: 1;
    animation-fill-mode: forwards;
  }
  h3 {
    position: relative;
    left:8.5%;
  }
  .el-card {
    transform-origin: 50% 0; 
  }
  .el-card:hover {
    background-color:#f5f3f3;
  }
  .plus-enter-active{
    transition: opacity .5s;
  }
  .plus-enter{
     opacity: 0;
  }
  .plus-leave-active{
    transition: opacity .5s;
  }
  .plus-leave-to{
    opacity: 0;
  }
  .plus-enter-to{
    opacity: 1;
  }
  .bg-purple-dark {
    background: #99a9bf;
  }
  .left{
    border-left:1px solid rgb(197, 197, 196);
  }
  .right {
    border-right:1px solid rgb(197, 197, 196);
    color:skyblue;
  }
  .dialog {
    border-top: 1px solid rgb(197, 197, 196);
  }
</style>