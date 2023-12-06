<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "dbconn.jsp" %>
<%
   //request.setCharacterEncording("utf-8"); //한글 깨지면 추가
   String productCode = request.getParameter("productCode");   
   String productName = request.getParameter("productName");   
   String storeCode = request.getParameter("storeCode");
   String unitPrice = request.getParameter("unitPrice");
   String stockQty = request.getParameter("stockQty");
   
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Update product0905 set productName=?, storeCode=?, unitPrice=?, stockQty=? where productCode=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(5, productCode);    
      pstmt.setString(1, productName);  
      pstmt.setString(2, storeCode);
      pstmt.setString(3, unitPrice);
      pstmt.setString(4, stockQty);

      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="productSelect.jsp";
      </script>
      <%
   }catch(Exception e) {
	   System.out.println("수정 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
   
%>

</body>
</html>