<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag body-content="scriptless"%>
<!--태그 바디 설정
	body-content="scriptless" 기본값 : 태그 바디 사용
	body-content="empty" : 태그 바디 미사용
-->
<%@ attribute name="border" %>
<%@ attribute name="bgcolor" %>
<!-- attribute : 외부에서 태그를 사용할 때 지정할 속성 -->

<h1><jsp:doBody /></h1> <!-- 태그 바디에 작성된 값은 이곳으로 -->

<hr>

<jsp:useBean id="dataBean" class="model.DataBean" />
<table border="${border}" bgcolor="${bgcolor}">
	<%
		for (String v : dataBean.getDataList()) {
	%>
	<tr>
		<td><%=v%></td>
	</tr>
	<%
		}
	%>
</table>