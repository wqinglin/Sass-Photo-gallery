<template>
	 <view class="container"> 
		 <swiper class="swp" circular duration="100">
			<swiper-item class="aa" v-for="(item,index) in bgc" :key="index" :class="bgc[index]">
				<view :class="index==id[0]?'active':'hide'">
					<view class="cc">
						<image src="../../static/my_img/19-55-45.png" mode="widthFix" class="img"></image>
						<h1 class="h1">新鲜人<text class="icon">&#174;</text></h1>
						<view class="progress-box">
							<progress show-info stroke-width="3" />
						</view>
						<text>还差</text><b>1200成长值</b><text style="color:#C1C1C1">或</text><b>2次消费</b><text
							style="color:#C1C1C1">升级</text>
					</view>

					<view class="listup">
						<view class="list">
							<text class="f1">当前已解锁2项权益</text>
							<view class="item" v-for="(item,index) in listOne" :key="item.id">
								<image :src="domainUpload+item.imgurl" class="cl"></image>
								<text style="color: #000000;">{{item.name}}</text>
							</view>
						</view>
					</view>
				</view>
				<view :class="index==id[1]?'active':'hide'">
					<view class="cc">
						<image src="../../static/my_img/13-29-06.png" mode="widthFix" class="img"></image>
						<h1 class="h1">爱好者<text class="icon">&#174;</text></h1>
						<b>1200成长值</b><text style="color:#C1C1C1">或</text><b>2次消费</b><text
							style="color:#C1C1C1">升级</text></text>
					</view>
					<view class="listup">
						<view class="list">
							<text class="f1" style="color: rgb(148, 105, 70);">暂无解锁该等级权益</text>
							<view class="item" v-for="(item,index) in listTwo" :key="item.id">
								<image :src="domainUpload+item.imgurl" class="cl"></image>
								<text style="color: #000000;">{{item.name}}</text>
							</view>
						</view>
					</view>
				</view>
				<view :class="index==id[2]?'active':'hide'">
					<view class="cc">
						<image src="../../static/my_img/13-29-09.png" mode="widthFix" class="img"></image>
						<h1 class="h1">圈内人<text class="icon">&#174;</text></h1>
						<b>5000成长值</b><text style="color:#eee">或</text><b>4次消费</b><text
							style="color:#C1C1C1">升级</text></text>
					</view>
					<view class="listup">
						<view class="list">
							<text class="f1" style="color:rgb(241, 130, 19) ;">暂无解锁该等级权益</text>
							<view class="item" v-for="(item,index) in listThree" :key="item.id">
								<image :src="domainUpload+item.imgurl" class="cl"></image>
								<text style="color: #000000;">{{item.name}}</text>
							</view>
						</view>
					</view>
				</view>
				<view :class="index==id[3]?'active':'hide'">
					<view class="cc">
						<image src="../../static/my_img/13-29-12.png" mode="widthFix" class="img"></image>
						<h1 class="h1">艺术家<text class="icon">&#174;</text></h1>
						<b>10000成长值</b><text style="color:#C1C1C1">或</text><b>6次消费</b><text
							style="color:#C1C1C1">升级</text></text>
					</view>
					<view class="listup">
						<view class="list">
							<text class="f1" style="color: rgb(53, 32, 119);">暂无解锁该等级权益</text>
							<view class="item" v-for="(item,index) in listFour" :key="item.id">
								<image :src="domainUpload+item.imgurl" class="cl"></image>
								<text style="color: #000000;">{{item.name}}</text>
							</view>
						</view>
					</view>
				</view>
			</swiper-item>
		</swiper>
		<view class="extra">
			<view class="cere">
				<text>当前纪念值 0</text>
				<text>></text>
			</view>
			<view class="perInfo">
				<view class="inpro">
					<text>完善个人信息</text>
					<view>+200纪念币</view>
				</view>
				<view>
					<navigator url="../info/info">
						<button class="btn">去完成</button>
					</navigator>
				</view>
			</view>
			<view class="bei">
				<text>里程碑</text>
				<text>已累计0纪念值 ></text>
			</view>
			<memcoupon></memcoupon>
		</view> 
		
	</view>
	
</template>

<script>
	export default {
		data() {
			return {
				listOne: [],
				listTwo: [],
				listThree: [],
				listFour: [],
				id: [0, 1, 2, 3],
				list_id: [],
				bgc: ['bgc1', 'bgc2', 'bgc3', 'bgc4'],
			}
		},

		onLoad: function(options) {
			this.domainUpload = this.common.getConfig('domainUpload');
			this.mylistOne();
			this.mylistTwo();
			this.mylistThree();
			this.mylistFour();
		},

		methods: {
			async mylistOne() {
				await this.common.get('/api/mylist?currentPage=2', []).then((res) => {
					console.log(res.data);
					this.listOne = res.data;
				})
			},
			async mylistTwo() {
				await this.common.get('/api/mylist?currentPage=3', []).then((res) => {
					console.log(res.data);
					this.listTwo = res.data;
				})
			},
			async mylistThree() {
				await this.common.get('/api/mylist?currentPage=4', []).then((res) => {
					console.log(res.data);
					this.listThree = res.data;
				})
			},
			async mylistFour() {
				await this.common.get('/api/mylist?currentPage=5', []).then((res) => {
					console.log(res.data);
					this.listFour = res.data;
				})
			},

		},
		components: {
			memcoupon: () => import("./memcoupon.vue")
		}

	}
