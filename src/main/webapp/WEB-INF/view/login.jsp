<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  


<div class="row mt-4">
	<div class="col-12 text-center">
		<h5>Registrati</h5>
	</div>
</div>

<c:if test="${loginSuccess}">
<div>
	<div class="alert alert-success alert-dismissible mt-4" role="alert">
		<span>Accesso eseguito</span>
		<button class="btn-close" data-bs-dismiss="alert" aria-label="close"></button>
	</div>
</div>
</c:if>
<c:if test="${loginFailure}">
<div>
	<div class="alert alert-danger alert-dismissible mt-4" role="alert">
		<span>Nome utente non esistente o password errata</span>
		<button class="btn-close" data-bs-dismiss="alert" aria-label="close"></button>
	</div>
</div>
</c:if>

<div class="row justify-content-center">
	<div class="col-4 justify-content-center">
		<form:form action="login/checkdata"  method="POST" acceptCharset="ISO-8859-1">		
			<div class="row justify-content-center">
				<div class="col-6">
					<label for="usernameSp">Nome Utente:</label>
					<input id="usernameSp" type="text" name="username" class="form-control" required="required" />
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-6">
					<label for="passwordSp">Password:</label>
					<input id="passwordSp" type="password" name="password" class="form-control" required="required" />
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-2">
					<input type="submit" value="Accedi" class="btn btn-primary mt-4">
				</div>
			</div>
		</form:form>
	</div>
</div>