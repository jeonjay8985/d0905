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

<h1>매장 정보 목록</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>매장코드</th>
    <th>매장명</th>
    <th>상품코드</th>
    <th>상품명</th>
    <th>상품수량</th>
    <th>관리</th>
 
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     int no =0;
     try{
    	 String sql = "select b.storeCode, b.storeName, b.productCode, a.productName, b.Qty from product0905 a, store0905 b where a.storeCode = b.storeCode";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String storeCode = rs.getString("storeCode");
    		 String storeName= rs.getString("storeName");
    		 String productCode = rs.getString("productCode");
    		 String productName = rs.getString("productName");
    		 String Qty = rs.getString("Qty");
    		 
        no++;

%>
<tr>
    <td><%=no %> </td>
    <td><a href = "storeUpdate.jsp?storeCode=<%=storeCode %>"><%=storeCode %></a> </td>
    <td><%=storeName %> </td>
    <td><%=productCode %> </td>
    <td><%=productName %> </td>
    <td><%=Qty %> </td>

    <td>
      
      <a href="storeDelete.jsp?storeCode=<%=storeCode %>" onclick="if(!confirm('정말로 삭제하시겠습니까')) return false;"> 삭제</a>
    
    </td>
</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 8  align = center>
    <input id=bt1 type="button" value="매장정보추가" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insert_store.jsp";
	}
    </script>
    </td>
</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>