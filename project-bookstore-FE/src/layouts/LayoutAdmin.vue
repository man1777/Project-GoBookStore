<template>
    <v-app>
        <v-navigation-drawer app width="350" color="#FFFFFF">
            <v-list-item>
                <v-list-item-content>
                    <v-list-item-title class="text-h4 font-weight-medium ">
                        <div>
                            <a class="d-flex flex-row justify-center align-center" href="http://localhost:8080/index"
                                style="text-decoration: none;color:#6a6a6a">
                                <img style="width: 40px"
                                    src="https://websitedemos.net/plant-store-02/wp-content/uploads/sites/410/2020/06/plants-store-logo-green.svg"></img>
                                <span style="font-size: 35px;">BOOK</span>
                                <span style="font-size: 35px;color:orange"> STORE</span>
                            </a>
                        </div>
                    </v-list-item-title>
                    <v-list-item-subtitle class="text-h5 mt-3">
                        <span>Admin Management</span>
                    </v-list-item-subtitle>
                </v-list-item-content>
            </v-list-item>

            <v-divider></v-divider>

            <v-list>
                <v-list-group v-for="item in items" :key="item.title" no-action style="margin-top: 20px;">
                    <template v-slot:activator>
                        <v-icon color="#6a6a6a">{{ item.action }}</v-icon>
                        <v-list-item-content class="ms-5">
                            <v-list-item-title v-text="item.title" class="title" style="font-size: 16px;"
                                @click="getTitle(item.title)"></v-list-item-title>
                        </v-list-item-content>
                    </template>

                    <v-list-item v-for="child in item.items" :key="child.title" :to="child.url">
                        <v-list-item-content>
                            <v-list-item-title v-text="child.title" class="title"></v-list-item-title>
                        </v-list-item-content>
                    </v-list-item>
                </v-list-group>
            </v-list>
        </v-navigation-drawer>
        <v-app-bar app height="85" class="elevation-0" color="#FFFFFF">

            <span class="font-weight-medium text-h4">{{ Title }}</span>
            <v-spacer></v-spacer>
            <div>
                <v-icon color="primary">mdi-account-circle </v-icon>
                Trần Ngọc Mẫn
            </div>
        </v-app-bar>
        <v-main>
            <v-container fluid style="background-color: #F5F5F5;min-height: 100%;">
                <router-view></router-view>
            </v-container>
        </v-main>

        <v-footer app>
            <!-- -->
        </v-footer>
    </v-app>
</template>

<script>
export default {
    name: "LayoutAdmin",
    data() {
        return {
            Title: "",
            items: [
                {
                    action: 'mdi-view-dashboard',
                    items: [{ title: 'Dashboard', url: "/manager/dashboard" }],
                    title: 'Dashboard',
                },
                {
                    action: 'mdi-account-group',
                    items: [{ title: 'Danh sách nhân viên', url: "/manager/employee" }],
                    title: 'Nhân viên',
                },
                {
                    action: 'mdi-bookshelf',
                    items: [
                        { title: 'Danh sách sản phẩm', url: "/manager/products" },
                        { title: 'Danh mục sản phẩm', url: "/manager/catetoryproduct" },
                    ],
                    title: 'Sản phẩm',
                },
                {
                    action: 'mdi-account-group',
                    items: [{ title: 'Danh sách người dùng' }],
                    title: 'Người dùng',
                },
                {
                    action: 'mdi-cart-variant',
                    items: [
                        { title: 'Đơn hàng đang chuẩn bị', url: "/manager/orderswaiting" },
                        { title: 'Đơn hàng đã giao', url: "/manager/ordersshiped" },
                        { title: 'Đơn hàng hoàn thành', url: "/manager/orderssuccess" },
                        { title: 'Đơn hàng hoàn trả', url: "/manager/ordersback" }
                    ],
                    title: 'Đơn hàng',
                },
                // {
                //     action: 'mdi-cart-variant',
                //     items: [
                //         { title: 'Doanh thu hôm nay', url: "" },
                //         { title: 'Doanh thu tháng ', url: "" },
                //         { title: 'Doanh thu năm', url: "" },
                //         { title: 'Tổng hợp', url: "" }
                //     ],
                //     title: 'Quản lý doanh thu',
                // },
            ],
        }
    },
    methods: {
        getTitle(item) {
            this.Title = item
        }
    }
}
</script>

<style scoped>
.nav-drawer {
    max-width: 100%;
}

.title {
    color: #6a6a6a;
    font-weight: 400;
    font-size: 16px;
}

.tieude {
    letter-spacing: 20px;
}
</style>