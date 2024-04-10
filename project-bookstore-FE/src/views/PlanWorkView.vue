<template>
  <div>
    <v-card class=" rounded-xl">
      <v-card-text>
        <v-row>
          <v-col cols="12">
            <v-simple-table class="elevation-1 rounded-xl">
              <template v-slot:top>
                <v-toolbar flat>
                  <v-toolbar-title>Lịch làm việc</v-toolbar-title>
                </v-toolbar>
              </template>
              <template v-slot:default>
                <thead>
                  <tr>
                    <th class="text-left"
                      style="font-size: 14px;font-weight: 600;font-family: JetBrains Mono ; color: black;">
                      Ca làm việc
                    </th>
                    <th v-for="d in days" class="ms-5 text-left"
                      style="font-size: 14px;font-weight: 600;font-family: JetBrains Mono ; color: black;">
                      {{ d }}
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>Ca 1</td>
                    <td>Trần ngọc mẫn</td>
                    <td>Trần ngọc mẫn</td>
                    <td>Trần ngọc mẫn</td>
                    <td>Trần ngọc mẫn</td>
                    <td>Trần ngọc mẫn</td>
                    <td>Trần ngọc mẫn</td>
                    <td>Trần ngọc mẫn</td>

                  </tr>
                  <tr>
                    <td>Ca 2</td>
                    <td>Trần ngọc mẫn</td>
                  </tr>
                  <tr>
                    <td>Cả ngày</td>

                  </tr>


                </tbody>
              </template>
            </v-simple-table>
          </v-col>
          <v-col cols="12">
            <v-card height="300px" color="primary" class="rounded-xl elevation-0">

            </v-card>
          </v-col>

        </v-row>
      </v-card-text>


    </v-card>

    <span></span>

  </div>
</template>
<script>
export default {
  data() {
    return {
      days: ["Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy", "Chủ nhật"]
    }
  },
  mounted() {
  },
  methods: {

  }
}
</script>