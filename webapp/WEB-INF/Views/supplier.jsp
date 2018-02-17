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

<title>Supplier</title>
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


<form:form action="AddSupplier"  modelAttribute="supplier">
<table align="center" cellspacing="2">
	<tr>
		<td colspan="2"><h1>Supplier Form</h1></td>
	</tr>	
	<tr>
		<td>Supplier ID</td>
		 <td><form:input path="supplierId" type="hidden"/></td>
	</tr>
	<tr>
		<td>Supplier Name</td>
		 <td><form:input path="supplierName" required="required" /></td>
	</tr>
	<tr>
		<td>Supplier Address</td>
		 <td><form:input type="text" path="supplierAdd" required="required" /></td>
	</tr>
	<tr>
		<td colspan="2">
			<center><input type="submit" value="Insert"/></center>
		</td>
	</tr>
	
</table>
</form:form>

<div class=container>
<table class="table table-bordered">
   <thead>
  <tr bgcolor="white">
	<th>Supplier Id</th>
	<th>Supplier Name</th>
	<th>Supplier Address</th>
	<th>Operation</th>
	</tr>
	</thead>
<c:forEach items="${supplierList}" var="supplier">
	<tr bgcolor="">
		<td>${supplier.supplierId}</td>
		<td>${supplier.supplierName} </td>
		<td>${supplier.supplierAdd}</td>
		<td>
			<a href="<c:url value="deleteSupplier/${supplier.supplierId}"/>">delete</a>
			<a href="<c:url value="updateSupplier/${supplier.supplierId}"/>">update</a>
		</td>	
	
	</tr>
</c:forEach>

</table>
</div>
<br><br><br><br><br><br><br>

</body>
</html>
