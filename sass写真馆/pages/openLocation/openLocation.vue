<template>
	<view>
		<view class="uni-common-mt">
			<form @submit="openLocation">
				<view class="uni-list">
					<view class="uni-list-cell">
						<view class="uni-list-cell-left">
							<view class="uni-label">经度</view>
						</view>
						<view class="uni-list-cell-db">
							<input class="uni-input" type="text" :disabled="true" value="117.176231"
								name="longitude"></input>
						</view>
					</view>
					<view class="uni-list-cell">
						<view class="uni-list-cell-left">
							<view class="uni-label">纬度</view>
						</view>
						<view class="uni-list-cell-db">
							<input class="uni-input" type="text" :disabled="true" value="39.107443"
								name="latitude"></input>
						</view>
					</view>
					<view class="uni-list-cell">
						<view class="uni-list-cell-left">
							<view class="uni-label">位置名称</view>
						</view>
						<view class="uni-list-cell-db">
							<input class="uni-input" type="text" :disabled="true" value="天津市大学软件学院" name="name"></input>
						</view>
					</view>
					<view class="uni-list-cell">
						<view class="uni-list-cell-left">
							<view class="uni-label">详细位置</view>
						</view>
						<view class="uni-list-cell-db">
							<input class="uni-input" type="text" :disabled="true" value="天津工业大学宾水西道339号"
								name="address"></input>
						</view>
					</view> 
				</view>
				<view class="uni-padding-wrap">
					<view class="uni-btn-v uni-common-mt">
						<button formType="submit" class="page-body-button" type="default" size="mini" hover-class="clickbutton">查看位置</button>
					</view>
				</view>
			</form>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				title: 'openLocation'
			}
		},
		methods: {
			openLocation: function(e) {
				console.log(e)
				var value = e.detail.value
				uni.openLocation({
					longitude: Number(value.longitude),
					latitude: Number(value.latitude),
					name: value.name,
					address: value.address
				})
			},
			 
		}
	}
</script>

<style>
	.popup-view {
		width: 500rpx;
	}

	.popup-title {
		display: block;
		font-size: 16px;
		line-height: 3;
		margin-bottom: 10px;
		text-align: center;
	}

	.popup-buttons button {
		margin-left: 4px;
		margin-right: 4px;
	}
	.uni-list-cell{
		display: flex;
		line-height: 40px;
		border-top: 1px #eee solid;
		border-bottom:1px  #eee solid;
		align-items: center;
		justify-content:space-between;
	}
	.uni-label{
		padding-left: 20px;
		box-sizing: border-box;
		font-size: 14px;
	}
	.uni-input{
		width: 100%;
		font-size: 13px;
		padding-right: 45px;
	}
	.page-body-button{
		display: flex;
		justify-content: center;
		width: 40%;
		margin-top: 20px;
		border:1px #333333 solid;
	}
	.clickbutton{
		background-color: #007AFF;
	}
</style>
