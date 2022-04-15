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
<title>Dojos and Ninjas</title>
</head>
<body>
	<div class="container">
	<h2>All Dojos</h2>
	<a href="/ninjas/new">Create a Ninja</a>
	<table class="table">
		<thead>
			<tr>
				<th scope="col">Dojos</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dojo" items="${dojos }">
				<tr>
					<td><a href="/show/${dojo.id }"><c:out value="${dojo.name }"></c:out></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
	<div class="container">
		<form:form action="/create/dojo" method="post" modelAttribute="dojo">
			<div class="form-group">
	    		<form:label path="name">Name of Dojo: </form:label>
	    		<form:input path="name" placeholder="Burbank, Portland..."/>
				<form:errors path="name" />
  			</div>
  			<br />
  			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
	</div>
</body>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</html>