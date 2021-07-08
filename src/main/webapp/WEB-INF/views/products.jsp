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
			<c:if test="${empty products}">
				<h2 class="text-center">Sorry, No Products Available!!!</h2>
			</c:if>
			<c:if test="${not empty products}">
				<div class="row">
					<c:forEach items="${products}" var="row">
						<div class=m-2 style="border:solid; border-radius: 15px;" >	
							<div class="card" style="width: 16rem; margin-top:10px">
								<center><a href="${pageContext.request.contextPath}/product/${row.pid}"><img src="${row.image}" style="height:250px; width:auto;" class="card-img-top" alt="..."></a></center>
								<div class="card-body">
								
									<h5 class="card-title">${row.pname}</h5>
									<p class="card-text">${row.ptype}</p>
									
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item"><s>Rs.${row.price+500}</s> Rs.${row.price}</li>
								</ul>
								<div class="card-body">
									<a href="${pageContext.request.contextPath}/cart/add/${row.pid}" class="btn btn-block btn-primary">Add To Cart</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
</div>
</body>
</html>