<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="homeHeader.jsp"%>
<html>
<head>
<style type="text/css">
body {
	display: block;
	position: relative;
}

body::after {
	content: "";
	background: url(cart.jpg);
	opacity: 0.2;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	position: absolute;
	z-index: -1;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>product1</title>
</head>
<body bgcolor="lemonchiffon">
      <center><h2>Product Information</h2>
      <p></p>
      <p></p>
      <form:form method = "POST" action = "/ProjectCart1/insert">
         <table>
          <tr>
               <td>id: </td>
               <td><form:input path = "id" value="2"/></td>
            </tr>
            <tr>
               <td>Name: </td>
               <td><form:input path = "pname" value="Chair"/></td>
            </tr>
            <tr>
               <td>Price: </td>
               <td><form:input path = "price" value="500"/></td>
            </tr>
                <tr>
               <td>Quantity: </td>
               <td><form:input path = "quantity"/></td>
            </tr>
           
            <tr>
               <td colspan = "4">
                  <center><input type = "submit" value = "Add To Cart"/></center>
               </td>
            </tr>
         </table>  
      </form:form></center>
   </body>
</html>