<template>
    <div>
        <span style="font-size: 30px;">Tổng quan</span>
        <v-row class="mt-4">
            <v-col cols="12">
                <v-card height="300px" class="rounded-xl elevation-0">
                    <v-card-title>Doanh thu hôm nay</v-card-title>
                    <v-card-subtitle>Tóm tắt doanh thu</v-card-subtitle>
                    <v-card-text>
                        <v-row>
                            <v-col cols="3">
                                <div class="card d-flex flex-column align-center " style="background-color: #C2EEB1;">
                                    <div class="icon">
                                        <v-icon style="font-size:35px;color:#FFFFFF">mdi-cash</v-icon>
                                    </div>
                                    <span style="margin-top: 30px; font-size: 24px;font-weight: 600;"
                                        v-if="DoanhThuToday"><span>{{
                                            DoanhThuToday.toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
                                            }}</span> VND</span>
                                    <span style="margin-top: 30px; font-size: 24px;font-weight: 600;" v-else><span>{{
                                        0
                                            }}</span> VND</span>
                                    <span style="margin-top: 5px; font-size: 20px;">Doanh thu</span>
                                </div>
                            </v-col>
                            <v-col cols="3">
                                <div class="card d-flex flex-column align-center " style="background-color: #C6E9EE;">
                                    <div class="icon" style="background-color: cornflowerblue;">
                                        <v-icon style="font-size:35px;color:#FFFFFF">mdi-account-group</v-icon>
                                    </div>
                                    <span style="margin-top: 30px; font-size: 24px;font-weight: 600;">{{
                                        UserToday ? UserToday : 0 }}
                                    </span>
                                    <span style="margin-top: 5px; font-size: 20px;">Người dùng mới</span>
                                </div>
                            </v-col>

                            <v-col cols="3">
                                <div class="card d-flex flex-column align-center " style="background-color: #F0CAA4;">
                                    <div class="icon" style="background-color: darksalmon;">
                                        <v-icon style="font-size:35px;color:#FFFFFF">mdi-bookshelf</v-icon>
                                    </div>
                                    <span style="margin-top: 30px; font-size: 24px;font-weight: 600;"> {{
                                        SLSPToDay ? SLSPToDay : 0 }}
                                    </span>
                                    <span style="margin-top: 5px; font-size: 20px;">Số lượng sản phẩm đã bán</span>
                                </div>
                            </v-col>
                            <v-col cols="3">
                                <div class="card d-flex flex-column align-center " style="background-color: #EFF0CA;">
                                    <div class="icon" style="background-color: gold;">
                                        <v-icon style="font-size:35px;color:#FFFFFF">mdi-cart</v-icon>
                                    </div>
                                    <span style="margin-top: 30px; font-size: 24px;font-weight: 600;">{{ DonHangToDay }}
                                    </span>
                                    <span style="margin-top: 5px; font-size: 20px;">Đơn hàng hôm nay</span>
                                </div>
                            </v-col>
                        </v-row>
                    </v-card-text>
                </v-card>
            </v-col>
            <v-col cols="6">
                <div class="order-table">
                    <v-data-table :headers="headersOrdersToday" :items="OrdersToday" height="565px">
                        <template v-slot:top>
                            <v-toolbar flat>
                                <v-toolbar-title class=" text-h5 font-weight-medium primary--text">DANH SÁCH ĐƠN HÀNG
                                    HÔM NAY</v-toolbar-title>
                                <v-spacer></v-spacer>
                            </v-toolbar>
                        </template>
                        <template v-slot:item.id="{ item }">
                            <v-chip><span> {{ item.id }} </span></v-chip>
                        </template>
                        <template v-slot:item.hovaten="{ item }">
                            <span> {{ item.fisrtname }} {{ item.lastname }}</span>
                        </template>
                        <template v-slot:item.stt="{ item }">
                            <span> {{ OrdersToday.indexOf(item) + 1 }}</span>
                        </template>
                        <template v-slot:item.diachi="{ item }">
                            <span> {{ item.address }}, {{ item.provincal }}</span>
                        </template>
                        <template v-slot:item.tien="{ item }">
                            <v-chip color="success"><span> {{ item.money.toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g,
                                "$1,") }} VNĐ </span></v-chip>
                        </template>
                    </v-data-table>
                </div>
            </v-col>
            <v-col cols="6">
                <div class="order-table">
                    <v-data-table :headers="headersDoanhThu" :items="DoanhThuDayToDay" height="500px">
                        <template v-slot:top>
                            <v-toolbar flat>
                                <v-toolbar-title class=" text-h5 font-weight-medium primary--text">TRA CỨU DOANH
                                    THU</v-toolbar-title>
                                <v-spacer></v-spacer>
                                <v-text-field v-model="dayBegin" class="me-2" outlined dense hide-details
                                    style="width: 60px;" label="Từ ngày"></v-text-field>
                                <v-text-field v-model=dayEnd class="me-2" outlined dense hide-details
                                    style="width: 60px;" label="Đến ngày"></v-text-field>
                                <v-btn @click="API_getDoanhThuTheoTungNgay">Tìm kiếm</v-btn>
                            </v-toolbar>
                        </template>
                        <template v-slot:footer>
                            <v-toolbar flat><v-spacer></v-spacer>
                                <v-toolbar-title class=" text-h5 font-weight-medium primary--text">TỔNG DOANH
                                    THU: {{ Tong.toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
                                    }} VNĐ</v-toolbar-title>
                            </v-toolbar>
                        </template>
                        <template v-slot:item.stt="{ item }">
                            <span>{{ DoanhThuDayToDay.indexOf(item) + 1 }} </span>
                        </template>
                        <template v-slot:item.date="{ item }">
                            <v-chip><span>{{ formatDate(item.date) }} </span></v-chip>
                        </template>
                        <template v-slot:item.donhang="{ item }">
                            <v-chip color="warning">{{ item.donhang }}</v-chip>
                        </template>
                        <template v-slot:item.sosanpham="{ item }">
                            <v-chip color="secondary">{{ item.sosanpham }}</v-chip>
                        </template>
                        <template v-slot:item.tien="{ item }">
                            <v-chip color="success"><span>{{ (item.tien).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g,
                                "$1,") }} VNĐ </span></v-chip>
                        </template>
                    </v-data-table>
                </div>
            </v-col>

            <v-col cols="6">
                <v-card>
                    <v-card-title class="primary--text">Doanh thu từng tháng theo năm <v-spacer></v-spacer>
                        <v-btn class="mx-3" fab small @click="excel"><img width="35" height="35"
                                src="https://img.icons8.com/color/35/microsoft-excel-2019--v1.png"
                                alt="microsoft-excel-2019--v1" /></v-btn>
                        <v-select :items="yearItem" label="Năm" v-model="Nam" style="max-width:150px" dense hide-details
                            outlined></v-select>
                    </v-card-title>
                    <v-card-text>
                        <barChartCDN v-if="loaded" ref="chartbarcdn" :options="chartOptions" :data="data" :type="type">
                        </barChartCDN>
                    </v-card-text>
                </v-card>
            </v-col>
            <v-col cols="6">
                <v-card>
                    <v-card-title class="primary--text">BIỂU ĐỒ DOANH THU CÁC NĂM <v-spacer></v-spacer>
                    </v-card-title>
                    <v-card-text>
                        <lineChart v-if="loaded" ref="linechart" :data="dataLineChart">
                        </lineChart>
                    </v-card-text>
                </v-card>
            </v-col>

            <v-col cols="3">
                <div class="card d-flex flex-column align-center ">
                    <div class="icon">
                        <v-icon style="font-size:35px;color:#FFFFFF">mdi-cash</v-icon>
                    </div>
                    <span style="margin-top: 30px; font-size: 24px;font-weight: 600;"><span v-if="DoanhThu">{{
                        DoanhThu.toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") }}</span> VND</span>
                    <span style="margin-top: 5px; font-size: 20px;">Tổng doanh thu</span>
                </div>
            </v-col>
            <v-col cols="3">
                <div class="card d-flex flex-column align-center ">
                    <div class="icon" style="background-color: cornflowerblue;">
                        <v-icon style="font-size:35px;color:#FFFFFF">mdi-account-group</v-icon>
                    </div>
                    <span style="margin-top: 30px; font-size: 24px;font-weight: 600;">{{ NhanVien }} </span>
                    <span style="margin-top: 5px; font-size: 20px;">Tổng nhân viên</span>
                </div>
            </v-col>
            <v-col cols="3">
                <div class="card d-flex flex-column align-center ">
                    <div class="icon" style="background-color: darksalmon;">
                        <v-icon style="font-size:35px;color:#FFFFFF">mdi-bookshelf</v-icon>
                    </div>
                    <span style="margin-top: 30px; font-size: 24px;font-weight: 600;"> {{ SanPham }} </span>
                    <span style="margin-top: 5px; font-size: 20px;">Tổng sản phẩm</span>
                </div>
            </v-col>
            <v-col cols="3">
                <div class="card d-flex flex-column align-center ">
                    <div class="icon" style="background-color: gold;">
                        <v-icon style="font-size:35px;color:#FFFFFF">mdi-cart</v-icon>
                    </div>
                    <span style="margin-top: 30px; font-size: 24px;font-weight: 600;">{{ DonHang }} </span>
                    <span style="margin-top: 5px; font-size: 20px;">Tổng đơn hàng</span>
                </div>
            </v-col>
            <v-col cols="8">
                <div class="order-table">
                    <v-data-table :headers="headers" :items="fiveOrders" hide-default-footer>
                        <template v-slot:top>
                            <v-toolbar flat>
                                <v-toolbar-title class=" text-h5 font-weight-medium primary--text">5 ĐƠN HÀNG CÓ DOANH
                                    THU CAO NHẤT</v-toolbar-title>
                                <v-spacer></v-spacer>
                            </v-toolbar>
                        </template>
                        <template v-slot:item.hovaten="{ item }">
                            <span>{{ item.firstname }} {{ item.lastname }}</span>
                        </template>
                        <template v-slot:item.tien="{ item }">
                            <v-chip color="success"><span>{{ (item.tien).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g,
                                "$1,") }} VNĐ </span></v-chip>
                        </template>
                        <template v-slot:item.date="{ item }">
                            <span>{{ formatDate(item.date) }} </span>
                        </template>
                        <template v-slot:item.stt="{ item }">
                            <span>{{ fiveOrders.indexOf(item) + 1 }} </span>
                        </template>
                    </v-data-table>
                </div>
            </v-col>
            <v-col cols="4">
                <div class="order-table">
                    <v-list three-line>
                        <h3>5 SẢN PHẨM CÓ LƯỢT MUA NHIỀU NHẤT</h3>
                        <v-list-item v-for="p in fiveProducts">
                            <v-list-item-content>
                                <v-list-item-title>{{ p.name }}</v-list-item-title>
                                <v-list-item-subtitle><span>Giá bán: {{
                                    (p.price).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g,
                                        "$1,") }} VNĐ</span></v-list-item-subtitle>
                            </v-list-item-content>
                            <v-list-item-action class="d-flex flex-row justify-center align-center">
                                <v-chip color="orange"><span style="color:#FFFFFF;font-weight: 600;">{{ p.countOrder
                                        }}</span></v-chip><span class="ms-2">đơn hàng</span>
                            </v-list-item-action>
                        </v-list-item>
                    </v-list>
                </div>
            </v-col>

        </v-row>
    </div>
