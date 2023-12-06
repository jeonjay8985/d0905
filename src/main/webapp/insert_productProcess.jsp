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
      String sql = "Insert into product0905 values(?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, productCode); 
      pstmt.setString(2, productName);    //첫번째 물음표에 productName가 넘어감
      pstmt.setString(3, storeCode);        
      pstmt.setString(4, unitPrice);
      pstmt.setString(5, stockQty);
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("상품등록이 완료되었습니다");
      location.href="productSelect.jsp";
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