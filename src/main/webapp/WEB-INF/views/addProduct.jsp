<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<div class="card" style="width:23rem; margin-top: 10px; margin-left:400px; border:solid; border-radius: 10px;" >  
	           <c:if test="${edit==null}">    
	               <s:form class="form" method="post" style="margin: 10px;" modelAttribute="product"  action="${pageContext.request.contextPath}/product/add">
	       					<center><img src="Images/us.png" style="height:150px; width:auto;" class="card-img-top" alt="..."></a></center>
	                        <div class="card-body"><center><h1>Add Product</h1></center></div>
	
							<div class="form-group">
								<label>Enter Product Name</label>
								<s:input type="text" path="pname" placeholder="Enter Product Name"  class="form-control"/>
								<s:errors path="pname" class="text-danger"></s:errors>
							</div>
							<div class="form-group">
								<label>Enter Product Type</label>
								<s:select path="ptype" class="form-control">
									<option>Wired Earphones</option>
									<option>Bluetooth Earphones</option>
									<option>Wired Headphones </option>
									<option>Bluetooth Headphones</option>
									<option>Earpods</option>
									<option>Speaker</option>
								</s:select>
								<s:errors path="ptype" class="text-danger"></s:errors>
							</div>
							<div class="form-group">
								<label>Enter Description</label>
								<s:input type="text" path="pdesc" placeholder="Enter Description"  class="form-control"/>
								<s:errors path="pdesc" class="text-danger"></s:errors>
							</div>
							<div class="form-group">
								<label>Enter Product image link</label>
								<s:input type="text" path="image" placeholder="Enter Product image link"  class="form-control"/>
								<s:errors path="image" class="text-danger"></s:errors>
							</div>
							<div class="form-group">
								<label>Enter Price</label>
								<s:input type="text" path="price" placeholder="Enter Price"  class="form-control"/>
								<s:errors path="price" class="text-danger"></s:errors>
							</div>
							<div class="form-group">
								<input type="submit" value="Add Product" class="btn btn-primary btn-block"/>
								<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
							</div>
					</s:form>
				</c:if>
				<c:if test="${edit!=null}">	
					<s:form class="form" method="post" style="margin: 10px;" modelAttribute="edit"  action="${pageContext.request.contextPath}/product/update">
	       					<center><img src="Images/us.png" style="height:150px; width:auto;" class="card-img-top" alt="..."></a></center>
	                        <div class="card-body"><center><h1>Update Product</h1></center></div>
								<s:hidden path="pid" class="form-control"/>
													<div class="form-group">
								<label>Enter Product Name</label>
								<s:input type="text" path="pname" placeholder="Enter Product Name"  class="form-control"/>
								<s:errors path="pname" class="text-danger"></s:errors>
							</div>
							<div class="form-group">
								<label>Enter Product Type</label>
								<s:select path="ptype" class="form-control">
									<option>Wired Earphones</option>
									<option>Bluetooth Earphones</option>
									<option>Wired Headphones </option>
									<option>Bluetooth Headphones</option>
									<option>Earpods</option>
									<option>Speaker</option>
								</s:select>
								<s:errors path="ptype" class="text-danger"></s:errors>
							</div>
							<div class="form-group">
								<label>Enter Description</label>
								<s:input type="text" path="pdesc" placeholder="Enter Description"  class="form-control"/>
								<s:errors path="pdesc" class="text-danger"></s:errors>
							</div>
							<div class="form-group">
								<label>Enter Product image link</label>
								<s:input type="text" path="image" placeholder="Enter Product image link"  class="form-control"/>
								<s:errors path="image" class="text-danger"></s:errors>
							</div>
							<div class="form-group">
								<label>Enter Price</label>
								<s:input type="text" path="price" placeholder="Enter Price"  class="form-control"/>
								<s:errors path="price" class="text-danger"></s:errors>
							</div>
							<div class="form-group">
								<input type="submit" value="Update Product" class="btn btn-primary btn-block"/>
								<input type="reset" value="Reset" class="btn btn-danger btn-block"/>
							</div>
					</s:form>
				</c:if>
			</div>
	</div>
</body>
</html>
