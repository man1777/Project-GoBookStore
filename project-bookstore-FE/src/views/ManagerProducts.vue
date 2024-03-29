<template>
    <div>
        <v-data-table :headers="headers" :items="ProductsList" class="elevation-1">

            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title class=" text-h5 primary--text font-weight-medium">Danh sách sản
                        phẩm</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-dialog v-model="dialog" max-width="800px">
                        <template v-slot:activator="{ on, attrs }">
                            <v-btn color="success" fab x-small outlined class="mb-2" @click="openDialog">
                                <v-icon>mdi-plus</v-icon>
                            </v-btn>
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
                                <v-form>
                                    <v-row>
                                        <v-col cols="6">
                                            <v-card style="max-height:500px">
                                                <label for="file-input">
                                                    <v-img v-if="Product_Obj.image"
                                                        :src="'http://localhost:8080/upload/' + Product_Obj.image"
                                                        max-height="300" max-width="100%"></v-img>
                                                    <v-img
                                                        src="https://th.bing.com/th/id/OIP.w8YMeMXz_tZ3LUh06MB5UQHaHa?rs=1&pid=ImgDetMain"
                                                        v-else-if="imagePreviewUrl === null"></v-img>
                                                    <v-img v-if="imagePreviewUrl" :src="imagePreviewUrl" alt="Preview"
                                                        max-height="300" max-width="100%"></v-img>
                                                </label>

                                                <input id="file-input" type="file" style="display: none"
                                                    accept="image/*" @change="processImage">
                                            </v-card>
                                        </v-col>
                                        <v-col cols="6">
                                            <v-row>
                                                <v-col cols="12">
                                                    <v-text-field label="Tên sách" outlined dense
                                                        v-model="Product_Obj.name" hide-details></v-text-field>
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-text-field label="Nhà xuất bản" v-model="Product_Obj.origin"
                                                        outlined dense hide-details></v-text-field>
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-text-field label="Ngày xuất bản" v-model="Product_Obj.manuDay"
                                                        outlined dense hide-details></v-text-field>
                                                </v-col>
                                                <v-col cols="6">
                                                    <v-text-field label="Giá sách" v-model="Product_Obj.price" outlined
                                                        dense hide-details></v-text-field>
                                                </v-col>
                                                <v-col cols="6">
                                                    <v-text-field label="Loại bìa" v-model="Product_Obj.material"
                                                        outlined dense hide-details></v-text-field>
                                                </v-col>
                                                <v-col cols="12">
                                                    <v-checkbox :label="Product_Obj.status ? 'Còn hàng' : 'Hết hàng'"
                                                        color="success" v-model="Product_Obj.status">
                                                    </v-checkbox>
                                                </v-col>
                                            </v-row>
                                        </v-col>
                                        <v-col cols="12">
                                            <v-textarea clearable clear-icon="mdi-close-circle"
                                                v-model="Product_Obj.describe" label="Mô tả sách" outlined dense
                                                hide-details></v-textarea>
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

            <template v-slot:item.manuDay="{ item }">
                <span>{{ formatDate(item.manuDay) }}</span>
            </template>

            <template v-slot:item.price="{ item }">
                <span>{{ (item.price).toFixed(0).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,") }} VNĐ</span>
            </template>

            <template v-slot:item.actions="{ item }">
                <div style="display:flex">
                    <v-icon style="font-size:18px" color="red darken-3" small class="mr-2" @click="delete_emp(item)">
                        mdi-trash-can-outline
                    </v-icon>
                    <v-icon style="font-size:18px" color="green darken-2" small class="mr-2" @click="edit_emp(item)">
                        mdi-square-edit-outline
                    </v-icon>
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
            dialogConfirmDelete: false,
            imagePreviewUrl: null,
            imageTemp: null,
            headers: [
                { text: "STT", value: "stt", align: "center", sortable: false },
                { text: "Tên sách", value: "name" }, { text: "Nhà xuất bản", value: "origin" },
                { text: "Giá tiền", value: "price", align: "center", width: "120" },
                { text: "Ngày xuất bản", value: "manuDay" },
                { text: "Loại bìa", value: "material", sortable: false, width: "120" },
                { text: "Tình trạng", value: "status", align: "center" },
                { text: "Mô tả", value: "describe", sortable: false, width: "200" },
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
                status: null,
                review: "",
                manuDay: "2014-05-17"

            },
            Product_Obj_Default: {
                id: null,
                name: "",
                price: null,
                image: '',
                origin: "",
                material: "",
                describe: "",
                review: "",
                manuDay: "2014-05-17",
                status: null

            },
            imageFile: null
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
        },
        openDialog() {
            this.dialog = true
        },
        closeDialog() {
            this.dialog = false
            this.Product_Obj = Object.assign({}, this.Product_Obj_Default)
            this.editedIndex = -1
            this.imagePreviewUrl = null
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
            this.Product_Obj.image = this.imageTemp
            if (this.editedIndex === -1) {
                this.insertProduct();
            } else {
                this.insertProduct();
            }
        },
        processImage(event) {
            this.Product_Obj.image = null
            const file = event.target.files[0];
            this.imageTemp = file
            const reader = new FileReader();
            reader.onload = () => {
                this.imagePreviewUrl = reader.result;
            };
            reader.readAsDataURL(file);

        },
        image() {
            let formData = new FormData();
            formData.append('name', this.Product_Obj.name)
            formData.append('price', this.Product_Obj.price)
            formData.append('image', this.Product_Obj.image)
            formData.append('origin', this.Product_Obj.origin)
            formData.append('material', this.Product_Obj.material)
            formData.append('manuday', this.Product_Obj.manuDay)
            formData.append('describe', this.Product_Obj.describe)
            formData.append('review', this.Product_Obj.review)
            formData.append('status', this.Product_Obj.status)
            axios.post("http://localhost:8080/rest/getImage", formData, {
                headers: {
                    'Content-Type': 'multipart/form-data'
                }
            }
            )
                .then(res => {

                })
                .catch(err => console.log(err))
        },
        insertProduct() {
            let formData = new FormData();
            formData.append('name', this.Product_Obj.name)
            formData.append('price', this.Product_Obj.price)
            formData.append('image', this.Product_Obj.image)
            formData.append('origin', this.Product_Obj.origin)
            formData.append('material', this.Product_Obj.material)
            formData.append('manuday', this.Product_Obj.manuDay)
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
        formatDate(date) {
            const parts = date.split('-');
            return `${parts[2]}/${parts[1]}/${parts[0]}`;
        },
    },
    mounted() {
        this.renderDataTable();
    }
}
</script>

<style></style>