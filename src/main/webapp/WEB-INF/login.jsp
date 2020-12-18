<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>


<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1">Belt Review</span>
  </div>
</nav>


<div class="container mt-4">
  <div class="row">
    <div class="col-sm">
    
    
    <h1>Login</h1>
    <p><c:out value="${error}" /></p>
	  <form method="post" action="/login">  
	    <div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">Email</span>
	  		<input name="email" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
		</div>
	    <div class="input-group mb-3">
 			 <span class="input-group-text" id="basic-addon1">Password</span>
 			 <input name="password" type="password" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1">
		</div>
    <button type="submit" class="btn btn-info">Login</button>
    </form>
    
    
    </div>
    
    
    
    <div class="col-sm">
    
    	<h1>Register!</h1>
    
    <p><form:errors path="user.*"/></p>
    
        <form:form method="post" action="/registration" modelAttribute="user">
        <div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">First Name</span>
	  		<form:input path="firstName" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
		<div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">Last Name</span>
	  		<form:input path="lastName" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
    
    	 <div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">Email</span>
	  		<form:input path="email" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
		<div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">Location</span>
	  		<form:input path="location" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
		<div class="input-group mb-3">
	  		<span class="input-group-text" id="basic-addon1">State</span>
	  		<form:input path="state" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
		
	    <div class="input-group mb-3">
 			 <span class="input-group-text" id="basic-addon1">Password</span>
 			 <form:input path="password" type="password" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
    
    	 <div class="input-group mb-3">
 			 <span class="input-group-text" id="basic-addon1">Confirm Password</span>
 			 <form:input path="passwordConfirmation" type="password" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
		</div>
    	    <button type="submit" class="btn btn-warning">Register</button>
    	     
    	</form:form>
   
    </div>
    
    
  </div>
</div>












<%-- 
    <h1>Login</h1>
    <p><c:out value="${error}" /></p>
    <form method="post" action="/login">
        <p>
            <label for="email">Email</label>
            <input type="text" id="email" name="email"/>
        </p>
        <p>
            <label for="password">Password</label>
            <input type="password" id="password" name="password"/>
        </p>
        <input type="submit" value="Login!"/>
    </form>  --%>
    
    
    
    
    
    
<%--     <h1>Register!</h1>
    
    <p><form:errors path="user.*"/></p>
    
    <form:form method="post" action="/registration" modelAttribute="user">
        <p>
            <form:label path="email">Email:</form:label>
            <form:input type="email" path="email"/>
        </p>
        <p>
            <form:label path="password">Password:</form:label>
            <form:password path="password"/>
        </p>
        <p>
            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
            <form:password path="passwordConfirmation"/>
        </p>
        <input type="submit" value="Register!"/>
    </form:form>  --%> 
     
     
     
     
     <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
     
</body>
</html>