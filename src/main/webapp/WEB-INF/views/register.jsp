<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"></jsp:include>
			<div class="card" style="width:23rem; margin-top: 10px; margin-left:400px; border:solid; border-radius: 10px;" >  
               	<c:if test="${edit==null}"> 
               		<s:form class="form m-2" method="post"  modelAttribute="user"  action="${pageContext.request.contextPath}/user/add">
       					<center><img src="img/us.png" style="height:150px; width:auto;" class="card-img-top" alt="..."></a></center>
                        <div class="card-body"><center><h1>Register</h1></center></div>

						<div class="form-group">
							<label>Enter Username</label>
							<s:input type="text" path="username" placeholder="Enter Username"  class="form-control"/>
							<s:errors path="username" class="text-danger"></s:errors>
						</div>
						<div class="form-group">
							<label>Enter Email</label>
							<s:input type="email" path="email" placeholder="Enter Email"  class="form-control"/>
							<s:errors path="email" class="text-danger"></s:errors>
						</div>
						<div class="form-group">
							<label>Enter Mobile</label>
							<s:input type="text" path="mobile" placeholder="Enter Mobile"  class="form-control"/>
							<s:errors path="mobile" class="text-danger"></s:errors>
						</div>
						<div class="form-group">
							<label>Enter Password</label>
							<s:input type="password" path="password" placeholder="Enter Password"  class="form-control"/>
							<s:errors path="password" class="text-danger"></s:errors>
						</div>
						<div class="form-group">
							<input type="submit" value="Register" class="btn btn-primary btn-block"/>
							<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
						</div>
					</s:form>
				</c:if>
				<c:if test="${edit!=null}">
					 <s:form class="form" method="post" style="margin: 10px;" modelAttribute="edit"  action="${pageContext.request.contextPath}/user/update">
       					<center><img src="Images/us.png" style="height:150px; width:auto;" class="card-img-top" alt="..."></a></center>
                        <div class="card-body"><center><h1>Edit</h1></center></div>
							<s:hidden path="userid"/>
						<div class="form-group">
							<label>Enter Username</label>
							<s:input type="text" path="username" placeholder="Enter Username"  class="form-control"/>
							<s:errors path="username" class="text-danger"></s:errors>
						</div>
						<div class="form-group">
							<label>Enter Email</label>
							<s:input type="email" path="email" placeholder="Enter Email"  class="form-control"/>
							<s:errors path="email" class="text-danger"></s:errors>
						</div>
						<div class="form-group">
							<label>Enter Mobile</label>
							<s:input type="text" path="mobile" placeholder="Enter Mobile"  class="form-control"/>
							<s:errors path="mobile" class="text-danger"></s:errors>
						</div>
						<div class="form-group">
							<label>Enter Password</label>
							<s:input type="password" path="password" placeholder="Enter Password"  class="form-control"/>
							<s:errors path="password" class="text-danger"></s:errors>
						</div>
						<div class="form-group">
							<input type="submit" value="Update" class="btn btn-primary btn-block"/>
							<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
						</div>
					</s:form>
				</c:if>
			</div>
	</div>
	<script>
	$(document).ready(function()
	{
		$('span').each(function(){
		    var $this = $(this);
		    var t = $this.text();
		    $this.html(t.replace('&lt','<').replace('&gt', '>'));
		});
	});
		
</script>
</body>
</html>
