<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Edit Expense</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container">
		<h2>Edit this expense</h2>
		<form:form action="/expense/${expense.id}" method="post" modelAttribute="expense">
			<input type="hidden" name="_method" value="put" />
			<form:label path="name" class="form-label" for="name">Expense Name</form:label>
			<div><form:errors path="name" class="text-danger"/></div>
			<form:input path="name" class="form-control" type="text" id="name" name="name"/>
			<form:label path="vendor" class="form-label" for="vendor">Vendor</form:label>
			<div><form:errors path="vendor" class="text-danger"/></div>
			<form:input path="vendor" class="form-control" type="text" id="vendor" name="vendor"/>
			<form:label path="amount" class="form-label" for="amount">Amount</form:label>
			<div><form:errors path="amount" class="text-danger"/></div>
			<form:input path="amount" class="form-control" type="text" id="amount" name="amount"/>
			<form:label path="description" class="form-label" for="description">Description</form:label>
			<div><form:errors path="description" class="text-danger"/></div>
			<form:input path="description" class="form-control" type="text" id="description" name="description"/>
			<div class="btn-group mt-2">
				<input type="submit" class="btn btn-success" value="Update"/>
				<a href="/dashboard" class="btn btn-secondary">Go Back</a>
			</div>
		</form:form>
	</div>
</body>
</html>