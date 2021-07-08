<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product</title>
</head>
<body>

<div class="container">
<jsp:include page="header.jsp"></jsp:include>
				<div class="row">	
						<div class=m-2 style="border:solid; border-radius: 10px;" >	
							<div class="card" style="width: 27rem; margin-top: 20px">
							
								<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
									  <ol class="carousel-indicators">
									    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
									    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								      </ol>
								  	  <div class="carousel-inner">
								    	<div class="carousel-item active">
								      		<center><img src="${row.image}" style="height:350px; width:auto;"alt="..."></center>
								      	</div>
								      	<div class="carousel-item">
								      		<center><img src="${row.image}" style="height:350px; width:auto;"alt="..."></center>
								      	</div>
								      	<div class="carousel-item">
								      		<center><img src="${row.image}" style="height:350px; width:auto;"alt="..."></center>
								      	</div>
							  		  </div>
								  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" style="color:black;" data-slide="prev">
								    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
								    <span class="sr-only">Previous</span>
								  </a>
								  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
								    <span class="carousel-control-next-icon" aria-hidden="true"></span>
								    <span class="sr-only">Next</span>
								  </a>
								</div>
							
							</div>
						</div>
				
						<div class=m-2 style="border:solid; border-radius: 10px;" >	
							<div class="card" style="width: 39rem;">
								<div class="card-body">
									<h3 class="card-title">${row.pname}</h5>
									<p class="card-text">${row.ptype}</p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item"><s>Rs.${row.price+500}</s> Rs.${row.price}</li>
									<li class="list-group-item">Description :  </li>
									<li class="list-group-item">${row.pdesc}</li>
								</ul>
								<div class="card-body">
									<a href="${pageContext.request.contextPath}/cart/add/${row.pid}" class="btn btn-block btn-primary">Add To Cart</a>
									<sec:authorize access="hasAuthority('admin')">
									<a href="${pageContext.request.contextPath}/product/edit/${row.pid}" class="btn btn-block btn-success">Edit</a>
									<a href="${pageContext.request.contextPath}/product/delete/${row.pid}" class="btn btn-block btn-warning">Delete</a>
									</sec:authorize>
								</div>
							</div>
						</div>
				</div>
</div>
</body>
</html>