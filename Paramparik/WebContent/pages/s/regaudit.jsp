<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ page language="java" %>



<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/scripts/nrda.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var validator = $("#auditRegFormId").validate({	
		rules:{
			'guaranteeDTO.bgNo':{
				required:true
			}
		},
		submitHandler: function(form) {
			event.preventDefault();
		}
	  });
	});


</script>
</head>





<fieldset>
<legend><label class="labelNormal">Bank Guarantee Audit Details</label></legend>
<s:form id="auditRegFormId" action="/auditRegList.do" method="post" styleClass="formAlignment" enctype="multipart/form-data">
<table align="left" border="0" width="100%" >
		<tbody>
		<tr>
			<td width="24%"><span class="labelNormalStrong">Bank Guarantee No<font color="red">*</font>:</span></td>
			<td width="24%"><s:textfield cssClass="TextBoxLarge" id="bgNoId" name="guaranteeDTO.bgNo" maxlength="30" theme="simple"/></td>
			<td width="24%">&nbsp;</td>
			<td width="4%"><input type="button" class="Button" value="Search" id="appAuditButtonId"></td>
		</tr>

</tbody>
</table>
</s:form>
</fieldset>



<div id="auditAction"></div>




