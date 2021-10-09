<template>
	<view>
		<!-- 搜索框 -->
		<uni-nav-bar class="fixed" color="#fff" background-color="#ffffff" border="0" @clickLeft="showCity">
			<block slot="left">
				<view class="city">
					<view><text style="font-size: 14px;color:#1a7785 ;font-weight: 600;margin-left: 10px;">北京</text>
					</view>
					<uni-icons type="dingwei1" color="#1a7785" size="15" style="margin-left: 3px;margin-top: 3px;" />
				</view>
			</block>
			<view class="input-view">
				<uni-icons style="line-height: 30px;" type="sousuo" size="15" color="#666666" />
				<input confirm-type="search" class="nav-bar-input" type="text" placeholder="轻婚纱" @click="toSearch">
			</view>
		</uni-nav-bar>
		<!-- 轮播图 -->
		<view class="swiper" style="height: 500px;">

			<uni-swiper-dot :info="swipers" :current="current" field="content" :mode="mode" :dots-styles="dotsStyles">
				<swiper :autoplay="true" :interval="3000" :duration="1000" circular class="swiper-warps"
					@change="change">
					<swiper-item v-for="swiper in swipers" :key="swiper.id">
						<!-- <navigator :url="swiper.url"> -->
						<view class="swiper-item">
							<image :src="domainUpload+swiper.imgurl" mode=""></image>
						</view>
						<!-- </navigator> -->
					</swiper-item>
				</swiper>
			</uni-swiper-dot>
		</view>
		<!-- 分类列表 -->
		<view class="category-list">
			<view class="category" v-for="cate in cates" :key="cate.id" @tap="tocategory">

				<view class="category-img">
					<image :src="domainUpload+cate.imgurl"></image>

				</view>
				<view class="category-title">{{cate.name}}</view>
			</view>
		</view>
		<!-- 商品展示TAB切换 -->
		<view class="goods-content">
			<!-- 2.1 tab 滚动标题 -->
			<scroll-view scroll-x style="width:100%; ":class="{'is-fix':isFix}">
				<view class="tab" >
					<view @click="chaTab(0)" :class="{active:tab_index==0}">Sass</view>
					<view @click="chaTab(1)" :class="{active:tab_index==1}">Sass大师</view>
					<view @click="chaTab(2)" :class="{active:tab_index==2}">Sass家庭</view>
					<view @click="chaTab(3)" :class="{active:tab_index==3}">Sass儿童</view>
					<view @click="chaTab(4)" :class="{active:tab_index==4}">Sass商城</view>
					<view @click="chaTab(5)" :class="{active:tab_index==5}">企业服务</view>
					<view @click="chaTab(6)" :class="{active:tab_index==6}">礼品卡</view>
					<view @click="chaTab(7)" :class="{active:tab_index==7}">连锁加盟</view>
				</view>
			</scroll-view>
			<!-- 2.2 tab 滚动切换内容 swiper -->
			<swiper @change="chaSwiper" :current="cur" :style="{height:swiperHeight+'px'}">
				<swiper-item>
					<view class="sass">
						<sass></sass>
					</view>
				</swiper-item>
				<swiper-item>
					<view class="sassdashi">
						<sassdashi></sassdashi>
					</view>
				</swiper-item>
				<swiper-item>
					<view class="sasshome">
						<sasshome></sasshome>
					</view>
				</swiper-item>
				<swiper-item>
					<view class="sasschild">
						<sasschild></sasschild>
					</view>
				</swiper-item>
				<swiper-item>
					<view class="sassshops">
						<sassshops></sassshops>
					</view>
				</swiper-item>
				<swiper-item>
					<view class="companyserver">
						<companyserver></companyserver>
					</view>
				</swiper-item>
				<swiper-item>
					<view class="giftcard">
						<giftcard></giftcard>
					</view>
				</swiper-item>
				<swiper-item>
					<view class="chainstore">
						<chainstore></chainstore>
					</view>
				</swiper-item>

			</swiper>
		</view>
		<view class="backtop">
			<u-back-top :scrollTop="scrollTop" icon="arrow-up"  ></u-back-top>
		</view>
		<zdy-tabbar :current-page="0"></zdy-tabbar>

	</view>
