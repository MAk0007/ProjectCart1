<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*,java.util.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int id=Integer.parseInt(request.getParameter("id"));
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","akram97ulla");
      String query = "delete from product where id=?";
      PreparedStatement ps=con.prepareStatement(query);  
		ps.setInt(1, id);
		int status=ps.executeUpdate();
		if(status==1){
			out.println("Removed successfully");
		}else{
			out.println("Error while execution");
		}
}
catch(Exception e){
System.out.print(e);
e.printStackTrace();
}
%>
<form action="http://localhost:8082/ProjectCart1/viewCart"
			method="get">
			<input type="submit" value="View Cart">
		</form>
		<form action="http://localhost:8082/ProjectCart1/homepage">
<input type="submit" value="Home"></form>
</body>
</html>