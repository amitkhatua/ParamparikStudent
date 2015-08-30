
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>NRDA</title>
        
<%
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0);

%>         
        
    </head>
    <body>
    <script>
    var contextPath = '<%=request.getContextPath() %>';
    window.location = contextPath +'/sessionTimeOut.do';	
    
    <%--
    response.sendRedirect(request.getContextPath()+"/sessionExpiredHome");
     --%>
    </script>
    </body>
</html>