</template>

<script>
	import sass from "../../component/goodscontent/sass/sass.vue"
	import sassdashi from "../../component/goodscontent/sassdashi/sassdashi.vue"
	import sasshome from "../../component/goodscontent/sasshome/sasshome.vue"
	import sasschild from "../../component/goodscontent/sasschild/sasschild.vue"
	import sassshops from "../../component/goodscontent/sassshops/sassshops.vue"
	import companyserver from "../../component/goodscontent/companyserver/companyserver.vue"
	import giftcard from "../../component/goodscontent/giftcard/giftcard.vue"
	import chainstore from "../../component/goodscontent/chainstore/chainstore.vue"
	export default {
		onLoad: function(options) {
			this.domainUpload = this.common.getConfig('domainUpload');
			// 轮播图调用 
			this.getSwiper();
			// 二级导航
			this.getCates();
		},

		onPageScroll: function(e) {
			// 菜单固定定位
			this.scrollTop = e.scrollTop
			// console.log(this.scrollTop);
			this.getTabTop('tab')
		},

		onReady: function() {
			this.getSwiperHeight('intro');
		},
		components: {
			sass,
			sassdashi,
			sasshome,
			sasschild,
			sassshops,
			giftcard,
			companyserver,
			chainstore,
		},
		data() {
			return {
				isTop: false,
				swiperheight: 0, //这里是动态赋值的高度
				swipers: [],
				domainUpload: '',
				courseList: [],
				cates: [],
				current: 0,
				mode: 'default',
				
				// 商品展示
				isPlay: false, // 自动播放

				tab_index: 0, // 标题索引
				cur: 0, //  内容索引
				swiperHeight: '', // 每隔页面的高度值
				isFix: false, //菜单的固定定位
				id: '',
				scrollTop: '',
				dotsStyles: {
					backgroundColor: 'rgba(238, 238, 238, 0.3)',
					border: '1px rgba(238, 238, 238, 0.3) solid',
					color: '#fff',
					selectedBackgroundColor: 'rgba(255, 143, 0, 0.9)',
					selectedBorder: '1px rgba(255, 143, 0, 0.9) solid',

				},


			}
		},
		onReady: function() {
			this.getSwiperHeight('sass');
		},

		methods: {
			toSearch() {
				uni.navigateTo({
					url: '../HM-search/HM-search'
				})

			},
			change(e) {
				this.current = e.detail.current;
			},
			// uni.request 请求接口（封装成promise对象）， 异步转同步 async... await 接口
			async getSwiper() {
				await this.common.get('/api/getswiper', []).then((res) => {
					console.log(res.data)
					this.swipers = res.data.splice(0,8)
				})

			},
			async getCates() {
				await this.common.get('/api/cates', []).then((res) => {
					this.cates = res.data
				})
			},

			// 商品展示
			chaTab: function(index) {
				this.tab_index = index
				this.cur = index
				this.selCal(index) // 获得每页的高度
			},
			chaSwiper: function(e) {
				this.tab_index = e.detail.current // 当前滚动 内容索引
				this.selCal(e.detail.current) // 重新计算高度
			},

			selCal: function(index) {
				if (index == 0) {
					this.getSwiperHeight('sass'); //   类名称，目的拿DOM
				}
				if (index == 1) {
					this.getSwiperHeight('sassdashi');
				}
				if (index == 2) {
					this.getSwiperHeight('sasshome');
				}
				if (index == 3) {
					this.getSwiperHeight('sasschild');
				}
				if (index == 4) {
					this.getSwiperHeight('sassshops');
				}
				if (index == 5) {
					this.getSwiperHeight('companyserver');
				}
				if (index == 6) {
					this.getSwiperHeight('giftcard');
				}
				if (index == 7) {
					this.getSwiperHeight('chainstore');
				}


			},

			getTabTop: function(cal) {
				const query = uni.createSelectorQuery().in(this);
				query.select('.' + cal).boundingClientRect(data => {
					//console.log(data.top);
					if (data.top <= 100) {
						this.isFix = true
					}
					if (this.scrollTop <= 400) {
						this.isFix = false
					}

				}).exec();
			},


			getSwiperHeight: function(cal) {
				const query = uni.createSelectorQuery().in(this);
				query.select('.' + cal).boundingClientRect(data => { // 获得盒子的坐标  等同于 offsetTop,offsetLeft, 
					//   top left right bottom width,height
					this.swiperHeight = data.height + 50

				}).exec();
			},
			tocategory() {
				uni.switchTab({
					url: '../category/category'
				})
			},
		},
	}
