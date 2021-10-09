<template>
	<view>
		
		<u-cell-group>
			<u-cell-item title="头像" @click='changeHead'>
				<u-image width='100rpx' height='100rpx' slot="right-icon" :src="userInfo.user[0].avatar" shape="circle">
				</u-image>
			</u-cell-item>
			<u-cell-item title="用户名" :value="userInfo.user[0].username" @click="open"></u-cell-item>
			<u-cell-item title="性别" :value="sex" @click='selectSex'></u-cell-item>
			<u-cell-item title="出生日期" :value="birthday" @click='show=true'></u-cell-item>
			<u-calendar v-model="show" @change="change"></u-calendar>
			
		</u-cell-group>
		
		<view>
			<!-- 输入框示例 -->
			<uni-popup ref="popup" type="dialog">
				<uni-popup-dialog
					ref="inputClose"
					mode="input"
					title="请输入新的用户名"
					:value="userInfo.user[0].username"
					:beforeClose="true"
					placeholder="请输入内容"
					@confirm="confirm"
					@close="close"
				></uni-popup-dialog>
			</uni-popup>
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
				headImg: '/static/logo.png',
				sex: '男',
				birthday: '请选择出生日期',
				show: false,
				msgType: 'success',
				value: '默认输入的内容',
				username: ''

			}
		},
		computed: {
			...mapGetters(['hasLogin', 'userInfo'])
		},
		methods: {
			changeHead() {
				uni.chooseImage({
					count: 1,
					success: (res) => {
						this.headImg = res.tempFilePaths[0]
						this.userInfo.user[0].avatar = this.headImg
						console.log(this.userInfo.user[0].avatar)
						uni.setStorage({ //缓存用户登陆状态
							key: 'userInfo',
							data: this.$store.state.userInfo
						})
					}
				});
			},
			selectSex() {
				const arr = ['男', '女', '保密']
				uni.showActionSheet({
					itemList: arr,
					success: (res) => {
						this.sex = arr[res.tapIndex]
					},
					fail: function(res) {
						console.log(res.errMsg);
					}
				});
			},
			change(e) {
				this.birthday = e.result
			},

			open() {
				console.log(22)
				this.$refs.popup.open()
				
			},
			close() {
				this.$refs.popup.close()
			},

			confirm(value) {
				console.log(value)
				this.userInfo.user[0].username = value
				uni.setStorage({
					key: 'userInfo',
					data: this.$store.state.userInfo
				})
				this.$refs.popup.close()
			}
 
		} 
		
	}
</script>

<style>

</style>
