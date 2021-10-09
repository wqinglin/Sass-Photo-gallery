<template>
	<view class="check" @click="toLogin">
		<view class="left-check">
			<text class="f3" v-if="hasLogin">{{userInfo.user[0].username}}</text>
			<text class="f1" v-else>登录/注册</text>
			<text class="f2">生活需要仪式感</text>
		</view>
		<view class="right-check">
			<image v-if="hasLogin" :src="userInfo.user[0].avatar"></image>
			<image v-else src="../../static/my_img/logo-cat.png" mode="">
			</image>
		</view>
		<view v-show="hasLogin" class="logout">
			<image class="set"  @click="mylogout" src="../../static/my_img/set.png" mode=""></image>
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
				mobile: ''

			}
		},
		
		computed: {
			...mapGetters(['hasLogin', 'userInfo'])
		},
		methods: {
			...mapMutations(['logout']),
			toLogin() {
				if (this.hasLogin) { // 已经登录，就结束，否则去登录
					return false
				}
				uni.navigateTo({
					url: '../login/login'
				})
			},
			mylogout() {
				uni.showModal({
					content: '确定要退出登录么',
					success: (e) => {
						if (e.confirm) {
							this.logout();
							this.common.post('/api/logout').then((res) => {});
							setTimeout(() => {
								uni.navigateBack(); // 返回到上一页
							}, 200)
						}
					}
				});
			}
		}
	}
</script>

<style>
	.check {
		position: absolute;
		z-index: 99;
		display: flex;
		align-items: center;
		justify-content: space-around;
		height: 300rpx;
		width: 100%;
	}

	.f1,
	.f3 {
		display: block;
		font-size: 40rpx;
		font-weight: bold;
	}

	.right-check {
		width: 150rpx;
		height: 150rpx;
		border-radius: 50%;
		background-color: #000000;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.right-check image {
		width: 150rpx;
		height: 150rpx;
		border-radius: 50%;
	}

	.logout {
		position: absolute;
		right: 30rpx;
		top: 30rpx;
	}
	.set{
		position: absolute;
		right:10rpx ;
		top:10rpx;
		width: 50rpx;
		height: 50rpx;
	}
</style>