</script>

<style>
	.container {
		position: relative;
	}

	.swp {
		height: 1000rpx;
	}

	.aa {
		border-top: 1rpx solid #EEEEEE;

	}

	.cc {
		margin-top: -90%;
		padding-left: 40rpx;
		width: 100%;
	}

	.active {
		display: block;
		color: #fff;
	}

	.hide {
		display: none;
	}

	.icon {
		font-size: 30rpx;
		padding-left: 10rpx;
		padding-top: 40rpx;
	}

	.h1 {
		line-height: 70rpx;
	}

	.bgc1 {
		background:
			url(../../static/my_img/13-28-40.png) rgb(25, 123, 135) right -10rpx no-repeat;
		background-size: 300rpx;
	}

	.bgc2 {
		background:
			url(../../static/my_img/13-28-47.png) rgb(148, 105, 70) right -10rpx no-repeat;
		background-size: 300rpx;
	}

	.bgc3 {
		background: url(../../static/my_img/13-28-52.png) rgb(241, 130, 19) right -10rpx no-repeat;
		background-size: 300rpx;
	}

	.bgc4 {
		background: url(../../static/my_img/19-57-37.png) rgb(53, 32, 119) right -10rpx no-repeat;
		background-size: 300rpx;
	}

	.extra {
		height: 800rpx;
		width: 86%;
		margin: 0 auto;
		overflow: hidden;
	}

	.picture1 {
		position: absolute;
		top: 120rpx;
		right: 0rpx;
		width: 300rpx;
		z-index: 999;
	}

	.img {
		width: 80rpx;
		border: 2px #fff solid;
		border-radius: 50%;
	}

	.aa {
		display: flex;
		box-sizing: border-box;
		align-items: center;
	}

	.list .f1 {
		padding-left: 60rpx;
		font-size: 30rpx;
		display: block;
		height: 100rpx;
		width: 100%;
		line-height: 100rpx;
		font-weight: bold;
	}

	.listup {
		background-color: #FFFFFF;
		position: absolute;
		top: 550rpx;
		border-top-left-radius: 50rpx;
		border-top-right-radius: 50rpx;
	}

	.list {
		width: 100%;
		height: 450rpx;
		display: flex;
		flex-wrap: wrap;
		align-items: center;

	}

	.list view {
		width: 25%;
		text-align: center;
	}

	.list text {
		display: block;
		color: #1a7785;
		font-size: 30rpx;
		line-height: 70rpx;
	}

	.list image {
		width: 70rpx;
		height: 70rpx;
	}

	.cere,
	.bei {
		border-top: 2rpx #eee solid;
		display: flex;
		justify-content: space-between;
		font-size: 30rpx;
		height: 100rpx;
		align-items: center;
		font-weight: bold;
	}

	.cere>text:nth-child(2),
	.bei>text:nth-child(2),
		{
		font-size: 40rpx;
	}

	.perInfo,
	.bei {
		display: flex;
		align-items: center;
		justify-content: space-between;
		line-height: 70rpx;
	}

	.btn {
		background-color: #000000;
		width: 150rpx;
		height: 50rpx;
		border-radius: 25rpx;
		background-color: rgb(25, 123, 135);
		color: #fff;
		font-size: 10rpx;
		display: flex;
		align-items: center;
	}

	
	
	
	
	.category-box {
		padding: 30rpx;
		width: 230%;
		background-color: #fff;
		display: flex;
	}
	
	.category-column {
		width: 100%;
		margin-top: 10rpx;
		display: flex;
		justify-content: space-between;
	}
	
	.profile {
		width: 18%;
		height: 400rpx;
		display: flex;
		border-radius: 20rpx;
		justify-content: center;
		box-shadow: 0rpx 0rpx 6rpx #989a9d;
		flex-direction: column;
		text-align: center;
	}
	
	.profile image {
		margin-top: 10rpx;
		width: 200rpx;
		height: 200rpx;
	}
	
	.fonts {
		font-size: 30rpx;
		line-height: 40rpx;
	}
	
	.orange {
		color: orange;
		font-size: 20rpx;
		padding: 10rpx 0rpx;
		box-sizing: border-box;
	}
	
	.get {
		width: 170rpx;
		background-color: #c2c2c2;
		display: flex;
		justify-content: center;
		align-items: center;
		color: #818181;
		margin: 0 auto;
		border-radius: 30rpx;
	}
	
</style>
