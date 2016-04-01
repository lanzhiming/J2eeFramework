		<!-- 配置界面上的css -->
		<link rel="stylesheet" type="text/css" href="/J2eeFramework/trd/plupload-2.1.2/js/jquery.plupload.queue/css/jquery.plupload.queue.css">
		<script type="text/javascript" src="/J2eeFramework/trd/jquery/jquery-1.11.2.js"></script>
		<script type="text/javascript" src="/J2eeFramework/trd/plupload-2.1.2/js/plupload.full.min.js"></script>
		<script type="text/javascript" src="/J2eeFramework/trd/plupload-2.1.2/js/jquery.plupload.queue/jquery.plupload.queue.js"></script>

		<!-- 国际化中文支持 -->
		<script type="text/javascript" src="/J2eeFramework/trd/plupload-2.1.2/js/i18n/zh_CN.js"></script>
		<script type="text/javascript">
			// Initialize the widget when the DOM is ready
			$(function() {
				// Setup html5 version
				function plupload() {
					$("#uploader").pluploadQueue({
						// General settings
						runtimes : 'flash,html5,gears,browserplus,silverlight,html4',
						url : "/upload",
						//unique_names: true,
						chunk_size : '1mb',
						//rename : true,
						dragdrop : true,
						filters : {
							// Maximum file size
							max_file_size : '10mb',
							// Specify what files to browse for
							mime_types : [{
								title : "Image files",
								extensions : "jpg,gif,png"
							}, {
								title : "Zip files",
								extensions : "zip"
							}]
						},
						// Resize images on clientside if we can
						resize : {
							width : 200,
							height : 200,
							quality : 90,
							crop : true
							// crop to exact dimensions
						}, // Flash settings
						flash_swf_url : '/J2eeFramework/plupload-2.1.2/js/Moxie.swf',
						// Silverlight settings
						silverlight_xap_url : '/J2eeFramework/plupload-2.1.2/js/Moxie.xap',
						// 参数
						multipart_params : {
							'user' : 'Rocky',
							'time' : '2016-03-30'
						}

					});
				}

				plupload();

				$('#Reload').click(function() {
					plupload();
				});
			});

		</script>

		<div style="width:750px; margin:0px auto;">
			<div id="uploader">
				<p>
					您的浏览器未安装 Flash, Silverlight, Gears, BrowserPlus 或者支持 HTML5 .
				</p>
			</div>
			<input value="继续上传" id="Reload" type="button">
		</div>
