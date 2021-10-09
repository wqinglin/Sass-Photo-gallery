<template>
	<view>
		<view class="notlogin" v-show="!hasLogin">
			<view class="l1" @click="toLogin">
				请先登录
			</view>
			<view class="l2" @click="toLogin">
				立即登录 >
			</view>
		</view>
		<view class="islogin" v-show="hasLogin">
			<image class="pic" src="../../static/my_img/13-29-09.png" mode="" @click="member"></image>
			<view class="l1">
				<text class="f5">新鲜人</text>
				<text class="f6">会员特权,一键触发</text>
			</view>
			<view class="l2" @click="member">
				会员中心 >
			</view>
		</view>
	</view>
</template>

<script>
	import {
		mapMutations,
		mapGetters
	} from 'vuex'
	export default {
		data() {
			return {}
		},
		computed: {
			...mapGetters(['hasLogin', 'userInfo'])
		},
		methods:{
			member(){
				uni.navigateTo({
					url: "../member/member",
				})
			},
			toLogin() {
				if (this.hasLogin) { // 已经登录，就结束，否则去登录
					return false
				}
				uni.navigateTo({
					url: '../login/login'
				})
			}
		}
	}

	
</script>

<style>
	.notlogin {
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 95%;
		margin: 0 auto;
		height: 150rpx;
		background: linear-gradient(to right, rgb(236, 161, 21), rgb(252, 123, 3));
		border-radius: 20rpx;
		line-height: 150rpx;
		color: #fff;
	}

	.islogin {
		position: relative;
		display: flex;
		justify-content: space-between;
		align-items: center;
		width: 95%;
		margin: 0 auto;
		height: 150rpx;
		background: linear-gradient(to right, rgb(2, 207, 176), rgb(36, 127, 140));
		border-radius: 20rpx;
		line-height: 150rpx;
		color: #fff;
	}

	.l1 {
		padding-left: 70rpx;
		font-size: 34rpx;
		display: flex;
		flex-direction: column;
		box-sizing: border-box;
	}

	.l2 {
		margin-right: 40rpx;
		width: 170rpx;
		height: 50rpx;
		line-height: 50rpx;
		font-size: 24rpx;
		background: linear-gradient(to right, #e6e6e6, #a8a8a8);
		text-align: center;
		border-radius: 25rpx;
		color: #000000;
		font-weight: bold;
	}

	.pic {
		position: absolute;
		width: 90rpx;
		height: 90rpx;
		left: 50rpx;
	}

	.f5,
	.f6 {
		line-height: 50rpx;
		padding-left: 90rpx;
	}

	.f5 {
		font-size: 32rpx;
	}

	.f6 {
		font-size: 16rpx;
	}
</style>
