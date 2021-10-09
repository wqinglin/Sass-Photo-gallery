<template>
	<view class="welfare">
		<swiper :autoplay="true" :interval="3000" :duration="1000" circular vertical="true">
			<swiper-item class="item" v-for="swiper in swipers" :key="swiper.id">
				<view class="box">
					<view class="act">
						<text class="f3">{{swiper.name}}</text>
						<text class="f4">{{swiper.description}}</text>
					</view>
					<image class="act-img" :src="domainUpload+swiper.imgurl"></image>
				</view>
			</swiper-item>
		</swiper>
	</view>
</template>

<script>
	export default {
		data() {
			return {

			}
		},
		methods: {

		},
		props: {
			swipers: {
				type: Array,
				value: []
			},
			domainUpload: {
				type: String,
				value: ''
			}
		}
	}
</script>

<style>
	.welfare {
		width: 49%;
	}

	.welfare swiper {
		width: 100%;
		height: 180rpx;
	}

	.item {
		display: flex;
	}

	.welfare .box {
		width: 100%;
		height: 180rpx;
		display: flex;
		border: 2px #eee solid;
		box-shadow: 0px 0px 6rpx rgba(0, 0, 0, .4);
		justify-content: space-around;
		align-items: center;
		border-radius: 25rpx;
	}

	.act {
		line-height: 60rpx;
	}

	.f3 {
		font-size: 30rpx;
		display: block;
	}

	.f4 {
		font-size: 20rpx;
		color: #ADADAD;
	}

	.box .act-img {
		width: 120rpx;
		height: 120rpx;
	}
</style>
