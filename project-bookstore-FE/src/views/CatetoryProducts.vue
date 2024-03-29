<template>
    <div>
        <v-data-table :headers="headers" :items="DS_Product" class="elevation-1" :search="search">
            <template v-slot:top>
                <v-toolbar flat>
                    <v-select v-model="id_cate" label="Chọn thể loại" :items="items" item-text="name" item-value="id"
                        solo dense class="mt-5" style="width: 50px;" @change="API_get_product"></v-select>
                    <v-spacer></v-spacer>
                </v-toolbar>
            </template>

            <template v-slot:item.name="{ item }">
                <span>{{ item.product.name }}</span>
            </template>
            <template v-slot:item.theloai="{ item }">
                <span>{{ item.category.name }}</span>
            </template>
            <template v-slot:item.actions="{ item }">
                <div>
                    <v-icon style="font-size:18px" color="red darken-3" small class="mr-2" @click="delete_emp(item)">
                        mdi-trash-can-outline
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
            id_cate: 0,
            items: [],
            search: '',
            headers: [
                { text: "Tên sản phẩm", value: "name" },
                { text: "Thể loại", value: "theloai" },
                { text: "Hành động", value: "actions" }
            ],
            DS_Product: []
        }
    },
    mounted() {
        this.API_get_catetory()
    },
    methods: {
        API_get_catetory() {
            axios.get("http://localhost:8080/manager/catetoryproduct").then(res => {
                this.items = res.data
            }).catch(err => {
                console.log(err)
            })
        },
        API_get_product() {
            axios.get("http://localhost:8080/manager/getproduct", {
                params: {
                    id: this.id_cate
                }
            }).then(res => {
                this.DS_Product = res.data
            }).catch(err => {
                console.log(err)
            })
        }
    }
}
</script>
<style></style>