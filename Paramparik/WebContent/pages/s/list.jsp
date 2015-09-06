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
							    <th>Enrolment No</th>
							    <th>Full Name</th>
								<th>Birth Date</th>
								<th>Gender</th>
								<th>Contact No</th>
								<th>Email</th>
								<th>Enrolment Date</th>
							</tr>
						</thead>
						<tbody>
							<s:if test="studentList != null && studentList.size > 0">
								<s:iterator value="studentList" var="sDTO" status="regStatus">
										<tr class="<s:if test="#regStatus.odd == true ">odd</s:if><s:else>even</s:else>">
										    <td width="10%">
												<a href="#" onclick="loadCommonPageList('/studentDetails.do?studentDTO.enrolmentId=','<s:property value="%{#sDTO.enrolmentId}"/>');"><s:property value="%{#sDTO.enrolmentId}"/></a>
											</td>
											<td width="10%"><s:property value="%{#sDTO.name}"/></td>
											<!-- <td width="30%"><span style="WORD-BREAK: BREAK-ALL;"><s:property value="%{#reg.workName}"/></span></td>  -->
											<td width="10%"><s:property value="%{#sDTO.dob}"/></td>
											<td width="10%"><s:property value="%{#sDTO.gender}"/></td>
											<td width="10%"><s:property value="%{#sDTO.contactNo}"/></td>
											<td width="10%"><s:property value="%{#sDTO.emailId}"/></td>
											<td width="10%"><s:property value="%{#sDTO.dateOfEnrolment}"/></td>
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

