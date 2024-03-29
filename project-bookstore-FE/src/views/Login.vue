<template>
    <v-container>
        <v-row align="center" justify="center">
            <v-col cols="12" sm="10">
                <v-card class="elevation-6 mt-15 mb-15">
                    <v-window v-model="step">
                        <v-window-item :value="1">
                            <v-row>
                                <v-col cols="12" sm="6">
                                    <v-card-text class=" mt-8">
                                        <h3 class="text-center">ĐĂNG NHẬP</h3>
                                        <v-row align="center" justify="center">
                                            <v-col cols="12" sm="8">
                                                <v-text-field label="Email" outlined dense color="blue" autocomplete="false"
                                                    class="mt-16"></v-text-field>
                                                <v-text-field label="Password" type="password" outlined dense color="blue"
                                                    autocomplete="false"></v-text-field>
                                                <v-row>
                                                    <v-col cols="12" sm="7">
                                                        <v-checkbox label="Lưu đăng nhập" class="mt-n1"
                                                            color="blue"></v-checkbox>
                                                    </v-col>
                                                    <v-col cols="12" sm="5">
                                                        <span class="caption blue--text">Quên mật khẩu</span>
                                                    </v-col>
                                                </v-row>
                                                <v-btn color="blue" block>Sign in</v-btn>
                                                <h5 class="text-center grey--text mt-4 mb-3">hoặc đăng nhập với </h5>
                                                <div class="d-flex justify-space-between align-center mx-5 mb-16">
                                                    <v-btn outlined color="blue" class="elevation-1">
                                                        <v-icon color="blue">mdi-facebook</v-icon>
                                                    </v-btn>
                                                    <v-btn outlined color="red" class="elevation-1">
                                                        <v-icon color="red">mdi-google</v-icon>
                                                    </v-btn>
                                                    <v-btn outlined color="red" class="elevation-1">
                                                        <v-icon color="red">mdi-gmail</v-icon>
                                                    </v-btn>
                                                </div>
                                            </v-col>
                                        </v-row>
                                    </v-card-text>
                                </v-col>
                                <v-col cols="12" sm="6" class=" rounder-bl-xl" style="height:569.78px">
                                    <div style="padding:180px 0; text-align: center;">
                                        <v-card-text class="white--text">
                                            <h2 class="text-center">Don't have account yet?</h2>
                                            <h5 class="text-center">Let's create a account now</h5>
                                        </v-card-text>
                                        <div class="text-center">
                                            <v-btn tile dark outlined @click="step++">Sign Up</v-btn>
                                        </div>
                                    </div>
                                </v-col>
                            </v-row>
                        </v-window-item>
                        <v-window-item :value="2">
                            <v-row>
                                <v-col cols="12" sm="6" class=" rounder-br-xl">
                                    <div style="padding:180px 0; text-align: center;">
                                        <v-card-text class="white--text">
                                            <h2 class="text-center">Do you have account already?</h2>
                                            <h5 class="text-center">Let's sign in now</h5>
                                        </v-card-text>
                                        <div class="text-center">
                                            <v-btn tile dark outlined @click="step--">Sign In</v-btn>
                                        </div>
                                    </div>
                                </v-col>
                                <v-col cols="12" sm="6">
                                    <v-card-text class="mt-12">
                                        <h3 class="text-center">ĐĂNG KÝ TÀI KHOẢN</h3>
                                    </v-card-text>
                                    <v-row align="center" justify="center">
                                        <v-col cols="12" sm="10">
                                            <v-row>
                                                <v-col cols="12" sm="6">
                                                    <v-text-field label="Họ và tên" outlined dense color="blue"
                                                        autocomplete="false" class="mt-4"></v-text-field>
                                                </v-col>
                                                <v-col cols="12" sm="6">
                                                    <v-text-field label="Số điện thoại" outlined dense color="blue"
                                                        autocomplete="false" class="mt-4"></v-text-field>
                                                </v-col>
                                            </v-row>
                                            <v-text-field label="Email" outlined dense color="blue"
                                                autocomplete="false"></v-text-field>
                                            <v-text-field label="Password" type="password" outlined dense color="blue"
                                                autocomplete="false"></v-text-field>
                                            <v-row>
                                                <v-col cols="12" sm="7">
                                                    <v-checkbox label="I accept terms" class="mt-n1"
                                                        color="blue"></v-checkbox>
                                                </v-col>
                                                <v-col cols="12" sm="5">
                                                    <span
                                                        style="justify-content: center; text-align: center; color:rgb(161, 131, 95);margin-top: 5px;">Terms</span>
                                                </v-col>
                                            </v-row>
                                            <v-btn block color="blue">Đăng ký</v-btn>
                                            <h5 class="text-center grey--text mt-4 mb-3">hoặc đăng ký với </h5>
                                            <div class="d-flex justify-space-between align-center mx-15 mb-16">
                                                <v-btn depressed outlined tile>
                                                    <v-icon color="blue">mdi-facebook</v-icon>
                                                </v-btn>
                                                <v-btn depressed outlined tile>
                                                    <v-icon color="red">mdi-google</v-icon>
                                                </v-btn>
                                                <v-btn depressed outlined tile>
                                                    <v-icon color="red">mdi-gmail</v-icon>
                                                </v-btn>
                                            </div>
                                        </v-col>
                                    </v-row>
                                </v-col>
                            </v-row>
                        </v-window-item>
                    </v-window>
                </v-card>
            </v-col>
        </v-row>
    </v-container>
</template>
<script>
export default {
    data: () => ({
        step: 1
    }),
    propos: {
        source: String
    }
}
</script>
<style scoped>
.v-application .rounder-bl-xl {
    border-bottom-left-radius: 300px !important;
    background-color: rgba(0, 255, 102, 0.747);
}

.v-application .rounder-br-xl {
    border-bottom-right-radius: 300px !important;
    background-color: rgba(0, 255, 102, 0.747);
}
</style>