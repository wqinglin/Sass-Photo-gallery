<template>
	<view>
		<view class="container">
			<check></check>
			<bolang></bolang>
			<record></record>
			<login></login>

			<list :mylist="mylist" :domainUpload="domainUpload"></list>
			<active :domainUpload="domainUpload"></active>
			<view class="img_1">
				<text class="a1">产品精选</text>
			</view>
			<view class="img_2">
				<text class="a1">专属定制</text>
			</view>
			<view class="wrap">
				<u-swiper :list="list" mode="rect" height="400rpx" :effect3d="true" interval="2500"></u-swiper>
			</view>
		</view>
		<zdy-tabbar :current-page="4"></zdy-tabbar>
	</view>
</template>

<script>
	import {
		mapMutations,
		mapGetters
	} from 'vuex'
	
	export default {
		data() {
			return {
				mylist: [],
				pics: [],
				domainUpload: '',
				list: [
					'../../static/my_img/09-51-52.jpg',
					'../../static/my_img/09-51-57.jpg',
					'../../static/my_img/09-58-01.jpg',
				],

				mobile: '',
				orderNum: [],
				tabs: [{
						type: 1,
						icon: "icon-daifukuan",
						title: "待付款"
					},
					{
						type: 2,
						icon: "icon-daifahuo",
						title: "待发货"
					},
					{
						type: 3,
						icon: "icon-daishouhuo",
						title: "待收货"
					},
					{
						type: 4,
						icon: "icon-daipingjia",
						title: "待评价"
					}
				]
			}
		},
		computed: {
			...mapGetters(['hasLogin', 'userInfo'])
		},
		async onLoad() {
			this.domainUpload = this.common.getConfig('domainUpload');
			this.getmylist();
		},
		computed: {
			...mapGetters(['hasLogin', 'userInfo'])
		},
		methods: {
			async getmylist() {
				await this.common.get('/api/mylist', []).then((res) => {
					console.log(res.data);
					this.mylist = res.data;
				})
			},
			
			toOrder: function() {
				if (!this.hasLogin) {
					uni.navigateTo({
						url: '../login/login'
					})
				} else {
					
					uni.showToast({
						icon: 'none',
						title: '订单管理'
					})
				}


			},
			onSkipOrder(type) {

				uni.navigateTo({
					url: '/pages/orderList/orderList?type=' + type
				})
			},
		},
		components: {
			bolang: () => import("../../component/info/bolang.vue"),
			check: () => import("../../component/info/check.vue"),
			login: () => import("../../component/info/login.vue"),
			list: () => import("../../component/info/list.vue"),
			record: () => import("../../component/info/record.vue"),
			active:()=> import("../active/active.vue")
		}
	}
</script>

<style lang="scss">
	.container {
		width: 100%;
		background-image: url(../../static/my_img/10-15-25.png);
		background-size: contain;
		display: flex;
		flex-direction: column;
	}
	.img_1 {
		background-image: url(../../static/my_img/pic_061.jpg);
	}

	.img_2 {
		background-image: url(../../static/my_img/pic_053.jpg);
	}

	.img_1,
	.img_2 {
		background-repeat: no-repeat;
		background-size: contain;
		width: 90%;
		height: calc(100vw * 750 / 1920);
		display: flex;
		margin: 0 auto;
		justify-content: center;
		align-items: center;
	}

	.a1 {
		font-size: 16px;
		font-weight: bold;
		color: #FFFFFF;
	}
</style>
