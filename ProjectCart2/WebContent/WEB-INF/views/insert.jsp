<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="homeHeader.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="#B0C4DE">
<h2 align="center">${status}</h2>
<div align="right">
		<form action="http://BLRPRGFWD31231:8082/ProjectCart2/viewCart"
			method="get">
			<input type="submit" value="View Cart">
		</form>
	</div>
</body>
</html>