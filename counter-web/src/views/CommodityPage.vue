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
                <el-image class="goods-img" :src="attachImageUrl('img/' + item.imgSrc)"></el-image>
            </el-col>
            <el-col :span="14">
                <div class="goods-content">
                    <h3>{{item.name}}</h3>
                    <p>折扣：{{discountShow(item.discount)}}</p>
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
      <el-icon v-if="cartGoods.length == 0" color="#FFFFFF"><ShoppingCart /></el-icon>
      <el-icon v-if="cartGoods.length > 0" color="#FFFFFF"><ShoppingCartFull /></el-icon>
    </div>
    <el-dialog v-model="cartShow" width="30%">
      <div v-for="item in cartGoods" :key="item.id">
        <el-row class="cart-row">
          <el-col :span="4">
              <el-image class="cart-img" :src="attachImageUrl('img/' + item.imgSrc)"></el-image>
          </el-col>
          <el-col :span="20">
              <div class="goods-content">
                  <h3>{{item.name}}</h3>
                  <el-row>
                    <el-col :span="8">
                      <div class="goods-price">￥{{(item.price).toFixed(2)}}</div>
                    </el-col>
                    <el-col :span="16">
                        <el-input-number v-model="item.num" :min="0" :max="item.count"></el-input-number>
                    </el-col>
                  </el-row>
              </div>
          </el-col>
        </el-row>
        <div class="line"></div>
      </div>
      <br />
      <el-row class="cart-footer">
        <el-col :span="18" class="cart-left">
          <el-icon v-if="cartGoods.length == 0" color="#FFFFFF"><ShoppingCart /></el-icon>
          <el-icon v-if="cartGoods.length > 0" color="#FFFFFF"><ShoppingCartFull /></el-icon>
          总计：￥{{price.toFixed(2)}}
        </el-col>
        <el-col :span="6" class="cart-right" @click="cartShow =! cartShow">好！</el-col>
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
    const cartGoods = computed(() => {
      return allGoods.value.filter((item) => item.num > 0);
    });
    const price = computed(() => {
      let ans = 0;
      cartGoods.value.forEach((item) => {
        let discount = 0;
        if (item.discount < 0) {
          ans += (item.price + Number(item.discount)) * item.num;
        } else if (item.discount > 0) ans += (item.discount / 100) * item.price * item.num;
        else return ans += item. price * item.num;
      })
      return ans;
    });

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
      goods.value = allGoods.value.filter((item) => (item.cid == key));
    }

    function discountShow(discount) {
      if (discount == 0) return "妹有折扣嗷";
      else if (discount < 0) return "享受满" + -discount + "减" + -discount + "优惠";
      else return "享受" + discount / 10 + "折优惠"; 
    }

    getData();

    return {
      activeIndex,
      classifies,
      goods,
      cartGoods,
      price,
      cartShow,
      handleSelect,
      discountShow,
      attachImageUrl: HttpManager.attachImageUrl
    }
  }
}
</script>

<style lang="scss" scoped>
.main-block {
  width:100%;
  height: 100%;
}
.aside {
  height: 600px;
  border-right: 1px solid rgb(202, 200, 199);
}
.el-menu {
  max-width: 100%;
}
.menu-item {
  max-width:100%;
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
    max-width:100%;
}

.goods-img {
    border-radius:10px;
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
.cart-img {
  position: relative;
  left: 50%;
  top: 50%;
  border-radius: 10px;
  transform:translate(-50%, -50%);
  height: auto;
  width: 60px;
  max-height:60px;
  align-items: center;
}
.cart-footer {
  height: 40px;
}
.cart-left {
  border-top-left-radius: 20px;
  border-bottom-left-radius: 20px;
  background-color:black;
  color:white;
  font-family:"Times New Roman", Times, serif;
  text-align:center;
  line-height: 40px;
  .el-icon {
    position: absolute;
    top:50%;
    left:25px;
    transform:translateY(-50%) scale(2.5);
  }
}
.cart-right {
  border-top-right-radius: 20px;
  border-bottom-right-radius: 20px;
  background-color:orange;
  color:black;
  text-align:center;
  line-height: 40px;
}
.cart-right:hover {
  background-color:antiquewhite;
}
</style>