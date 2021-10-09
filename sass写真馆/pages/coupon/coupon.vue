<template>
	<view class="page">
		<view class="wrapper" v-for='item in courseIntr.coupon' :key='item.id'>
			<!-- 左侧box -->
			<view class="content">
				
				<view>
					<text class="moyfh">¥</text>
					<text class="moneyNum">{{Math.round(item.coupon_fee)}}</text>
				</view>
				<view class="oilline  linwidth160 lineBt"></view>
			</view>

			<view class="split-line"></view>
			<!-- 右侧box -->
			<view class="tip">
				<view class="oilline linwidth227 lineBt "></view>
				<view class="vnameBx">
					<view class="couponmaes">{{item.coupon_name}}</view>
					<view class="couponmaes">满{{Math.round(item.total_fee)}}减{{Math.round(item.coupon_fee)}}元</view>
				</view>
				<view class="oilline linwidth227 lineBt"></view>
				<view class="btnbx" :class="item.isJoin==200?'':'moveCm'" :disabled="item.isFlag">
					<view class="btnw" :class="item.isJoin==200?'btnBgGray':'btnBgActive'">
						<view class="btnn" :disabled="true" @click="ling">{{isling?'已':''}}领取</view>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				isSelectCoupon: [],
				theme: '#f60',
				msg: '领取优惠卷',
				serviceClass: '', //show  , hide 弹窗css类，控制开关动画
				courseId: null,
				courseIntr: '',
				isJoin: "200",
				btnTxt: "领取成功",
				isling:false,
			}			
		},
		onLoad(option) {
			this.common.post('/api/getCoupon/').then((res) => {
				this.isSelectCoupon = res.data;

			})
			// 获得课程接口
			uni.showLoading();
			this.common.get('/api/getCourseDetail/1').then((res) => {
				uni.hideLoading();
				this.courseIntr = res.data;
				this.poster = this.common.getConfig('domainUpload') + res.data.imgurl
				this.videoSrc = this.common.getConfig('domainUpload') + res.data.video_src
				if (this.isSelectCoupon) {
					this.courseIntr.coupon.filter((item, index, self) => {
						let n = this.isSelectCoupon.some((item2) => {
							return item2.couponId == item.id
						})
						if (n) {
							return item.isFlag = true
						} else {
							return item.isFlag = false
						}
					})
				}
				console.log(this.courseIntr.coupon);
			})
			},
			methods: {
				getCoupon: function(id) {
					var that = this
					uni.getStorage({
						key: 'userInfo',
						success: function(result) {
							that.common.post('/api/storeCoupon/1').then((res) => {
								if (res.code == 1) {
									this.courseIntr.coupon.map((item, index, self) => {
										if (item.id == id) {
											return item.isFlag = true
										} else {
											return item.isFlag = false
										}
									})
								}

							})
						},
						fail: function() {
							uni.showModal({
								content: '还没登录?先去登录吧',
								success: function(res) {
									if (res.confirm) {
										uni.navigateTo({
											url: '../login/login'
										})
									} else if (res.cancel) {
										return false
									}
								}
							})
						}
					})

				},
				ling(){
					this.isling = this.isling ? false : true;
				},
			}
			}
</script>

