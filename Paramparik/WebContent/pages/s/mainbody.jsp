<script>
var contextPath = '<%=request.getContextPath() %>';
jQuery(document).ready(
		function() {
			var url = contextPath+"/homeLanding.do"; 
			$("#mainAction").load(url);
});



</script>

<div id="mainAction"></div>