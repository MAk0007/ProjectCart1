<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*,java.util.*"%>
<%@include file="homeHeader.jsp"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#B0C4DE">
<% int id=Integer.parseInt(request.getParameter("id"));
try{
	/* 	Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.6.184.165:1521:xe","system","tiger"); */
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://10.6.184.246:3306/springdemo","root1","root1"); 
    String query = "delete from product where id=?";
      PreparedStatement ps=con.prepareStatement(query);  
		ps.setInt(1, id);
		int status=ps.executeUpdate();
		if(status==1){
			out.println("<center><h3>Removed successfully</h3></center>");
			
		}else{
			out.println("<center><h3>Error while execution</h3></center>");
		}
}
catch(Exception e){
System.out.print(e);
e.printStackTrace();
}
%>
<div align="right">
<form action="http://BLRPRGFWD31231:8082/ProjectCart1/viewCart"
			method="get">
			<input type="submit" value="View Cart">
		</form>
	</div>	
</body>
</html>