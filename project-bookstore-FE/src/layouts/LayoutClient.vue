<template>
    <div>
        <NavbarComp></NavbarComp>
        <v-main><router-view></router-view></v-main>
        <FooterComp></FooterComp>
    </div>
</template>
<script>

import { FooterComp, NavbarComp } from '../components'
export default {
    name: "LayoutClient",
    data: () => ({
        //
    }),
    components: {
        FooterComp,
        NavbarComp
    },
}
</script>
<style ></style>