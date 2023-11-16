<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Expense Detail</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

</head>
<body>
<div class="container">
	<div class="row d-flex">
		<h1>Expense Details</h1><a href="/dashboard">Go back</a>
	</div>
	<div class="row">
		<table class="table">
			<tr>
				<th>Expense Name</th>
				<td><c:out value="${ expense.name }"/></td>
			</tr>
			<tr>
				<th>Expense Description</th>
				<td><c:out value="${ expense.description }"/></td>
			</tr>
			<tr>
				<th>Vendor</th>
				<td><c:out value="${ expense.vendor }"/></td>
			</tr>
			<tr>
				<th>Amount Spent</th>
				<td><fmt:formatNumber type="currency" value="${expense.amount}"/></td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>