import Vue from 'vue'
import store from './store'
import App from './App'
import common from './common/common.js'
Vue.prototype.common = common

import zdyTabbar from "component/zdy-tabbar.vue"
import uView from 'uview-ui';
Vue.use(uView);

Vue.component('zdy-tabbar', zdyTabbar)
Vue.prototype.common = common

Vue.config.productionTip = false

App.mpType = 'app'

const app = new Vue({
	store,
    ...App
})
app.$mount()
