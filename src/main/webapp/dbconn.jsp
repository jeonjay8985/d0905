<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
    Connection conn = null;
    try{
    	String url = "jdbc:oracle:thin:@//localhost:1521/xe";
	    String user = "system";
	    String pass = "1234";
	    String driver = "oracle.jdbc.OracleDriver";
	    Class.forName(driver);
	    conn = DriverManager.getConnection(url, user, pass);
	    System.out.println("오라클 연결 성공");
    }catch(Exception e) {
    	System.out.println("데이터베이스 에러" +e.getMessage());
    }
 
%>