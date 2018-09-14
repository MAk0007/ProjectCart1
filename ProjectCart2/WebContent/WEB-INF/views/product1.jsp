<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="homeHeader.jsp"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>product1</title>
</head>
<body bgcolor="lemonchiffon">
      <center><h2>Product Information</h2>
      <p></p>
      <p></p>
      <form:form method = "POST" action = "http://BLRPRGFWD31231:8082/ProjectCart2/add" >
         <table>
         <tr>
               <td>Id: </td>
         <td><form:input path = "id" value="1"/></td>
         </tr>
         
           <tr>
               <td>Name: </td>
               <td><form:input path = "pname" value="Phone"/></td>
            </tr>
            <tr>
               <td>Price: </td>
               <td><form:input path = "price" value="50000"/></td>
            </tr>
                <tr>
               <td>Quantity: </td>
               <td><form:input path = "quantity"/></td>
            </tr>
           
            <tr>
               <td colspan = "3" align="center">
                  <input type = "submit" value = "Add To Cart"/>
               </td>
            </tr>
         </table>  
      </form:form></center>
   </body>
</html>