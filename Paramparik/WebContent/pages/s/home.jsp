<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertTemplate template="/pages/common/layout.jsp" flush="true">
    <tiles:putAttribute name="banner" value="/pages/common/commonbanner.jsp" />
    <tiles:putAttribute name="header" value="/pages/s/header.jsp" />
    <tiles:putAttribute name="menu" value="/pages/s/menu.jsp" />
    <tiles:putAttribute name="body" value="/pages/s/mainbody.jsp" />
    <tiles:putAttribute name="footer" value="" /> 
</tiles:insertTemplate>


