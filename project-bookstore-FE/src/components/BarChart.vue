<template>
    <Bar ref="mychart" :options="chartOptions" :data="chartData" />
</template>

<script>
import { Bar } from 'vue-chartjs'
import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

export default {
    extends: Bar,
    props: ["data", "option"],
    name: 'BarChart',
    components: { Bar },
    computed: {
        chartData: function () {
            return this.data
        },
        chartOptions: function () {
            return this.option
        }
    },

}
</script>