<template>
	<view class="tabbar-container">
		<block>
			<view class="tabbar-item" v-for="(item, index) in tabbarList "  :key="index"
				:class="[item.centerItem ? ' center-item' : '']" @click="changeItem(item)">
				<view class="item-top">
					<image :src="currentItem == item.id ? item.selectIcon : item.icon"></image>
				</view>
				<view class="item-bottom" :class="[currentItem == item.id ? 'item-active' : '']">
					<text>{{ item.text }}</text>
				</view>
			</view>
		</block>
	</view>
</template>

<script>
	export default {
		props: {
			currentPage: {
				type: Number,
				default: 0
			}
		},
		data() {
			return {
				currentItem: 0,
				tabbarList: [{
						id: 0,
						path: '/pages/index/index',
						icon: "/static/images/shouye_1.png",
						selectIcon: "/static/images/shouye_2.png",
						text: '首页',
						centerItem: false
					},
					{
						id: 1,
						path: '/pages/category/category',
						icon: '/static/images/chanpinfrnlei.png',
						selectIcon: '/static/images/chanpinfenlei2.png',
						text: '分类',
						centerItem: false
					},
					{
						id: 2,
						icon: '/static/logo.png',
						selectIcon: '/static/logo.png',
						centerItem: true
					},
					{
						id: 3,
						path: '/pages/cart/cart',
						icon: '/static/images/gouwuche_1.png',
						selectIcon: '/static/images/gouwuche_2.png',
						text: '购物车',
						centerItem: false
					},
					{
						id: 4,
						path: '/pages/my/my',
						icon: '/static/images/wode.png',
						selectIcon: '/static/images/wode2.png',
						text: '我的',
						centerItem: false
					}
				]
			};
		},
		mounted() {
			this.currentItem = this.currentPage;
			uni.hideTabBar();
		},
		methods: {
			changeItem(item) {
				let _this = this;
				//_this.currentItem = item.id;
				uni.switchTab({
					url: item.path
				});
			}
		}
	};
</script>

<style>
	view {
		padding: 0;
		margin: 0;
		box-sizing: border-box;
	}

	.tabbar-container {
		position: fixed;
		bottom: 0;
		left: 0;
		width: 100%;
		height: 100rpx;
		box-shadow: 0 0 5px #999;
		display: flex;
		align-items: center;
		padding: 5rpx 0;
		color: #999999;
	}

	.tabbar-container .tabbar-item {
		width: 20%;
		height: 100rpx;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		text-align: center;
	}

	.tabbar-container .item-active {
		color: #1a7785;
	}

	.tabbar-container .center-item {
		display: block;
		position: relative;
	}

	.tabbar-container .tabbar-item .item-top {
		width: 70rpx;
		height: 80rpx;
		padding: 8rpx;
	}

	.tabbar-container .center-item .item-top {
		flex-shrink: 0;
		width: 100rpx;
		height: 100rpx;
		position: absolute;
		top: -50rpx;
		left: calc(50% - 50rpx);
		border-radius: 50%;
		box-shadow: 0 0 5px #999;
		background-color: #ffffff;
	}

	.tabbar-container .tabbar-item .item-top image {
		width: 100%;
		height: 100%;
		border-radius: 50%
	}

	.tabbar-container .tabbar-item .item-bottom {
		font-size: 25rpx;
		width: 100%;
	}

	.tabbar-container .center-item .item-bottom {
		position: absolute;
		bottom: 5rpx;
	}
</style>
