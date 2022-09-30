<template>
  <div>
    <el-card>
        <h3>BMI计算</h3>
        <br />
        <el-row>
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
          <el-col :span="17"></el-col>
          <el-col :span="2" align="right">
            <el-button type="primary" @click="bmiShow = !bmiShow">计算</el-button>
          </el-col>
        </el-row>
        <br />
        <el-row v-if="bmiShow" class="dialog">
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
          <el-col :span="17"></el-col>
          <el-col :span="2" align="right">
            <el-button type="primary" @click="bmiShow = !bmiShow">计算</el-button>
          </el-col>
        </el-row>
        <br />
        <el-row v-if="bmiShow">
          <el-col :span="8"></el-col>
          <el-col :span="4">
            <div class="left">
              <div>&nbsp;BMI指数</div>
              <div>&nbsp;BMI建议</div>
            </div>
          </el-col>
          <el-col :span="4">
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
      <h3>每日消耗</h3>
      <br />
      <el-row>
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
        <el-col :span="17">
          <el-select placeholder="请选择今日活动系数" v-model="activeCoff">
            <el-option label="1.2-少量活动" value="1.2-少量活动"></el-option>
            <el-option label="1.3-轻度活动" value="1.3-轻度活动"></el-option>
            <el-option label="1.6-中度活动" value="1.6-中度活动"></el-option>
            <el-option label="2.0-剧烈活动" value="2.0-剧烈活动"></el-option>
          </el-select>
        </el-col>
        <el-col :span="2" align="right">
          <el-button type="primary" @click="bmiShow = !bmiShow">计算</el-button>
        </el-col>
      </el-row>
      <br />
      <el-row v-if="bmiShow">
        <el-col :span="8"></el-col>
        <el-col :span="4">
          <div class="left">
            <div>&nbsp;BMI指数</div>
            <div>&nbsp;BMI建议</div>
          </div>
        </el-col>
        <el-col :span="4">
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
      <h3>三大营养摄入比</h3>
      <br />
      <el-row>
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
        <el-col :span="17"></el-col>
        <el-col :span="2" align="right">
          <el-button type="primary" @click="bmiShow = !bmiShow">计算</el-button>
        </el-col>
      </el-row>
      <br />
      <el-row v-if="bmiShow">
        <el-col :span="8"></el-col>
        <el-col :span="4">
          <div class="left">
            <div>&nbsp;BMI指数</div>
            <div>&nbsp;BMI建议</div>
          </div>
        </el-col>
        <el-col :span="4">
          <div class="right" align="right">
            <div>{{bmi}}&nbsp;</div>
            <div>{{bmiAdvice}}&nbsp;</div>
          </div>
        </el-col>
        <el-col :span="8"></el-col>
      </el-row>
    </el-card>
  </div>
</template>
  
<script>
import { ref, computed, watch } from "vue";

export default {
  setup(){
    const height = ref();
    const weight = ref();
    const sex = ref();
    const age = ref();
    const activeCoff = ref();
    const bmiShow = ref(false);
    const bmi = computed(() => {
      return (weight.value / Math.pow(height.value / 100, 2)).toFixed(1);
    });
    const bmiAdvice = computed(() => {
      if (bmi.value < 18.5) return "体重过轻，需要增重";
      else if (bmi.value <= 24) return "体重正常";
      else if (bmi.value <= 28) return "超重，需要减重";
      else return "肥胖需要减重";
    })
    return {
      height,
      weight,
      sex,
      age,
      activeCoff,
      bmi,
      bmiAdvice,
      bmiShow
    }
  }
}
</script>

<style scoped>
  * {
    transition: all 2s;
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
    border-left: 1px dotted black;
  }
  .right {
    border-right: 1px dotted black;
    color:skyblue;
  }
  .dialog {
    border-top: 1px solid rgb(197, 197, 196);
  }
</style>