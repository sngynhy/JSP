<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="r_id" %>
<%@ attribute name="u_id" %>

<c:if test="${selUser == u_id}">
	<a href="control.jsp?action=deleteRMSG&r_id=${r_id}&mcnt=${mcnt}">삭제</a>
</c:if>