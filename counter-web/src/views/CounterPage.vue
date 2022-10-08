<template>
<el-card id="Counter">
    <el-row>
        <el-col :span="14">
            <el-card class="left-box">
                <el-row id="result">
                    <el-input v-model="result" clearable placeholder="请输入表达式">
                    </el-input>
                </el-row>
                <el-row :gutter="10">
                    <el-col :span="6">
                        <div @click="getResult(7)" class="grid-content bg-purple">7</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult(8)" class="grid-content bg-purple">8</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult(9)" class="grid-content bg-purple">9</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult('/')" class="grid-content bg-purple">/</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult(4)" class="grid-content bg-purple">4</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult(5)" class="grid-content bg-purple">5</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult(6)" class="grid-content bg-purple">6</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult('*')" class="grid-content bg-purple">*</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult(1)" class="grid-content bg-purple">1</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult(2)" class="grid-content bg-purple">2</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult(3)" class="grid-content bg-purple">3</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult('+')" class="grid-content bg-purple">+</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult('.')" class="grid-content bg-purple">.</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult('0')" class="grid-content bg-purple">0</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult('^')" class="grid-content bg-purple">^</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult('-')" class="grid-content bg-purple">-</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult('(')" class="grid-content bg-purple">(</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult(')')" class="grid-content bg-purple">)</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult('=')" class="grid-content bg-purple">=</div>
                    </el-col>
                    <el-col :span="6">
                        <div @click="getResult('')" class="grid-content bg-purple">AC</div>
                    </el-col>
                </el-row>
            </el-card>
        </el-col>
        <el-col :span="10">
          <router-link to="evaluation">
            <div class="right-box card">
                <br />
                <h2>&nbsp;综测计算</h2>
                <el-image class="evaluation-img" :src="require('../assets/images/evaluation.png')"></el-image>
            </div>
          </router-link>
        </el-col>
    </el-row>
    <el-row>
      <el-col :span="8">
        <transition>
            <router-link to="function">
                <div class="bottom-box-1 card">
                    <br />
                    <h2>&nbsp;函数图像</h2>
                    <el-image class="function-img" :src="require('../assets/images/function.png')"></el-image>
                </div>
            </router-link>
        </transition>
      </el-col>
      <el-col :span="8">
        <router-link to="healthy">
          <div class="bottom-box-2 card">
            <br />
            <h2>&nbsp;健康计算</h2>
            <el-image class="healthy-img" :src="require('../assets/images/healthy.png')"></el-image>
          </div>
        </router-link>
      </el-col>
      <el-col :span="8">
        <router-link to="commodity">
          <div class="bottom-box-3 card">
            <br />
            <h2>&nbsp;一周开销</h2>
            <el-image class="commodity-img" :src="require('../assets/images/commodity.png')"></el-image>
          </div>
        </router-link>
      </el-col>
    </el-row>
</el-card>
</template>

  
<script>
function calc(str) {
    let idx = str.indexOf('^');
    if (idx == -1) return eval(str);
    let i = str.substring(0, idx).lastIndexOf('('),
        j = idx + 1;
    while (j < str.length && str[j] >= '0' && str[j] <= '9') j++;
    let left = str.substring(i + 1, idx - 1),
        right = str.substring(idx + 1, j);
    return calc(str.substring(0, i) + Math.pow(left, right) + str.substring(j));
}

export default {
    name: 'Counter',
    data() {
        return {
            'result': ''
        }
    },
    methods: {
        sendMessage(message) {
            this.$message({
                message: message,
                type: 'warning'
            })
        },
        getResult(e) {
            // 不可以连续输入 小数点
            if (e == '') this.result = this.result.substr(0, this.result.length - 1);
            if (e === '.' && this.result.split('').reverse().join('').indexOf('.') === 0) {
                this.sendMessage('请输入正确的浮点数1')
                return false
            }
            // 如果第一次 输入的是 运算符号，则提示
            if (['+', '-', '*', '/', '%', '.', '^'].indexOf(e) > -1 && this.result.length === 0) {
                this.sendMessage('请先输入数字')
                return false
            }
            // 如果第一次 输入的是 = 号，则直接返回
            if (e === '=' && this.result.length === 0) {
                return false
            }
            // 出现 = 号则表示已经执行过计算，需要清空
            if (this.result.indexOf('=') > -1) {
                this.result = ''
            }
            switch (e) {
                case '=':
                    this.result += '=' + calc(this.result)
                    break
                default:
                    this.result += e;
            }
        }
    }
}
</script>

  
<style lang="scss" scoped>
* {
    transition:all 0.2s;
}
#Counter {
  height: 100%;
}

#result {
    margin-bottom: 10px;
}

.grid-content {
    text-align: center;
    height: 40px;
    border: solid 1px #e6e6e6;
    line-height: 40px;
    margin-bottom: 10px;
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
    transition: all .1s;
}

.grid-content:hover {
    background-color: #f5f5f5;
    transform: scale(1.2);
}
.fade-enter-active, .fade-leave-active {
    transition: all 0.5s ease;
}
.fade-enter, .fade-leave-to {
    transform: scale(5);
}
.left-box {
    border-radius:20px;
}
.right-box {
    position:relative;
    left:5%;
    background-color:rgb(242, 248, 248);
    border-radius:20px;
    width:95%;
    height: 100%;
    max-height:340px;
}
.bottom-box-1 {
    position:relative;
    top:10%;
    left:0;
    right:2.5%;
    background-color:rgb(242, 248, 248);
    border-radius:20px;
    width:97.5%;
    height: 240px;
}
.bottom-box-2 {
    position:relative;
    top:10%;
    left:2.5%;
    right:2.5%;
    background-color:rgb(242, 248, 248);
    border-radius:20px;
    width:95%;
    height: 240px;
}
.bottom-box-3 {
    position:relative;
    top:10%;
    left:2.5%;
    background-color:rgb(242, 248, 248);
    border-radius:20px;
    width:97.5%;
    height: 240px;
}
.evaluation-img {
    top:-60px;
    width:100%;
    height:350px;
} 
.function-img {
    top:-60px;
    width:100%;
    height:280px;
}
.healthy-img {
    top:-60px;
    width:100%;
    height:320px;
}
.commodity-img {
    top:-60px;
    width:100%;
    height:260px;
}
.card:hover {
    background-color:#fff;
    .el-image{
        transform: scale(1.1);
    }
}
</style>
