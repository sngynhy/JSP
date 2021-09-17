<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 전달할 데이터는 attribute로 받아오기 --%>
<%@ attribute name="m_id" %>
<%@ attribute name="u_id" %>
<%@ attribute name="selUser" %>

<c:if test="${sssUser == u_id}">
	<a href="deleteMsg.do?m_id=${m_id}&mcnt=${mcnt}&selUser=${selUser}">삭제</a>
</c:if>