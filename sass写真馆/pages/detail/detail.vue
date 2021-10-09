<template>
	<view>
		<view class="status" :style="{ opacity: afterHeaderOpacity }"></view>
		<view class="header">
			<!-- 头部-默认显示 -->
			<view class="before" :style="{ opacity: 1 - afterHeaderOpacity, zIndex: beforeHeaderzIndex }">
				<view class="back">
					<view class="icon xiangqian" @tap="back" v-if="showBack"></view>
				</view>
				<view class="middle"></view>
				<view class="icon-btn">
					<view class="icon tongzhi" @tap="toMsg"></view>
					<view class="icon cart" @tap="tocart"></view>
				</view>
			</view>
			<!-- 头部-滚动渐变显示 -->
			<view class="after" :style="{ opacity: afterHeaderOpacity, zIndex: afterHeaderzIndex }">
				<view class="back">
					<view class="icon xiangqian" @tap="back" v-if="showBack"></view>
				</view>
				<view class="middle">
					<view v-for="(anchor,index) in anchorlist" :class="[selectAnchor==index ?'on':'']" :key="index"
						@tap="toAnchor(index)">{{anchor.name}}</view>
				</view>
				<view class="icon-btn">
					<view class="icon tongzhi" @tap="toMsg"></view>
					<view class="icon cart" @tap="joinCart"></view>
				</view>
			</view>
		</view>
		<!-- 底部菜单 -->
		<view class="footer">
			<view class="icons">
				<view class="box" @tap="share">
					<view class="icon fenxiang"></view>
					<view class="text">分享</view>
				</view>
				<view class="box" @tap="toChat">
					<view class="icon kefu"></view>
					<view class="text">客服</view>
				</view>
				<view class="box" @tap="keep">
					<view class="icon" :class="[isKeep?'shoucangsel':'shoucang']"></view>
					<view class="text">{{isKeep?'已':''}}收藏</view>
				</view>

			</view>
			<view class="btn" @click="abc">
				<view class="joinCart" @tap="joinCart" >加入购物车</view>
				<view class="buy" @tap="buy" >立即购买</view>

			</view>
		</view>
		<!-- share弹窗 -->
		<view class="share" :class="shareClass" @touchmove.stop.prevent="discard" @tap="hideShare">
			<view class="mask"></view>
			<view class="layer" @tap.stop="discard">
				<view class="h1">分享</view>
				<view class="list">
					<view class="box">
						<image src="../../static/share/weixin.png"></image>
						<view class="title">
							微信好友
						</view>
					</view>
					<view class="box">
						<image src="../../static/share/pengyouquan.png"></image>
						<view class="title">
							朋友圈
						</view>
					</view>
					<view class="box">
						<image src="../../static/share/weibo.png"></image>
						<view class="title">
							新浪微博
						</view>
					</view>
					<view class="box">
						<image src="../../static/share/qq.png"></image>
						<view class="title">
							QQ
						</view>
					</view>
				</view>
				<view class="btn" @tap="hideShare">
					取消
				</view>
			</view>

		</view>
		<!-- 服务-模态层弹窗 -->
		<view class="popup service" :class="serviceClass" @touchmove.stop.prevent="discard" @tap="hideService">
			<!-- 遮罩层 -->
			<view class="mask"></view>
			<view class="layer" @tap.stop="discard">
				<view class="content">
					<view class="row" v-for="(item,index) in goodsData.service" :key="index">
						<view class="title">{{item.name}}</view>
						<view class="description">{{item.description}}</view>
					</view>
				</view>
				<view class="btn">
					<view class="button" @tap="hideService">完成</view>
				</view>
			</view>
		</view>
		<!-- 规格-模态层弹窗 -->
		<view class="popup spec" :class="specClass" @touchmove.stop.prevent="discard" @tap="hideSpec">
			<!-- 遮罩层 -->
			<view class="mask"></view>
			<view class="layer" @tap.stop="discard">
				<view class="content">
					<view class="title">产品类型</view>
					<view class="sp" style="white-space: nowrap;flex-wrap: wrap;">
						<view v-for="(item,index) in goodsData.spec" :class="[index==selectSpec?'on':'']"
							@tap="setSelectSpec(index)" :key="index">{{item}}</view>
					</view>
					<view class="length" v-if="selectSpec!=null">
						<view class="text">数量</view>
						<view class="number">
							<view class="sub" @tap.stop="sub">
								<view class="icon jian"></view>
							</view>
							<view class="input" @tap.stop="discard">
								<input type="number" v-model="goodsData.number" />
							</view>
							<view class="add" @tap.stop="add">
								<view class="icon jia"></view>
							</view>
						</view>
					</view>
				</view>
				<view class="btn">
					<view class="button" @tap="hideSpec">完成</view>
				</view>
			</view>
		</view>
		<!-- 优惠券弹层 -->
		<view class="popup service" :class="couponClass" @touchmove.stop.prevent="discard" @tap="hideCoupon">
			<!-- 遮罩层 -->
			<view class="mask"></view>
			<view class="layer" @tap.stop="discard">
				<view class="content">
					<!-- <view class="row" v-for="(item,index) in goodsData.service" :key="index">
						<view class="title">{{item.name}}</view>
						<view class="description">{{item.description}}</view>
					</view> -->
					<view  ref="mycoupon" class="coupon-item" v-for="item in courseIntr.coupon">
					
						<view class="coupon-money">
							<view class="nick">{{item.coupon_name}}使用</view>
							<view class="layof" :style="{color:theme}">￥{{item.coupon_fee}}</view>
							<view class="end_time">
								{{new Date(item.from_time).toLocaleDateString()}}-{{new Date(item.to_time).toLocaleDateString()}}前使用
							</view>
							<view>
								<view class="demand">{{item.total_fee}}</view>
							</view>
						</view>
						<view class="get-btn"  :disabled="true"  style="background:#ceb80c;color:#fff" @click="ling">{{isling?'已':''}}领取</view>
					</view>
				</view>
				<view class="btn">
					<view class="button" @tap="hideCoupon">完成</view>
				</view>
			</view>
		</view>
		<!-- 商品主图轮播 -->
		<view class="swiper-box">
			<swiper circular="true" autoplay="true" @change="swiperChange">
				<swiper-item v-for="swiper in swiperList" :key="swiper.id">
					<image :src="swiper.img"></image>
				</swiper-item>
			</swiper>
			<view class="indicator">{{currentSwiper+1}}/{{swiperList.length}}</view>
		</view>
		<!-- 标题 价格 -->
		<view class="info-box">
			<view class=" goods-info">
				<view class="title">
					{{goodsData.name}}
				</view>
				<view class="price">￥{{goodsData.price}}起</view>

			</view>

			<!-- coupon -->

		<!-- 	<view class="coupon"
				style="display:flex; justify-content: space-between;padding: 28rpx; align-items: center;height: 100rpx;">
				<view>优惠券</view>
				<view class="">
					<navigator url="../coupon/coupon">
						<button
							style="width: 200rpx; height: 50rpx;font-size: 10rpx; line-height: 50rpx; border: 1rpx orange solid;background-color: orange;"
							@tap="showCoupon">去领取</button>
					</navigator>
				</view>
			</view> -->





			<!-- 服务-规则选择 -->
			<view class=" spec">
				<view class="row" @tap="showCoupon">
					<view class="text">优惠券</view>
					<view class="service-content">
						<!-- <button class="serviceitem"
							style="width: 200rpx; height: 50rpx;font-size: 10rpx; line-height: 50rpx; border: 1rpx orange solid;background-color: orange;"
							@tap="showCoupon">去领取</button> -->
					</view>
					<view class="arrow">
						<view class="icon xiangyou"></view>
					</view>

				</view>


				<view class="row" @tap="showService">
					<view class="text">服务</view>
					<view class="service-content">
						<view class="serviceitem" v-for="(item,index) in goodsData.service" :key="index">{{item.name}}
						</view>
					</view>
					<view class="arrow">
						<view class="icon xiangyou"></view>
					</view>
				</view>
				<view class="row" @tap="showSpec(false)">
					<view class="text">选择</view>
					<view class="content">
						<view>请选择拍摄产品</view>
						<!-- <view class="sp">
						<view v-for="(item,index) in goodsData.spec" :key="index" :class="[index==selectSpec?'on':'']">{{item}}</view>
					</view> -->

					</view>
					<view class="arrow">
						<view class="icon xiangyou"></view>
					</view>
				</view>
			</view>
			<!-- 评价 -->
			<view class=" comments" id="comments">
				<view class="row">
					<view class="text">买家秀({{goodsData.comment.number}})</view>
					<view class="arrow" @tap="toRatings">
						<view class="show" @tap="showComments(goodsData.id)">
							查看全部
							<view class="icon xiangyou"></view>
						</view>
					</view>
				</view>
				<view class="comment" @tap="toRatings">
					<view class="user-info">
						<view class="face">
							<image :src="goodsData.comment.userface"></image>
						</view>
						<view class="username">{{goodsData.comment.username}}</view>
					</view>
					<view class="content">
						{{goodsData.comment.content}}
					</view>
				</view>
			</view>
		</view>

		<!-- 详情 -->
		<view class="info-box">
			<view class="description">
				<view class="title">———— 产品详情 ————</view>
				<view class="content">
					<rich-text :nodes="descriptionStr"></rich-text>
				</view>
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
		computed: {
			...mapGetters(['hasLogin', 'userInfo'])
		},
		data() {
			return {
				isFlag:true,
				isSelectCoupon: [],
				theme: '#ceb80c',
				msg: '领取优惠卷',
				serviceClass: '', //show  , hide 弹窗css类，控制开关动画
				courseId: null,
				courseIntr: '',
				isJoin: "200",
				btnTxt: "领取成功",
				catlogs: [],
couponClass:"",
				//控制渐变标题栏的参数
				beforeHeaderzIndex: 11, //层级
				afterHeaderzIndex: 10, //层级
				beforeHeaderOpacity: 1, //不透明度
				afterHeaderOpacity: 0, //不透明度
				
				//是否显示返回按钮
				// #ifndef MP
				showBack: true,
				// #endif
				//轮播主图数据
				swiperList: [{
						id: 1,
						img: "../../static/sass/详情1.jpg"
					},
					{
						id: 2,
						img: "../../static/sass/详情2.jpg"
					},
					
					{
						id: 3,
						img: "../../static/sass/详情4.jpg"
					}
				],
				//轮播图下标
				currentSwiper: 0,
				anchorlist: [], //导航条锚点
				selectAnchor: 0, //选中锚点
				serviceClass: '', //服务弹窗css类，控制开关动画
				specClass: '', //规格弹窗css类，控制开关动画
				shareClass: '', //分享弹窗css类，控制开关动画
				// 商品信息
				goodsData: {
					id: 1,
					name: "照片",
					price: "127.00",
					number: 1,
					service: [{
							name: "一套造型、 ",
							description: "本店提供发型以及化妆服务"
						},
						{
							name: "一套服装、",
							description: "本店提供服装"
						},
						{
							name: "精修底片",
							description: "精修图电子版"
						}
					],
					spec: ["半身照", "全身照", "花颜照", "国风", "大师臻选", "全家福"],
					comment: {
						number: 102,
						userface: '../../static/img/face.jpg',
						username: '非****',
						content: '拍的巨好无比，太好看了把！！'
					}
				},
				selectSpec: null, //选中规格
				isKeep: false, //收藏
				isling
				:false,
				//商品描述html
				descriptionStr: '<div style="text-align:center;"><img width="100%" src="../../static/sass/商品展示15.png"/><img width="100%"src="../../static/sass/商品展示14.png"/><img width="100%" src="../../static/sass/商品展示13.png"/></div>'
			};
		},
		onLoad(option) {
			this.common.post('/api/getCoupon/').then((res) => {
				this.isSelectCoupon = res.data;
				console.log(this.isSelectCoupon)
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
			

			// #ifdef MP
			//小程序隐藏返回按钮
			this.showBack = false;
			// #endif
			//option为object类型，会序列化上个页面传递的参数
			// console.log(option.cid); //打印出上个页面传递的参数。
		},
		onReady() {
			this.calcAnchor(); //计算锚点高度，页面数据是ajax加载时，请把此行放在数据渲染完成事件中执行以保证高度计算正确
		},
		onPageScroll(e) {
			//锚点切换
			this.selectAnchor = e.scrollTop >= this.anchorlist[2].top ? 2 : e.scrollTop >= this.anchorlist[1].top ? 1 : 0;
			//导航栏渐变
			let tmpY = 375;
			e.scrollTop = e.scrollTop > tmpY ? 375 : e.scrollTop;
			this.afterHeaderOpacity = e.scrollTop * (1 / tmpY);
			this.beforeHeaderOpacity = 1 - this.afterHeaderOpacity;
			//切换层级
			this.beforeHeaderzIndex = e.scrollTop > 0 ? 10 : 11;
			this.afterHeaderzIndex = e.scrollTop > 0 ? 11 : 10;
		},
		//上拉加载，需要自己在page.json文件中配置"onReachBottomDistance"
		onReachBottom() {
			uni.showToast({
				title: '触发上拉加载'
			});
		},
		mounted() {

		},
		methods: {
			getCoupon: function(id) {
				
				var that = this
				uni.getStorage({
					key: 'userInfo',
					success: function(result) {
						that.common.post('/api/storeCoupon/'+1,).then((res) => {
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
			//服务弹窗
			showCoupon() {
				// console.log(x);
				this.couponClass = 'show'; // show
			},
			//关闭服务弹窗
			hideCoupon() {
				this.couponClass = 'hide';
				setTimeout(() => {
					this.couponClass = 'none';
				}, 200);
			},



			//轮播图指示器
			swiperChange(event) {
				this.currentSwiper = event.detail.current;
			},
			//消息列表
			toMsg() {
				uni.navigateTo({
					url: '../msg/msg'
				})
			},
			tocart() {
				uni.switchTab({
					url: '../cart/cart'
				})
			},
			// 客服
			toChat() {
				uni.navigateTo({
					url: "../msg/chat/chat?name=客服008"
				})
			},
			// 分享
			share() {
				this.shareClass = 'show';
			},
			hideShare() {
				this.shareClass = 'hide';
				setTimeout(() => {
					this.shareClass = 'none';
				}, 150);
			},
			//收藏
			keep() {
				this.isKeep = this.isKeep ? false : true;
			},
			// 加入购物车
			joinCart() {
				if (this.selectSpec == null) {
					return this.showSpec(() => {
						uni.showToast({
							title: "已加入购物车"
						});
					});
					let cartList = [];
					let joingoods = {
						id: this.goodsData.id,
						img: '../../static/img/goods/p1.jpg',
						name: this.goodsData.name,
						spec: '规格:' + this.goodsData.spec[this.selectSpec],
						price: this.goodsData.price,
						number: this.goodsData.number
					};
					cartList.push(joingoods);
					uni.setStorage({
						key: 'cartlist',
						data: cartList,
					})
				}
				uni.showToast({
					title: "已加入购物车"
				});
			},
			//立即购买
			buy() {
				if (this.selectSpec == null) {
					return this.showSpec(() => {
						this.toConfirmation();
					});
				}
				this.toConfirmation();
			},
			//商品评论
			toRatings() {
				uni.navigateTo({
					url: 'ratings/ratings'
				})
			},
			//跳转确认订单页面
			toConfirmation() {
				let tmpList = [];
				let goods = {
					id: this.goodsData.id,
					img: '../../static/img/goods/p1.jpg',
					name: this.goodsData.name,
					spec: '规格:' + this.goodsData.spec[this.selectSpec],
					price: this.goodsData.price,
					number: this.goodsData.number
				};
				tmpList.push(goods);
				uni.setStorage({
					key: 'buylist',
					data: tmpList,
					success: () => {
						uni.navigateTo({
							url: '../order/confirmation'
						})
					}
				})
			},
			//跳转评论列表
			showComments(goodsid) {

			},
			//选择规格
			setSelectSpec(index) {
				this.selectSpec = index;
			},
			//减少数量
			sub() {
				if (this.goodsData.number <= 1) {
					return;
				}
				this.goodsData.number--;
			},
			//增加数量
			add() {
				this.goodsData.number++;
			},
			//跳转锚点
			toAnchor(index) {
				this.selectAnchor = index;
				uni.pageScrollTo({
					scrollTop: this.anchorlist[index].top,
					duration: 200
				});
			},
			//计算锚点高度
			calcAnchor() {
				this.anchorlist = [{
						name: '买家秀',
						top: 0
					},
					{
						name: '展示',
						top: 0
					},
					{
						name: '服务',
						top: 0
					}
				]
				let commentsView = uni.createSelectorQuery().select("#comments");
				commentsView.boundingClientRect((data) => {
					let statusbarHeight = 0;
					//APP内还要计算状态栏高度
					// #ifdef APP-PLUS
					statusbarHeight = plus.navigator.getStatusbarHeight()
					// #endif
					let headerHeight = uni.upx2px(100);
					this.anchorlist[1].top = data.top - headerHeight - statusbarHeight;
					this.anchorlist[2].top = data.bottom - headerHeight - statusbarHeight;

				}).exec();
			},
			//返回上一页
			back() {
				uni.navigateBack();
			},
			//服务弹窗
			showService() {
				console.log('show');
				this.serviceClass = 'show';
			},
			//关闭服务弹窗
			hideService() {
				this.serviceClass = 'hide';
				setTimeout(() => {
					this.serviceClass = 'none';
				}, 200);
			},
			//规格弹窗
			showSpec(fun) {
				console.log('show');
				this.specClass = 'show';
				this.specCallback = fun;
			},
			specCallback() {
				return;
			},
			//关闭规格弹窗
			hideSpec() {
				this.specClass = 'hide';
				//回调

				this.selectSpec && this.specCallback && this.specCallback();
				this.specCallback = false;
				setTimeout(() => {
					this.specClass = 'none';
				}, 200);
			},
			discard() {
				//丢弃
			},
			abc() {
				if (!this.hasLogin) {
					uni.navigateTo({
						url: '../login/login'
					})
				} else {
					uni.showToast({
						icon: 'none',
						title: '暂未登录'
					})
				}
			},
			//领取
		
			ling(){
				this.isling = this.isling ? false : true;
			},
		}
	};
</script>

<style lang="scss">
	page {
		background: linear-gradient(to right, #ffffff, #d9d9d9);
	}

	@keyframes showPopup {
		0% {
			opacity: 0;
		}

		100% {
			opacity: 1;
		}
	}

	@keyframes hidePopup {
		0% {
			opacity: 1;
		}

		100% {
			opacity: 0;
		}
	}

	@keyframes showLayer {
		0% {
			transform: translateY(0);
		}

		100% {
			transform: translateY(-100%);
		}
	}

	@keyframes hideLayer {
		0% {
			transform: translateY(-100%);
		}

		100% {
			transform: translateY(0);
		}
	}

	.icon {
		font-size: 26upx;
	}

	.status {
		width: 100%;
		height: 0;
		position: fixed;
		z-index: 10;
		top: 0;
		/*  #ifdef  APP-PLUS  */
		height: var(--status-bar-height); //覆盖样式
		/*  #endif  */
		background-color: #f1f1f1;
		transition: opacity 0.05s linear;
	}

	.header {
		width: 100%;

		height: 100upx;
		display: flex;
		align-items: center;
		position: fixed;
		top: 0;
		z-index: 10;
		/*  #ifdef  APP-PLUS  */
		top: var(--status-bar-height);

		/*  #endif  */
		.before,
		.after {
			width: 100%;
			padding: 0 4%;
			height: 100upx;
			display: flex;
			align-items: center;
			position: fixed;
			top: 0;
			/*  #ifdef  APP-PLUS  */
			top: var(--status-bar-height);
			/*  #endif  */
			transition: opacity 0.05s linear;

			.back {
				width: 125upx;
				height: 60upx;
				flex-shrink: 0;

				.icon {
					margin-left: -10%;
					width: 60upx;
					height: 60upx;
					display: flex;
					align-items: center;
					justify-content: center;
					font-size: 42upx;
				}
			}

			.middle {
				width: 100%;
			}

			.icon-btn {
				width: 125upx;
				height: 60upx;
				flex-shrink: 0;
				display: flex;

				.icon {
					&:first-child {
						margin-right: 5upx;
					}

					width: 60upx;
					height: 60upx;
					display: flex;
					justify-content: center;
					align-items: center;
					font-size: 42upx;
				}
			}
		}

		.before {
			.back {
				.icon {
					color: #fff;
					background-color: rgba(0, 0, 0, 0.2);
					border-radius: 100%;
				}
			}

			.icon-btn {
				.icon {
					color: #fff;
					background-color: rgba(0, 0, 0, 0.2);
					border-radius: 100%;

				}
			}
		}

		.after {
			background: linear-gradient(70deg, #ffffff, #d9d9d9);

			.back {
				.icon {
					color: #666;
				}
			}

			.icon-btn {
				.icon {
					color: #666;
				}
			}

			.middle {
				font-size: 32upx;
				height: 90upx;
				display: flex;
				justify-content: center;
				align-items: center;
				padding: 0 7%;

				view {
					width: (100%/3);
					padding: 0 3%;
					margin: 0 3%;
					display: flex;
					justify-content: center;
					align-items: center;
					white-space: nowrap;

					&.on {
						margin-bottom: -4upx;
						color: #ceb80c;
						white-space: nowrap;
						border-bottom: solid 4upx #ceb80c;
						font-weight: 600;
					}
				}
			}
		}
	}

	.swiper-box {
		position: relative;
		width: 100%;
		height: 500px;

		swiper {
			width: 100%;
			height: 500px;

			swiper-item {
				image {
					width: 100%;
					height: 500px;
				}
			}
		}

		.indicator {
			display: flex;
			justify-content: center;
			align-items: center;
			padding: 0 25upx;
			height: 40upx;
			border-radius: 40upx;
			font-size: 22upx;
			position: absolute;
			bottom: 20upx;
			right: 20upx;
			color: #fff;
			background-color: rgba(0, 0, 0, 0.2);
		}
	}

	.info-box {
		// width: 100%;
		// padding: 20upx 4%;
		// background-color: #fff;
		width: 90%;
		height: 100%;
		background-color: white;
		margin: 0 auto 42upx auto;
		background: #FFFFFF;
		box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.10);
		border-radius: 5px;
		position: relative;

	}

	.goods-info {
		display: flex;
		justify-content: space-between;
		box-sizing: border-box;
		padding: 0 11px;
		margin-bottom: 20px;
		height: 50px;
		border-bottom: 1px solid #eee;

		.price {
			font-size: 46upx;
			font-weight: 600;
			color: #ceb80c;
			line-height: 50px;


		}

		.title {
			font-size: 40upx;
			font-weight: 600;
			line-height: 50px;
		}
	}

	.spec {
		border-bottom: 1px solid #eee;
		box-sizing: border-box;
		padding: 0 11px;

		.row {
			width: 100%;
			display: flex;
			align-items: center;
			margin: 0 0 30upx 0;

			.text {
				font-size: 24upx;
				color: #a2a2a2;
				margin-right: 20upx;
			}

			.content {
				font-size: 28upx;
				display: flex;
				flex-wrap: wrap;

				.serviceitem {
					margin-right: 10upx;
				}

				.sp {
					width: 100%;
					display: flex;

					view {
						background-color: #f6f6f6;
						padding: 5upx 10upx;
						color: #999;
						margin-right: 10upx;
						font-size: 20upx;
						border-radius: 5upx;

						&.on {
							border: solid 1upx #ff8f00;
							padding: 4upx 8upx;
						}
					}
				}
			}

			.arrow {
				position: absolute;
				right: 4%;

				.icon {
					color: #ccc;
				}
			}
		}
	}

	.comments {
		box-sizing: border-box;
		padding: 0 11px;
		height: 110px;

		.row {
			width: 100%;
			height: 40upx;
			display: flex;
			align-items: center;
			margin: 0 0 30upx 0;

			.text {
				font-size: 30upx;
				margin-top: 4%;
			}

			.arrow {
				font-size: 28upx;
				position: absolute;
				right: 4%;
				color: #000000;
				margin-top: 4%;

				.show {
					display: flex;
					align-items: center;

					.icon {
						color: #000000;
					}
				}
			}
		}

		.comment {
			width: 100%;

			.user-info {
				width: 100%;
				height: 40upx;
				display: flex;
				align-items: center;

				.face {
					width: 40upx;
					height: 40upx;
					margin-right: 8upx;

					image {
						width: 40upx;
						height: 40upx;
						border-radius: 100%;
					}
				}

				.username {
					font-size: 24upx;
					color: #999;
				}
			}

			.content {
				margin-top: 10upx;
				font-size: 26upx;
			}
		}
	}

	.description {
		.title {
			width: 100%;
			height: 80upx;
			display: flex;
			justify-content: center;
			align-items: center;
			font-size: 26upx;
			color: #999;
		}
	}

	.footer {
		position: fixed;
		bottom: 0upx;
		width: 100%;
		padding: 0 4%;
		height: 99upx;
		border-top: solid 1upx #eee;
		background: linear-gradient(to left, #ffffff, #d9d9d9);
		z-index: 2;
		display: flex;
		justify-content: space-between;
		align-items: center;

		.icons {
			display: flex;
			height: 80upx;
			margin-left: -4%;

			.box {
				width: 80upx;
				height: 80upx;
				display: flex;
				justify-content: center;
				flex-wrap: wrap;

				.icon {
					font-size: 40upx;
					color: #828282;
				}

				.text {
					display: flex;
					justify-content: center;
					width: 100%;
					font-size: 22upx;
					color: #666;
				}
			}
		}

		.btn {
			height: 80upx;
			border-radius: 40upx;
			overflow: hidden;
			display: flex;
			margin-right: -2%;

			.joinCart,
			.buy {
				height: 80upx;
				padding: 0 40upx;
				color: #fff;
				display: flex;
				align-items: center;
				font-size: 28upx;
			}

			.joinCart {
				background-color: #ff8f00;

			}

			.buy {
				background-color: #1a7785;
			}
		}
	}

	.popup {
		position: fixed;
		top: 0;
		width: 100%;
		height: 100%;
		z-index: 20;
		display: none;

		.mask {
			position: fixed;
			top: 0;
			width: 100%;
			height: 100%;
			z-index: 21;
			left: 0;
			background-color: rgba(0, 0, 0, 0.6);
		}

		.layer {
			position: fixed;
			z-index: 22;
			bottom: -70%;
			width: 100%;
			left: 0;
			box-sizing: border-box;
			padding: 0 4%;
			height: 70%;
			border-radius: 20upx 20upx 0 0;
			background-color: #fff;
			display: flex;
			flex-wrap: wrap;
			align-content: space-between;

			.content {
				width: 100%;
				padding: 20upx 0;
			}

			.btn {
				width: 100%;
				height: 100upx;

				.button {
					width: 100%;
					height: 80upx;
					border-radius: 40upx;
					color: #fff;
					display: flex;
					align-items: center;
					justify-content: center;
					background: linear-gradient(to right, #ceb80c, #dac20c);
					font-size: 28upx;
				}
			}
		}

		&.show {
			display: block;

			.mask {
				animation: showPopup 0.2s linear both;
			}

			.layer {
				animation: showLayer 0.2s linear both;
			}
		}

		&.hide {
			display: block;

			.mask {
				animation: hidePopup 0.2s linear both;
			}

			.layer {
				animation: hideLayer 0.2s linear both;
			}
		}

		&.none {
			display: none;
		}

		&.service {
			.row {
				margin: 30upx 0;

				.title {
					font-size: 30upx;
					margin: 10upx 0;
				}

				.description {
					font-size: 28upx;
					color: #999;
				}
			}
		}

		&.spec {
			.title {

				margin: 30upx 0;
				font-weight: 600;
				font-size: 32upx;
			}

			.sp {
				display: flex;

				view {
					font-size: 28upx;
					padding: 5upx 20upx;
					border-radius: 8upx;
					margin: 0 30upx 20upx 0;
					background-color: #f6f6f6;

					&.on {
						padding: 3upx 18upx;
						border: solid 1upx #ff8f00;
					}
				}
			}

			.length {
				margin-top: 30upx;
				border-top: solid 1upx #aaa;
				display: flex;
				justify-content: space-between;
				align-items: center;
				padding-top: 20upx;

				.text {
					font-size: 30upx;
					font-weight: 600;
					font-size: 32upx;

				}

				.number {
					display: flex;
					justify-content: center;
					align-items: center;

					.input {
						width: 80upx;
						height: 60upx;
						margin: 0 10upx;
						background-color: #f3f3f3;
						display: flex;
						justify-content: center;
						align-items: center;
						text-align: center;

						input {
							width: 80upx;
							height: 60upx;
							display: flex;
							justify-content: center;
							align-items: center;
							text-align: center;
							font-size: 26upx;
						}
					}

					.sub,
					.add {
						width: 60upx;
						height: 60upx;
						background-color: #f3f3f3;
						border-radius: 5upx;

						.icon {
							font-size: 30upx;
							width: 60upx;
							height: 60upx;
							display: flex;
							justify-content: center;
							align-items: center;

						}
					}
				}
			}

		}
	}

	.share {
		display: none;

		&.show {
			display: block;

			.mask {
				animation: showPopup 0.15s linear both;
			}

			.layer {
				animation: showLayer 0.15s linear both;
			}
		}

		&.hide {
			display: block;

			.mask {
				animation: hidePopup 0.15s linear both;
			}

			.layer {
				animation: hideLayer 0.15s linear both;
			}
		}

		&.none {
			display: none;
		}

		.mask {
			background-color: rgba(0, 0, 0, .5);
			position: fixed;
			width: 100%;
			height: 100%;
			top: 0;
			z-index: 11;
		}

		.layer {
			width: 100%;
			position: fixed;
			z-index: 12;
			padding: 0 4%;
			top: 100%;
			background-color: rgba(255, 255, 255, 0.9);

			.list {
				width: 100%;
				display: flex;
				padding: 10upx 0 30upx 0;

				.box {
					width: 25%;
					display: flex;
					justify-content: center;
					flex-wrap: wrap;

					image {
						width: 13.8vw;
						height: 13.8vw;
					}

					.title {
						margin-top: 10upx;
						display: flex;
						justify-content: center;
						width: 100%;
						font-size: 26upx;
					}
				}
			}

			.btn {
				width: 100%;
				height: 100upx;
				display: flex;
				justify-content: center;
				align-items: center;
				font-size: 28upx;
				border-top: solid 1upx #666666;
			}

			.h1 {
				width: 100%;
				height: 80upx;
				display: flex;
				justify-content: center;
				align-items: center;
				font-size: 34upx;
			}
		}
	}

	.service-content {
		color: #000000;
		display: flex;
		flex-wrap: wrap;
		margin-left: 3px;
	}
	
	.coupon-item {
		width: 100%;
		height: auto;
		display: table;
		border-radius: 10upx;
		padding: 0 20upx;
		margin-top: 22upx;
		border: 1px solid #eeeeee;
		position: relative;
	
		.coupon-money {
			width: 465upx;
			height: auto;
			display: table;
			float: left;
			padding: 26upx 0;
			border-style: none dotted none none;
			border-color: #eeeeee;
	
			.nick {
				width: 100%;
				height: 50upx;
				line-height: 30upx;
				font-size: 24rpx;
				color: #999999;
			}
	
			.tit {
				width: 100%;
				height: 50upx;
				line-height: 50upx;
				font-size: 24rpx;
				color: #999999;
			}
	
			.demand {
				width: 100%;
				height: 30upx;
				line-height: 30upx;
				font-size: 24rpx;
				color: #999999;
			}
	
			.layof {
				width: 100%;
				height: 48upx;
				line-height: 30upx;
				font-size: 44upx;
				color: #ceb80c;
				font-weight: bold;
			}
	
			.end_time {
				width: 100%;
				height: 30upx;
				line-height: 30upx;
				font-size: 24rpx;
				color: #999999;
			}
		}
		}
		.coupon-item {
			width: 100%;
			height: auto;
			display: table;
			border-radius: 10upx;
			padding: 0 20upx;
			margin-top: 22upx;
			border: 1px solid #eeeeee;
			position: relative;
		
			.coupon-money {
				width: 465upx;
				height: auto;
				display: table;
				float: left;
				padding: 26upx 0;
				border-style: none dotted none none;
				border-color: #eeeeee;
		
				.nick {
					width: 100%;
					height: 50upx;
					line-height: 30upx;
					font-size: 24rpx;
					color: #999999;
				}
		
				.tit {
					width: 100%;
					height: 50upx;
					line-height: 50upx;
					font-size: 24rpx;
					color: #999999;
				}
		
				.demand {
					width: 100%;
					height: 30upx;
					line-height: 30upx;
					font-size: 24rpx;
					color: #999999;
				}
		
				.layof {
					width: 100%;
					height: 48upx;
					line-height: 30upx;
					font-size: 44upx;
					color: #ceb80c;
					font-weight: bold;
				}
		
				.end_time {
					width: 100%;
					height: 30upx;
					line-height: 30upx;
					font-size: 24rpx;
					color: #999999;
				}
			}
		
			.get-btn {
				width: 146upx;
				height: 52upx;
				line-height: 50upx;
				position: absolute;
				top: 50%;
				right: 26upx;
				margin-top: -26upx;
				text-align: center;
				border-radius: 60upx;
				color: #ceb80c;
				border: 1px solid #ceb80c;
				font-size: 24rpx;
				float: right;
			}
		}
		
		.coupon-item:after {
			width: 40upx;
			height: 20upx;
			position: absolute;
			left: 460upx;
			top: -1px;
			border-radius: 0 0 40upx 40upx;
			content: "";
			display: block;
			background: #ffffff;
			border: 1px solid #eeeeee;
			border-top: 0px;
		}
		
		.coupon-item:before {
			width: 40upx;
			height: 20upx;
			position: absolute;
			left: 460upx;
			bottom: -1px;
			border-radius: 40upx 40upx 0 0;
			content: "";
			display: block;
			background: #ffffff;
			border: 1px solid #eeeeee;
			border-bottom: 0px;
		}
	
</style>
