<template>
    <div class="navbar">
        <div class="logo mr-2">
            <v-img src="https://rtl.booklovers.ancorathemes.com/wp-content/uploads/2021/03/logo-retinax2.png"
                width="200px"></v-img>
        </div>
        <a href="/" class="navbar-item">Trang chủ</a>
        <a href="/about" class="navbar-item">Mục lục sách</a>
        <a href="/test" class="navbar-item">Sách bán chạy nhất</a>
        <a href="/" class="navbar-item">Tin mới nhất</a>
        <a href="/manager" class="navbar-item">Quản lý</a>
        <v-spacer></v-spacer>
        <div>
            <v-badge color="green" content="6" overlap class="pt-1">
                <v-icon class="me-2">
                    mdi-cart-variant</v-icon>
            </v-badge>
            <a class="user ml-2" href="">Giỏ hàng</a>
        </div>
        <div>
            <v-icon class="me-2 ">mdi-account</v-icon>
            <a class="user" href="/login">Username</a>
        </div>
    </div>
</template>
  
<script>

export default {
    name: "NavbarComp",
    data: () => ({
        //
    }),
};
</script>
<style scoped>
.content-link {
    line-height: 40px;
    letter-spacing: 2px;
}

.content-link a {
    text-decoration: none;
    display: block;
    font-size: 25px;
    font-family: sans;
    color: rgba(0, 0, 0, 0.59)
}

.content-link a:hover {
    color: #de3241
}

.tittle {
    font-family: sans;
    font-size: 30px;
}

.navbar {
    display: flex;
    padding: 0px;
    width: 100%;
    justify-content: center;
    gap: 20px;
    background-color: #eae9e9;
    padding: 5px 20px;
    height: 100px;
    align-items: center;
}

.footer {
    width: 100%;
    height: auto;
    background-color: #eae9e9;
    padding: 100px 40px;
}

.navbar-item {
    color: rgb(4, 4, 4);
    text-decoration: none;
    position: relative;
    display: block;
    padding: 5px 0px;
    font-size: 20px;
    font-weight: 450;

}

.navbar-item:hover {
    color: #de3241
}



.navbar-item:after {
    content: "";
    position: absolute;
    height: 3px;
    width: 100%;
    background-color: #de3241;
    bottom: 0;
    left: 0;
    transform: scaleX(0);
    transition: 0.3s ease 0s;
}

.navbar-item:hover:after {
    transform: scaleX(1);

}

.navbar {
    margin-right: 25px;
}

.user {
    color: rgb(15, 15, 15);
    text-decoration: none;
    font-size: 20px;
    font-weight: 500;
}

.cart {
    display: block;
    justify-content: center;
}
</style>
  