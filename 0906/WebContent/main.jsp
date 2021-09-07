<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 주문</title>
<script type="text/javascript">
	function check() {
		document.form2.stock.value
		document.form2.pnum.value
		
		var data = <%=datas%>;
		console.log(data);
	}
</script>
</head>
<body>
	<mytag:login />
	<mytag:logout />
	<form action="control.jsp" method="post" name="form1">
	<input type="hidden" name="action" value="search">
		<%-- <mytag:printProduct>상품 목록</mytag:printProduct>
	</form> --%>
		<table border="1">
			<tr>
				<th>상품명</th><th>가격</th><th>재고량</th>
			</tr>
			<c:if test="${datas.size()==0}">
				<tr>
					<td colspan="5" align="center">검색 결과가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${datas.size()!=0}">
				<c:forEach var="data" items="${datas}">
					<c:if test="${data.stock==0}">
						<tr>
							<td>${data.pname}</td>
							<td>${data.price}</td>
							<td style="color:red">품절</td>
						</tr>
					</c:if>
					<c:if test="${data.stock!=0}">
						<tr>
							<td>${data.pname}</td>
							<td>${data.price}</td>
							<td>${data.stock}</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="3"><input type="text" name="search" placeholder="검색어 입력">
				<input type="submit" value="검색하기"></td>
			</tr>
		</table>
	</form>
	<hr>
	
	<mytag:order />

</body>
</html>