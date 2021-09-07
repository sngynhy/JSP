<%@ tag language="java" pageEncoding="UTF-8" import="model.product.*, java.util.ArrayList" %>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="productVO" class="model.product.ProductVO" scope="session" />
<%
	if (session.getAttribute("customer") != null) {
%>
<form action="control.jsp" method="post" name="form2">
	<input type="hidden" name="action" value="order">
	<select name="pnum">
		<%
			for (ProductVO vo : (ArrayList<ProductVO>) datas) {
				if (vo.getStock()==0) {
			%>
				<option value="<%=vo.getPnum()%>" disabled="disabled"><%=vo.getPname()%></option>
			<%
				} else {
			%>
				<option value="<%=vo.getPnum()%>"><%=vo.getPname()%></option>
			<%
				}
			}
		%>
	</select>
	<input type="number" min="1" name="cnt" placeholder="수량 선택" required>
	<input type="submit" value="주문하기">
	<!-- <input type="button" value="주문하기" onclick="check()"> -->
</form>

<%
	}
%>

