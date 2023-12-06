<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
function check() {

	if(document.frm.inOutDate.value==""){
		alert("입출고일자를 입력하세요");
		document.frm.inOutDate.focus(); //커서가 id에 그대로 남아있도록 
		return false;           
	}
	if(document.frm.storeCode.value==""){
		alert("매장코드를 입력하세요");
		document.frm.storeCode.focus(); 
		return false; }	  	
	
	if(document.frm.productCode.value==""){
		alert("상품코드를 입력하세요");
		document.frm.productCode.focus(); 
		return false; }	  	
	
	if(document.frm.saleQty.value==""){
		alert("입출고수량을 입력하세요");
		document.frm.saleQty.focus(); 
		return false; }	
	 	
	 	
/* 	if(document.frm.unitPrice.value==""){
		alert("단가를 입력하세요");
		document.frm.unitPrice.focus(); 
		return false;  
	}
	
	if(document.frm.stockQty.value==""){
		alert("재고수량을 입력하세요");
		document.frm.stockQty.focus(); 
		return false;  
	} */
	
	document.frm.action="insert_inOutProcess.jsp";
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
<h1>입출고 등록 화면</h1>
<%@ include file = "dbconn.jsp" %>

<%
    //int sel=0;   //반납 여부 체크 변수 초기화
    ResultSet rs=null;
    PreparedStatement pstmt=null;
        
    //String lentno =request.getParameter("lentno"); //대출번호 입력시 칸 사라짐 방지
    String inOutDate=request.getParameter("inOutDate"); 
    String storeCode = request.getParameter("storeCode");
    String storeName = "";
    String productCode = request.getParameter("productCode");
    String productName = "";
    String saleQty=request.getParameter("saleQty"); 

    
    if(inOutDate == null) {
         inOutDate = "";
    }
   
    
  /*   if(productCode == null) {
    	productCode = "";
    } */

   
    int sw=0;
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
				  sw=1;
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
    int price=0,total=0;	  
    
     if(productCode == null || (productCode == "" && sw==1)) {
     	productCode = "";
     }else{
    	try{
      	  String sql = "select productName, unitPrice from product0905 where productCode=? and storeCode=?";
      	  pstmt=conn.prepareStatement(sql);
      	  pstmt.setString(1, productCode);
      	  pstmt.setString(2, storeCode);
      	  rs=pstmt.executeQuery();
      	  
  		  if(rs.next()){
  			  productName = rs.getString("productName");
  			  price=rs.getInt("unitPrice");
  			  
  		   }else{
  			 System.out.println("에러1" + productCode+" "+storeCode+"sw : "+sw);
  			   %>
  				<script>
  				alert("등록되지 않은 상품코드입니다");
  				</script>
  				<% }
    	 }catch(Exception e) {
     	    System.out.println("에러" + e.getMessage());
         }
     }
   		  
     if(saleQty == null) {
    	 saleQty = "0";
    }else{
    	int Qty=Integer.parseInt(saleQty);
    	total=price*Qty;
	    System.out.println("total :"+total);
    }
   
    
 %>


<form name="frm" method="post" action="insert_inOut.jsp" method="post">

<table border=1 id="tab2">

<tr> 
      <th>입출고일자</th>
      <td><input type="text" name="inOutDate" value="<%=inOutDate %>" id=in1></td>
</tr>

<tr> 
      <th>매장코드</th>
      <td><input type="text" name="storeCode" value="<%=storeCode %>" id=in1 onchange="changesubmit();">

      <th>매장명</th>
      <td><input type="text" name="storeName" value="<%=storeName %>" id=in1></td>
</tr>

<tr> 
      <th>상품코드</th>
      <td><input type="text" name="productCode" value="<%=productCode %>" id=in1 onchange="changesubmit();"> 

      <th>상품명</th>
      <td><input type="text" name="productName" value="<%=productName %>" id=in1></td>
</tr>

<tr> 
      <th>입출고구분</th>
      <td>
         <input type="Radio" name="gubun" value="1" onclick="gubun()" checked>입고
         <input type="Radio" name="gubun" value="2" onclick="gubun()">출고
         
      </td>
</tr>

<tr> 
      <th>입출고수량</th>
      <td><input type="text" name="saleQty" value="<%=saleQty %>" id=in1  onchange="changesubmit();">
	  <th>입출고금액</th>
      <td><input type="text" name="total" value="<%=total %>" id=in1 >

</tr>

<tr>
    <td colspan = 4 align = center>
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