<template>
	<view class="move-img">
		<activities :swipers="act" :domainUpload="domainUpload"></activities>
		<activities :swipers="act1" :domainUpload="domainUpload"></activities>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				act:[],
				act1:[]
			}
		},
		mounted: function(options) {
			this.getactivities();
			this.getactivities1()
		},
		props:{
			domainUpload:{
				type:String,
				default:''
			}
		},
		methods: {
			async getactivities() {
				await this.common.get('/api/activities?currentPage=3', []).then((res) => {
					console.log(res)
					console.log(res.data)
					this.act = res.data
				})
			},
			async getactivities1() {
				await this.common.get('/api/activities?currentPage=4', []).then((res) => {
					console.log(res)
					console.log(res.data)
					this.act1 = res.data
				})
			},
			

		},
		components: {
			activities: () => import("../../component/info/activities.vue")
		}
	};
</script>
<style>
	.move-img {
		margin: 0 auto;
		display: flex;
		width: 94%;
		height: 220rpx;
		justify-content: space-between;
		align-items: center;
	}
</style>
