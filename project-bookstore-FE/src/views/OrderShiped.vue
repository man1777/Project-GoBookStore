<template>
    <div>
        <v-data-table :headers="headers" :items="Orders_Shiped" class="elevation-1" search height="612px">
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title class="primary--text font-weight-medium text-h5">Đơn hàng đang vận
                        chuyển</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-dialog v-model="dialog" max-width="700px">

                        <v-card>
                            <v-card-title>
                                <span class="text-h5 primary--text font-weight-medium">Yêu cầu trả hàng</span>
                                <v-spacer></v-spacer>
                                <v-btn fab small icon>
                                    <v-icon @click="closeDialog">mdi-close</v-icon>
                                </v-btn>
                            </v-card-title>
                            <v-card-text>
                                <v-form>
                                    <v-row>
                                        <v-col cols="12">
                                            <v-textarea v-model="note" label="Lý do" outlined dense
                                                hide-details></v-textarea>
                                        </v-col>
                                    </v-row>
                                </v-form>
                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn @click="closeDialog">Đóng</v-btn>
                                <v-btn class="ml-2" color="primary" @click="btn_ConFirmTraHang">
                                    Xác nhận</v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                    <v-dialog v-model="dialogConfirm" max-width="500px">
                        <v-card>
                            <v-card-title>
                                <span class="text-h5 primary--text">Xác nhận hoàn thành đơn hàng này?</span>
                                <v-spacer></v-spacer>
                                <v-btn fab small icon>
                                    <v-icon @click="closeDialogConfirm">mdi-close</v-icon>
                                </v-btn>
                            </v-card-title>
                            <v-card-text class="mt-5">

                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn @click="closeDialogConfirm">Đóng</v-btn>
                                <v-btn color="success" @click="API_changeStatusToSuccess()">Xác nhận</v-btn>
                            </v-card-actions>
                        </v-card>
                    </v-dialog>
                </v-toolbar>
            </template>

            <template v-slot:item.stt="{ item }">
                {{ Orders_Shiped.indexOf(item) + 1 }}
            </template>

            <template v-slot:item.date="{ item }">
                {{ formatDate(item.date) }}
            </template>

            <template v-slot:item.status="{ item }">
                <v-chip color="primary" v-if="item.trangthai === 1">Đang giao hàng</v-chip>

            </template>
            <template v-slot:item.trangthaithanhtoan="{ item }">
                <v-chip color="success" v-if="item.method_payment === true">Đã thanh toán</v-chip>
                <v-chip v-else>Chưa thanh toán</v-chip>
            </template>
            <template v-slot:item.price="{ item }">
                {{ (item.price).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") }} VNĐ
            </template>
            <template v-slot:item.trahang="{ item }">
                <div>
                    <v-btn text color="error" @click="btn_TraHang(item)"><v-icon left style="font-size:18px" small
                            class="mr-2">
                            mdi-cash-refund
                        </v-icon>Yêu cầu hoàn trả</v-btn>

                </div>
            </template>
            <template v-slot:item.actions="{ item }">
                <div style="display:flex">
                    <v-btn text color="success" @click="openDialogConfirm(item)"><v-icon left style="font-size:18px"
                            small>
                            mdi-check
                        </v-icon>đã giao</v-btn>
                </div>
            </template>


        </v-data-table>
    </div>
</template>

<script>
export default {
    data() {
        return {
            dialog: false,
            dialogConfirm: false,
            note: "",
            name: "",
            headers: [
                { text: "STT", value: "stt", align: "center", sortable: false },
                { text: "Mã đơn hàng", value: "name", sortable: false },
                { text: "Ngày đặt hàng", value: "date", align: "center" },
                { text: "Tổng tiền thanh toán", value: "price", align: "center" },
                { text: "Trạng thái", value: "status", sortable: false, align: "center" },
                { text: "Trạng thái thanh toán", value: "trangthaithanhtoan", sortable: false, align: "center" },
                { text: "Giao hàng thành công", value: "actions", sortable: false, align: "center" },
                { text: "Yêu cầu trả hàng", value: "trahang", sortable: false, align: "center" },
            ],
            Orders_Shiped: [],
        }
    },
    methods: {
        openDialogConfirm(item) {
            this.dialogConfirm = true
            this.name = item.name
        },
        openDialog() {
            this.dialog = true
        },
        closeDialog() {
            this.dialog = false
            this.note = ""
            this.name = ""
        },
        closeDialogConfirm() {
            this.dialogConfirm = false
            this.name = ""

        },
        btn_TraHang(item) {
            this.dialog = true
            this.name = item.name

        },
        btn_ConFirmTraHang() {
            this.API_changeStatusToBack(this.name)
            this.closeDialog()
        },
        API_Get_Order_W() {
            axios.get("http://localhost:8080/rest/ordersshiped").then(res => {
                this.Orders_Shiped = res.data
            }).catch(err => {
                console.log("err", err)
            })
        },
        formatDate(date) {
            const parts = date.split('-');
            return `${parts[2]}/${parts[1]}/${parts[0]}`;
        },
        API_changeStatusToSuccess() {
            let nameOrder = this.name
            axios.post("http://localhost:8080/rest/changestatustosuccess", {
                name: nameOrder
            }).then(res => {
                alert("Đã xác nhận giao thành công!")
                this.closeDialogConfirm()
                this.API_Get_Order_W()
            }).catch(err => {
                console.log("err", err)
            })
        },
        API_changeStatusToBack(name) {
            let nameOrder = name
            axios.post("http://localhost:8080/rest/changestatustoback", {
                name: nameOrder,
                note: this.note
            }).then(res => {
                alert("Đã xác nhận hoàn trả đơn hàng!")

                this.API_Get_Order_W()
            }).catch(err => {
                console.log("err", err)
            })
        }

    },
    mounted() {
        this.API_Get_Order_W()
    },
    watch: {
        dialog: function (val) {
            val || this.closeDialog()
        },
        dialogConfirm: function (val) {
            val || this.closeDialogConfirm();
        }
    }
}
</script>

<style></style>