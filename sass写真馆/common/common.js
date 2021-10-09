const domain = 'http://localhost:3000';
const domainUpload = 'http://localhost:3000/upload/'
export default {
	get: function(url, params = []) {
		var that = this;
		return new Promise(function(resolve, reject) {
			var data = {};
			for (var i in params) {
				data[i] = params[i]
			}
			uni.request({
				url: domain + url,
				data: data,
				method: 'GET',
				success: (res) => {
				
				 resolve(res.data)
					
				},
				fail: (err) => {
					reject(err)
				}

			})
		})
	},
	post: function(url, params = []) {
			return new Promise(function(resolve, reject) {
				var data = {};
				for (var i in params) {
					data[i] = params[i]
				}
				let header = {  // 没token 的编码
					'content-type': 'application/x-www-form-urlencoded'
				}
				let userInfo = uni.getStorageSync('userInfo');
				if (userInfo) {
					header = {
						'authorization': userInfo.token,  // Authorization 向服务传递token 
						'content-type': 'application/x-www-form-urlencoded'
					}
				}
				uni.request({
					url: domain + url,
					data: data,
					method: 'POST',
					header,
					success: (res) => {
						if (res.data.code == 1) {
							resolve(res.data)
						} else if(res.data.code == 801){
							console.log('没token');
						}else if (res.data.code == 802) { // 没 token 返回 801 ， token 过期  返回 802
						    uni.showModal({ // 重新登录
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
						} else {
							resolve(res.data)
						}
					},
					fail: function(err) {
						reject(err)
					}
	
				})
			})
		},
	getConfig: function(configName) {
		if (configName == 'domain') {
			return domain
		} else if (configName == 'domainUpload') {
			return domainUpload
		}
	}

}
