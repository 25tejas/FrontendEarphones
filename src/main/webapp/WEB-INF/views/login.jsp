<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
			<div class="card" style="width:23rem; margin-top: 10px; margin-left:400px; border:solid; border-radius: 10px;" >  
               <form class="form m-2" action="${pageContext.request.contextPath}/loginaction" method="post">
					<center><img src="img/us.png" style="height:150px; width:auto;" class="card-img-top" ></center>
					<div class="card-body"><center><h1>Login</h1></center></div>
						<div class="form-group">
							<label>Enter Username</label>
							<input type="text" name="username" placeholder="Enter Username" class="form-control"/>
						</div>
						<div class="form-group">
							<label>Enter Password</label>
							<input type="password" name="password"  placeholder="Enter Password" class="form-control"/>
						</div>
						<div class="form-group">
							<input type="submit" value="Login" class="btn btn-primary btn-block"/>
							<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
						</div>
				</form>
			</div>
	</div>
</body>
</html>
