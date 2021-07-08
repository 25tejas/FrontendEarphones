<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List User</title>
</head>
<body>
<div class="container">
	<jsp:include page="header.jsp"></jsp:include>
	<h1 class="text-center">User Data</h1>
			
	<table class="table table-hover" border="1">
		<thead class="thead-dark">
		<tr>
			<th scope="col">UserName</th>
			<th scope="col">Email</th>
			<th scope="col">Mobile</th>
			<!-- <th scope="col">password</th> -->
			<th scope="col">Manipulate</th>
		</tr>
		</thead>		
		<c:forEach items="${users}" var="row"> 
			<tr> 
				<td>${row.username}</td>
				<td>${row.email}</td>
				<td>${row.mobile}</td>
				<%-- <td>${row.password}</td>  --%>
				<td><a href="${pageContext.request.contextPath}/user/${row.userid}" class="btn btn-primary">View</a>
					<a href="${pageContext.request.contextPath}/user/edit/${row.userid}" class="btn btn-warning">Edit</a>
					<a href="${pageContext.request.contextPath}/user/delete/${row.userid}" class="btn btn-danger">Delete</a></td>		
			</tr>
		</c:forEach>	
	</table>
</div>
</body>
</html>