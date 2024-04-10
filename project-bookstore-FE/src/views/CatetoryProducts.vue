<template>
    <div>
        <v-card class="rounded-xl">
            <v-card-title></v-card-title>
            <v-card-text>
                <v-row>
                    <v-col cols="7">
                        <v-data-table :headers="headers" :items="DS_Product" class="elevation-1 rounded-xl"
                            :search="search" :footer-props="{ 'items-per-page-options': [10, 15, 20, -1] }"
                            height="650px">
                            <template v-slot:top>
                                <v-toolbar flat>
                                    <v-select v-model="id_cate" label="Chọn thể loại" :items="items" item-text="name"
                                        item-value="id" solo dense class="mt-5" style="max-width: 400px;"
                                        @change="API_get_product"></v-select>
                                    <v-spacer></v-spacer>
                                    <v-btn color="success" fab x-small outlined class="mb-2" @click="openDialog">
                                        <v-icon>mdi-plus</v-icon>
                                    </v-btn>
                                    <v-dialog v-model="dialog" max-width="500px">

                                        <v-card>
                                            <v-card-title class="primary--text font-weight-medium">
                                                Cập nhật thể loại cho sách
                                            </v-card-title>
                                            <v-card-text>
                                                <v-row dense>
                                                    <v-col cols="12">
                                                        <v-autocomplete label="Chọn sách" v-model="idsach"
                                                            :items="ProductsList" item-text="name" item-value="id">
                                                            <template v-slot:item="{ item }">
                                                                <v-avatar left>
                                                                    <v-img
                                                                        :src="'http://localhost:8080/upload/' + item.image"></v-img>
                                                                </v-avatar>
                                                                <span>{{ item.name }}</span>
                                                            </template>
                                                        </v-autocomplete>
                                                    </v-col>
                                                    <v-col cols="12">
                                                        <v-autocomplete label="Chọn thể loại" v-model="iddanhmuc"
                                                            :items="danhmuc" item-text="name"
                                                            item-value="id"></v-autocomplete>
                                                    </v-col>
                                                </v-row>
                                            </v-card-text>
                                            <v-card-actions>
                                                <v-spacer></v-spacer>
                                                <v-btn>Đóng</v-btn>
                                                <v-btn color="primary" @click="findProHasId">Lưu</v-btn>
                                            </v-card-actions>
                                        </v-card>
                                    </v-dialog>
                                </v-toolbar>
                            </template>
                            <template v-slot:item.image="{ item }">
                                <v-img :src="'http://localhost:8080/upload/' + item.product.image"
                                    width="100px"></v-img>
                            </template>
                            <template v-slot:item.name="{ item }">
                                <span>{{ item.product.name }}</span>
                            </template>
                            <template v-slot:item.theloai="{ item }">
                                <span>{{ item.category.name }}</span>
                            </template>
                            <template v-slot:item.actions="{ item }">
                                <div>
                                    <v-icon style="font-size:18px" color="red darken-3" small class="mr-2"
                                        @click="deleteById(item)">
                                        mdi-trash-can-outline
                                    </v-icon>
                                </div>
                            </template>
                        </v-data-table>
                    </v-col>
                    <v-col cols="5">
                        <v-card>
                            <v-card-title>Thêm danh mục sản phẩm</v-card-title>
                            <v-card-text>
                                <v-text-field label="Tên danh mục"></v-text-field>
                            </v-card-text>
                        </v-card>
                    </v-col>
                </v-row>
            </v-card-text>
        </v-card>


    </div>
</template>
<script>
export default {
    data() {
        return {
            id_cate: 0,
            items: [],
            search: '',
            headers: [
                { text: "Hình ảnh sản phẩm", value: "image" },
                { text: "Tên sản phẩm", value: "name" },
                { text: "Thể loại", value: "theloai" },
                { text: "Hành động", value: "actions" }
            ],
            DS_Product: [],
            data_compare: [],
            itemperpage: 15,
            ProductCateID: null,
            ProductID: null,
            dialog: false,
            danhmuc: [],
            ProductsList: [],
            iddanhmuc: null,
            idsach: null
        }
    },
    mounted() {
        this.API_get_catetory()
        this.API_get_product()
        this.renderDataTable()
    },
    watch: {
        dialog: function (val) {
            val || this.closeDialog()
        }
    },
    methods: {
        openDialog() {
            this.dialog = true
        },
        closeDialog() {
            this.dialog = false
            this.iddanhmuc = null
            this.idsach = null
        },
        findProHasId() {
            let obj = this.DS_Product.find(item => {
                if (item.product.id === this.idsach && item.category.id === this.iddanhmuc) {
                    return item
                } else
                    return null
            })
            if (obj) {
                alert("Đã có")
            } else {
                this.API_Ins_Product()
                alert("Cập nhật thể loại thành công")
            }
            this.closeDialog()
        },
        deleteById(item) {
            this.API_Del_Product(item.id)

            alert("Đã xóa thể loại " + item.category.name + " của sách " + item.product.name)
        },
        API_get_catetory() {
            axios.get("http://localhost:8080/manager/catetoryproduct").then(res => {
                this.items = res.data
                this.danhmuc = this.items.map(item => {
                    if (item.id !== 0) {
                        return item
                    }
                })
                this.items.push({
                    id: 0,
                    name: "Tất cả thể loại"
                })
            }).catch(err => {
                console.log(err)
            })
        },
        API_Ins_Product() {
            axios.post("http://localhost:8080/manager/addproduct", {
                cateid: this.iddanhmuc,
                productid: this.idsach
            }).then(res => {
                this.API_get_product()
            }).catch(err => {
                console.log(err)
            })
        },

        API_Del_Product(id) {
            axios.post("http://localhost:8080/manager/delproduct", {
                id: id
            }).then(res => {
                this.API_get_product()
            }).catch(err => {
                console.log(err)
            })
        },
        API_get_product() {
            axios.get("http://localhost:8080/manager/getproduct", {
                params: {
                    id: this.id_cate
                }
            }).then(async res => {
                let data = res.data
                this.data_compare = res.data
                this.DS_Product = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        renderDataTable() {
            axios.get("http://localhost:8080/rest/getAllProducts").then(res => {
                this.ProductsList = res.data
            }).catch(err => {
                console.log(err)
            })
        },
    }
}
</script>
<style></style>