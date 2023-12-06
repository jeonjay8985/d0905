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
   String storeCode = request.getParameter("storeCode");   
   String storeName = request.getParameter("storeName");   
   String productCode = request.getParameter("productCode");
   String Qty = request.getParameter("Qty");

   
   
   PreparedStatement pstmt = null;
   try{
      String sql = "Update store0905 set storeName=?, productCode=?, Qty=? where storeCode=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(4, storeCode);    
      pstmt.setString(1, storeName);  
      pstmt.setString(2, productCode);
      pstmt.setString(3, Qty);

      pstmt.executeUpdate();
      %>
      <script>
       alert("수정 성공");
       location.href="storeSelect.jsp";
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