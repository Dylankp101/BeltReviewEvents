<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>






<div class="container">
  <div class="row">
    <div class="col-sm">
    
    <h3>EDIT AN EVENT</h3>
		   <form:form action="/events/${events.id}/update" method="post" modelAttribute="events">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Name</span>
			  <form:input path="name" type="text" class="form-control" value="${events.name }" aria-label="Username" aria-describedby="basic-addon1"/>
			</div>
			
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Date</span>
			  <form:input path="date" type="date" class="form-control" value="${events.date }" aria-label="Username" aria-describedby="basic-addon1"/>
			</div>
		
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Location</span>
			  <form:input path="location" type="text" class="form-control" value="${events.location }" aria-label="Username" aria-describedby="basic-addon1"/>
			</div>
			    
		    <form:select path="state" class="form-select" aria-label="Default select example">
			  <form:option selected="selected" value="CA">CA</form:option>
			  <form:option  value="CA">CA</form:option>
			  <form:option  value="NV">NV</form:option>
			  <form:option  value="OR">OR</form:option>
			  <form:option  value="AZ">AZ</form:option>
			  
			</form:select>
			<button type="submit" class="btn btn-success mt-2">Success</button>
		    </form:form> 
    
    
    </div>
  </div>
</div>





<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>


</body>
</html>