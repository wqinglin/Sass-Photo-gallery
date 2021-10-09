<template>
	<view class="record">
		<view @click="toCoupon">
			<text><b class="sty">0</b>张</text>
			<view class="pro">优惠券</view>
		</view>
		<view @click="toCere">
			<text><b class="sty">0</b></text>
			<view class="pro">纪念值</view>
		</view>
		<view @click="toXunzhang">
			<text><b class="sty">0</b></text>
			<view class="pro">勋章</view>
		</view>
		<view @click="toGift">
			<text><b class="sty">0.00</b></text>
			<view class="pro">礼品卡</view>
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
			return {

			}
		},
		computed: {
			...mapGetters(['hasLogin', 'userInfo'])
		},
		methods: {
			toCoupon() {
					uni.showToast({
						icon: 'none',
						title: '暂无优惠券'
					})
			},
			toCere() {
				if (!this.hasLogin) {
					uni.navigateTo({
						url: '../login/login'
					})
				} else {
					uni.showToast({
						icon: 'none',
						title: '暂无纪念值'
					})
				}
			},
			toXunzhang() {
				if (!this.hasLogin) {
					uni.navigateTo({
						url: '../login/login'
					})
				} else {
					uni.showToast({
						icon: 'none',
						title: '暂无勋章'
					})
				}

			},

			toGift() {
				if (!this.hasLogin) {
					uni.navigateTo({
						url: '../login/login'
					})
				} else {
					uni.showToast({
						icon: 'none',
						title: '暂无礼品卡'
					})
				}
			}
		}
	}
</script>

<style>
	.record {
		height: 150rpx;
		display: flex;
		justify-content: space-around;
		align-items: center;
		text-align: center;
		margin-top: 5%;
	}

	.pro {
		font-size: 28rpx;
		color: #828282;
		padding: 10rpx 0px;
		box-sizing: border-box;
	}

	.sty {
		font-weight: bold;
		font-size: 50rpx;
	}
</style>
