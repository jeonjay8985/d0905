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

<h1>입/출고 정보 목록</h1>
<table border=1 id="tab1">
<tr>
    <th>no</th>
    <th>입출고일자</th>
    <th>매장코드</th>
    <th>매장명</th>
    <th>상품코드</th>
    <th>상품명</th>
    <th>입출고구분</th>
    <th>(입고/출고)수량</th>
  
 
</tr>

<%
     ResultSet rs = null;
     PreparedStatement pstmt = null;
     int no =0;
     try{
    	 String sql = "select to_char(c.inOutDate, 'yyyy-mm-dd'), b.storeCode, b.storeName, b.productCode, a.productName, c.gubun, c.saleQty from product0905 a, store0905 b, inOut0905 c where a.productCode=b.productCode and a.productCode=c.productCode order by c.inOutDate";
    	 pstmt = conn.prepareStatement(sql);
    	 rs = pstmt.executeQuery();
    	 while(rs.next()) {
    		 String inOutDate = rs.getString(1);
    		 String storeCode = rs.getString("storeCode");
    		 String storeName= rs.getString("storeName");
    		 String productCode = rs.getString("productCode");
    		 String productName = rs.getString("productName");
    		 String gubun = rs.getString("gubun");
    		  if(gubun.equals("1")) {
    			 gubun="입고";
    		 }else if(gubun.equals("2")){
    			 gubun="출고";
    		 }
    		 String saleQty = rs.getString("saleQty");
    		 
        no++;

%>
<tr>
    <td><%=no %> </td>
    <td><%=inOutDate %> </td>
    <td><%=storeCode %> </td>
    <td><%=storeName %> </td>
    <td><%=productCode %> </td>
    <td><%=productName %> </td>
    <td><%=gubun %> </td>
    <td><%=saleQty %> </td>

</tr>
<%
     	 }
     }catch(Exception e) {
    	 System.out.println("데이터베이스 읽기 에러" +e.getMessage());
     }

%>

<tr>
    <td colspan = 9  align = center>
    <input id=bt1 type="button" value="입출고 정보추가" onclick="newPage()" > 
    <script>
     function newPage()  {
	 location.href="insert_inOut.jsp";
	}
    </script>
    </td>
</tr>


</table>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>