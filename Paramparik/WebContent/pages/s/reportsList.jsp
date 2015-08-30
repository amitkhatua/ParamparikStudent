<%@ taglib prefix="s" uri="/struts-tags"%>


<head>
<script type="text/javascript">
	$(document).ready(function() {
		var oTable = $('#repTable').dataTable();
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
					<table width="99%" class="display" id="repTable" border="1"
						style="border-collapse: collapse">
						<thead>
							<tr>
								<th>Reg #</th>
								<th>Expiry Date</th>
								<th>Work Name</th>
								<th>Bank Name</th>
								<th>Emd PG</th>
								<th>Section</th>
								<th>Officer</th>
								<th>Contractor</th>
								<th>Amount</th>
								
							</tr>
						</thead>
						<tbody>
							<s:if test="reportList != null && reportList.size > 0">
								<s:iterator value="reportList" var="rep" status="regStatus">
										<tr class="<s:if test="#regStatus.odd == true ">odd</s:if><s:else>even</s:else>">
											<td width="10%"><s:property value="%{#rep.bgNo}"/></td>
											<td width="10%"><span style="WORD-BREAK: BREAK-ALL;"><s:property value="%{#rep.expiryDate}"/></span></td>
											<td width="10%"><s:property value="%{#rep.workName}"/></td>
											<td width="10%"><s:property value="%{#rep.bankName}"/></td>
											<td width="10%"><s:property value="%{#rep.emdPg}"/></td>
											<td width="10%"><s:property value="%{#rep.sectionName}"/></td>
											<td width="15%"><s:property value="%{#rep.officerName}"/></td>
											<td width="15%"><s:property value="%{#rep.contractorName}"/></td>
											<td width="10%"><s:property value="%{#rep.amount}"/></td>
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







