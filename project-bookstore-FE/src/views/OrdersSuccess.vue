<template>
    <div>
        <v-data-table :headers="headers" :items="Orders_Success" class="elevation-1" search height="612px">
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title class="primary--text font-weight-medium text-h5">Đơn hàng đã giao</v-toolbar-title>
                    <v-spacer></v-spacer>
                </v-toolbar>

            </template>

            <template v-slot:item.stt="{ item }">
                {{ Orders_Success.indexOf(item) + 1 }}
            </template>

            <template v-slot:item.date="{ item }">
                {{ formatDate(item.date) }}
            </template>

            <template v-slot:item.status="{ item }">
                <v-chip color="success" v-if="item.trangthai === 2">Hoàn thành</v-chip>

            </template>
            <template v-slot:item.trangthaithanhtoan="{ item }">
                <v-chip color="success" v-if="item.status === true">Đã thanh toán</v-chip>
                <v-chip v-else>Chưa thanh toán</v-chip>
            </template>
            <template v-slot:item.price="{ item }">
                {{ (item.price).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") }} VNĐ
            </template>

            <!-- <template v-slot:item.actions="{ item }">
                <div>
                    <v-icon style="font-size:18px" color="red darken-3" small class="mr-2" @click="delete_emp(item)">
                        mdi-trash-can-outline
                    </v-icon>
                    <v-btn color="success" @click="API_changeStatus(item)"><v-icon left style="font-size:24px" small
                            class="mr-2">
                            mdi-check
                        </v-icon>giao hàng thành công</v-btn>
                </div>
            </template> -->


        </v-data-table>
    </div>
</template>
<script>
export default {
    data() {
        return {
            headers: [
                { text: "STT", value: "stt", align: "center", sortable: false },
                { text: "Mã đơn hàng", value: "name", sortable: false },
                { text: "Ngày đặt hàng", value: "date", align: "center" },
                { text: "Tổng tiền thanh toán", value: "price", align: "center" },
                { text: "Trạng thái đơn hàng", value: "status", sortable: false, align: "center" },
                { text: "Trạng thái thanh toán", value: "trangthaithanhtoan", sortable: false, align: "center" },
                //{ text: "Hành động", value: "actions", sortable: false, align: "center" },
            ],
            Orders_Success: []
        }
    },
    methods: {
        API_Get_Order_S() {
            axios.get("http://localhost:8080/rest/orderssuccess").then(res => {
                this.Orders_Success = res.data
            }).catch(err => {
                console.log("err", err)
            })
        },
        formatDate(date) {
            const parts = date.split('-');
            return `${parts[2]}/${parts[1]}/${parts[0]}`;
        },
        API_changeStatus(item) {
            console.log("item", item.name)
            let nameOrder = item.name
            axios.post("http://localhost:8080/rest/changestatus", {
                name: nameOrder
            }).then(res => {
                this.API_Get_Order_S()
                console.log("thanh cong", res.data)
            }).catch(err => {
                console.log("err", err)
            })
        }

    },
    mounted() {
        this.API_Get_Order_S()

    },
}
</script>
<style></style>