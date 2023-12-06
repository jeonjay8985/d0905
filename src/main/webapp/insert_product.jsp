<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {

	if(document.frm.productName.value==""){
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
	
	document.frm.action="insert_productProcess.jsp";
}
function changesubmit(){
	frm.submit();
}
</script>

</head>
<body>

<%@ include file = "header.jsp" %>
<%@ include file = "nav.jsp" %>
<section>   
<h1>상품 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>

<%
    //int sel=0;   //반납 여부 체크 변수 초기화
    ResultSet rs=null;
    PreparedStatement pstmt=null;
        
    //String lentno =request.getParameter("lentno"); //대출번호 입력시 칸 사라짐 방지
    String productName=request.getParameter("productName"); 
    String unitPrice = request.getParameter("unitPrice");
    String stockQty = request.getParameter("stockQty");
    String storeCode = request.getParameter("storeCode");
    String storeName = "";
    
    /* if(lentno  == null) {    //lentno null로 뜨는 것 지워줌
   	      lentno ="";
    } */
   
    if(productName == null) {
       productName = "";
    }
    if(unitPrice == null) {
    	unitPrice = "";
    }
    if(stockQty == null) {
    	stockQty = "";
    }
     if(storeCode == null) {
        	storeCode = "";
    }else{
    
     try{
    	  String sql = "select storeName from store0905 where storeCode=?";
    	  pstmt=conn.prepareStatement(sql);
    	  pstmt.setString(1, storeCode);
    	  rs=pstmt.executeQuery();
    	  
		  if(rs.next()){
			  storeName = rs.getString("storeName");
		   }else{
			   %>
				<script>
				alert("등록되지 않은 매장코드입니다");
				</script>
				<%
		        }
	
    	  }catch(Exception e) {
    	    System.out.println("에러" + e.getMessage());
        }
    }
    
 %>


<form name="frm" method="post" action="insert_product.jsp" method="post">

<table border=1 id="tab2">
<% 
   String sql = "select max(productCode) from product0905";
   pstmt=conn.prepareStatement(sql);
   rs=pstmt.executeQuery();
   int productCode = 0;
   if(rs.next()) {
	   productCode = rs.getInt(1)+1;
   }
%>

<tr> 
      <th>상품코드(자동생성)</th>
      <td><input type="text" name="productCode" value="<%=productCode %>" id=in1> 마지막번호+1</td>
</tr>


<tr> 
      <th>상품명</th>
      <td><input type="text" name="productName" value="<%=productName %>" id=in1></td>
</tr>


<tr> 
      <th>매장코드</th>
      <td><input type="text" name="storeCode" value="<%=storeCode %>" id=in1 onchange="changesubmit();"></td>
</tr>

<tr> 
      <th>매장명</th>
      <td><input type="text" name="storeName" value="<%=storeName %>" id=in1></td>
</tr>


<tr> 
      <th>단가</th>
      <td><input type="text" name="unitPrice" value="<%=unitPrice %>" id=in1></td>
</tr>

<tr> 
      <th>재고수량</th>
      <td><input type="text" name="stockQty" value="<%=stockQty %>" id=in1></td>
</tr>

<tr>
    <td colspan = 2 align = center>
    <input id=bt1 type="submit" value="등록" onclick="check()"> 
    <input id=bt2 type="reset" value="취소">
    </td>
</tr>

</table>
</form>
</section>
<%@ include file = "footer.jsp" %>

</body>
</html>