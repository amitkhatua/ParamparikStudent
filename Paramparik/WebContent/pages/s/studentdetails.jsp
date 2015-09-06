<%@ page language="java"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/scripts/paramparik.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/ajaxSuggest/js/bsn.AutoSuggest_2.1.3.js"
	charset="utf-8"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/ajaxSuggest/css/autosuggest_inquisitor.css"
	type="text/css" media="screen" charset="utf-8" />

<!-- 
<script type="text/javascript">
	var options_med_xml = {
		script : function(input) {
			var userName = $("#officerUserNameId_0").val();
			var url = contextPath
					+ '/jsondataloader.data?fieldCons=AUTO_SUGEST&userName='
					+ userName;
			return url;
		},
		varname : "input"
	};
	var as_xml = new bsn.AutoSuggest('officerUserNameId_0',
			'officerUserEmailId_0', 'officerUserMobNo_0', options_med_xml);
</script>

 
<script type="text/javascript">
	var options_med_xml = {
		script : function(input) {
			var userName = $("#officerUserNameId_1").val();
			var url = contextPath
					+ '/jsondataloader.data?fieldCons=AUTO_SUGEST&userName='
					+ userName;
			return url
		},
		varname : "input"
	};
	var as_xml = new bsn.AutoSuggest('officerUserNameId_1',
			'officerUserEmailId_1', 'officerUserMobNo_1', options_med_xml);
</script>

<script type="text/javascript">
	var options_med_xml = {
		script : function(input) {
			var userName = $("#officerUserNameId_2").val();
			var url = contextPath
					+ '/jsondataloader.data?fieldCons=AUTO_SUGEST&userName='
					+ userName;
			return url
		},
		varname : "input"
	};
	var as_xml = new bsn.AutoSuggest('officerUserNameId_2',
			'officerUserEmailId_2', 'officerUserMobNo_2', options_med_xml);
</script>
 -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#expiryDateId').datepicker({
			changeMonth : true,
			changeYear : true,
			dateFormat : 'dd/mm/yy',
			//endDate: (new Date()),
			minDate : -0

		});
	});

	$(document).ready(function() {

		var validator = $("#newRegFormId").validate({
			rules : {
				'studentDTO.enrolmentId' : {
					required : true
				},
				'studentDTO.workName' : {
					required : true
				},
				'studentDTO.sectionId' : {
					required : true
				},
				'studentDTO.emdPg' : {
					required : true
				},
				'studentDTO.bankName' : {
					required : true
				},
				'studentDTO.amout' : {
					required : true
				},
				'studentDTO.sectionId' : {
					required : true
				},
				'studentDTO.expiryDate' : {
					required : true
				},
				'studentDTO.levelOneDay' : {
					required : true
				},
				'studentDTO.levelTwoDay' : {
					required : true
				},
				'studentDTO.levelThreeDay' : {
					required : true
				},

				'studentDTO.contractorName' : {
					required : true
				},
				'studentDTO.contractorName' : {
					required : true
				},
				'studentDTO.emdPg' : {
					required : true
				}
				

			},
			submitHandler : function(form) {
				event.preventDefault();
			}
		});
	});
