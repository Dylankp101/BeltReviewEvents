<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<title>Welcome</title>
</head>
<body>

<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1">Welcome, <c:out value="${user.email}" /> </span><a class="navbar-brand mb-0 h1" href="/logout">Logout</a>
  </div>
</nav>


<div class="container mt-2">
  <div class="row">
    <div class="col-sm">
    <h4>Here are some event in your state</h4>
    <table class="table table-success table-striped">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Date</th>
      <th scope="col">Location</th>
      <th scope="col">Host</th>
      <th scope="col">Action | Status</th>
    </tr>
  </thead>
  <tbody>
  
   <c:forEach items="${events}" var="event">
   	<c:if  test="${event.state == 'CA'}" >
    <tr>
      <th scope="row"><a href="/show/${event.id}">${event.name}</a>      </th>
      <td>${event.date}</td>
      <td>${event.location}</td>
      <td>${event.user.firstName}</td>
      <td><a href="/delete/${event.id}">DELETE</a> | <a href="/events/${event.id}/edit">EDIT</a></td>
    </tr>
     </c:if>
     </c:forEach>  
     
  </tbody>
</table>
    
    </div>
  </div>
</div>










<div class="container mt-2">
  <div class="row">
    <div class="col-sm">
    <h4>Here are some event in other state</h4>
    <table class="table table-info table-striped">
  <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Date</th>
      <th scope="col">Location</th>
      <th scope="col">Host</th>
      <th scope="col">Action | Status</th>
      
    </tr>
  </thead>
  <tbody>
    
   	<c:forEach items="${events}" var="event">
   	<c:if test="${event.state != 'CA'}">
    <tr>
      <th scope="row">${event.name}</th>
      <td>${event.date}</td>
      <td>${event.location}</td>
      <td>${event.user.firstName}</td> 
      <td><a href="/delete/${event.id}">DELETE</a> | <a href="/events/${event.id}/edit">EDIT</a></td>
       </tr>
        </c:if> 
    </c:forEach> 
    
  </tbody>
</table>
    
    </div>
  </div>
</div>









<div class="container">
  <div class="row">
    <div class="col-sm">
			<h3>CREATE AN EVENT</h3>
		   <form:form action="/create/events" method="post" modelAttribute="event">
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Name</span>
			  <form:input path="name" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
			</div>
			
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Date</span>
			  <form:input path="date" type="date" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
			</div>
		
			<div class="input-group mb-3">
			  <span class="input-group-text" id="basic-addon1">Location</span>
			  <form:input path="location" type="text" class="form-control" placeholder="" aria-label="Username" aria-describedby="basic-addon1"/>
			</div>
			    
		    <form:select path="state" class="form-select" aria-label="Default select example">
			  <form:option  value="CA" selected="selected">CA</form:option>
			  <form:option  value="AZ">AZ</form:option>
			  <form:option  value="OR">OR</form:option>
			  <form:option  value="NV">NV</form:option>
			  
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