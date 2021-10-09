<template>
	<view class="flex">
		<scroll-view scroll-y scroll-with-animation
			style="height: calc(100vh - 239upx);width: 180upx;background-color: #f8f8f8;">
			<view class="type-item">
				<view v-for="courseTitle in catlogs">
					<view v-for="catlog in courseTitle.catlog"  :key="catlog.catlog_title" @click="select(catlog.id)" >
						{{catlog.catlog_title}}-{{catlog.id}}
					</view>
					</view>
				</view>
		</scroll-view>
		<scroll-view scroll-y style="height: calc(100vh - 239upx);width: 570upx;background-color: #ffffff;">
			<!-- <view>新品推荐</view>
			<view>套餐</view>
			<view>精致证件照</view>
			<view>新品推荐</view>-->

			<view v-for="courseTitle in catlogs">
				<view v-for="catlog in courseTitle.catlog" class="course-title" :key="catlog.catlog_title">
					<!-- {{catlog}} -->
					<!-- {{catlog.video_url.split(',')}} -->
					<view class="" v-for="item in catlog.video_url.split(',')" :key="item.id">
						 <image :src="domainUpload+item" mode=""></image>
					</view>
					
					<!-- <image :src="domainUpload+catlog.video_url" mode=""></image> -->
				</view>
			</view>
		</scroll-view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				types: ['新品推荐', '商品2', '商品3', '商品4', '商品5', '商品6', '商品7', '商品8', '商品9', '商品10', '商品11', '商品12', '商品13',
					'商品14'
				],
				selected:0,
				arr: [5,6,7],
				flag:true,
				
			}
		},
		methods: {
			select(id) {
				selected:this.catlogs
				console.log(id)
				// this.flag=!this.flag
			}
		},
		props: {
			catlogs: {
				type: Array,
				default: []
			},
			domainUpload: {
				type: String,
				default: ''
			}
		}
	}
</script>

<style>
	.flex {
		display: flex;
		margin-top: 10upx;
	}

	.type-item {
		height: 80upx;
		text-align: center;
		line-height: 80upx;
		position: relative;
		font-size: 12upx;
		color: #7A7E83;
		font-weight: bold;
	}

	.shuxian {
		position: absolute;
		width: 10upx;
		height: 30upx;
		background-color: #1a7785;
		top: 25upx;
		left: 5upx;
		border-radius: 40upx;
	}
	.active{
		background-color: #F8F8F8;
		color: #1A7785;
	}
</style>
