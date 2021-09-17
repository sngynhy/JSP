<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ attribute name="r_id" %>
<%@ attribute name="u_id" %>
<%@ attribute name="m_id" %>

<c:if test="${sssUser == u_id}">
	<a href="deleteRmsg.do?r_id=${r_id}&mcnt=${mcnt}&m_id=${m_id}">삭제</a>
</c:if>