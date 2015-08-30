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
				'guaranteeDTO.bgNo' : {
					required : true
				},
				'guaranteeDTO.workName' : {
					required : true
				},
				'guaranteeDTO.sectionId' : {
					required : true
				},
				'guaranteeDTO.emdPg' : {
					required : true
				},
				'guaranteeDTO.bankName' : {
					required : true
				},
				'guaranteeDTO.amout' : {
					required : true
				},
				'guaranteeDTO.sectionId' : {
					required : true
				},
				'guaranteeDTO.expiryDate' : {
					required : true
				},
				'guaranteeDTO.levelOneDay' : {
					required : true
				},
				'guaranteeDTO.levelTwoDay' : {
					required : true
				},
				'guaranteeDTO.levelThreeDay' : {
					required : true
				},

				'guaranteeDTO.contractorName' : {
					required : true
				},
				'guaranteeDTO.contractorName' : {
					required : true
				},
				'guaranteeDTO.emdPg' : {
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
			<label class="labelNormal">Bank Guarantee Details</label>
		</legend>
		<s:form id="newRegFormId" action="/newRwgSubmit.do" method="post"
			styleClass="formAlignment" enctype="multipart/form-data">
			<font color="red"><s:actionerror /> </font>
			<font color="green"><s:actionmessage /> </font> <!-- the notification message -->
			<span style="font-size: 8pt; font-style: italic; font-weight: bold"><i><font
					color="red">*</font> marked fields are mandatory</i> </span>
			<table align="left" border="0" width="100%">
				<tbody>
					<tr>
						<td width="24%"><span class="labelNormalStrong">Bank
								Guarantee No<font color="red">*</font>:</span></td>
						<td width="24%"><s:if
								test="%{guaranteeDTO.newReg == 'false'}">
								<s:textfield cssClass="TextBoxLarge" id="bgNoId"
									name="guaranteeDTO.bgNo" maxlength="30" theme="simple"
									readonly="true" />
							</s:if> <s:else>
								<s:textfield cssClass="TextBoxLarge" id="bgNoId"
									name="guaranteeDTO.bgNo" maxlength="30" theme="simple"
									onchange="checkIsReg(this.value);" />
							</s:else> <label class="labelNormalError"><span id="regErrorMsg"
								style="display: none"></span> </label></td>
						<td width="4%"></td>
						<td width="24%"><span class="labelNormalStrong">Work
								Name<font color="red">*</font>:</span></td>
						<td width="24%"><s:textfield cssClass="TextBoxLarge"
								id="workNameId" name="guaranteeDTO.workName" maxlength="50"
								theme="simple" /></td>
					</tr>
					<tr>
						<td align="left"><span class="labelNormalStrong">Bank
								Name<font color="red">*</font>:</span></td>
						<td align="left"><s:textfield cssClass="TextBoxLarge"
								id="bankNameId" name="guaranteeDTO.bankName" maxlength="30"
								theme="simple" /></td>
						<td align="left">&nbsp;</td>
						<td align="left"><span class="labelNormalStrong">Amount
								(Rs.)<font color="red">*</font>:</span></td>
						<td align="left"><s:textfield cssClass="TextBoxLarge"
								id="amoutId" name="guaranteeDTO.amout" maxlength="10"
								theme="simple" /> <script type="text/javascript">
									$("#amoutId").numeric({
										negative : false
									});
								</script></td>
					</tr>
					<tr>
						<td align="left"><span class="labelNormalStrong">EMD/PG<font
								color="red">*</font>:</span></td>
						<td align="left">
						<s:select id="emdPgId" list="emdPgIdList"
								cssClass="DropDown" listKey="itemValue" listValue="itemLebel"
								headerKey="" headerValue="-Select One-"
								name="guaranteeDTO.emdPg" theme="simple"/>
						<td align="left">&nbsp;</td>
						<td align="left"><span class="labelNormalStrong">Expiry
								Date<font color="red">*</font>:</span></td>
						<td align="left"><s:textfield cssClass="TextBoxLarge"
								id="expiryDateId" name="guaranteeDTO.expiryDate" maxlength="30"
								readonly="true" theme="simple" /></td>
					</tr>
					<tr>
						<td align="left"><span class="labelNormalStrong">Section<font
								color="red">*</font>:</span></td>
						<td align="left"><s:select id="sectionId" list="sectionList"
								cssClass="DropDown" listKey="itemValue" listValue="itemLebel"
								headerKey="" headerValue="-Select One-"
								name="guaranteeDTO.sectionId" theme="simple"
								onchange="selectSectionHead(this.value)" /></td>
						<td align="left">&nbsp;</td>
						<td align="left"><span class="labelNormalStrong">Keyword/File No.:</span></td>
						<td align="left"><s:textfield cssClass="TextBoxLarge"
								id="keyWord" name="guaranteeDTO.keyWord" maxlength="30"
								theme="simple" /></td>
						
						<td align="left">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5" align="left">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5" align="left">Reminder notification will be
							sent to the following officers:</td>
					</tr>
					<tr>
						<td colspan="5" align="left"><table width="100%"
								id="officerTableId">
								<s:iterator value="guaranteeDTO.officers" status="officerStatus"
									var="officers">

									<tr>
										<td colspan="5" align="left">Officer Details :</td>
									</tr>
									<tr>
										<td align="left"><span class="labelNormalStrong">Name<font
												color="red">*</font>:</span></td>
										<td align="left"><s:textfield cssClass="TextBoxLarge"
												id="officerUserNameId_%{#officerStatus.index}"
												name="guaranteeDTO.officers[%{#officerStatus.index}].userFullName"
												maxlength="30" theme="simple" /></td>
										<td align="left"><s:hidden
												id="officerUserName_%{#officerStatus.index}"
												name="guaranteeDTO.officers[%{#officerStatus.index}].userLoginName" />
										</td>
										<td align="left">&nbsp;</td>
										<td align="left">&nbsp;</td>
									</tr>
									<%--<s:if test="%{guaranteeDTO.newReg == 'false'}"> --%>
									<tr>
										<td align="left"><span class="labelNormalStrong">Email
												Id<font color="red">*</font>:</span></td>
										<td align="left"><s:textfield cssClass="TextBoxLarge"
												id="officerUserEmailId_%{#officerStatus.index}"
												name="guaranteeDTO.officers[%{#officerStatus.index}].emailId"
												maxlength="50" theme="simple" /></td>
										<td align="left">&nbsp;</td>
										<td align="left">&nbsp;</td>
										<td align="left">&nbsp;</td>
									</tr>
									<tr>
										<td align="left"><span class="labelNormalStrong">Mobile
												No<font color="red">*</font>:</span></td>
										<td align="left"><s:textfield cssClass="TextBoxLarge"
												id="officerUserMobNo_%{#officerStatus.index}"
												name="guaranteeDTO.officers[%{#officerStatus.index}].mobileNo"
												maxlength="10" theme="simple" /> 
										</td>
										<td align="left">&nbsp;</td>
										<td align="left">&nbsp;</td>
										<td align="left">&nbsp;</td>
									</tr>
									<%--</s:if> --%>
								</s:iterator>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="3" align="left">&nbsp;</td>
					</tr>


					<tr>
						<td colspan="3" align="left"><table width="100%"
								id="contractorTableId">

								<tr>
									<td colspan="5" align="left">Contractor Details:</td>
								</tr>
								<tr>
									<td width="48%"><span class="labelNormalStrong">Contractor Name<font color="red">*</font>:</span></td>
									<td width="24%"><s:textfield cssClass="TextBoxLarge"
											id="contractorId" name="guaranteeDTO.contractorName" maxlength="50"
											theme="simple" /></td>
								</tr>
								<%--<s:if test="%{guaranteeDTO.newReg == 'false'}"> --%>
								<tr>
									<td width="48%"><span class="labelNormalStrong">Email Id :</span></td>
									<td width="24%"><s:textfield cssClass="TextBoxLarge"
											id="contractorEmailId" name="guaranteeDTO.contractorMailId" maxlength="40"
											theme="simple" /></td>
								</tr>
								<tr>
									<td width="48%"><span class="labelNormalStrong">Mobile No <!-- <font color="red">*</font> -->:</span></td>
									<td width="24%"><s:textfield cssClass="TextBoxLarge"
											id="contractorMobId" name="guaranteeDTO.contractorMobileNo" maxlength="10"
											theme="simple" /><script type="text/javascript">
											$("#contractorMobId").numeric({
												negative : false
											});
										</script></td>
								</tr>
							</table>
						</td>
					</tr>
					
					<tr>
						<td colspan="5" align="left">&nbsp;</td>
					</tr>



					<tr>
						<td colspan="5" align="left">Provide the no of days for each
							level of reminder:</td>
					</tr>
					<tr>
						<td align="left"><span class="labelNormalStrong">Level
								One<font color="red">*</font>:</span></td>
						<td align="left" colspan="4"><s:textfield
								cssClass="TextBoxSmall" id="levelOneId"
								name="guaranteeDTO.levelOneDay" maxlength="3" theme="simple"/>
							<span style="font-size: 8pt; font-style: italic;"><i>Days</i> </span> <script
								type="text/javascript">
										$("#levelOneId").numeric({
											negative : false
										});
									</script></td>
					</tr>
					<tr>
						<td align="left"><span class="labelNormalStrong">Level
								Two<font color="red">*</font>:</span></td>
						<td align="left" colspan="4"><s:textfield
								cssClass="TextBoxSmall" id="levelTwoId"
								name="guaranteeDTO.levelTwoDay" maxlength="3" theme="simple" />
							<span style="font-size: 8pt; font-style: italic;"><i>Days</i> </span> <script
								type="text/javascript">
										$("#levelTwoId").numeric({
											negative : false
										});
									</script></td>
					</tr>
					<tr>
						<td align="left"><span class="labelNormalStrong">Level
								Three<font color="red">*</font>:</span></td>
						<td align="left" colspan="4"><s:textfield
								cssClass="TextBoxSmall" id="levelThreeId"
								name="guaranteeDTO.levelThreeDay" maxlength="3" theme="simple" />
							<span style="font-size: 8pt; font-style: italic;"><i>Days</i> </span> <script
								type="text/javascript">
										$("#levelThreeId").numeric({
											negative : false
										});
									</script></td>
					</tr>
					<tr>
						<td colspan="5" align="left">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5" align="left"><span class="labelNormalStrong">Attach
								relevant documents (if applicable):</span></td>
					</tr>
					<tr>
						<td colspan="5" align="left"><table width="100%"
								id="mainFileTableId">
								<s:iterator value="guaranteeDTO.uploadFileList"
									status="fileStatus" var="uploadFileList">
									<s:set name="fName"
										value="%{guaranteeDTO.uploadFileList[#fileStatus.index].fileFileName}" />
									<s:set name="fUid"
										value="%{guaranteeDTO.uploadFileList[#fileStatus.index].fileUUID}" />
									<s:set name="fPath"
										value="%{guaranteeDTO.uploadFileList[#fileStatus.index].filePath}" />
									<s:if test="%{#fUid != null}">
										<tr>
											<td align="left"><a href="#"
												onclick="openAttachment('<s:property value="%{#fUid}"/>', '<s:property value="%{#fName}"/>', '<s:property value="%{#fPath}"/>')"><s:property
														value="%{#fName}" /> </a></td>
										</tr>
									</s:if>
									<s:else>
										<tr>
											<td><table width="100%" id="fileTableId">
													<tr>
														<td><s:file
																name="guaranteeDTO.uploadFileList[%{#fileStatus.index}].file"
																cssClass="Button" theme="simple"></s:file></td>
													</tr>
												</table>
											</td>
										</tr>
									</s:else>
								</s:iterator>
							</table>
						</td>
					</tr>


					<tr>
						<td colspan="5" align="left"><input type="button"
							class="Button" value="Add File"
							onclick="addRowFile('fileTableId')" /> <input type="button"
							class="Button" value="Delete File"
							onclick="deleteRowFile('fileTableId')" /> <label
							class="labelNormalError"><span
								id="showEditFileDeleteErrorMsg" style="display: none"></span> </label>
						</td>
					</tr>

					<tr>
						<td align="left"><span class="labelNormalStrong">Comments
								(if any):</span></td>
						<td align="left" colspan="4"><s:textarea
								name="guaranteeDTO.comments" id="commentsId"
								cssClass="TextBoxAreaLarge" theme="simple"></s:textarea></td>
					</tr>

					<tr>
						<td colspan="5" align="left">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="5" align="left">&nbsp;</td>
					</tr>

					<s:if test="%{guaranteeDTO.newReg == 'false'}">
						<tr>
							<td align="left"><span class="labelNormalStrong">Update
									Comments<font color="red">*</font>:</span></td>
							<td align="left" colspan="4"><s:textarea
									name="guaranteeDTO.updateComments" id="updateCommentsId"
									cssClass="TextBoxAreaLarge" theme="simple"></s:textarea></td>
						</tr>
						<tr>
							<td colspan="5" align="left"><input type="button"
								class="Button" value="Update" id="applicationUpdateButtonId">
								<input type="button"
								class="Button" value="Deactivate" id="applicationInactiveButtonId">
							</td>
						</tr>
					</s:if>
					<s:else>
						<tr>
							<td colspan="5" align="left"><input type="button"
								class="Button" value="Submit" id="applicationSubmitButtonId">
								 <input type="button"
								class="Button" value="Deactivate" id="applicationInactiveButtonId">
							</td>
							
						</tr>

					</s:else>
				</tbody>

			</table>
		</s:form>
	</fieldset>

</body>





