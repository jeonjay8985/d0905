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
      String sql = "Insert into store0905 values(?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, storeCode); 
      pstmt.setString(2, storeName);        
      pstmt.setString(3, productCode);
      pstmt.setString(4, Qty);
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("매장등록이 완료되었습니다");
      location.href="storeSelect.jsp";
      </script>
      <%
      //사번: <%=id % <br>
      //System.out.println("저장 완료");
   }catch(Exception e) {
	   System.out.println("저장 실패 : " +e.getMessage());
   }
   
   //System.out.println("사번 : " +id);
   //System.out.println("이름 : " +name);
    %>

</body>
</html>