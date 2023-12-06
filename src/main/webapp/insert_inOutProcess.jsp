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

   String inOutDate = request.getParameter("inOutDate"); 
   String storeCode = request.getParameter("storeCode");   
   String productCode = request.getParameter("productCode");
   String gubun = request.getParameter("gubun");
   String saleQty = request.getParameter("saleQty");

   
   PreparedStatement pstmt = null;
   try{
      String sql = "Insert into inOut0905 values(?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, inOutDate); 
      pstmt.setString(2, storeCode);    //첫번째 물음표에 productName가 넘어감
      pstmt.setString(3, productCode);        
      pstmt.setString(4, gubun);
      pstmt.setString(5, saleQty);
      pstmt.executeUpdate();
      
      %>
      <script>
      alert("입출고등록이 완료되었습니다");
      location.href="inOutSelect.jsp";
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