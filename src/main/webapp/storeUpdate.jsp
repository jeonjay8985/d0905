<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {

	/* if(document.frm.productName.value==""){
		alert("상품명을 입력하세요");
		document.frm.productName.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.storeCode.value==""){
		alert("매장코드를 입력하세요");
		document.frm.storeCode.focus(); 
		return false; }	  	
	 	
	if(document.frm.unitPrice.value==""){
		alert("단가를 입력하세요");
		document.frm.unitPrice.focus(); 
		return false;  
	}
	
	if(document.frm.stockQty.value==""){
		alert("재고수량을 입력하세요");
		document.frm.stockQty.focus(); 
		return false;  
	}
	 */
	document.frm.submit(); 
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>매장 등록 수정 화면</h1>
<%@ include file = "dbconn.jsp" %>

<%
   String storeCode = request.getParameter("storeCode"); 
   ResultSet rs=null;
   PreparedStatement pstmt = null;
   try{
	   String sql="select * from store0905 where storeCode=?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, storeCode); //String의 id랑 이름이 같아야 함
	   rs = pstmt.executeQuery();
	   if(rs.next()) {
		   String storeName = rs.getString("storeName");
		   String productCode = rs.getString("productCode");
		   String Qty = rs.getString("Qty");
		  

%>
<form name="frm" method="post" action="storeUpdateProcess.jsp">
<table border=1 id="tab2">

<tr> 
      <th>매장코드</th>
      <td><input type="text" name="storeCode" id=in1 value="<%=storeCode%>"></td>
</tr>
<tr> 
      <th>매장명</th>
      <td><input type="text" name="storeName" id=in1 value="<%=storeName%>"></td>
</tr>
<tr> 
      <th>상품코드</th>
      <td><input type="text" name="productCode" id=in1 value="<%=productCode%>"></td>
</tr>

<tr> 
      <th>상품수량</th>
      <td><input type="text" name="Qty" id=in1 value="<%=Qty%>"></td>
</tr>


<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="button" value="수정" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
<%
	   }
    }catch(Exception e){
 	  System.out.println("수정 실패" +e.getMessage());
   }
%>
</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>