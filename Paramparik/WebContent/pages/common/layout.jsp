<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
	<head>
	
		<title>Paramparik - Student</title>
        <link rel="icon" href="<%=request.getContextPath()%>/images/logo.ico" type="image/ico">
        <link href="<%=request.getContextPath()%>/styles/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script src="<%=request.getContextPath()%>/scripts/jquery.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/jquery-1.9.1.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/jquery-ui-1.8.22.custom.min.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/jquery-migrate-1.0.0.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/jquery-ui.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/jquery.validate.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/jquery.form.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/datetimepicker_css_modified.js"></script>
        <link href="<%=request.getContextPath()%>/styles/TableSortestyle.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/styles/nrda.css" rel="stylesheet" type="text/css" />
        <script src="<%=request.getContextPath()%>/scripts/jquery.numeric.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/additional-methods.js"></script>
        <script src="<%=request.getContextPath()%>/scripts/additional-methods.min.js"></script>
        
        <script src="<%=request.getContextPath()%>/scripts/jquery.ui.core.js"></script>
		<script src="<%=request.getContextPath()%>/scripts/jquery.ui.widget.js"></script>
		<script src="<%=request.getContextPath()%>/scripts/jquery.ui.position.js"></script>
		<script src="<%=request.getContextPath()%>/scripts/jquery.ui.dialog.js"></script>
		<link href="<%=request.getContextPath()%>/styles/jquery-ui-1.8.22.custom.css" rel="stylesheet" type="text/css" />
		
		<script src="<%=request.getContextPath()%>/scripts/jquery.dataTables.js"></script>
		<link href="<%=request.getContextPath()%>/styles/demo_table.css" rel="stylesheet" type="text/css" />
		
	
	
	
	</head>
	
	
	<script>

 jQuery(document).ajaxStart(function(){
		$( "#dialog-modal" ).dialog({
			height: 70,
			title: "Loading..." ,
			hideEffect: "puff",
			modal: true
		});
		});
		
	jQuery(document).ajaxStop(function(){
		$( "#dialog-modal" ).dialog('close');
		});
		
</script>
		
	
	<body>
	
	<table border="0" align="center" class="mainBodyAlignment">
           <tr>
           	<td colspan="2" width="100%" valign="top">
           		<tiles:insertAttribute name="banner" flush="false"/></td>
           	</tr>
           	<tr>
           	<td colspan="2" width="100%" valign="top">
           		<tiles:insertAttribute name="header" flush="false"/></td>
           	</tr>
            <tr>
                <td width="20%" valign="top">
                <tiles:insertAttribute name="menu" flush="false"/></td>
                <td width="80%" valign="top">
                <tiles:insertAttribute name="body" flush="false"/></td>
            </tr>
            <tr>
                <td colspan="2" width="100%" valign="top">
                 <tiles:insertAttribute name="footer" flush="false"/>
            </tr>
        </table>    
	
	</body>
</html>