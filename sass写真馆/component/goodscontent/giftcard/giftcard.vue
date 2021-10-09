<template>
	<view class="sass-box">
		<view class="header"></view>
		<view class="font">SASS GIFTS </view>
		<view class="swiper" style="height: 500px; margin-top: 10%;">
			<uni-swiper-dot  :current="current" field="content" :mode="mode" :dots-styles="dotsStyles">
				
				<swiper :autoplay="true" :interval="3000" :duration="1000" circular class="swiper-warps"
					@change="change" >
					<swiper-item class="swiper-item" >
						<image  src="../../../static/LB/giftLB1.png"></image>
					</swiper-item>
					<swiper-item class="swiper-item" >
						<image  src="../../../static/LB/giftLB2.png"></image>
					</swiper-item>
				</swiper>
			</uni-swiper-dot>
		</view>
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
				
			}
		},
		onLoad() {
			

		},
		methods: {
			change(e) {
				this.current = e.detail.current;
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
		height: 1500rpx;

	}

	// 开头渐变条
	.header {
		width: 100%;
		height: 10rpx;
		background: linear-gradient(to right, #c64263, #ff6f95);
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
		height: 300px !important;
	}
</style>
