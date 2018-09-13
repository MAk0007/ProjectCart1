<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*,java.util.*"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int id= Integer.parseInt(request.getParameter("id")) ;
String pname= request.getParameter("pname");
double price= Double.parseDouble(request.getParameter("price"));
int quantity= Integer.parseInt(request.getParameter("quantity")) ;
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","akram97ulla");
      Statement st=con.createStatement();
      int i=st.executeUpdate("insert into product(id,pname,price,quantity) values('"+id+"','"+pname+"','"+price+"','"+quantity+"')");
   out.println("Product successfully added to Cart!");
   }
   catch(Exception e){
   System.out.print(e);
   e.printStackTrace();
   }
   %>
<form action="http://localhost:8082/ProjectCart1/homepage">
<input type="submit" value="Home">
</form>
</body>
</html>