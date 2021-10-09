<template>
	<view style="500px">
		<view class='box'>
			<view class="sun">
				<image :src="sun" class='sunbody' style="border-color: #000000;"></image>
				<image :src="eye" class='eye'></image>
			</view>
			<view class="tip-box">
				<text class="tip">SASS</text>
			</view>
		</view>
		<view class="container" @tap="toindex">
			
			<span>Welcome to SASS world</span>
			
			
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				url: 'https://ext.dcloud.net.cn/plugin?id=3971',
				sun: 'https://6e69-niew6-1302638010.tcb.qcloud.la/%E5%85%B6%E4%BB%96%E6%96%87%E4%BB%B6/sun.png?sign=fa5e2acb4d8ae66a8d2073c4c98e6851&t=1611159459',
				eye: 'https://6e69-niew6-1302638010.tcb.qcloud.la/%E5%85%B6%E4%BB%96%E6%96%87%E4%BB%B6/eye.png?sign=4a9c3eb479c2da8c8730499612c78dd5&t=1611159510'
			}
		},
		onLoad() {

		},
		methods: {
			toindex(){
				uni.switchTab({
					url: '../index/index'
				})
			},
		}
	}
</script>

<style>
	.container{
		width: 250px;
		height: 35px;
		text-align: center;
		line-height: 30px;
		margin: auto;
		border: 3px solid #cccccc;
		font-size: 18px;
	}
	.container span{
		background: linear-gradient(to right, #000000, #000000, #919191, #000000, #000000);
		-webkit-background-clip: text;
		color: transparent;
	}
	page {
		background: linear-gradient(to right, #ffffff, #d9d9d9);
		height: 500px;
		font-family: "微软雅黑",sans-serif;
		
	}

	.box {
		display: flex;
		justify-content: center;
		margin-top: 350rpx;
		height: 250px;
		background: linear-gradient(to right, #ffffff, #d9d9d9);
	}

	.sun {
		width: 136rpx;
		height: 136rpx;
		position: absolute;
		left: 0;
		right: 0;
		margin: 0 auto;
		z-index: -1;
		animation: move 2.7s infinite linear;
	}

	.sun .eye {
		position: absolute;
		top: 28%;
		left: 33%;
		width: 22rpx;
		height: 6rpx;
		animation: eye 2.7s infinite linear;
	}

	.sun .sunbody {
		width: 136rpx;
		height: 136rpx;
		animation: scroll 2.7s linear infinite;
		
	}
	
	.tip-box{
		display: flex;
		justify-content: center;
		border-top: 5rpx solid #2C405A;
		width: 250rpx;
		height:200rpx;
	}

	 .tip {
		text-align: center;
		font-family: '苹方';
		padding-top: 10rpx;
		font-size: 25rpx;
		background: linear-gradient(to right, #000000, #000000, #919191, #000000, #000000);
		-webkit-background-clip: text;
		color: transparent;
		animation: opp 2.7s infinite linear;
	}

	@keyframes move {
		0% {
			transform: translateY(0);
		}

		10% {
			transform: translateY(0);
		}

		40% {
			transform: translateY(-55rpx);
		}

		70% {
			transform: translateY(-55rpx);
		}

		100% {
			transform: translateY(0);
		}
	}

	@keyframes scroll {
		0% {
			transform: rotate(0);
		}

		40% {
			transform: rotate(0);
		}

		50% {
			transform: rotate(45deg);
		}

		60% {
			transform: rotate(45deg);
		}

		100% {
			transform: rotate(45deg);
		}
	}

	@keyframes eye {
		0% {
			transform: translateX(0rpx);
		}

		50% {
			transform: translateX(0rpx) scale(1, 1);
		}

		55% {
			transform: translateX(0rpx) scale(1, 0.1);
		}

		60% {
			transform: translateX(0rpx) scale(1);
		}

		70% {
			transform: translateX(26rpx);
		}

		100% {
			transform: translateX(26rpx);
		}
	}

	@keyframes opp {
		0% {
			opacity: 1;
		}

		40% {
			opacity: 1;
		}

		60% {
			opacity: 0;
		}

		100% {
			opacity: 1;
		}
	}
</style>
