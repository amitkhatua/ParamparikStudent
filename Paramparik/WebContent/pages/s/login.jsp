<%@ page language="java" %>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertTemplate template="/pages/common/loginlayout.jsp" flush="true">
    <tiles:putAttribute name="header" value="/pages/common/commonbanner.jsp"/>
    <tiles:putAttribute name="body" value="/pages/common/loginpagebody.jsp"/>
    <tiles:putAttribute name="footer" value="" /> 
</tiles:insertTemplate>