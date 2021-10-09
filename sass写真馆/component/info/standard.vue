<template>
	<view>
		<view class="course-content">
			<!-- 2.1 tab 滚动标题 -->
			<view class="tab" :class="{'is-fix':isFix}">
				<view @click="chaTab(0)" :class="{active:tab_index==0}">Sass服务</view>
				<view @click="chaTab(1)" :class="{active:tab_index==1}">大师级服务</view>
			</view>
			<!-- 2.2 tab 滚动切换内容 swiper -->
			<swiper @change="chaSwiper" :current="cur" :style="{height:550+'px'}">
				<swiper-item>
					<view class="intro">
						<view class="cont" v-for="item in conList" :key="item.id">
							<view class="outercon">
								<view class="innercon">
									<view class="lb">
										<image :src="domainUpload+item.imgurl" mode="widthFix" style="width: 200rpx;">
										</image>
									</view>
									<view class="rb">
										<text class="tit">{{item.name}}</text>
										<text class="con">{{item.description}}</text>
									</view>
								</view>
							</view>
						</view>
					</view>
				</swiper-item>
				<swiper-item>
					<view class="catalog">
						<view class="cont" v-for="item in conList1" :key="item.id">
							<view class="outercon">
								<view class="innercon">
									<view class="lb">
										<image :src="domainUpload+item.imgurl" mode="widthFix" style="width: 200rpx;">
										</image>
									</view>
									<view class="rb">
										<text class="tit" style="color: gold">{{item.name}}</text>
										<text class="con">{{item.description}}</text>
									</view>
								</view>
							</view>
						</view>
					</view>
				</swiper-item>


			</swiper>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				swiperHeight: '', // 每隔页面的高度值
				catlogs: [],
				tab_index: 0,
				cur: 0,
				isFix: false, //菜单的固定定位
				id: '',
				scrollTop: '',
			}
		},
		props: {
			conList: {
				type: Array,
				value: []
			},
			conList1: {
				type: Array,
				value: []
			},
			domainUpload: {
				type: String,
				value: ''
			}
		},

		onPageScroll: function(e) {
			// 菜单固定定位
			this.scrollTop = e.scrollTop

			this.getTabTop('tab')
		},

		onReady: function() {
			this.getSwiperHeight('intro');
		},



		watch: {
			tab_index(val) {
				this.selCal(val);
			}
		},
		methods: {
			chaTab(index) {
				this.tab_index = index
				this.cur = index
			},
			chaSwiper(e) {
				this.tab_index = e.detail.current
			},
			selCal: function(index) {
				if (index == 0) {
					this.getSwiperHeight('intro');
				}
				if (index == 1) {
					this.getSwiperHeight('catalog');
				}
			},

			getTabTop: function(cal) {
				const query = uni.createSelectorQuery().in(this);
				query.select('.' + cal).boundingClientRect(data => {
					console.log(data.top);
					if (data.top <= 0) {
						this.isFix = true
					}

					if (this.scrollTop <= 100) {
						this.isFix = false
					}

				}).exec();
			},
			getSwiperHeight: function(cal) {
				const query = uni.createSelectorQuery().in(this);
				query.select('.' + cal).boundingClientRect(data => { // 获得盒子的坐标  等同于 offsetTop,offsetLeft, 
					this.swiperHeight = data.height + 100
				}).exec();
			}

		}
	}
</script>

<style lang="scss" scoped>
	.isGet {
		background-color: #FFFFFF !important;
		color: #F60 !important;
	}

	.course-img video {
		height: 400rpx;
		width: 750rpx;
	}

	.tab {
		display: flex;
		justify-content: center;
		height: 84rpx;
		width: 100%;
		border-bottom: 2rpx solid #F5F5F5;
		background-color: #FFFFFF;
	}

	.tab view {
		width: 33.3%;
		text-align: center;
		height: 84rpx;
		line-height: 84rpx;
		font-size: medium;
	}

	.active {
		color: #1a7785;
		border-bottom: 2rpx solid #1a7785;
	}

	.is-fix {
		position: fixed;
		top: 0;
		z-index: 999;
	}

	.tab-content {
		height: 100vh;
		padding: 10rpx 0;
		background: #f7f7f7;
	}

	.cont {
		width: 90%;
		margin: 0 auto;
	}

	.outercon {
		display: flex;
		height: 250rpx;
		align-items: center;
	}

	.innercon {
		height: 200rpx;
		display: flex;
		justify-content: space-between;
	}

	.lb {
		width: 200rpx;
		height: 200rpx;
		/* border: 1rpx  solid #000000; */
	}

	.rb {
		padding-left: 30rpx;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}

	.tit {
		font-size: 30rpx;
		font-weight: bold;
	}
	.con{
		font-size: 30rpx;
		// font-weight: bold;
	}
</style>
