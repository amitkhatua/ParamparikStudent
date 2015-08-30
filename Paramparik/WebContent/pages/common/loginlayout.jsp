<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
	<head>
	
		<title>Paramparik - Student</title>
        <link rel="icon" href="<%=request.getContextPath()%>/images/logo.ico" type="image/ico">
        <link href="<%=request.getContextPath()%>/styles/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script src="<%=request.getContextPath()%>/scripts/jquery-1.9.1.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/jquery-ui.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/jquery.validate.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/jquery.form.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/jqueryslidemenu.js" type="text/javascript"></script>
		<link href="<%=request.getContextPath()%>/styles/jqueryslidemenu.css" type="text/css" rel="stylesheet">
        <script src="<%=request.getContextPath()%>/scripts/datetimepicker_css_modified.js"></script>
        <link href="<%=request.getContextPath()%>/styles/TableSortestyle.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/styles/nrda.css" rel="stylesheet" type="text/css" />
	
	
	
	</head>
	<body>
	
	<table border="0" align="center" class="mainBodyAlignment">
           <tr>
           		<td colspan="2" width="100%" valign="top">
           		<tiles:insertAttribute name="header" flush="false"/></td>
           	</tr>
             <tr>
                <td colspan="2" width="100%" valign="top">
                 <tiles:insertAttribute name="body" flush="false"/>
            </tr>
            <tr>
                <td colspan="2" width="100%" valign="top">
                 <tiles:insertAttribute name="footer" flush="false"/>
            </tr>
        </table>    
	
	</body>
</html>