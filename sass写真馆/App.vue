<script>
	export default {
		onLaunch: function() {
			console.log('App Launch')
			
		},
		onShow: function() {
			console.log('App Show')
		},
		onHide: function() {
			console.log('App Hide')
		}
	}
</script>

<style  lang="scss">
	@import "uview-ui/index.scss";
	@import "/static/iconfont/font.scss";
	@import url("/common/base.css");
	/* #ifdef MP-WEIXIN || APP-PLUS */
		::-webkit-scrollbar{
		    display: none;
		}
	/* #endif */
	/* 解决H5 的问题 */
	/* #ifdef H5 */
	    uni-scroll-view .uni-scroll-view::-webkit-scrollbar {
	    	/* 隐藏滚动条，但依旧具备可以滚动的功能 */
		display: none
	    }
	/* #endif */
	* {
	   touch-action: none;
	}
	/* 无下划线 */
	::-webkit-scrollbar {
	        display: none;  
	        width: 0 !important;  
	        height: 0 !important;  
	        -webkit-appearance: none;  
	        background: transparent;  
	    }
</style>
