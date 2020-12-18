<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>


<div class="container">
  <div class="row">
  
  
    <div class="col-sm">
    
    <h1>${events.name}</h1>
    <h3>Host: ${events.user.firstName}</h3>
    
    <h3>Date: ${events.date}</h3>
    <h3>Location: ${events.location}</h3>
    <h3>Attendees: </h3>
    
    
    
    
    <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>

    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>

    </tr>

  </tbody>
</table>
    
    
    
    </div>
    
    
    
    <div class="col-sm">
    
    <h1>MESSAGE WALL</h1>

<div data-bs-spy="scroll" data-bs-target="#list-example" data-bs-offset="0" class="scrollspy-example" tabindex="0">
   <c:forEach items="${comments}" var="com">
  <p>${com.comment}</p>
	</c:forEach>
</div>


<form action="/comment" method="post" modelAttribute="comments">

<div class="input-group mb-3">
  <span class="input-group-text" id="basic-addon1">@</span>
  <input name="comment" type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1"/>
</div>


<button type="submit" class="btn btn-info">Submit</button>

  </form>  
    
    
    </div>
    
    
    
  </div>
</div>





<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>

</body>
</html>