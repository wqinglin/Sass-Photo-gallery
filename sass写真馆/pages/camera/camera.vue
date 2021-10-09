<template>
	<view>
		<camera></camera>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				
			}
		},
		methods: { 
			
		},
		components: {
			camera: () => import("../../component/uni-file-picker/upload-image.vue"),
		}
	}
</script>

<style>

</style>
