<template>
    <div>
        <canvas ref="myChart"></canvas>
    </div>
</template>
<script>
import Chart from 'chart.js/auto'
export default {
    name: "lineChart",
    props: ['data', 'options'],
    data() {
        return {
            config: {
                type: 'line',
                data: this.data,
                plugins: []
            },
            myChart: null,
        }
    },
    watch: {
        data: {
            deep: true,
            handler(newValue) {
                this.myChart.destroy();
                this.config.data = newValue;
                this.myChart = new Chart(this.$refs.myChart, this.config);
            }
        }
    },
    mounted() {
        this.myChart = new Chart(this.$refs.myChart, this.config);
    }

}
</script>
<style></style>