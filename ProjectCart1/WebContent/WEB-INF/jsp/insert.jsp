<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*,java.util.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
 <%@include file="homeHeader.jsp"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#B0C4DE">
<%
int id= Integer.parseInt(request.getParameter("id")) ;
String pname= request.getParameter("pname");
double price= Double.parseDouble(request.getParameter("price"));
int quantity= Integer.parseInt(request.getParameter("quantity")) ;
try{
	/* 	Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.6.184.165:1521:xe","system","tiger"); */
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://10.6.184.246:3306/springdemo","root1","root1"); 
    	 

      Statement st=con.createStatement();
      int i=st.executeUpdate("insert into product(id,pname,price,quantity) values('"+id+"','"+pname+"','"+price+"','"+quantity+"')");
   out.println("<center><h3>Product successfully added to Cart!</h3></center>");
   }
   catch(Exception e){
   out.print("<center><h3>"+pname+" has already been added to cart!</h3></center>");
   e.printStackTrace();
   }
   %>
<!-- <form action="http://localhost:8082/ProjectCart1/homepage">
<input type="submit" value="Home"> 
</form>-->
<div align="right">
		<form action="http://BLRPRGFWD31231:8082/ProjectCart1/viewCart"
			method="get">
			<input type="submit" value="View Cart">
		</form>
	</div>
</body>
</html>