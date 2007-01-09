<%@ tag body-content="empty" %>
<%@ attribute name="editmode" rtexprvalue="true" required="false" %>
<%@ attribute name="keys" rtexprvalue="true" required="true" %>
<%@ taglib prefix="zm" uri="com.zimbra.zm" %>
<%@ taglib prefix="app" uri="com.zimbra.htmlclient" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="expanded" scope="session" class="java.util.HashMap" />
<c:set var="expanded" value="${sessionScope.expanded.tags ne 'collapse'}"/>

<div class=Tree>
    <table width=100% cellpadding=0 cellspacing=0>
        <c:url value="/h/mtags" var="mtagsUrl"/>        
        <tr>
            <c:url var="toggleUrl" value="/h/search">
                <c:param name="${expanded ? 'collapse' : 'expand'}" value="tags"/>
                <c:if test="${not empty param.st}"><c:param name="st" value="${param.st}"/></c:if>
            </c:url>
            <th style='width:20px'><a href="${toggleUrl}"><app:img src="${ expanded ? 'dwt/NodeExpanded.gif' : 'dwt/NodeCollapsed.gif'}" altkey="${ expanded ? 'ALT_TREE_EXPANDED' : 'ALT_TREE_COLLAPSED'}"/></a></th>
            <th class='Header'> <fmt:message key="tags"/></th>
            
            <th width='1%' align='right'>
                <c:if test="${empty editmode}">
                    <a href="${mtagsUrl}"><app:img altkey='ALT_APP_MANAGE_TAGS' src="common/Edit.gif"/></a>
                </c:if>
            </th>
        </tr>
        <c:if test="${expanded}">
            <zm:forEachTag var="tag">
                <app:overviewTag tag="${tag}"/>
            </zm:forEachTag>
        </c:if>
    </table>
</div>
