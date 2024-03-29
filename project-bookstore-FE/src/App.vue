<template>
  <v-app>
    <LayoutClient v-if="!isShow"></LayoutClient>
    <LayoutAdmin v-if="isShow"></LayoutAdmin>
  </v-app>
</template>

<script>
import { LayoutClient, LayoutAdmin } from "./layouts"

export default {
  name: 'App',
  components: {
    LayoutClient,
    LayoutAdmin
  },
  data: () => ({
    //
  }),

  computed: {
    isShow: function () {
      const subUrl = ["/manager", "/manager/employee",
        "/manager/login", "/manager/products", "/manager/dashboard",
        "/manager/orderswaiting", "/manager/ordersshiped", "/manager/catetoryproduct", "/manager/orderssuccess", "/manager/ordersback"]
      return subUrl.indexOf(this.$route.path) >= 0;
    }
  }
};
</script>

<style scoped></style>
