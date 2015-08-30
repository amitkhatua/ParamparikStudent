
<script src="<%=request.getContextPath()%>/scripts/jqueryslidemenu.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/styles/jqueryslidemenu.css" type="text/css" rel="stylesheet">
<script>

var contextPath = '<%=request.getContextPath() %>';

		 $(function() {
			 
				$("#accordion").accordion({
					header : "> div > h3"
				}).sortable({
					axis : "y",
					handle : "h3",
					stop : function(event, ui) {
						// IE doesn't register the blur when sorting
						// so trigger focusout handlers to remove .ui-state-focus
						ui.item.children("h3").triggerHandler("focusout");
					}
				});
			});

		 function loadCommonPage(page){	
				var url = contextPath+page; 
				$("#mainAction").load(url); 
			}
		 function loadCommonPageList(page,value)
		     {	var url = contextPath+page+encodeURIComponent(value); 
				$("#mainAction").load(url); 
			}
		
</script>

<style>
/* IE has layout issues when sorting (see #5413) */
.group {
	zoom: 1
}
</style>

<div id="dialog-modal" style="display: none; vertical-align: middle;" align="center"><img src="<%=request.getContextPath()%>/images/ajax-loader_blue.gif"></div>
  
  			<div id="accordion">
						<div class="group">
							<h3> </h3>
							<div>
								<table>
									<tr>
										<td align="left"><a href ="#"><span class="Label" style="font-size: 1.0em" onclick="loadCommonPage('/homeLanding.do')">Home</span></a></td>
									</tr>
									<tr><td align="left" height='5px'></td></tr>
									<tr>
										<td align="left"><a href ="#"><span class="Label" style="font-size: 1.0em" onclick="loadCommonPage('/regList.do')">Student Registration List</span></a></td>
									</tr>
									<tr><td align="left" height='5px'></td></tr>
									<tr>
										<td align="left"><a href ="#"><span class="Label" style="font-size: 1.0em" onclick="loadCommonPage('/newReg.do')">New Student Registration</span></a></td>
									</tr>
									<tr><td align="left" height='5px'></td></tr>
									<tr>
										<td align="left"><a href ="#"><span class="Label" style="font-size: 1.0em" onclick="loadCommonPage('/reports.do')">Reports</span></a></td>
									</tr>
								</table>
							</div>
						</div>
						</div>
  
  
  
                 
                
                

