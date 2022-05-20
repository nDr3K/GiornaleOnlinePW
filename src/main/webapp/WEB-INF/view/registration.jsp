<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row mt-4">
	<div class="col-12 text-center">
		<h5>Benvenuto! Registrati per far parte della nostra community!</h5>
	</div>
</div>

<div class="row justify-content-center">
	<div class="col-6">
		<form:form method="POST" modelAttribute="user" acceptCharset="ISO-8859-1">
			<div class="row">
				<div class="col-6">
					<label for="username">Username:</label>
					<form:input path="username" id="username" type="text" cssClass="form-control" 
						required="required" />
					<form:errors path="username" id="usernameError" cssClass="text-danger"/>
				</div>
				<div class="col-6">
					<label for="password">Password:</label>
					<form:input path="password" id="password" type="password" cssClass="form-control" 
						required="required" />
					<form:errors path="password" id="password" cssClass="text-danger"/>
				</div>
			</div>
			<div class="row">
				<div class="col-6">
					<label for="mail">Indirizzo Mail:</label>
					<form:input path="mail" id="mail" type="mail" cssClass="form-control" 
						required="required" />
					<form:errors path="mail" id="mailError" cssClass="text-danger"/>
					<div class="row mt-4">
				<div class="col-12 text-center">
					<input type="submit" value="Registrati" class="btn btn-primary btn-lg">
				</div>
			</div>
				</div>
			</div>
		</form:form>
	</div>
</div>
