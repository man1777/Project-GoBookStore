<template>
    <div>
        <v-data-table :headers="headers" :items="DS_Product" class="elevation-1" :search="search" items-per-page="15">
            <template v-slot:top>
                <v-toolbar flat>
                    <v-select v-model="id_cate" label="Chọn thể loại" :items="items" item-text="name" item-value="id"
                        solo dense class="mt-5" style="width: 50px;" @change="API_get_product"></v-select>
                    <v-spacer></v-spacer>
                </v-toolbar>
            </template>
            <template v-slot:item.image="{ item }">
                <v-img :src="'http://localhost:8080/upload/' + item.product.image" width="100px"></v-img>
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
                { text: "Hình ảnh sản phẩm", value: "image" },
                { text: "Tên sản phẩm", value: "name" },
                { text: "Thể loại", value: "theloai" },
                { text: "Hành động", value: "actions" }
            ],
            DS_Product: []
        }
    },
    mounted() {
        this.API_get_catetory()
        this.API_get_product()
    },
    methods: {
        API_get_catetory() {
            axios.get("http://localhost:8080/manager/catetoryproduct").then(res => {
                this.items = res.data
                this.items.push({
                    id: 0,
                    name: "Tất cả thể loại"
                })
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
                let ar = []
                await data.forEach((item, index) => {
                    for (let i = index + 1; i < data.length; i++) {
                        if (item.product.name === data[i].product.name) {
                            item.category.name = item.category.name + ', ' + data[i].category.name
                            ar.push(item)
                        }
                    }
                })
                for (let i = 0; i < ar.length; i++) {
                    data.forEach(item => {
                        console.log(item)
                        if (item.product.name === ar[i].product.name) {
                            data.splice(data.indexOf(item), 1)
                        }
                    })
                }
                this.DS_Product = data.map(item => {
                    ar.forEach(i => {
                        if (item.product.name === i.product.name) {
                            item = i
                        }
                    })
                    return { ...item }
                })
                console.log("xxx", data)
            }).catch(err => {
                console.log(err)
            })
        }
    }
}
</script>
<style></style>