<template>
	<view class="sass-box">
		<view class="header"></view>
		<view class="font">SASS写真馆</view>
		<!-- 轮播图 -->
		<view class="swiper" style="height: 500px; margin-top: 10%;">
			<uni-swiper-dot :current="current" field="content" :mode="mode" :dots-styles="dotsStyles">
				<swiper :autoplay="true" :interval="3000" :duration="1000" circular class="swiper-warps"
					@change="change">
					<swiper-item class="swiper-item">
						<image src="../../../static/LB/sassLB1.png"></image>
					</swiper-item>
					<swiper-item class="swiper-item">
						<image src="../../../static/LB/sassLB2.png"></image>
					</swiper-item>
				</swiper>
			</uni-swiper-dot>
		</view>
		<!-- 商品展示 -->
		<view class="unique">
			<view class="part-header" @tap="todetail">
				<view class="part-font"  >
					UNIQUE
					<p style="font-size: 14px; font-weight: 500; ">热卖商品</p>
				</view>
				<view style="font-size: 27px; font-weight: 600; color: #000000; margin-top: 10%;" >></view>
			</view>
			<!-- unique商品 -->
			<view class="goods-box">
			
				<view class="item"  v-for="course in courseList" :key="course.id" >
					<image class="img" :src="domainUpload+course.imgurl" @tap="todetail"></image>
				</view>

			</view>

		</view>
		<view style="height: 300px;"></view>
		
	</view>
</template>

<script>
	export default {
		data() {
			return {
				mode: 'default',
				current: 0,
				dotsStyles: {
					backgroundColor: 'rgba(238, 238, 238, 0.3)',
					border: '1px rgba(238, 238, 238, 0.3) solid',
					color: '#fff',
					selectedBackgroundColor: 'rgba(255, 143, 0, 0.9)',
					selectedBorder: '1px rgba(255, 143, 0, 0.9) solid',

				},
				courseList: [],
				domainUpload: '',
				



			}
		},
		mounted() {
			this.domainUpload = this.common.getConfig('domainUpload');
			this.getunique();

		},
		methods: {
			change(e) {
				this.current = e.detail.current;
			},
		async  getunique() {
			await this.common.get('/api/getswiper',[]).then((res) => {
				this.courseList=res.data.splice(4,8)
				// this.packageList=res.data.splice(4,8)
				console.log('======================================')
				console.log(this.courseList)
				
			})
		},
		todetail() {
			uni.navigateTo({
				url: '../../pages/detail/detail'
			})
		},
		},
	}
</script>

<style lang="scss" scoped>
	// 全部渐变底色
	.sass-box {
		color: #e2e2e2;
		background: linear-gradient(70deg, #ffffff, #d9d9d9);
		width: 100%;
		height: 100%;

	}

	// 开头渐变条
	.header {
		width: 100%;
		height: 10rpx;
		background: linear-gradient(to right, #104c54, #28bfd0);
	}

	.font {
		background: linear-gradient(to right, #000000, #000000, #a5a5a5, #000000, #000000);
		-webkit-background-clip: text;
		color: transparent;
		font-size: 20px;
		text-align: center;
		margin-top: 10%;
		font-weight: 600;
	}

	// 轮播图
	.swiper {
		height: 510px !important;
	}

	.swiper-warps {
		height: 510px;
	}

	.swiper-item image {
		width: 100% !important;
		height: 510px !important;
	}

	// 栏目头部样式
	.part-header {
		box-sizing: border-box;
		padding: 0px 16px;
		display: flex;
		justify-content: space-between;



	}

	.part-font {
		margin-top: 10%;
		width: 100%;
		height: 80px;
		color: #000000;
		font-size: 25px;
		font-weight: 600;
	}

	// 商品布局
	.goods-box {
		display: flex;
		box-sizing: border-box;
		padding: 0 4%;
		justify-content: space-between;
		flex-wrap: wrap;
		height: 600px;
	}

	.item {
		width: 45%;
		height: 200px;
		background-color: #f1f8ff;
		margin-bottom: 10px;
	}
	.img{
		width: 100%;
		height: 200px;
	}
</style>