</script>
</head>
<body>

	<fieldset>
		<legend>
			<label class="labelNormal">Student Details</label>
		</legend>
		<s:form id="newRegFormId" action="/newRwgSubmit.do" method="post"
			styleClass="formAlignment" enctype="multipart/form-data">
			<font color="red"><s:actionerror /> </font>
			<font color="green"><s:actionmessage /> </font> <!-- the notification message -->
			<span style="font-size: 8pt; font-style: italic; font-weight: bold"><i><font color="red">*</font> marked fields are mandatory</i> </span>
					
					
			<table align="left" border="0" width="100%">
			<tr>
			<td colspan="5" align="left">
			
			<fieldset>
				<legend>
					<label class="labelNormal">Personal Details</label>
				</legend>
				
				<table align="left" border="0" width="100%">
				<tbody>
					<s:if test="%{studentDTO.newReg == 'false'}">
					<tr>
						<td colspan="5"><span class="labelNormal">Student Enrolment Id :</span><span class="labelNormalStrong"><s:property value="enrolmentNumber"/></span></td>
					</tr>
					</s:if>					
					<tr>
						<td width="24%"><span class="labelNormalStrong">First Name<font color="red">*</font>:</span></td>
						<td width="24%"><s:textfield cssClass="TextBoxLarge" id="fNameId" name="studentDTO.firstName" maxlength="30" theme="simple"/></td>
						<td width="4%"></td>
						<td width="24%"><span class="labelNormalStrong">Last Name<font color="red">*</font>:</span></td>
						<td width="24%"><s:textfield cssClass="TextBoxLarge" id="lNameId" name="studentDTO.lastName" maxlength="50" theme="simple" /></td>
					</tr>
					<tr>
						<td align="left"><span class="labelNormalStrong">Father Name<font color="red">*</font>:</span></td>
						<td align="left"><s:textfield cssClass="TextBoxLarge" id="fatherNameId" name="studentDTO.fatherName" maxlength="30" theme="simple" /></td>
						<td align="left">&nbsp;</td>
						<td align="left"><span class="labelNormalStrong">Guardian Name<font color="red">*</font>:</span></td>
						<td align="left"><s:textfield cssClass="TextBoxLarge" id="guardianNameId" name="studentDTO.guardianName" maxlength="30" theme="simple" /></td>
					</tr>
					<tr>
						<td align="left"><span class="labelNormalStrong">Student Contact No.<font color="red">*</font>:</span></td>
						<td align="left"><s:textfield cssClass="TextBoxLarge" id="contactNoId" name="studentDTO.contactNo" maxlength="30" theme="simple" />
							<script type="text/javascript">
									$("#contactNoId").numeric({
										negative : false
									});
								</script>
						</td>
						<td align="left">&nbsp;</td>
						<td align="left"><span class="labelNormalStrong">Guardian Contact No.<font color="red">*</font>:</span></td>
						<td align="left"><s:textfield cssClass="TextBoxLarge" id="guardianNoId" name="studentDTO.guardianContactNo" maxlength="10" theme="simple" /> 
							<script type="text/javascript">
									$("#guardianNoId").numeric({
										negative : false
									});
								</script>	
						</td>
					</tr>
					<tr>
						<td align="left"><span class="labelNormalStrong">Emergency Contact No.<font color="red">*</font>:</span></td>
						<td align="left"><s:textfield cssClass="TextBoxLarge" id="emergencyContactNoId" name="studentDTO.emergencyContactNo" maxlength="30" theme="simple" />
							<script type="text/javascript">
									$("#emergencyContactNoId").numeric({
										negative : false
									});
								</script>
						</td>
						<td align="left">&nbsp;</td>
						<td align="left"><span class="labelNormalStrong">Email Id<font color="red">*</font>:</span></td>
						<td align="left"><s:textfield cssClass="TextBoxLarge" id="emailId" name="studentDTO.emailId" maxlength="10" theme="simple" /></td>
					</tr>

				</tbody>
					<tr>
						<td colspan="5" align="left">&nbsp;</td>
					</tr>
					</table>
			</fieldset>
			<fieldset>
				<legend>
					<label class="labelNormal">Course Details</label>
				</legend>
							<table align="left" border="0" width="100%">
				<tbody>
					<tr>
						<td width="24%"><span class="labelNormalStrong">Institute Name<font color="red">*</font>:</span></td>
						<td width="24%"><s:select id="instituteId" list="instituteList"
								cssClass="DropDown" listKey="itemValue" listValue="itemLebel"
								headerKey="" headerValue="-Select One-"
								name="studentDTO.instituteId" theme="simple"/></td>
						<td width="4%"></td>
						<td width="24%"><span class="labelNormalStrong">Course Name<font color="red">*</font>:</span></td>
						<td width="24%"><s:select id="courseId" list="courseList"
								cssClass="DropDown" listKey="itemValue" listValue="itemLebel"
								headerKey="" headerValue="-Select One-"
								name="studentDTO.courseId" theme="simple"/></td>
					</tr>
				</tbody>
				</table>				
			</fieldset>
			</td>
			</tr>
			<tr><td colspan="5" align="left">&nbsp;</td></tr>

					<s:if test="%{studentDTO.newReg == 'false'}">
						<tr>
							<td colspan="5" align="left"><input type="button" class="Button" value="Update" id="applicationUpdateButtonId"></td>
						</tr>
					</s:if>
					<s:else>
						<tr>
							<td colspan="5" align="left"><input type="button" class="Button" value="Submit" id="applicationSubmitButtonId"></td>
						</tr>

					</s:else>
				</tbody>
			</table>
		</s:form>
	</fieldset>

</body>





