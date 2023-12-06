<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {

	if(document.frm.storeName.value==""){
		alert("매장명을 입력하세요");
		document.frm.storeName.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.productCode.value==""){
		alert("상품코드를 입력하세요");
		document.frm.productCode.focus(); 
		return false; }	  	

	if(document.frm.Qty.value==""){
		alert("수량을 입력하세요");
		document.frm.Qty.focus(); 
		return false;  
	}
		
	frm.action="insert_storeProcess.jsp";
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
<h1>매장 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>

<%
    //int sel=0;   //반납 여부 체크 변수 초기화
    ResultSet rs=null;
    PreparedStatement pstmt=null;
        
    //String lentno =request.getParameter("lentno"); //대출번호 입력시 칸 사라짐 방지
    String storeName=request.getParameter("storeName"); 
    String productCode = request.getParameter("productCode");
    String Qty = request.getParameter("Qty");

    String productName = "";
    
    /* if(lentno  == null) {    //lentno null로 뜨는 것 지워줌
   	      lentno ="";
    } */
   
    if(storeName == null) {
    	storeName = "";
    }	
    if(productCode == null) {
    	productCode = "";
    }	
    if(Qty == null) {
    	Qty = "";
    }else{
    
     try{
    	  String sql = "select productName from product0905 where productCode=?";
    	  pstmt=conn.prepareStatement(sql);
    	  pstmt.setString(1, productCode);
    	  rs=pstmt.executeQuery();
    	  
		  if(rs.next()){
			  productName = rs.getString("productName");
		   }else{
			   %>
				<script>
				alert("등록되지 않은 상품코드입니다");
				</script>
				<%
		        }
	
    	  }catch(Exception e) {
    	    System.out.println("에러" + e.getMessage());
        }
    }
    
 %>


<form name="frm" method="post" action="insert_store.jsp" method="post">

<table border=1 id="tab2">
<% 
   String sql = "select max(storeCode) from store0905";
   pstmt=conn.prepareStatement(sql);
   rs=pstmt.executeQuery();
   int storeCode = 0;
   if(rs.next()) {
	   storeCode = rs.getInt("max(storeCode)")+1;
   }
%>

<tr> 
      <th>매장코드(자동생성)</th>
      <td><input type="text" name="storeCode" value="<%=storeCode %>" id=in1> 마지막번호+1</td>
</tr>


<tr> 
      <th>매장명</th>
      <td><input type="text" name="storeName" value="<%=storeName %>" id=in1></td>
</tr>


<tr> 
      <th>상품코드</th>
      <td><input type="text" name="productCode" value="<%=productCode %>" id=in1 onchange="changesubmit();"></td>
</tr>

<tr> 
      <th>상품명</th>
      <td><input type="text" name="productName" value="<%=productName %>" id=in1></td>
</tr>

<tr> 
      <th>수량</th>
      <td><input type="text" name="Qty" value="<%=Qty %>" id=in1></td>
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