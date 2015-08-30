
<%@ taglib prefix="s" uri="/struts-tags"%>

<table width="100%" border="0">
	<tr>

		<td>
			<table width="100%" border="0">
				<tr>
					<td width="100%" height="100px">
						<center>
							<font size="4"><strong>Student Management System - Paramparik</strong>
							</font>
						</center>
						<br/>
						<center>To retrieve your saved quotes and information,
							enter your username and password below</center></td>
				</tr>
			</table></td>

	</tr>

	<tr>
		<td>

			<s:form action="login.do" id="loginForm">				

				<div style="height: 20px; padding: 0 10px; margin: 0 auto; background: #fff;">

						<table width="100%">
							<tr> 
								<td align="center" colspan="3"><font color="red"><s:actionerror/></font></td>
							</tr>
							<tr> 
								<td align="center" colspan="3"><font color="green"><s:actionmessage/></font></td>
							</tr>
							<tr>
								<td width="33%"></td>
								<td width="33%">
									<table width="100%">									
									
										<tr>
											<td><s:textfield cssClass="TextBoxMedium" id="userLoginId" label="User Name" name="userLoginId" /></td>
										</tr>

										<tr>
											<td><s:password cssClass="TextBoxMedium" label="Password"id="userPassword" name="userPasswordID"/></td>
										</tr>
										<tr>
											<td align="center"><div id="fieldError"></div></td>
										</tr>		
									</table>
								</td>
								<td width="33%"></td>
							</tr>


							<tr>
								<td width="33%"></td>
								<td width="33%" align="center">

									<table>
										
										<tr>
											<td align="right">
												<!--  <s:a href="#" id="btnLogin" name="btnLogin" 									
														onClick="successLogin();" >
													<img border="none" src="resources/images/right.gif"/>	
												</s:a>  --> 
												<s:submit button="true" formId="loginForm" id="btlLogin" value="Login" align="center" cssClass="Button"/>
											</td>
										</tr>
									</table>
								</td>
								

								<td width="33%">									
								</td>
								
							</tr>

						</table>

				</div>

			</s:form>
		</td>
	</tr>

</table>