</script>

<style lang="scss">
	
	/* 搜索框样式开始 */
	.is-fix {
		position: fixed;
		width: 100%;
		top: 44px;
		/* #ifdef MP */
		top: 120rpx;
		/* #endif */
		/* #ifdef APP-PLUS */
		top: 120rpx;
		/* #endif */

		z-index: 999999;
	}

	.fixed {
		position: fixed;
		top: 0;
		width: 100%;
		left: 0;
		z-index: 999;
	}

	.uni-navbar {
		width: 100%;
		height: 44px;
		/* #ifdef MP */
		height: calc(44px + var(--status-bar-height));
		/* #endif */
		/* #ifdef APP-PLUS */
		height: calc(44px + var(--status-bar-height));
		/* #endif */
	}

	.uni-navbar__content {
		display: block;
		position: relative;
		width: 100%;
		background-color: #fff;
		overflow: hidden;
		/* #ifdef MP */
		padding-top: var(--status-bar-height);
		/* #endif */
		/* #ifdef APP-PLUS */
		padding-top: var(--status-bar-height);
		/* #endif */
	}



	.city {
		display: flex;
		flex-direction: row;
		align-items: center;
		margin-left: 4px;

	}



	.input-view {
		display: flex;
		flex-direction: row;
		flex: 1;
		width: 300rpx;
		background-color: #f8f8f8;
		height: 30px;
		border-radius: 15px;
		padding: 0 15px;
		flex-wrap: nowrap;
		margin: 7px 0;
		line-height: 30px;
	}

	.nav-bar-input {
		height: 30px;
		line-height: 30px;
		width: 350rpx;
		padding: 0 5px;
		font-size: 14px;
		background-color: #f8f8f8;
	}

	/* 搜索框样式结束*/
	/* 轮播图开始 */
	.swiper {
		height: 510px !important;
		margin-top: 44px;
		background-color: #FFFFFF;
	}

	.swiper-warps {
		height: 510px;
	}

	.swiper-item image {
		width: 100%;
		height: 510px;
	}

	/* 轮播图结束*/
	/* 分类菜单start */
	.category-list {
		width: 92%;
		margin: 0 4%;
		padding: 0 0 30upx 0;
		border-bottom: solid 2upx #f6f6f6;
		display: flex;
		justify-content: space-between;
		flex-wrap: wrap;

		.category {
			width: 25%;
			margin-top: 50upx;
			display: flex;
			flex-wrap: wrap;

			.category-img {
				width: 100%;
				display: flex;
				justify-content: center;

				image {
					width: 9vw;
					height: 9vw;
					border-radius: 25%;
				}
			}

			.category-title {
				margin-top: 16upx;
				width: 100%;
				display: flex;
				justify-content: center;
				font-size: 24upx;
				color: #3c3c3c;
			}
		}
	}

	/* 分类菜单end */
	// 商品展示开始
	// :root {
	//   --primary: #ff8f00;
	//   --white: #FFFFFF;
	//   --greyLight-1: #E4EBF5;
	//   --greyLight-2: #c8d0e7;
	//   --greyLight-3: #bec8e4;
	//   --greyDark: #9baacf;
	// }

	*,
	*::before,
	*::after {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}

	.tab {
		display: flex;
		background-color: #ffffff;
		width: 200%;
		height: 84rpx;
		box-shadow: 5rpx 5rpx 5rpx #EEEEEE,
	}

	.tab view {
		width: 33.3%;
		text-align: center;
		height: 84rpx;
		line-height: 84rpx;
		font-size: medium;
		color: #959595;

	}

	.active {
		color: #1a7785 !important;
		border-bottom: 2rpx solid #1a7785;
		font-size: 16rpx;
		font-weight: 600;
		box-shadow: inset 0px -3px 2px #1a7785;
		border-radius: 5rpx;
	}
</style>
