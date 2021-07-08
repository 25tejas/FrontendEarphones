<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products</title>
</head>
<body>
<div class="container">
<jsp:include page="header.jsp"></jsp:include>
		<div class="row">
			<c:if test="${empty carts}">
	    		<center><h1>No Cart Items Available. Please Add Product to Cart.</h1></center>
	    	</c:if>
	    	
	    	<c:if test="${not empty carts}">
					<c:forEach items="${carts}" var="row">
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
								      		<center><img src="${row.product.image}" style="height:350px; width:auto;"alt="..."></center>
								      	</div>
								      	<div class="carousel-item">
								      		<center><img src="${row.product.image}" style="height:350px; width:auto;"alt="..."></center>
								      	</div>
								      	<div class="carousel-item">
								      		<center><img src="${row.product.image}" style="height:350px; width:auto;"alt="..."></center>
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
									<h3 class="card-title">${row.product.pname}</h5>
									<p class="card-text">${row.product.ptype}</p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">Quantity : <input class="col-lg-2" type="number" name="qty" min="1" max="5" value="1"/><input type="submit" value="Update Quantity" class="btn btn-primary ml-2"/></li>
									<li class="list-group-item">Total Price: ${row.product.price}</li>
									<div class="card-body">
										<a href="${pageContext.request.contextPath}/cart/buy/${row.cid}" target="_blank" class="btn btn-success btn-block">Buy</a>
										<a href="${pageContext.request.contextPath}/cart/delete/${row.cid}" class="btn btn-danger btn-block">Remove from Cart</a>
									</div>
								</ul>
								
							</div>
						</div>
			</c:forEach>
		</c:if>
	</div>
</div>	
</body>
</html>