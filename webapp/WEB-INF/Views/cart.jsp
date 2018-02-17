<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Product Display</title>
 </head>
<body>
<%@ include file="header2.jsp" %>
<div class="container">
<table class="table table-bordered">
    <thead>
 <tr bgcolor="gray">
 <th>Cart Id</th>
	<th>Product Name</th>
	<th>Quantity</th>
	<th>UnitPrice</th>
	<th>Operation</th>
	
	</tr>
	</thead>

<c:forEach items="${cartList}" var="cart">
	<tr>
	
	<td>${cart.productId}</td>
		<td>${cart.productName}</td>
		<td>${cart.productQuantity}</td>
		<td>${cart.productUnitPrice}</td>
			
			<td>
			<a href="<c:url value="deleteCart/${cart.productId}"/>"><i class="fa fa-trash-o fa-3x"></i>Remove from cart</a>
			<a href="payment" ><span class="glyphicon glyphicon-credit-card"></span>Checkout</a>
			</td>	
			
				</tr>
</c:forEach>
</table>
</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="footer.jsp" %>
</body>
</html>