
<script src="<%=request.getContextPath()%>/scripts/jquery-1.9.1.js" type="text/javascript"></script>

<script>
var contextPath = '<%=request.getContextPath() %>';
alert(contextPath);
 jQuery(document).ready(
			function() {
				var url = contextPath+"/login.do"; 
				$("#mainAction").load(url);
});

</script>