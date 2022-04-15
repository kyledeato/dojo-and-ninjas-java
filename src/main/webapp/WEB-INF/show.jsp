<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<title>Show</title>
</head>
<body>
	<h1><c:out value="${dojos.name}"></c:out> Dojo Location</h1>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">First Name: </th>
				<th scope="col">Last Name: </th>
				<th scope="col">Age: </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dojo" items="${dojos.ninjas}">
				<tr>
					<td><c:out value="${dojo.firstName}"></c:out></td> 
					<td><c:out value="${dojo.lastName}"></c:out></td> 
					<td><c:out value="${dojo.age}"></c:out></td> 
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</html>