</template>

<script>
import ExcelJS from 'exceljs'
import { BarChart, barChartCDN, lineChart } from '../components'
export default {
    components: {
        BarChart,
        barChartCDN,
        lineChart
    },
    data() {
        return {
            chartLineOptions: {},
            dataLineChart: {
                labels: [],
                datasets: [{
                    label: 'Doanh thu',
                    data: [],
                    fill: false,
                    borderColor: 'rgb(75, 192, 192)',
                    tension: 0.1
                }]
            },
            loaded: false,
            type: 'bar',
            data: {
                labels: [],
                datasets: [{
                    label: 'Doanh thu',
                    backgroundColor: '#f87979',
                    data: []
                }]
            },
            chartOptions: {
                responsive: true
            },
            DoanhThu: null,
            DonHang: null,
            SanPham: null,
            NhanVien: null,
            headers: [
                { text: "Số thứ tự", value: "stt", align: "center" },
                { text: "Mã đơn hàng", value: "name" },
                { text: "Tên khách hàng", value: "hovaten" },
                { text: "Ngày đặt hàng", value: "date" },
                { text: "Tổng tiền thanh toán", value: "tien" }
            ],
            headersOrdersToday: [{ text: "Số thứ tự", value: "stt", align: "center" },
            { text: "Mã đơn hàng", value: "id" },
            { text: "Tên khách hàng", value: "hovaten" },
            { text: "Địa chỉ", value: "diachi" },
            { text: "Tổng tiền thanh toán", value: "tien", align: "center " }],
            headersDoanhThu: [
                { text: "Số thứ tự", value: "stt", align: "center", sortable: false },
                { text: "Ngày", value: "date", align: "center" },
                { text: "Tổng đơn hàng", value: "donhang", align: "center" },
                { text: "Tổng sản phẩm đã bán", value: "sosanpham", align: "center" },
                { text: "Doanh thu", value: "tien", align: "center" },
            ],
            orders: [],
            fiveOrders: [],
            fiveProducts: [],
            day: "",
            revenue_day: {
                ngay: "",
                doanhthu: null
            },
            dayBegin: "",
            dayEnd: "",
            Nam: "2024",
            currenDate: "",
            DonHangToDay: null,
            DoanhThuToday: null,
            SLSPToDay: null,
            UserToday: null,
            DoanhThuDayToDay: [],
            DSThang: [
                { month: 1, revenue: 0 },
                { month: 2, revenue: 0 },
                { month: 3, revenue: 0 },
                { month: 4, revenue: 0 },
                { month: 5, revenue: 0 },
                { month: 6, revenue: 0 },
                { month: 7, revenue: 0 },
                { month: 8, revenue: 0 },
                { month: 9, revenue: 0 },
                { month: 10, revenue: 0 },
                { month: 11, revenue: 0 },
                { month: 12, revenue: 0 },
            ],
            ThangData: [],
            yearItem: ["2020", "2021", "2022", "2023", '2024'],
            DataLineChart: [],
            OrdersToday: [],
            ExcelData: [],
            ExcelDataValue: []
        }
    },
    computed: {
        Tong: function () {
            let sum = 0
            this.DoanhThuDayToDay.forEach(item => {
                sum += item.tien
            })
            return sum
        },
    },
    mounted() {
        this.getDateNow()
        this.API_get_doanh_thu()
        this.API_get_don_hang()
        this.API_get_SanPham()
        this.API_get_NhanVien()
        this.API_get5orders()
        this.API_get5sanpham()
        this.API_getOrdersToday()
        this.API_getDoanhThuTheoNam()
        this.API_getDonHangToDay()
        this.API_getDoanhThuToDay()
        this.API_getSLSPToday()
        this.API_getUserToday()
    },
    created() {
        this.API_getDoanhThuThangTheoNam()
    },
    watch: {
        Nam: function (val) {
            console.log(val)
            this.API_getDoanhThuThangTheoNam()
        }
    },
    methods: {
        getDateNow() {
            let date = new Date()
            this.currenDate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate()

        },
        formatDate(date) {
            const parts = date.split('-');
            return `${parts[2]}/${parts[1]}/${parts[0]}`;
        },
        formatDateInput(date) {
            const parts = date.split('/');
            return `${parts[2]}-${parts[1]}-${parts[0]}`;
        },

        API_get_doanh_thu() {
            axios.get("http://localhost:8080/rest/getDoanhThu").then(res => {
                this.DoanhThu = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        API_get_don_hang() {
            axios.get("http://localhost:8080/rest/getDonHang").then(res => {
                this.DonHang = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        API_get_SanPham() {
            axios.get("http://localhost:8080/rest/getSanPham").then(res => {
                this.SanPham = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        API_get_NhanVien() {
            axios.get("http://localhost:8080/rest/getNhanVien").then(res => {
                this.NhanVien = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        API_get5orders() {
            axios.get("http://localhost:8080/rest/get5DonHang").then(res => {
                this.orders = res.data
                this.fiveOrders = this.orders.slice(0, 5)
            }).catch(err => {
                console.log(err)
            })
        },
        API_get5sanpham() {
            axios.get("http://localhost:8080/rest/get5SanPham").then(res => {
                let products = res.data
                this.fiveProducts = products.slice(0, 5)
            }).catch(err => {
                console.log(err)
            })
        },
        API_getDoanhThuTheoNgay() {
            axios.post("http://localhost:8080/rest/getDoanhThuTheoNgay", {

                day: this.formatDateInput(this.day)
            }).then(res => {
                this.revenue_day = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        API_getDoanhThuTheoNam() {
            axios.post("http://localhost:8080/rest/getDoanhThuTheoNam", {
            }).then(res => {
                let DataLineChart = res.data
                let year = DataLineChart.map((item) => { return "Năm " + item.nam })
                let dataArr = DataLineChart.map(item => { return item.tien })

                this.dataLineChart.labels = year
                this.dataLineChart.datasets[0].data = dataArr

                let linechart = this.$refs?.linechart?.myChart
                if (linechart) line.update()
                this.loaded = true
            }).catch(err => {
                console.log(err)
            })
        },
        API_getDoanhThuTheoTungNgay() {
            let date = new Date()
            if (this.dayBegin === "" || this.dayBegin === null) {
                this.dayBegin = "20/2/2020"
            }
            if (this.dayEnd === "" || this.dayEnd === null) {
                this.dayEnd = this.formatDate(date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate())
            }
            axios.post("http://localhost:8080/rest/getDoanhThuTheoTungNgay", {
                dayBegin: this.formatDateInput(this.dayBegin),
                dayEnd: this.formatDateInput(this.dayEnd)
            }).then(res => {
                this.DoanhThuDayToDay = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        API_getDoanhThuThangTheoNam() {
            let data = {
                labels: [],
                datasets: [{
                    label: 'Doanh thu',
                    backgroundColor: '#f87979',
                    data: []
                }]
            }
            let dsThang = this.DSThang
            axios.post("http://localhost:8080/rest/getDoanhThuTungThangTheoNam", {
                Nam: this.Nam
            }).then(res => {
                let thangData = res.data
                let result = dsThang.map(itemThang => {
                    const obj = thangData.find(item => item.month === itemThang.month)
                    if (obj) {
                        itemThang = obj
                    }
                    return itemThang
                })
                result = result.map(item => {
                    return { ...item, month: "Tháng " + item.month }
                })
                let monthArr = result.map(item => item.month)
                data.labels = monthArr
                data.datasets[0].data = result.map((item) => {
                    return item.revenue
                })
                this.data = data
                this.ExcelData = monthArr
                this.ExcelDataValue = result.map((item) => {
                    return item.revenue
                })
                let chartbar = this.$refs?.chartbarcdn?.myChart
                if (chartbar) chartbar.update()
                this.loaded = true
            }).catch(err => {
                console.log(err)
            })

        },
        API_getDonHangToDay() {
            axios.post("http://localhost:8080/rest/getDonHangToDay", {
                date: this.currenDate
            }).then(res => {
                this.DonHangToDay = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        API_getDoanhThuToDay() {
            axios.post("http://localhost:8080/rest/getDoanhThuToday", {
                date: this.currenDate
            }).then(res => {
                this.DoanhThuToday = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        API_getSLSPToday() {
            axios.post("http://localhost:8080/rest/getSLSPToday", {
                date: this.currenDate
            }).then(res => {
                this.SLSPToDay = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        API_getUserToday() {
            axios.post("http://localhost:8080/rest/getUserToday", {
                date: this.currenDate
            }).then(res => {
                this.UserToday = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        API_getOrdersToday() {
            axios.post("http://localhost:8080/rest/getOrdersToday", {
                date: this.currenDate
            }).then(res => {
                this.OrdersToday = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        async excel() {

            const workbook = new ExcelJS.Workbook();
            const worksheet = workbook.addWorksheet('Doanh thu theo năm');
            worksheet.addRow(["Doanh thu năm: ", this.Nam]);
            worksheet.addRow(this.ExcelData);
            worksheet.addRow(this.ExcelDataValue);
            // Tạo file Excel và tải xuống
            const buffer = await workbook.xlsx.writeBuffer();
            const blob = new Blob([buffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
            const fileName = 'DoanhThuTungNam.xlsx';
            if (window.navigator.msSaveOrOpenBlob) {
                window.navigator.msSaveBlob(blob, fileName);
            } else {
                const url = window.URL.createObjectURL(blob);
                const a = document.createElement('a');
                a.href = url;
                a.download = fileName;
                document.body.appendChild(a);
                a.click();
                window.URL.revokeObjectURL(url);
                document.body.removeChild(a);
            }

        }

    }
}
</script>

<style scoped>
.card {
    height: 200px;
    background-color: rgb(255, 255, 255);
    border-radius: 20px;
    padding: 20px
}

.icon {
    background-color: #2ac94c;
    width: 60px;
    text-align: center;
    display: flex;
    justify-content: center;
    border-radius: 50%;
    height: 60px;
}

.d-group {
    height: 170px;
    align-items: center;
}

.order-table {
    min-height: 530px;
    height: auto;
    background-color: rgb(255, 255, 255);
    border-radius: 20px;
    padding: 20px
}
</style>