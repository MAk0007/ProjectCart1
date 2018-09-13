<%@page import="com.itc.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*,java.util.*"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    -webkit-animation-name: fadeIn; /* Fade in the background */
    -webkit-animation-duration: 0.4s;
    animation-name: fadeIn;
    animation-duration: 0.4s
}

/* Modal Content */
.modal-content {
    position: fixed;
    bottom: 0;
    background-color: #fefefe;
    width: 100%;
    -webkit-animation-name: slideIn;
    -webkit-animation-duration: 0.4s;
    animation-name: slideIn;
    animation-duration: 0.4s
}

/* The Close Button */
.close {
    color: white;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-header {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

.modal-body {padding: 2px 16px;}

.modal-footer {
    padding: 2px 16px;
    background-color: #5cb85c;
    color: white;
}

/* Add Animation */
@-webkit-keyframes slideIn {
    from {bottom: -300px; opacity: 0} 
    to {bottom: 0; opacity: 1}
}

@keyframes slideIn {
    from {bottom: -300px; opacity: 0}
    to {bottom: 0; opacity: 1}
}

@-webkit-keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}

@keyframes fadeIn {
    from {opacity: 0} 
    to {opacity: 1}
}
</style>
<title>Insert title here</title>
</head>
<body>
<%
ArrayList<Product> ar = new ArrayList<>();
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
      Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","akram97ulla");
      String query = "select * from product";
      PreparedStatement ps=con.prepareStatement(query);  
      int id=0,quantity=0;
      String pname=null;
      double price=0;
      ResultSet rs=ps.executeQuery();  
      while(rs.next()){  
    	  Product p = new Product();
      	p.setId(rs.getInt(1));
      	p.setPname(rs.getString(2));
      	p.setPrice(rs.getDouble(3));
      	p.setQuantity(rs.getInt(4));
      	ar.add(p);
      }  
   }
   catch(Exception e){
   System.out.print(e);
   e.printStackTrace();
   }
%>
<center><table border="1">
<tr>
<td>Name</td>
<td>Price</td>
<td>Quantity</td>
<td>Total price</td>
<td>Select</td>
</tr>

<% 
double tpr= 0;
for(int i=0;i<ar.size();i++){
	Product p = ar.get(i);
%><tr><td><% out.println(p.getPname());
%></td><td><% out.println(p.getPrice());
%></td><td><% out.println(p.getQuantity());
%></td><td><% tpr=tpr+p.getQuantity()*p.getPrice(); out.println(p.getQuantity()*p.getPrice());
%></td><td><% String hyperLink = "<a href=./delete?id="+p.getId()+">Delete from Cart</a>"; 
out.println(hyperLink);%></td></tr><% 
}
%>

<tr>
<td colspan="2">Total price</td>
<td colspan="3"><%out.println(tpr); %></td>
</tr>
</table>
</center>
<button id="myBtn">Confirm Payment</button>
<div id="myModal" class="modal">
<div class="modal-content">
<div class="modal-header">
<span class="close">&times;</span>
<h2>Confirm Payment</h2>
</div>
<div class="modal-body">
<h5>you have to pay an amount of <%out.println(tpr); %> INR</h5>
</div>
<div class="modal-footer">
<h4>Thank you for Shopping with SmallMart</h4>
</div>
</div>
</div>
<!-- <form action="http://localhost:8082/ProjectCart1/confirmPayment">
<input type="submit" value="ConfirmPayment">
</form> -->
<form action="http://localhost:8082/ProjectCart1/homepage">
<input type="submit" value="Home"></form>
<script>
// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.style.display = "none";
    window.location.href="http://localhost:8082/ProjectCart1/homepage";
}

// When the user clicks anywhere outside of the modal, close it
/* window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
} */
</script>
</body>
</html>