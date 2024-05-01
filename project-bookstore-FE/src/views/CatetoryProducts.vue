<template>
    <div>
        <v-card class="rounded-xl">
            <v-card-title></v-card-title>
            <v-card-text>
                <v-row>
                    <v-col cols="7">
                        <v-data-table :headers="headers" :items="DS_Product" class="elevation-1 rounded-xl"
                            :search="search" :footer-props="{ 'items-per-page-options': [10, 15, 20, -1] }"
                            height="850px">
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
                                                        <v-autocomplete label="Chọn sách" v-model="idsach" chips
                                                            multiple :items="ProductsList" item-text="name"
                                                            item-value="id">
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
                                                <v-btn @click="closeDialog">Đóng</v-btn>
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
                                <v-form ref="form">
                                    <v-row>
                                        <v-col cols="12">
                                            <label for="file-input">
                                                <v-img v-if="category.image"
                                                    :src="'http://localhost:8080/upload/' + category.image"
                                                    max-height="200" max-width="100%" cover></v-img>
                                                <v-img
                                                    src="https://th.bing.com/th/id/OIP.w8YMeMXz_tZ3LUh06MB5UQHaHa?rs=1&pid=ImgDetMain"
                                                    v-else-if="imagePreviewUrl === ''" max-height="200" max-width="100%"
                                                    contain></v-img>
                                                <v-img v-if="imagePreviewUrl" :src="imagePreviewUrl" alt="Preview"
                                                    max-height="200" cover max-width="100%"></v-img>
                                            </label>

                                            <input id="file-input" type="file" style="display: none" accept="image/*"
                                                @change="processImage">
                                        </v-col>
                                        <v-col cols="12">
                                            <v-text-field v-model="category.name" label="Tên danh mục" outlined dense
                                                :rules="nameRules"></v-text-field>
                                        </v-col>
                                        <v-col cols="12">
                                            <v-data-table :headers="headers_cate" :items-per-page="itemperpage"
                                                :items="items" height="500px">
                                                <template v-slot:item.image="{ item }">
                                                    <v-img :src="'http://localhost:8080/upload/' + item.image"
                                                        width="100px"></v-img>
                                                </template><template v-slot:item.actions="{ item }">
                                                    <div>
                                                        <v-icon style="font-size:18px" color="red darken-3" small
                                                            class="mr-2" @click=" API_del_category(item)">
                                                            mdi-trash-can-outline
                                                        </v-icon>
                                                        <v-icon style="font-size:18px" color="green darken-2" small
                                                            class="mr-2" @click="edit_cate(item)">
                                                            mdi-square-edit-outline
                                                        </v-icon>
                                                    </div>
                                                </template>
                                            </v-data-table>
                                        </v-col>
                                    </v-row>
                                </v-form>



                            </v-card-text>
                            <v-card-actions>
                                <v-spacer></v-spacer>
                                <v-btn color="success " v-if="indexCate === -1" @click="API_add_category()">
                                    Thêm mới</v-btn>
                                <v-btn color="primary" v-else @click="API_upd_category()">
                                    Cập nhật</v-btn>

                            </v-card-actions>
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
                { text: "Hình ảnh sách", value: "image" },
                { text: "Tên sản sách", value: "name" },
                { text: "Thể loại", value: "theloai" },
                { text: "Hành động", value: "actions", align: "center" }
            ],
            headers_cate: [
                { text: "Hình ảnh danh mục", value: "image" },
                { text: "Tên danh mục", value: "name" },
                { text: "Hành động", value: "actions", align: "center" }
            ],
            DS_Product: [],
            data_compare: [],
            itemperpage: 15,
            ProductCateID: null,
            ProductID: null,
            dialog: false,
            itemperpage: 5,
            danhmuc: [],
            ProductsList: [],
            iddanhmuc: null,
            idsach: [],
            category: {
                id: null,
                name: "",
                image: ""
            },
            category_df: {
                id: null,
                name: "",
                image: ""
            },
            imagePreviewUrl: '',
            imageTemp: "",
            indexCate: -1,
            nameRules: [
                v => !!v || "Vui lòng nhập tên danh mục"
            ]
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
        processImage(event) {
            this.category.image = ''
            const file = event.target.files[0];
            const reader = new FileReader();
            this.imageTemp = file
            reader.onload = () => {
                this.imagePreviewUrl = reader.result;
            };
            reader.readAsDataURL(file);
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

            }
            this.closeDialog()
        },
        edit_cate(item) {
            this.category = Object.assign({}, item)
            this.indexCate = this.items.indexOf(item)
        },
        rf_cate() {
            this.category = Object.assign({}, this.category_df)
            this.indexCate = -1
            this.imagePreviewUrl = ''
            this.imageTemp = ''
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

            if (this.idsach.length > 0) {
                this.idsach.forEach(item => {
                    axios.post("http://localhost:8080/manager/addproduct", {
                        cateid: this.iddanhmuc,
                        productid: item
                    }).then(res => {
                        this.API_get_product()
                    }).catch(err => {
                        console.log(err)
                    })
                })

                alert("Cập nhật thể loại thành công")
            } else {
                alert("Chọn sách")
            }


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
        API_add_category() {
            if (this.$refs.form.validate() === false) {
                return
            }
            this.category.image = this.imageTemp
            let formData = new FormData();
            formData.append('name', this.category.name)
            formData.append('image', this.category.image)
            axios.post("http://localhost:8080/manager/addcategory", formData,
                {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                }
            ).
                then((res) => {
                    this.API_get_catetory()
                    this.rf_cate()
                    alert("Thêm danh mục thành công")
                    console.log(res)
                }).catch(err => {
                    console.log(err)
                })
        },
        API_upd_category() {
            if (this.$refs.form.validate() === false) {
                return
            }
            this.category.image = this.imageTemp
            let formData = new FormData();
            formData.append('id', this.category.id)
            formData.append('name', this.category.name)
            formData.append('image', this.category.image)
            console.log(this.category.image)
            axios.post("http://localhost:8080/manager/updatecategory", formData,
                {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                }
            ).
                then((res) => {
                    this.API_get_catetory()
                    this.rf_cate()
                    alert("Cập nhật danh mục thành công")
                    console.log(res)
                }).catch(err => {
                    console.log(err)
                })
        },
        API_del_category(item) {
            axios.post("http://localhost:8080/manager/delbyidcate", {
                id: item.id
            }).
                then((res) => {
                    this.API_get_catetory()
                    this.rf_cate()
                    alert("Xóa danh mục thành công")
                    console.log(res)
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