<style>
	.page {
		width: 100%;
		height: 100%;
		min-height: 100vh;
		padding-top: 59rpx;
		padding-bottom: 38rpx;
		box-sizing: border-box;
		position: relative;
		background: #000;
	}


	.wrapper {
		width: 670rpx;
		height: 226rpx;
		margin: 0 auto;
		display: flex;
		background: linear-gradient(135deg, rgba(219, 93, 115, 1) 0%, rgba(137, 29, 34, 1) 100%);
		border-radius: 20rpx;
		margin-bottom: 28rpx;
	}

	/*前半部分样式*/
	.content {
		position: relative;
		height: 229rpx;
		flex: 0 0 200rpx;
		text-align: center;
		overflow: hidden;
		border-top-left-radius: 18rpx;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}

	/*后半部分样式*/
	.tip {
		position: relative;
		flex: 1;
		height: 229rpx;
		box-sizing: border-box;
		padding-left: 20rpx;
		display: flex;
		flex-direction: column;
		justify-content: center;
	}

	/*中间竖直虚线样式*/
	.split-line {
		position: relative;
		flex: 0 0 0;
		margin: 0 10rpx 0 6rpx;
		border-left: 2rpx dashed #fff;
	}

	/*给虚线加两个伪类，基本样式如下*/
	.split-line:before,
	.split-line:after {
		content: '';
		position: absolute;
		width: 32rpx;
		height: 16rpx;
		background: #000;
		left: -18rpx;
		z-index: 1;
	}

	/*几个伪类化成的圆弧的样式以及位置（置于顶部）我把它放在一起了*/
	.content:before,
	.tip:before,
	.split-line:before {
		border-radius: 0 0 16rpx 16rpx;
		top: 0;
	}

	/*几个伪类化成的圆弧的样式以及位置（置于底部）我把它放在一起了*/
	.content:after,
	.tip:after,
	.split-line:after {
		border-radius: 16rpx 16rpx 0 0;
		bottom: 0;
	}


	.couponCount {
		width: 150rpx;
		height: 150rpx;
		font-size: 30rpx;
		font-family: PingFangSC-Semibold, PingFang SC;
		font-weight: 600;
		color: rgba(140, 31, 37, 1);
		transform: rotate(-45deg);
		position: absolute;
		text-align: center;
		line-height: 259rpx;
		top: -78rpx;
		left: -78rpx;
		background: linear-gradient(319deg, rgba(244, 219, 160, 1) 0%, rgba(255, 255, 255, 1) 100%);
	}

	.oilline {
		background: linear-gradient(to right,
				rgba(0, 0, 0, 0) 0%,
				rgba(0, 0, 0, 0) 10%,
				rgba(255, 255, 255, 0.3) 20%,
				rgba(255, 255, 255, 0.4) 30%,
				rgba(255, 255, 255, 0.5) 40%,
				rgba(255, 255, 255, 0.8) 50%,
				rgba(255, 255, 255, 0.5) 60%,
				rgba(255, 255, 255, 0.4) 70%,
				rgba(255, 255, 255, 0.3) 80%,
				rgba(0, 0, 0, 0) 90%,
				rgba(0, 0, 0, 0) 100%);
		height: 2rpx;
	}

	.linwidth227 {
		width: 227rpx;
	}

	.linwidth160 {
		width: 160rpx;
	}

	.moyfh {
		font-size: 69rpx;
		font-family: PingFangSC-Semibold, PingFang SC;
		font-weight: 600;
		color: rgba(255, 255, 255, 1);
		margin-right: -2rpx;
	}

	.moneyNum {
		font-size: 80rpx;
		font-family: PingFangSC-Semibold, PingFang SC;
		font-weight: 600;
		color: rgba(255, 255, 255, 1);
	}

	.couponmaes {
		font-size: 30rpx;
		font-family: PingFangSC-Semibold, PingFang SC;
		font-weight: 600;
		color: rgba(255, 255, 255, 1);
		width: 260rpx;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 1;
		-webkit-box-orient: vertical;
	}

	.vnameBx {
		text-align: center;
		width: 227rpx;
		margin: 25rpx 0;
	}

	.btnbx {
		position: absolute;
		right: 0;
		top: 0;
		bottom: 0;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.btnw {
		display: flex;
		justify-content: center;
		align-items: center;
		width: 148rpx;
		height: 148rpx;
		border-radius: 50%;
		margin-right: 30rpx;
	}

	.btnBgActive {
		color: rgba(140, 31, 37, 1);
		box-shadow: 0px 2px 29px 0px rgba(77, 12, 15, 0.56);
		background: linear-gradient(319deg, rgba(244, 219, 160, 1) 0%, rgba(255, 255, 255, 1) 100%);
	}

	.btnBgGray {
		box-shadow: 0px 2px 29px 0px rgba(77, 12, 15, 0.56);
		background: #999;
		color: #fff;
	}

	.btnn {
		font-size: 30rpx;
		font-family: PingFangSC-Semibold, PingFang SC;
		font-weight: 600;
		width: 120rpx;
		height: 120rpx;
		border-radius: 50%;
		border: 1rpx solid rgba(142, 33, 39, 1);
		text-align: center;
		box-sizing: border-box;
		padding: 18rpx;
		line-height: 46rpx;
		display:flex;
		align-items: center;
		justify-content: center;
	}

	.moveCm {
		animation: scale 0.8s ease-in-out infinite alternate;
	}

	@keyframes scale {
		0% {
			transform: scale(0.92);
		}

		100% {
			transform: scale(1);
		}
	}
</style>
