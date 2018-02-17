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

<title>Product</title>
<style> 
input[type=submit],delete,UPDATE {
   background-color: 	green;
   border: none;
   color: white;
   padding: 10px 20px;
   text-decoration: none;
   margin: 4px 2px;
   cursor: pointer;
}
input[type=text] {
   
   padding: 12px 10px;
   margin: 8px 0;
   box-sizing: border-box;
   border: 3px solid #99ff99;
   -webkit-transition: 0.5s;
   transition: 0.5s;
   outline: none;
}
input[type=text]:focus {
   border: 3px solid #ff66b3;
}
</style>


</head>
<body>


<form:form action="AddProduct"  modelAttribute="product">
<table align="center" cellspacing="2">
	<tr>
		<td colspan="2"><h1>BOOK Form</h1></td>
	</tr>	
	
	<tr>
		<td>Book ID</td>
		 <td><form:input path="productId" type="hidden"/></td>
	</tr>
	<tr>
		<td>Book Name</td>
		 <td><form:input path="productName" required="required" /></td>
	</tr>
	<tr>
		<td>Book Desc</td>
		 <td><form:input type="text" path="productDesc" required="required" /></td>
	</tr>
	<tr>
		<td>Book Quantity in inventory</td>
		 <td><form:input type="text" path="productQuantity" required="required" /></td>
	</tr>
	<tr>
		<td>Book Unit-Price</td>
		 <td><form:input type="text" path="unitPrice" required="required" /></td>
	</tr>
	<tr>
		<td>ProBookduct Price</td>
		 <td><form:input type="text" path="productPrice" required="required" /></td>
	</tr>
	<tr>
		<td>Book Publisher</td>
		<td>
		<form:select path="supplierId">
				<form:option value="0" label="Option" required="required"/>
				<form:options items="${supplierList}"/>
			</form:select>
	</td>
	</tr>
	<tr>
		<td>Category</td>
		<td>
		<form:select path="categoryId">
				<form:option value="0" label="Option" required="required"/>
				<form:options items="${categoryList}"/>
			</form:select>
	</td>
	</tr>
	 
	<tr>
		<td colspan="2">
			<center><input type="submit" value="Insert"/></center>
		</td>
	</tr>
	
</table>
</form:form>
<br><br>
<div class=container>
<table class="table table-bordered">
   <thead>
  <tr bgcolor="white">
	<th>Product Id</th>
	<th>Product Name</th>
	<th>Product Desc</th>
	<th>Product Quantity</th>
	<th>Product Price</th>
	<th>Supplier</th>
	<th>Category</th>
	
	<th>Operation</th>
	</tr>
	</thead>
<c:forEach items="${productList}" var="product">
	<tr bgcolor="">
		<td>${product.productId}</td>
		<td>${product.productName} </td>
		<td>${product.productDesc}</td>
		<td>${product.productQuantity}</td>
		<td>${product.productPrice}</td>
		<td>${product.supplierId}</td>
		<td>${product.categoryId}</td>
		
		<td>
			<a href="<c:url value="deleteProduct/${product.productId}"/>">delete</a>
			<a href="<c:url value="updateProduct/${product.productId}"/>">update</a>
		</td>	
	
	</tr>
</c:forEach>

</table>
</div>
<br><br><br><br><br><br><br>

</body>
</html>
