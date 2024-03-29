<template>
    <v-container fluid style="background-color: #f5f5f4 ;">
        <section class="section">
            <v-row>
                <v-col cols="5">
                    <v-card>
                        <v-img height="750px"
                            src="https://rtl.booklovers.ancorathemes.com/wp-content/uploads/2020/05/book10-copyright.jpg"
                            cover></v-img>
                    </v-card>

                </v-col>
                <v-col cols="7">
                    <v-card class="elevation-0" color="#f5f5f4" style="height: 100%;">
                        <v-card-title class="card-title">The Story About Me</v-card-title>
                        <v-card-text class="card-text">
                            <p class="mt-5">Authors: mantran</p>
                            <p class="mt-5 price">200.000 - 300.000 VNĐ </p>
                            <p class="mt-5">Dicta sunt explicabo. Nemo enim ipsam voluptatem voluptas sit odit aut fugit,
                                sed quia
                                consequuntur. Lorem ipsum dolor. Aquia sit amet, elitr, sed diam nonum eirmod tempor
                                invidunt.</p>
                            <v-row class="mt-5">
                                <v-col cols="3" class="content">
                                    <p>Nhà phát hành: </p>
                                    <p>Năm phát hành: </p>
                                    <p>Loại sách: </p>
                                    <p>Số trang: </p>
                                    <p>Dạng sách: </p>
                                </v-col>
                                <v-col cols="9" class="content-detail">
                                    <p>BIENHOABOOK </p>
                                    <p>2023 </p>
                                    <p>Drama </p>
                                    <p>200 </p>
                                    <p>Bản trực tuyến - Bản sách giấy </p>
                                </v-col>
                            </v-row>
                        </v-card-text>
                        <div class="ml-4" style="display:flex;align-items: center;">
                            <v-radio-group v-model="radios" row>
                                <v-radio label="Sách online" value="Sách online"></v-radio>
                                <v-radio label="Sách cuốn giấy" value="Sách cuốn giấy"></v-radio>
                            </v-radio-group>
                        </div>
                        <v-card-actions class="card-action">

                            <div class="d-flex me-5" justify="center">
                                <input class="quantity" type="text" v-model="quantity">
                                <div class="button-quantity">
                                    <v-icon @click="increase">mdi-chevron-up</v-icon>
                                    <v-icon @click="decrease">mdi-chevron-down</v-icon>
                                </div>
                            </div>
                            <v-btn class="elevation-0 btn-buy" style="height: 50px; width: 200px;" dark plain
                                @click="buyItem">Mua
                                ngay</v-btn>

                        </v-card-actions>
                    </v-card>
                </v-col>
            </v-row>
        </section>
        <section class="section1">
            <div class="title">
                <p style="font-size: 50px;font-family: sans;">Sách cùng thể loại</p>
                <hr class="hr mt-10">
                <v-row class="mt-10">
                    <v-col cols="4" v-for="(i, imgIndex) in pickedByAuthors" :key="imgIndex">
                        <v-card class="card-picked">
                            <a href=""><v-img class="img-hover" :src="i.img" style="height: 500px;" href="/">
                                    <div class="hoverr"></div>
                                </v-img></a>
                        </v-card>
                        <v-card-title style="display: block;gap:20px">
                            <h1 style="font-family: sans;">{{ i.name }}</h1>
                            <p style="color:#817f7f;font-family: sans;margin-top: 10px;">{{ i.author }}</p>
                            <p style="color:#de3241;font-family: sans;margin-top: 10px;">{{ i.price }} VND</p>
                        </v-card-title>
                    </v-col>
                </v-row>
            </div>
        </section>
    </v-container>
</template>
<script>
export default {
    data: () => ({
        quantity: 1,
        radios: "",
        pickedByAuthors: [
            {
                name: "Let the Sun Shine",
                author: "Richard Mann",
                img: 'https://rtl.booklovers.ancorathemes.com/wp-content/uploads/2020/05/book1-copyright.jpg',
                price: 10000
            },
            {
                name: "Let the Sun Shine",
                author: "Richard Mann",
                img: 'https://rtl.booklovers.ancorathemes.com/wp-content/uploads/2020/05/book1-copyright.jpg',
                price: 10000
            },
            {
                name: "Let the Sun Shine",
                author: "Richard Mann",
                img: 'https://rtl.booklovers.ancorathemes.com/wp-content/uploads/2020/05/book1-copyright.jpg',
                price: 10000
            },
            {
                name: "Let the Sun Shine",
                author: "Richard Mann",
                img: 'https://rtl.booklovers.ancorathemes.com/wp-content/uploads/2020/05/book1-copyright.jpg',
                price: 10000
            },
            {
                name: "Let the Sun Shine",
                author: "Richard Mann",
                img: 'https://rtl.booklovers.ancorathemes.com/wp-content/uploads/2020/05/book1-copyright.jpg',
                price: 10000
            },
            {
                name: "Let the Sun Shine",
                author: "Richard Mann",
                img: 'https://rtl.booklovers.ancorathemes.com/wp-content/uploads/2020/05/book1-copyright.jpg',
                price: 10000
            },
        ]
    }),
    methods: {
        increase() {
            this.quantity++
            if (this.quantity >= 20) {
                this.quantity = 20
            }
        },
        decrease() {
            this.quantity--
            if (this.quantity <= 1) {
                this.quantity = 1
            }
        },
        buyItem() {
            if (this.radios === "") {

                alert("Vui lòng chọn kiểu sách")

            } else {
                alert("Thêm vào giỏ hàng thành công")
            }

        }
    }

}
</script>
<style scoped>
.section {
    padding: 60px 20px;
}

.quantity {
    background-color: white;
    font-size: 20px;
    text-align: center;
    width: 100px;
    height: 50px;
}

.button-quantity {
    display: block;
    width: 24px;
    background-color: white;
}

.button-quantity .btn {
    width: 16px;
}

.btn-buy {
    background-color: black;
    border: 2px solid black;
    border-radius: 0;
}

.btn-buy:hover {
    background-color: #ffffff;
    border: 2px solid black;
    color: black
}

.content {
    font-size: 20px;
    font-family: sans;
    color: rgba(61, 59, 59, 0.723);
    line-height: 40px;
}

.content-detail {
    font-size: 20px;
    font-family: sans;
    color: black;
    font-weight: 500;
    line-height: 40px;
}

.card-title {
    font-size: 50px;
    font-family: sans;
}

.card-text {
    font-size: 20px;
    font-family: sans;
    color: rgba(61, 59, 59, 0.723);
    line-height: 40px;
}

.price {
    color: #de5236;
    font-size: 40px
}

.section1 {
    background-color: #ffffff;
    width: 100%;
    padding: 50px 0px;
    height: auto;
    display: inline-flex;
    align-items: center;
    justify-content: center;
}

.hr {
    width: 200px;
    height: 3px;
    background-color: rgb(223, 223, 223);
    border: 0px;
    margin-left: auto;
    margin-right: auto;
}

.title {
    text-align: center;
    padding: 20px;
    width: 100%;
    height: auto;
}

.card-picked {
    overflow: hidden;
}

.hoverr {
    width: 100%;
    transition: all 0.35s ease;
    height: 100%;
}

.card-picked:hover .hoverr {
    background-color: rgba(0, 0, 0, 0.582);
}
</style>