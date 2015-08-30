<%@ page language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/scripts/nrda.js"></script>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/ajaxSuggest/js/bsn.AutoSuggest_2.1.3.js"
	charset="utf-8"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/ajaxSuggest/css/autosuggest_inquisitor.css"
	type="text/css" media="screen" charset="utf-8" />

<script type="text/javascript">

	$(document).ready(function() {
		$("#fromExpDateId").datepicker({
			changeYear : true,
			numberOfMonths : 2,
			onSelect : function(selected) {
				$("#toExpDateId").datepicker("option", "minDate", selected);
			}
		});
		$("#toExpDateId").datepicker({
			changeYear : true,
			numberOfMonths : 2,
			onSelect : function(selected) {
				$("#fromExpDateId").datepicker("option", "maxDate", selected);
			}
		});
	});



	function selectReportType(reportTypeId) {
		//	alert("report type = " + reportTypeId);
		if (reportTypeId == '1') {
			$('#repByOfficerId').css("display", "none");
			jQuery('#reportsAction').html('');
			$('#reportsAction').css("display", "none");
			$('#repExpTableId').css("display", "block");
			//$('#repExpTableId').value();
			
			

		} else if (reportTypeId == '2') {
			$('#repExpTableId').css("display", "none");
			jQuery('#reportsAction').html('');
			$('#reportsAction').css("display", "none");
			$('#repByOfficerId').css("display", "block");
		}

		//	alert("after display ");
	}

	
</script>
</head>





<fieldset>
	<legend>
		<label class="labelNormal">Reports</label>
	</legend>
	<s:form id="reportsFormId" action="/reportsList.do" method="post"
		styleClass="formAlignment" enctype="multipart/form-data">
		<table align="left" border="0" width="100%">
			<tbody>
				<tr>
					<td width="16%"><span class="labelNormalStrong">Report
							Type<font color="red">*</font>:</span>
					</td>

					<td align="left"><s:select id="reportTypeId"
							list="#{'1':'By Expiry Date', '2':'By Officer'}"
							cssClass="DropDown" headerKey="-1" headerValue="-Select One-"
							name="reportDTO.reportType" theme="simple"
							onchange="selectReportType(this.value)" />
					</td>
					
					
				</tr>
			</tbody>
		</table>
		<table>
			<tr>
				<td height='6px' align="left">&nbsp;</td>
			</tr>
		</table>
		<table class="display" id="repExpTableId" align="left" border="0"
			width="100%" style='display: none;'>
			<tbody>
				<tr>
					<td width="15%" align="left"><span class="labelNormalStrong">From
							Date<font color="red">*</font>:</span>
					</td>
					<td width="25%" align="left"><s:textfield
							cssClass="TextBoxLarge" id="fromExpDateId"
							name="reportDTO.fromExpDate" maxlength="30" readonly="true"
							theme="simple" />
					</td>

					<td width="15%" align="right"><span class="labelNormalStrong">To
							Date<font color="red">*</font>:</span>
					</td>
					<td width="25%" align="left"><s:textfield
							cssClass="TextBoxLarge" id="toExpDateId"
							name="reportDTO.toExpDate" maxlength="30" readonly="true"
							theme="simple" />
					</td>

					<td width="5%">&nbsp;</td>
					<td width="12%"><input type="button" class="Button"
						value="Search" id="repButtonId1"></td>
				</tr>

			</tbody>
		</table>

		<table class="display" id="repByOfficerId" align="left" border="0"
			width="100%" style='display: none;'>
			<tbody>
				<tr>
					<td colspan="5" align="left">Officer Name :</td>
					<td align="left"><s:textfield cssClass="TextBoxLarge"
							id="officerUserNameId"
							name="reportDTO.officerName" maxlength="30"
							theme="simple" />
					</td>
					<td align="left"><s:hidden
							id="officerLoginId"
							name="reportDTO.officerLoginId" />
					</td>
					
					
					<td width="5%">&nbsp;</td>
					<td width="12%"><input type="button" class="Button"
						value="Search" id="repButtonId2">
					</td>
				</tr>
			</tbody>
		</table>
		<script type="text/javascript">
			var options_med_xml = {
				script : function(input) {
				//	alert("input = "+input);
					var userName = $("#officerUserNameId").val();
					var url = contextPath
							+ '/jsondataloader.data?fieldCons=AUTO_SUGEST&userName='
							+ userName;
					return url;
				},
				varname : "input"
			};
			var as_xml = new bsn.AutoSuggest('officerUserNameId','','',
					options_med_xml);
		</script>



	</s:form>
</fieldset>



<div id="reportsAction"></div>




