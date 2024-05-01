<template>
    <v-card class="rounded-xl ">
        <v-card-title></v-card-title>
        <v-card-text>
            <v-data-table :headers="headers" :search="search" :items="ProductsList" class="elevation-1 rounded-xl"
                :footer-props="{ 'items-per-page-options': [10, 15, 20, -1] }">

                <template v-slot:top>
                    <v-toolbar flat>
                        <v-toolbar-title class=" text-h5 primary--text font-weight-medium">Danh sách sản
                            phẩm</v-toolbar-title>
                        <v-spacer></v-spacer>
                        <v-text-field class="me-5" v-model="search" prepend-icon="mdi-magnify" label="Tìm kiếm" outlined
                            dense hide-details style="max-width:400px"></v-text-field>
                        <v-dialog v-model="dialog" max-width="800px">
                            <template v-slot:activator="{ on, attrs }">
                                <v-btn color="success" fab x-small outlined class="mb-2" @click="openDialog">
                                    <v-icon>mdi-plus</v-icon>
                                </v-btn>
                                <v-icon color="success" @click="exportToExcel()">mdi-excel</v-icon>
                                <v-btn class="me-5" @click="exportToExcel()"><img class="me-3" width="32" height="32"
                                        src="https://img.icons8.com/color/32/ms-excel.png" alt="ms-excel" />Xuất
                                    Excel</v-btn>
                            </template>
                            <v-card>
                                <v-card-title>
                                    <span class="text-h5 primary--text">Thông tin sản phẩm sách</span>
                                    <v-spacer></v-spacer>
                                    <v-btn fab small icon>
                                        <v-icon @click="closeDialog">mdi-close</v-icon>
                                    </v-btn>
                                </v-card-title>
                                <v-card-text class="mt-5">
                                    <v-form ref="form" v-model="valid" lazy-validation>
                                        <v-row>
                                            <v-col cols="6">
                                                <v-card style="max-height:500px">
                                                    <label for="file-input">
                                                        <v-img v-if="Product_Obj.image"
                                                            :src="'http://localhost:8080/upload/' + Product_Obj.image"
                                                            max-height="300" max-width="100%"></v-img>
                                                        <v-img
                                                            src="https://th.bing.com/th/id/OIP.w8YMeMXz_tZ3LUh06MB5UQHaHa?rs=1&pid=ImgDetMain"
                                                            v-else-if="imagePreviewUrl === ''"></v-img>
                                                        <v-img v-if="imagePreviewUrl" :src="imagePreviewUrl"
                                                            alt="Preview" max-height="300" max-width="100%"></v-img>
                                                    </label>

                                                    <input id="file-input" type="file" style="display: none"
                                                        accept="image/*" @change="processImage">
                                                </v-card>
                                            </v-col>
                                            <v-col cols="6">
                                                <v-row>
                                                    <v-col cols="12" style="height: 70px;">
                                                        <v-text-field label="Tên sách" outlined dense
                                                            v-model="Product_Obj.name" :rules="nameRules" counter="200"
                                                            lazy-validation="true"></v-text-field>
                                                    </v-col>
                                                    <v-col cols="12" style="height: 70px;">
                                                        <v-text-field label="Tác giả" v-model="Product_Obj.author"
                                                            outlined dense counter="50"></v-text-field>
                                                    </v-col>
                                                    <v-col cols="12" style="height: 70px;">
                                                        <v-text-field label="Nhà xuất bản" v-model="Product_Obj.origin"
                                                            outlined dense lazy-validation="true" :rules="originRules"
                                                            counter="50"></v-text-field>
                                                    </v-col>
                                                    <v-col cols="12" style="height: 70px;">
                                                        <v-text-field label="Ngày xuất bản"
                                                            v-model="Product_Obj.manuDay" outlined dense
                                                            :rules="manuDayRules" hint="VD: 17/07/2003"
                                                            lazy-validation="true"></v-text-field>
                                                    </v-col>
                                                    <v-col cols="6" style="height: 70px;">
                                                        <v-text-field label="Giá sách" :rules="priceRules"
                                                            v-model="Product_Obj.price" outlined dense
                                                            lazy-validation="true"></v-text-field>
                                                    </v-col>
                                                    <v-col cols="6" style="height: 70px;">
                                                        <v-select label="Loại bìa"
                                                            :items="['Bìa cứng', 'Bìa mềm', 'Khác']"
                                                            v-model="Product_Obj.material" outlined dense
                                                            :rules="[v => !!v || 'Vui lòng chọn loại bìa']"
                                                            lazy-validation="true"></v-select>
                                                    </v-col>
                                                    <v-col cols="12">
                                                        <v-checkbox
                                                            :label="Product_Obj.status ? 'Còn hàng' : 'Hết hàng'"
                                                            color="success" v-model="Product_Obj.status">
                                                        </v-checkbox>
                                                    </v-col>
                                                </v-row>
                                            </v-col>
                                            <v-col cols="12">
                                                <v-textarea v-model="Product_Obj.describe" label="Mô tả sách" outlined
                                                    dense hide-details></v-textarea>
                                            </v-col>
                                        </v-row>
                                    </v-form>
                                </v-card-text>
                                <v-card-actions>
                                    <v-spacer></v-spacer>
                                    <v-btn @click="closeDialog">Đóng</v-btn>


                                    <v-btn class="ml-2" color="primary" @click="save()">
                                        Lưu</v-btn>
                                </v-card-actions>
                            </v-card>
                        </v-dialog>
                        <v-dialog v-model="dialogConfirmDelete" max-width="600px">
                            <v-card>
                                <v-card-title>Bạn có chắc chắn muốn xóa sản phẩm này?</v-card-title>
                                <v-card-actions>
                                    <v-spacer></v-spacer>
                                    <v-btn @click="closeDialogDelete">Đóng</v-btn>
                                    <v-btn class="ml-2" color="primary" @click="confirmDelete">
                                        Xác nhận</v-btn>
                                </v-card-actions>
                            </v-card>
                        </v-dialog>
                    </v-toolbar>
                </template>

                <template v-slot:item.status="{ item }">
                    <v-chip class="ma-2" color="green" text-color="white" v-if="item.status === true">
                        Còn hàng
                    </v-chip>
                    <v-chip v-if="item.status === false" class="ma-2" color="warning" text-color="white">
                        Hết hàng
                    </v-chip>
                </template>

                <template v-slot:item.stt="{ item }">
                    <span>{{ ProductsList.indexOf(item) + 1 }}</span>
                </template>
                <template v-slot:item.image="{ item }">
                    <v-img :src="'http://localhost:8080/upload/' + item.image" width="100px"></v-img>
                </template>
                <template v-slot:item.manuDay="{ item }">
                    <span>{{ formatDate(item.manuDay) }}</span>
                </template>

                <template v-slot:item.price="{ item }" class="p-5">
                    <span>{{ (item.price).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") }} VNĐ</span>
                </template>

                <template v-slot:item.actions="{ item }">
                    <div style="display:flex">
                        <v-icon style="font-size:18px" color="red darken-3" small class="mr-2"
                            @click="delete_emp(item)">
                            mdi-trash-can-outline
                        </v-icon>
                        <v-icon style="font-size:18px" color="green darken-2" small class="mr-2"
                            @click="edit_emp(item)">
                            mdi-square-edit-outline
                        </v-icon>
                    </div>
                </template>
            </v-data-table>
        </v-card-text>

    </v-card>
</template>

<script>
import ExcelJS from 'exceljs'
export default {
    data() {
        return {
            valid: false,
            dialog: false,
            dialogConfirmDelete: false,
            imagePreviewUrl: '',
            imageTemp: "",
            headers: [
                { text: "STT", value: "stt", align: "center", sortable: false },
                { text: "Hình ảnh", value: "image", align: "center" },
                { text: "Tên sách", value: "name" }, { text: "Nhà xuất bản", value: "origin" },
                { text: "Giá tiền", value: "price", align: "center", width: "120" },
                { text: "Tác giả", value: "author", sortable: false, width: "200" },
                { text: "Ngày xuất bản", value: "manuDay" },
                { text: "Loại bìa", value: "material", sortable: false, width: "120" },
                { text: "Tình trạng", value: "status", align: "center" },

                { text: "Hành động", value: "actions", align: "center", sortable: false }
            ],
            editedIndex: -1,
            ProductsList: [],
            Product_Obj: {
                id: null,
                name: "",
                price: null,
                image: '',
                origin: "",
                material: "",
                describe: "",
                author: "",
                status: false,
                review: "",
                manuDay: ""

            },
            Product_Obj_Default: {
                id: null,
                name: "",
                price: null,
                image: '',
                origin: "",
                material: "",
                describe: "",
                author: "",
                review: "",
                manuDay: "",
                status: false

            },
            imageFile: "",
            nameRules: [
                v => !!v || "Vui lòng nhập tên sản phẩm",
                v => (v && v.length < 200) || "Tên sản phẩm nhập tối đa 200 ký tự"
            ],
            originRules: [
                v => !!v || "Vui lòng nhập nhà xuất bản",
                v => (v && v.length < 50) || "Nhà xuất bản tối đa 50 ký tự"
            ],
            manuDayRules: [
                v => !!v || "Vui lòng nhập ngày xuất bản",
                v => /^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/\d{4}$/.test(v) || 'Ngày không hợp lệ (dd/MM/yyyy)',
            ],
            priceRules: [
                v => !!v || "Vui lòng nhập giá bán",
                v => /^\d+$/.test(v) || "Giá bán không hợp lệ"
            ],
            search: ""
        }
    },
    watch: {
        dialog: function (val) {
            val || this.closeDialog();
        },
        dialogConfirmDelete: function (val) {
            val || this.closeDialogDelete();
        }
    },
    methods: {
        renderDataTable() {
            axios.get("http://localhost:8080/rest/getAllProducts").then(res => {
                this.ProductsList = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        delete_emp(item) {
            this.Product_Obj = Object.assign({}, item)
            this.dialogConfirmDelete = true
        },
        edit_emp(item) {
            this.dialog = true
            this.Product_Obj = Object.assign({}, item)
            console.log("item", item)
            this.editedIndex = this.ProductsList.indexOf(item)
            console.log("this.editedIndex", this.editedIndex)
            this.Product_Obj.manuDay = this.formatDate(this.Product_Obj.manuDay)
        },
        openDialog() {
            this.dialog = true
        },
        closeDialog() {
            this.dialog = false
            this.Product_Obj = Object.assign({}, this.Product_Obj_Default)
            this.editedIndex = -1
            this.imagePreviewUrl = ''
            this.$refs.form.reset()
            this.imageTemp = ''
        },
        closeDialogDelete() {
            this.dialogConfirmDelete = false
            this.Product_Obj = Object.assign({}, this.Product_Obj_Default)
        },
        confirmDelete() {
            axios.delete(`http://localhost:8080/rest/deleteProduct/${this.Product_Obj.id}`).then(res => {
                this.renderDataTable()
                console.log("Xóa thành công!", res.data)
                this.dialogConfirmDelete = false
            }).catch(err => {
                console.log("Xóa lỗi", err)
            })
        },
        save() {
            if (this.$refs.form.validate() === false) {
                return
            }
            this.Product_Obj.image = this.imageTemp
            this.Product_Obj.manuDay = this.formatSql(this.Product_Obj.manuDay)

            if (this.editedIndex === -1) {
                this.insertProduct();
            } else {
                this.updateProduct();
            }
        },
        processImage(event) {
            this.Product_Obj.image = ''
            const file = event.target.files[0];
            this.imageTemp = file
            const reader = new FileReader();
            reader.onload = () => {
                this.imagePreviewUrl = reader.result;
            };
            reader.readAsDataURL(file);

        },
        insertProduct() {
            let formData = new FormData();
            formData.append('name', this.Product_Obj.name)
            formData.append('price', this.Product_Obj.price)
            formData.append('image', this.Product_Obj.image)
            formData.append('origin', this.Product_Obj.origin)
            formData.append('material', this.Product_Obj.material)
            formData.append('manuday', this.Product_Obj.manuDay)
            formData.append('author', this.Product_Obj.author)
            formData.append('describe', this.Product_Obj.describe)
            formData.append('review', this.Product_Obj.review)
            formData.append('status', this.Product_Obj.status)
            axios.post("http://localhost:8080/rest/insertProduct", formData,
                {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                }
            )
                .then(res => {
                    this.closeDialog()
                    this.renderDataTable()
                    console.log("thànhc ông", res.data)
                })
                .catch(err => console.log(err))
        },
        updateProduct() {
            let formData = new FormData();
            formData.append('name', this.Product_Obj.name)
            formData.append('price', this.Product_Obj.price)
            formData.append('image', this.Product_Obj?.image)
            formData.append('origin', this.Product_Obj.origin)
            formData.append('material', this.Product_Obj.material)
            formData.append('author', this.Product_Obj.author)
            formData.append('manuday', this.Product_Obj.manuDay)
            formData.append('describe', this.Product_Obj.describe)
            formData.append('review', this.Product_Obj.review)
            formData.append('status', this.Product_Obj.status)
            formData.append('id', this.Product_Obj.id)
            console.log("this.Product_Obj.image", this.Product_Obj.image)
            axios.post("http://localhost:8080/rest/updateProduct", formData)
                .then(res => {
                    this.closeDialog()
                    this.renderDataTable()
                    console.log("thànhc ông", res.data)
                })
                .catch(err => console.log(err))
        },
        formatDate(date) {
            const parts = date.split('-');
            return `${parts[2]}/${parts[1]}/${parts[0]}`;
        },
        formatSql(date) {
            const parts = date.split('/');
            return `${parts[2]}-${parts[1]}-${parts[0]}`;
        },
        async exportToExcel() {
            const workbook = new ExcelJS.Workbook();
            const worksheet = workbook.addWorksheet('Data');

            // Thêm tiêu đề từ headers vào worksheet
            let headerRow = []
            this.headers.forEach(header => {
                headerRow.push({ name: header.text });
            });
            let title = this.headers.map(header => header.text)
            worksheet.addRow(title);

            //Thêm dữ liệu từ ProductsList vào worksheet
            this.ProductsList.forEach((item, index) => {
                const rowData = [];
                item.stt = index + 1
                if (item.status) {
                    item.status = "Còn hàng"
                } else {
                    item.status = "Hết hàng"
                }
                this.headers.forEach(header => {
                    rowData.push(item[header.value]);
                });
                worksheet.addRow(rowData);
                this.renderDataTable()
            });
            // worksheet.addTable({
            //     name: 'Data',
            //     ref: 'A1', // Reference to the top-left cell of the table
            //     headerRow: true, // Include header row
            //     totalsRow: false, // Include totals row (if needed)
            //     style: {
            //         theme: 'TableStyleMedium9', // Choose a table style
            //         showRowStripes: true, // Show row stripes
            //     },
            //     rows: this.ProductsList.length + 2,

            //     columns: headerRow,
            // });

            // Tạo file Excel và tải xuống
            const buffer = await workbook.xlsx.writeBuffer();
            const blob = new Blob([buffer], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
            const fileName = 'QuanLySanPham.xlsx';
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
    },
    mounted() {
        this.renderDataTable();
    }
}
</script>

<style></style>