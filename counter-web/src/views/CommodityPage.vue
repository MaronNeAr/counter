<template>
  <el-card class="main-block">
    <el-row>
      <el-col :span="3" class="aside">
        <el-menu 
          :default-active="activeIndex" 
          @select="handleSelect"
          active-text-color="green"
        >
          <el-menu-item v-for="item in classifies" :key="item.id" class="menu-item" :index="item.id">
            {{item.name}}
          </el-menu-item>
        </el-menu>
      </el-col>
      <el-col :span="21" class="right-box">
        <div v-for="item in goods" :key="item.id">
          <el-row class="goods-row">
            <el-col :span="4">
                <el-image class="goods-img" :src="require('../assets/images/wyz.jpg')"></el-image>
            </el-col>
            <el-col :span="14">
                <div class="goods-content">
                    <h3>{{item.name}}</h3>
                    <p>商品描述：{{item.details}}</p>
                    <p>折扣：{{item.discount}}</p>
                </div>
            </el-col>
            <el-col :span="2">
                <div class="goods-price">￥{{(item.price).toFixed(2)}}</div>
            </el-col>
            <el-col :span="4">
                <el-input-number v-model="item.num" :min="0" :max="item.count"></el-input-number>
            </el-col>
          </el-row>
          <div class="line"></div>
        </div>
      </el-col>
    </el-row>
    <div class="shop-cart" @click="cartShow =! cartShow">
      <el-icon color="#FFFFFF"><ShoppingCart /></el-icon>
    </div>
    <el-dialog v-model="cartShow" >
      <el-row>
          <el-col :span="11">
              <img align="right" src="../assets/images/wyz.jpg" height="120">
          </el-col>
          <el-col :span="2"></el-col>
          <el-col :span="11">
              <p>您的综合测评成绩为</p>
              <h1>{{(Number(zyScore) + Number(tyScore) + Number(extroScore) + Number(randScore)).toFixed(2)}}</h1>
          </el-col>
      </el-row>
    </el-dialog>
  </el-card>
</template>

<script lang="ts">
import { computed, ref } from "vue";
import { ShoppingCart, Menu } from "@element-plus/icons-vue";
import { HttpManager } from "@/api";

export default {
  setup() {
    const activeIndex = ref(1);
    const num = ref();
    const classifies = ref([]);
    const allGoods = ref([]);
    const goods = ref([]);
    const cartShow = ref(false);

    async function getData() {
      classifies.value = [];
      allGoods.value = [];
      const result = (await HttpManager.getClassify()) as ResponseBody;
      classifies.value = result.data;
      const goodsResult = (await HttpManager.getAllGoods()) as ResponseBody;
      allGoods.value = goodsResult.data;
      goods.value = allGoods.value.filter((item) => (item.cid == activeIndex.value));
    }

    function handleSelect(key) {
      console.log(allGoods.value);
      goods.value = allGoods.value.filter((item) => (item.cid == key));
    }

    getData();

    return {
      num,
      classifies,
      goods,
      cartShow,
      handleSelect
    }
  }
}
</script>

<style lang="scss" scoped>
.main-block {
  height: 100%;
}
.aside {
  height: 600px;
  border-right: 1px solid rgb(202, 200, 199);
}
.menu-item {
  text-align:center;
  line-height: 50px;
  height:50px;
  transition:all 0.3s;
  border: none;
}
.menu-item:hover {
  transform:scale(1.2);
  background-color:rgb(202, 200, 199);
}
.right-box {
  height: 620px;
  overflow: scroll;
  transition: all 0.5s;
}
.goods-row {
    height: 150px;
    animation: fadeInAnimation ease-in 0.5s;
    animation-iteration-count: 1;
    animation-fill-mode: forwards;
}

.el-input-number {
    position: relative;
    left: 50%;
    top: 50%;
    transform:translate(-50%, -50%);
}

.goods-img {
    position: relative;
    left: 50%;
    top: 50%;
    transform:translate(-50%, -50%);
    height: auto;
    width: 120px;
    max-height:140px;
    max-width: 100%;
    align-items: center;
}

.goods-content {
    position: relative;
    left:10px;
    top:50%;
    transform:translateY(-50%);
}

.goods-price {
    color: red;
    position: relative;
    left:50%;
    top:50%;
    transform:translate(-50%, -50%);
    font-size:20px;
    font-family: "Times New Roman", Times, serif;
}

.line {
    border-top: 1px solid rgb(202, 200, 199);
}

.shop-cart {
  width:80px;
  height:80px;
  border-radius: 50%;
  background-color:red;
  position: absolute;
  right:70px;
  bottom:100px;

  animation: fadeInAnimation ease-in 0.5s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
  .el-icon {
    position: relative;
    left:50%;
    top:50%;
    transform:translate(-50%, -50%) scale(3);
  }
}
.shop-cart:hover {
  background-color: rgb(240, 151, 151);
}
</style>