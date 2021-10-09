<template>
	<view class="list">
		<view class="item-row item" @click="every(item.id)" v-for="(item,index) in mylist" :key="item.id">
			<image :src="domainUpload+item.imgurl"></image>
			<text class="title">{{item.name}}</text>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {}
		},
		props: {
			mylist: {
				type: Array,
				value: []
			},
			domainUpload: {
				type: String,
				value: ''
			}
		},
		methods: {
			every(id) {
				if (id == 1) {
					uni.navigateTo({
						url: "/pages/info/info?id=" + id + "&link=" + this.link,
					})
				} else if (id == 5) {
					uni.navigateTo({
						url: "/pages/standard/standard?id=" + id,
					})
				} else if (id == 8) {
					uni.navigateTo({
						url: "/pages/map/map?id=" + id,
					})
				}
			}
		}
	}
</script>

<style>
	.list {
		height: 360rpx;
		display: flex;
		flex-wrap: wrap;
		justify-content: space-around;
		align-items: center;
		text-align: center;
	}

	.list view {
		width: 25%;
	}

	.list text {
		display: block;
		color: #1a7785;
		font-size: 30rpx;
	}

	.list image {
		width: 60rpx;
		height: 60rpx;
	}
</style>
