<template>
	<view>
		<standard :conList="conList" :conList1="conList1" :domainUpload="domainUpload"></standard>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				domainUpload: '',
				 conList:[],
				 conList1:[]
			}
		},
		onLoad: function(options) {
			this.domainUpload = this.common.getConfig('domainUpload');
			this. getStandard();
			this. getStandard1();
		},
		methods: {
			async getStandard() {
				await this.common.get('/api/activities?currentPage=1', []).then((res) => {
					console.log(res)
					console.log(res.data)
					this.conList = res.data
				})
			},
			async getStandard1() {
				await this.common.get('/api/activities?currentPage=2', []).then((res) => {
					console.log(res)
					console.log(res.data)
					this.conList1 = res.data
				})
			},
		},
		components: {
			standard: () => import("../../component/info/standard.vue")
		}
	};
</script>
