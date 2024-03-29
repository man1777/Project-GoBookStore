<template>
    <div class="footer">
        <v-row>
            <v-col cols="3">
                <h1>LOGO HERE</h1>
            </v-col>
            <v-col cols="3">
                <p class="tittle">LINHKS</p>
                <hr class="mt-3" style="width: 50%;">
                <div class="content-link mt-6">
                    <a href="">Home</a>
                    <a href="">About Us</a>
                    <a href="">Blog</a>
                    <a href="">Store</a>
                    <a href="">Contact Us</a>
                </div>

            </v-col><v-col cols="3">
                <p class="tittle">LIÊN HỆ CHÚNG TÔI</p>
                <hr class="mt-3">
                <div class="content-link mt-6">
                    <p>FPT Polytechnic cơ sở 3, Đường Tô Ký, Quận 12, TP. Hồ Chí Minh.</p>
                    Email: mantnps22526@fpt.edu.vn
                </div>

            </v-col>
        </v-row>
    </div>
</template>
  
<script>

export default {
    name: "FooterComp",
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
  