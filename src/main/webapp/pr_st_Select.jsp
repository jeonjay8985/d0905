<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>

<section> 
<%@ include file = "dbconn.jsp" %>

<h1>상품/매장 정보 목록</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>상품코드</th>
    <th>상품명</th>
    <th>매장코드</th>
    <th>매장명</th>
    <th>단가</th>
    <th>재고수량</th>
 
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     int no =0;
     try{
    	 String sql = "select a.productCode, a.productName, a.storeCode, b.storeName, a.unitPrice, a.stockQty from product0905 a, store0905 b where a.storeCode = b.storeCode";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String productCode = rs.getString("productCode");
    		 String productName= rs.getString("productName");
    		 String storeCode = rs.getString("storeCode");
    		 String storeName = rs.getString("storeName");
    		 String unitPrice = rs.getString("unitPrice");
    		 String stockQty = rs.getString("stockQty");
    		 
        no++;

%>
<tr>
    <td><%=no %> </td>
    <td><a href = "productUpdate.jsp?productCode=<%=productCode %>"><%=productCode %></a> </td>
    <td><%=productName %> </td>
    <td><%=storeCode %> </td>
    <td><%=storeName %> </td>
    <td><%=unitPrice %> </td>
    <td><%=stockQty %> </td>

</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 7  align = center>
    <input id=bt1 type="button" value="상품정보추가" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insert_product.jsp";
	}
    </script>
    </td>
</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>