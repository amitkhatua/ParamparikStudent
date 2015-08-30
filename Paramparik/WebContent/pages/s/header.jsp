<%@page import="in.student.param.dto.UserLoginDTO"%>

<%
UserLoginDTO user = null;
if(null != session && session.getAttribute("loggedInUser")!=null){
	user = (UserLoginDTO) session.getAttribute("loggedInUser");
}

%>
			<div id="includeheader" style="background-repeat: repeat-x">
                        <table style="width: 100%">
                            <tbody>
                                <tr>
                                    <td style="width: 60%; height: 5px">
                                        Welcome 
                                        <%		if(user!=null){%>	
										<font color="#3366CC"><%=user.getUserFullName()%></font>
											<%} %>
                                    </td>
                                    <td style="width: 40%; height: 5px" align="right">
                                        <a href="<%=request.getContextPath()%>/logout.do" class="FormText">Logout</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br>
                    </div>

