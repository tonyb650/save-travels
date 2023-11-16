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
	<title>Expense Dashboard</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
<div class="container">
	<h2>Save Travels</h2>
	<table class="table border">
		<thead>
			<tr>
				<th>Expense</th>
				<th>Vendor</th>
				<th>Amount</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="expense" items="${ expenseList }">
			<tr>
				<td><a href="/expense/${expense.id}/detail"><c:out value="${ expense.name }"/></a></td>
				<td><c:out value="${ expense.vendor }"/></td>
				
				<td><fmt:formatNumber type="currency" value="${expense.amount}" /></td>
				<td class="d-flex">

						<a href="/expense/${expense.id}/edit" class="btn btn-sml btn-secondary mx-2">edit</a>
						<form action="/expense/${expense.id}/delete" method="post" attribute="expense">
							<input type="hidden" name="_method" value="delete"/>
							<input type="submit" class="btn btn-sml btn-secondary" value="delete"/>
						</form>

				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
		<h2>Add an expense</h2>
		<form:form action="/expense" method="post" modelAttribute="expense">
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
			<input type="submit" class="btn btn-secondary" value="Submit"/>
		</form:form>
</div>
</body>
</html>