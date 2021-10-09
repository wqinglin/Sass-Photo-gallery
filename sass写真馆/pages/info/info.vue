<template>
	<view>
		<my-info></my-info>
	</view>
</template>
<script>
	export default {

		components: {
			MyInfo: () => import("../../component/info/info.vue")
		},
	}
</script>
