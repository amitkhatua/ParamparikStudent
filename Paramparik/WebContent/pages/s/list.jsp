<%@ taglib prefix="s" uri="/struts-tags"%>


<head>
<script type="text/javascript">
	$(document).ready(function() {
		var oTable = $('#regTable').dataTable();
		oTable.fnPageChange( "next" );
		oTable.fnPageChange( "previous" );
	} );
</script>

</head>


<table width="100%" border="0">

	<tr>
		<td width="100%" align="left" valign="top">
			<fieldset>
				<legend>
					<label class="labelNormal">All Student List</label>
				</legend>
				<div><font color="red"><s:actionerror/></font></div>
				<div id="allGuaranteesFieldSet" style="display: block; z-index: -100px">
					<table width="99%" class="display" id="regTable" border="1"
						style="border-collapse: collapse">
						<thead>
							<tr>
							    <th>Reg No.</th>
							    <th>Full Name</th>
								<th>Reg Date</th>
								<th>Total Amount Taken</th>
							</tr>
						</thead>
						<tbody>
							<s:if test="regList != null && regList.size > 0">
								<s:iterator value="regList" var="reg" status="regStatus">
										<tr class="<s:if test="#regStatus.odd == true ">odd</s:if><s:else>even</s:else>">
										    <td width="10%">
												<a href="#" onclick="loadCommonPageList('/regDetails.do?guaranteeDTO.bgNo=','<s:property value="%{#reg.bgNo}"/>');"><s:property value="%{#reg.bgNo}"/></a>
											</td>
											<td width="10%"><s:property value="%{#reg.sectionName}"/></td>
											<td width="30%"><span style="WORD-BREAK: BREAK-ALL;"><s:property value="%{#reg.workName}"/></span></td>
											<td width="10%"><s:property value="%{#reg.amout}"/></td>
										</tr>
								</s:iterator>
							</s:if>
						</tbody>
					</table>
				</div>
			</fieldset>
		</td>
	</tr>

</table>

