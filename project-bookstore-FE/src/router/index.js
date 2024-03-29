
import Vue from 'vue'
import VueRouter from 'vue-router'
import HomeView from '../views/HomeView.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView
  },
  {
    path: '/about',
    name: 'about',
    component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  },
  {
    path: '/login',
    name: 'login',
    component: () => import(/* webpackChunkName: "about" */ '../views/Login.vue')
  },
  {
    path: '/DetailProduct',
    name: 'detail',
    component: () => import(/* webpackChunkName: "about" */ '../views/DetailProduct.vue')
  },
  {
    path: '/manager/employee',
    name: 'employee',
    component: () => import(/* webpackChunkName: "about" */ '../views/ManagerEmployee.vue'),
  },
  {
    path: '/manager/products',
    name: 'products',
    component: () => import(/* webpackChunkName: "about" */ '../views/ManagerProducts.vue'),
  },
  {
    path: '/manager/dashboard',
    name: 'dashboard',
    component: () => import(/* webpackChunkName: "about" */ '../views/DashboardView.vue'),
  },
  {
    path: '/manager/orderswaiting',
    name: 'orderswaiting',
    component: () => import(/* webpackChunkName: "about" */ '../views/OrdersWaiting.vue'),
  },
  {
    path: '/manager/ordersshiped',
    name: 'ordersshiped',
    component: () => import(/* webpackChunkName: "about" */ '../views/OrderShiped.vue'),
  },
  {
    path: '/manager/catetoryproduct',
    name: 'catetoryproduct',
    component: () => import(/* webpackChunkName: "about" */ '../views/CatetoryProducts.vue'),
  },
  {
    path: '/manager/orderssuccess',
    name: 'orderssuccess',
    component: () => import(/* webpackChunkName: "about" */ '../views/OrdersSuccess.vue'),
  },
  {
    path: '/manager/ordersback',
    name: 'ordersback',
    component: () => import(/* webpackChunkName: "about" */ '../views/OrdersBack.vue'),
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router 
