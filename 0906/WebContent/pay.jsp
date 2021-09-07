<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productVO" class="model.product.ProductVO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 결제</title>
<script type="text/javascript">
	function cancel() {
		history.go(-1);
	}
</script>
</head>
<body>
	주문하신 메뉴는 [${pname}] x ${cnt}잔 입니다.<br>
	총 결제 금액은 ${price * cnt}원 입니다.
	<form action="control.jsp" method="post" name="form1">
		<input type="hidden" name="action" value="pay">
		<input type="hidden" name="pnum" value="${pnum}">
		<input type="hidden" name="cnt" value="${cnt}">
		<input type="submit" value="결제하기">
		<input type="button" value="취소하기" onclick="cancel()">
	</form>
</body>
</html>