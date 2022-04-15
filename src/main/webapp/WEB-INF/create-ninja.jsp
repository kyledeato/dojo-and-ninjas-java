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
<title>Create a Ninja</title>
</head>
<body>
	<div class="container">
		<a href="/">Home</a>
		<form:form action="/create/ninja" method="post" modelAttribute="ninja">
			<div class="form-group">
	    		<label for="dojo">Choose a Dojo: </label>
	    		<form:select path="Dojo">
	    			<c:forEach var="dojo" items="${dojos }">
	    				<form:option  value="${dojo.id}">
	    					${dojo.getName() }
	    				</form:option>
	    			</c:forEach>
	    		</form:select>
  			</div>
			<div class="form-group">
	    		<form:label path="firstName">First Name: </form:label>
	    		<form:input path="firstName"/>
				<form:errors path="firstName" />
  			</div>
			<div class="form-group">
	    		<form:label path="lastName">Last Name: </form:label>
	    		<form:input path="lastName"/>
				<form:errors path="lastName" />
  			</div>
			<div class="form-group">
	    		<form:label path="age">Age: </form:label>
	    		<form:input type="number" path="age"/>
				<form:errors path="age" />
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