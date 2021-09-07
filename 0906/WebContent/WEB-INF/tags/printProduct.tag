<%@ tag language="java" pageEncoding="UTF-8" import="model.product.*, java.util.ArrayList" %>
<jsp:useBean id="datas" class="java.util.ArrayList" scope="request" />
<jsp:useBean id="productVO" class="model.product.ProductVO" scope="session" />

<h1><jsp:doBody /></h1>

<hr>

<table border="1">
	<tr>
		<th>상품명</th><th>가격</th><th>재고량</th>
	</tr>
	<%
		if (datas.size() == 0) {
			%>
			<tr>
				<td colspan="5" align="center">검색 결과가 없습니다.</td>
			</tr>
			<%
		} else {
			for (ProductVO vo : (ArrayList<ProductVO>) datas) {
				if (vo.getStock() == 0) {
	%>
		<tr>
			<td><%=vo.getPname()%></td>
			<td><%=vo.getPrice()%></td>
			<td style="color:red">품절</td>
		</tr>
	<%
				} else {
	%>
					<tr>
						<td><%=vo.getPname()%></td>
						<td><%=vo.getPrice()%></td>
						<td><%=vo.getStock()%></td>
					</tr>
	<%
				}
			}
		}
	%>	
	
	<tr>
		<td colspan="3"><input type="text" name="search" placeholder="검색어 입력">
		<input type="submit" value="검색하기"></td>
	</tr>
</table>

