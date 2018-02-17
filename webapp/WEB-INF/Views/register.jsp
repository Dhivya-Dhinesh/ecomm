<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>REGISTER PAGE</title>
<style >
body 
{
background: url('https://static1.squarespace.com/static/54b6c871e4b013117df49218/t/54c4059de4b063fc8abc0dbf/1422132654726/books-straw-woven-table-photo-hd-wallpaper-background-uhd-2k-4k-5k-2015-2016-tablet-phone-mobile-pc-computer-Other-Hosting.jpg?format=1500w') fixed;
    
background-size: cover;
 
 margin-top:0px; 
 margin-left:0px; 
 
}
</style>
</head>
<body>
<center>
<br>
<br>
<h2>Register</h2>
<form:form action="register" method="post" commandName="user">

    <label><b>FirstName</b></label>
    <form:input type="text" path="firstname"/><br>
    <br><label><b>LastName</b></label>
    <form:input type="text" path="lastname"/> <br>
    <br><label><b>UserName</b></label>
    <form:input type="text" path="username"/><br>
     <br><label><b>Password</b></label>
    <form:input type="password" path="password"/> <br>
    <br><label><b>Address</b></label> 
    <form:input type="text" path="address"/><br>
     <br><label><b>Email-Id</b></label>
    <form:input type="email" path="email"/><br>
     <input type="submit" value="Submit"/>
    
  </form:form>
 </center>
</body>
</html>
