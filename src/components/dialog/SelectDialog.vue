<template>
  <div>
    <!-- 选课提示框 -->
    <el-dialog title="提示" v-model="centerDialogVisible" width="300px" center>
      <div class="del-dialog-cnt" align="center">是否选/退课？</div>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="cancelRow">取 消</el-button>
          <el-button type="primary" @click="confirm">确 定</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script lang="ts">
import { defineComponent, getCurrentInstance, toRefs, watch, ref } from "vue";

export default defineComponent({
  props: {
    choiceVisible: Boolean,
  },
  emits: ["cancelRow", "confirm"],
  setup(props) {
    const { proxy } = getCurrentInstance();

    const { choiceVisible } = toRefs(props);
    const centerDialogVisible = ref(choiceVisible.value);

    watch(choiceVisible, (value) => {
      centerDialogVisible.value = value;
    });

    function cancelRow() {
      proxy.$emit("cancelRow", false);
    }
    function confirm() {
      proxy.$emit("confirm", null);
    }
    return {
      centerDialogVisible,
      cancelRow,
      confirm,
    };
  },
});
</script>
