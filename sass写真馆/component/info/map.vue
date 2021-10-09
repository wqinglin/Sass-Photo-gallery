<template>
		<!--pages/map/map.wxml-->
		<view class="page-body">
			<view class="page-section page-section-gap">
				<map id="myMap" style="width: 100%; height: 300px;" :scale="scale" :latitude="latitude"
					:longitude="longitude" :markers="markers" show-location></map>
			</view>
			<view class="info" style="font-size: 14px; line-height: 30px;">
				<view @click="phone">联系电话:{{tel}} ( 点击拨打 )</view>
				<view>校区地址:{{adress}}</view>
			</view>
			<view class="btn-area">
				
				<button @click="openLocation" class="page-body-button"  type="default" size="mini" hover-class="clickbutton">打开地理位置</button>
			</view>
		</view>
</template>

<script>
	export default {
		data() {
			return {
				latitude: 23.099994,
				longitude: 113.324520,
				scale: 13,
				tel: "400-618-9090",
				adress: "天津工业大学宾水西道399号",
				markers: [{
					id: 1,
					latitude: 23.099994,
					longitude: 113.324520,
					name: 'T.I.T 创意园'
				}],
			}
		},
		onReady: function(e) {
			this.mapCtx = uni.createMapContext('myMap')
		},
		methods: {
			phone() {
				uni.makePhoneCall({
					phoneNumber: '400-618-9090'
				})
			},
			// 常用
			openLocation(){
				uni.navigateTo({
					url: "../openLocation/openLocation"
				})
			}
		}
	}
</script>

<style>
	.page-body-button{
		display: flex;
		justify-content: space-around;
		width: 40%;
		margin-top: 10px;
		border:1px #333333 solid;
	}
	.clickbutton{
		background-color: #007AFF;
	}
</style>
