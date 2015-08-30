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
					<label class="labelNormal">All Registered Guarantees</label>
				</legend>
				<div><font color="red"><s:actionerror/></font></div>
				<div id="allGuaranteesFieldSet" style="display: block; z-index: -100px">
					<table width="99%" class="display" id="regTable" border="1"
						style="border-collapse: collapse">
						<thead>
							<tr>
								<th>Reg #</th>
								<th>Work Name</th>
								<th>Amount</th>
								<th>Expiry Date</th>
								<th>Updated By</th>
								<th>Upadated Date</th>
								<th>Upadated Comments</th>
							</tr>
						</thead>
						<tbody>
							<s:if test="regAuditList != null && regAuditList.size > 0">
								<s:iterator value="regAuditList" var="reg" status="regStatus">
										<tr class="<s:if test="#regStatus.odd == true ">odd</s:if><s:else>even</s:else>">
											<td width="10%"><s:property value="%{#reg.bgNo}"/></td>
											<td width="20%"><span style="WORD-BREAK: BREAK-ALL;"><s:property value="%{#reg.workName}"/></span></td>
											<td width="10%"><s:property value="%{#reg.amout}"/></td>
											<td width="10%"><s:property value="%{#reg.expiryDate}"/></td>
											<td width="15%"><s:property value="%{#reg.updatedBy}"/></td>
											<td width="15%"><s:property value="%{#reg.updatedDate}"/></td>
											<td width="20%"><span style="WORD-BREAK: BREAK-ALL;"><s:property value="%{#reg.updateComments}"/></span></td>
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







