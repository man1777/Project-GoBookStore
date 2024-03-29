<template>
    <v-data-table :headers="headers" :items="UserList" class="elevation-1" search>
        <template v-slot:top>
            <v-toolbar flat>
                <v-toolbar-title class="primary--text text-h5">Thông tin nhân viên</v-toolbar-title>
                <v-spacer></v-spacer>
                <v-dialog v-model="dialog" max-width="700px">
                    <template v-slot:activator="{ on, attrs }">
                        <v-btn color="success" fab x-small outlined class="mb-2" @click="openDialog">
                            <v-icon>mdi-plus</v-icon>
                        </v-btn>
                    </template>
                    <v-card>
                        <v-card-title>
                            <span class="text-h5 primary--text">Thông tin nhân viên</span>
                            <v-spacer></v-spacer>
                            <v-btn fab small icon>
                                <v-icon @click="closeDialog">mdi-close</v-icon>
                            </v-btn>
                        </v-card-title>
                        <v-card-text>
                            <v-form>
                                <v-row>
                                    <v-col cols="4">
                                        <v-select :items="UserIdList" v-model="Employee_Obj.user.id" item-text="id"
                                            item-value="id" label="Mã nhân viên" @change="autoFill" outlined dense
                                            hide-details :readonly="editedIndex !== -1"></v-select>
                                    </v-col>
                                    <v-col cols="4">
                                        <v-text-field label="Họ và tên" v-model="Employee_Obj.user.fullname" readonly
                                            outlined dense hide-details></v-text-field>
                                    </v-col>
                                    <v-col cols="4">
                                        <v-text-field label="Email" v-model="Employee_Obj.user.email" readonly outlined
                                            dense hide-details></v-text-field>
                                    </v-col>
                                    <v-col cols="4">
                                        <v-select label="Vị trí" :items="ViTri" v-model="Employee_Obj.position" outlined
                                            dense hide-details></v-select>
                                    </v-col>
                                    <v-col cols="4">
                                        <v-text-field label="Ngày vào làm" v-model="Employee_Obj.startDay" outlined
                                            dense hide-details></v-text-field>
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
                        <v-card-title>Bạn có chắc chắn muốn xóa nhân viên này?</v-card-title>
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

        <template v-slot:item.fullname="{ item }">
            <p>{{ item.user.fullname }}</p>
        </template>

        <template v-slot:item.email="{ item }">
            <p>{{ item.user.email }}</p>
        </template>

        <template v-slot:item.manhanvien="{ item }">
            <p>{{ item.user.id }}</p>
        </template>
    </v-data-table>
</template>

<script>
export default {

    // import {}
    name: "ManagerEmployee",
    data() {
        return {
            dialog: false,
            dialogConfirmDelete: false,
            headers: [
                { text: "Mã nhân viên", value: "manhanvien" },
                { text: "Họ và tên", value: "fullname" },
                { text: "Vị trí", value: "position" },
                { text: "Email", value: "email" },
                { text: "Ngày vào làm", value: "startDay" },
                { text: "Hành động", value: "actions" }
            ],
            UserList: [],
            UserIdList: [],
            ViTri: ["Kỹ sư phần mềm", "Nhân viên bán hàng", "Nhân viên giao hàng", "Kế toán"],
            Employee_Obj: {
                user: {
                    fullname: "",
                    email: "",
                    id: null
                },
                position: "",
                startDay: null
            },
            Employee_Obj_Default: {
                user: {
                    fullname: "",
                    email: "",
                    id: null
                },
                position: "",
                startDay: null
            },
            editedIndex: -1,

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
        delete_emp(item) {
            this.Employee_Obj = Object.assign({}, item)
            this.dialogConfirmDelete = true
        },
        edit_emp(item) {
            this.dialog = true
            this.Employee_Obj = Object.assign({}, item)
            this.Employee_Obj.user = Object.assign({}, item.user)
            this.editedIndex = this.UserList.indexOf(item)
            console.log("item", item.id)
        },
        openDialog() {
            this.dialog = true
        },
        closeDialog() {
            this.dialog = false
            this.Employee_Obj = Object.assign({}, this.Employee_Obj_Default)
            this.Employee_Obj.user = Object.assign({}, this.Employee_Obj_Default.user)
            this.editedIndex = -1
        },
        closeDialogDelete() {
            this.dialogConfirmDelete = false
            this.Employee_Obj = Object.assign({}, this.Employee_Obj_Default)
            this.Employee_Obj.user = Object.assign({}, this.Employee_Obj_Default.user)
        },
        confirmDelete() {
            axios.delete(`http://localhost:8080/rest/deleteEmployee/${this.Employee_Obj.id}`).then(res => {
                this.renderDataTable()
                console.log("Xóa thành công!", res.data)
                this.dialogConfirmDelete = false
            }).catch(err => {
                console.log("Xóa lỗi", err)
            })
        },
        renderDataTable() {
            axios
                .get('http://localhost:8080/rest/getEmployees')
                .then(response => {
                    this.UserList = response.data
                }

                )
        },
        renderUserId() {
            axios
                .get('http://localhost:8080/rest/getEmployeeId')
                .then(response => {
                    this.UserIdList = response.data
                }

                )
        },
        save() {
            if (this.editedIndex === -1) {
                this.insertEmployee();
            } else {
                axios.post("http://localhost:8080/rest/insertEmployee", this.Employee_Obj).then(resp => {
                    this.renderDataTable()
                    console.log("Cập nhật thành công", resp.data)
                    this.closeDialog()
                }).catch(err => (console.log("err", err)))
            }
        },
        insertEmployee() {
            let exist = this.UserList.some(item => item.user.id === this.Employee_Obj.user.id);
            console.log("exist", exist)
            if (exist === true) {
                return alert("Trùng mã nhân viên")
            }
            axios.post("http://localhost:8080/rest/insertEmployee", this.Employee_Obj).then(resp => {
                this.renderDataTable()
                console.log("Insert thành công", resp.data)
                this.closeDialog()
            }).catch(err => (console.log("err", err)))
        },
        autoFill() {
            let obj = this.UserIdList.find(item =>
                item.id === this.Employee_Obj.user.id
            )
            let index = this.UserIdList.indexOf(obj)
            this.Employee_Obj.user.fullname = this.UserIdList[index].fullname
            this.Employee_Obj.user.email = this.UserIdList[index].email

        }
    },
    mounted() {
        this.renderDataTable()
        this.renderUserId()
    }
}
</script>

<style scoped></style>