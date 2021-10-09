<template>
		<scroll-view scroll-x style="width:100%;height: 500rpx;" horizontal="true">
			<view class="category-box">
				<view class="category-column"> 
					<view class="profile">
						<view>
							<image src="../../static/coupon/19-36-00.png" mode=""></image>
						</view>
						<text class="fonts">加印卷</text>
						<text class="orange">1200纪念券</text>
						<text class="get">暂未获得</text>


					</view> 
					<view class="profile">
						<view>
							<image src="../../static/coupon/19-36-02.png" mode=""></image>
						</view>
						<text class="fonts">加修券</text>
						<text class="orange">4500纪念券</text>
						<text class="get">暂未获得</text>
					</view>
					<view class="profile">
						<view>
							<image src="../../static/coupon/19-37-14.png" mode=""></image>
						</view>
						<text class="fonts">美妆纪念盒</text>
						<text class="orange">10500纪念币</text>
						<view class="get">暂未获得</view>
					</view>
					<view class="profile">
						<view>
							<image src="../../static/coupon/19-36-07.png" mode=""></image>
						</view>
						<text class="fonts">文艺照</text>
						<text class="orange">30000纪念币</text>
						<view class="get">暂未获得</view>
					</view>
					<view class="profile">
						<view>
							<image src="../../static/coupon/19-36-10.png" mode=""></image>
						</view>
						<text class="fonts">全家福</text>
						<text class="orange">75000纪念币</text>
						<view class="get">暂未获得</view>
					</view>
				</view>
			</view>
		</scroll-view>
</template>

<script>
</script>

<style>
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
	.tab-h{
		white-space: nowrap;
	}
</style>
