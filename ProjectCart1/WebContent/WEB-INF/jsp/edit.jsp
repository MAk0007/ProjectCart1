<%@page import="com.itc.Product"%>
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
<body bgcolor="lemonchiffon">
	<% int id= Integer.parseInt(request.getParameter("id"));
ArrayList<Product> ar = new ArrayList<>();
try{
	/* 	Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@10.6.184.165:1521:xe","system","tiger"); */
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://10.6.184.246:3306/springdemo","root1","root1"); 
    String query = "select * from product where id=?";
      PreparedStatement ps=con.prepareStatement(query);  
		ps.setInt(1, id);
		
	      ResultSet rs=ps.executeQuery();
	      Product p = new Product();
	      while(rs.next()){  
	    	 
	      	p.setId(rs.getInt(1));
	      	p.setPname(rs.getString(2));
	      	p.setPrice(rs.getDouble(3));
	      	p.setQuantity(rs.getInt(4));
	      	
	      }  
	      
	      %>

	<center>
		<h2> Update Product Information</h2>
		<p></p>
		<p></p>
		<form method="POST" action="/ProjectCart1/update">
			<table>
				<tr>
					<td><center>Id:</center></td>
					<td><input name="id" value=<%=p.getId() %>>
						</td>
				</tr>
				<tr>
					<td><center>Name:</center></td>
					<td><input name="pname" value=<%=p.getPname()  %> />
						</td>
				</tr>
				<tr>
					<td><center>Price:</center></td>
					<td><input name="price" value=<%=p.getPrice()  %> />
						</td>
				</tr>
				<tr>
					<td><center>Quantity:</center></td>
					<td><input name="quantity" value=<%=p.getQuantity() %> />
						</td>
				</tr>

				<tr>
					<td colspan="4">
						<center>
							<input type="submit" value="Edit" />
						</center>
					</td>
				</tr>
			</table>
		</form>
	</center>

	<%
		
	
}
catch(Exception e){
System.out.print(e);
e.printStackTrace();
}
%>
	
</body>
</html>