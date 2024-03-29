<template>
    <div>
        <v-data-table :headers="headers" :items="Orders_Waiting" class="elevation-1" search>
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title class="primary--text font-weight-medium text-h5">Đơn hàng đang chờ vận
                        chuyển</v-toolbar-title>
                    <v-spacer></v-spacer>
                </v-toolbar>
                <v-dialog v-model="dialog" max-width="800px">
                    <v-card>
                        <v-card-title>
                            <span class="text-h5 primary--text">Thông tin địa chỉ giao hàng đơn hàng <span
                                    v-if="Buyer_Info.id_order"> số {{ Buyer_Info.id_order }}</span></span>
                            <v-spacer></v-spacer>
                            <v-btn fab small icon>
                                <v-icon @click="closeDialog">mdi-close</v-icon>
                            </v-btn>
                        </v-card-title>
                        <v-card-text class="mt-5">
                            <v-form>
                                <v-row>
                                    <v-col cols="6">
                                        <v-text-field label="Tên quý khách hàng" readonly
                                            v-model="Buyer_Info.name_buyer" outlined dense hide-details></v-text-field>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-text-field label="Số điện thoại" readonly
                                            v-model="Buyer_Info.phone_number_buyer" outlined dense
                                            hide-details></v-text-field>
                                    </v-col>
                                    <v-col cols="12">
                                        <v-text-field label="Email" readonly v-model="Buyer_Info.email_buyer" outlined
                                            dense hide-details></v-text-field>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-text-field label="Địa chỉ" readonly v-model="Buyer_Info.address_buyer"
                                            outlined dense hide-details></v-text-field>
                                    </v-col>
                                    <v-col cols="6">
                                        <v-text-field label="Thành phố/ Tỉnh" readonly v-model="Buyer_Info.provincial"
                                            outlined dense hide-details></v-text-field>
                                    </v-col>
                                </v-row>
                            </v-form>
                            <v-data-table :headers="headers_order" class="elevation-1 mt-5" :items="orders">
                                <template v-slot:top>
                                    <v-toolbar flat>
                                        <v-toolbar-title class="primary--text  text-h7">
                                            Danh sách sản phẩm </v-toolbar-title>
                                        <v-spacer></v-spacer>
                                    </v-toolbar>
                                </template>
                                <template v-slot:item.name="{ item }">
                                    <span>{{ item.name }}</span>
                                </template>
                                <template v-slot:item.price="{ item }">
                                    <span>{{ (item.price).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") }}
                                        VNĐ</span>

                                </template>
                                <template v-slot:item.quality="{ item }">
                                    <span>{{ item.quality }}</span>
                                </template>
                                <template v-slot:item.count="{ item }">
                                    <span>{{ (item.price * item.quality).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g,
            "$1,") }} VNĐ</span>
                                </template>
                            </v-data-table>
                        </v-card-text>
                        <v-card-actions>
                            <v-spacer></v-spacer>
                            <v-btn @click="closeDialog">Đóng</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
                <v-dialog v-model="dialogConfirm" max-width="500px">
                    <v-card>
                        <v-card-title>
                            <span class="text-h5 primary--text">Xác nhận giao đơn hàng này?</span>
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
                            <v-btn color="success" @click="API_changeStatus()">Xác nhận</v-btn>
                        </v-card-actions>
                    </v-card>
                </v-dialog>
            </template>

            <template v-slot:item.stt="{ item }">
                {{ Orders_Waiting.indexOf(item) + 1 }}
            </template>

            <template v-slot:item.date="{ item }">
                {{ formatDate(item.date) }}
            </template>

            <template v-slot:item.status="{ item }">
                <v-chip color="primary" v-if="item.trangthai === null">Đang chuẩn bị hàng</v-chip>

            </template>

            <template v-slot:item.methodpayment="{ item }">
                <v-chip color="warning" v-if="item.method_payment === false">Thanh toán khi nhận hàng</v-chip>
                <v-chip color="success" v-else>Chuyển khoản</v-chip>
            </template>

            <template v-slot:item.price="{ item }">
                {{ (item.price).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") }} VNĐ
            </template>

            <template v-slot:item.actions="{ item }">
                <div style="display:flex">
                    <v-btn @click="API_Get_Order_Detail(item)" text><v-icon left style="font-size:16px" small
                            class="mr-2">
                            mdi-map-marker
                        </v-icon>Địa chỉ</v-btn>
                    <v-btn color="success" text @click="openDialogConfirm(item)"><v-icon left style="font-size:16px"
                            small class="mr-2">
                            mdi-cart
                        </v-icon>Giao hàng</v-btn>
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
            headers_order: [
                { text: "Tên sản phẩm", value: "name", align: "center", sortable: false },
                { text: "Đơn giá", value: "price", align: "center", sortable: false },
                { text: "Số lượng", value: "quality", align: "center", sortable: false },
                { text: "Thành tiền", value: "count", align: "center", sortable: false },
            ],
            items_order: [],
            headers: [
                { text: "STT", value: "stt", align: "center", sortable: false },
                { text: "Mã đơn hàng", value: "name", sortable: false },
                { text: "Ngày đặt hàng", value: "date", align: "center" },
                { text: "Tổng tiền thanh toán", value: "price", align: "center" },
                { text: "Phương thức thanh toán", value: "methodpayment", align: "center" },
                { text: "Trạng thái", value: "status", sortable: false, align: "center" },
                { text: "Hành động", value: "actions", sortable: false, align: "center" },
            ],
            Orders_Waiting: [],
            Buyer_Info: {
                id_order: null,
                name_buyer: "",
                phone_number_buyer: "",
                address_buyer: "",
                email_buyer: "",
                provincial: ""
            },
            Buyer_Info_Default: {
                id_order: null,
                name_buyer: "",
                phone_number_buyer: "",
                address_buyer: "",
                email_buyer: "",
                provincial: ""
            },
            orders: [],
            name: "",
        }
    },
    watch: {
        dialog: function (val) {
            val || this.closeDialog();
        },
        dialogConfirm: function (val) {
            val || this.closeDialogConfirm();
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
            this.Buyer_Info = Object.assign({}, this.Buyer_Info_Default)
        },
        closeDialogConfirm() {
            this.dialogConfirm = false
            this.name = ""

        },
        API_Get_Order_W() {
            axios.get("http://localhost:8080/rest/orderswaiting").then(res => {
                this.Orders_Waiting = res.data
            }).catch(err => {
                console.log("err", err)
            })
        },
        formatDate(date) {
            const parts = date.split('-');
            return `${parts[2]}/${parts[1]}/${parts[0]}`;
        },
        API_changeStatus() {
            let nameOrder = this.name
            let trangthaiOrder = 1
            axios.post("http://localhost:8080/rest/changestatus", {
                name: nameOrder,
                trangthai: trangthaiOrder
            }).then(res => {
                alert("Đã giao đơn hàng này!")
                this.closeDialogConfirm()
                this.API_Get_Order_W()
            }).catch(err => {
                console.log("err", err)
            })
        },
        API_Get_Order_Detail(item) {
            this.openDialog()
            let nameOrder = item.name
            axios.post("http://localhost:8080/rest/orderdetail", {
                name: nameOrder
            }).then(res => {
                this.items_order = res.data
                this.Buyer_Info.address_buyer = this.items_order[0].address_buyer
                this.Buyer_Info.name_buyer = this.items_order[0].name_buyer
                this.Buyer_Info.email_buyer = this.items_order[0].email_buyer
                this.Buyer_Info.phone_number_buyer = this.items_order[0].phone_number_buyer
                this.Buyer_Info.provincial = this.items_order[0].provincial
                this.orders = this.items_order.map(item => {
                    let order = {
                        name: "",
                        price: null,
                        quality: null
                    }
                    order.name = item.product.name
                    order.price = item.product.price
                    order.quality = item.quality
                    return order
                })
            }).catch(err => {
                console.log("err", err)
            })
        }

    },
    mounted() {
        this.API_Get_Order_W()

    },
}
</script>

<style></style>