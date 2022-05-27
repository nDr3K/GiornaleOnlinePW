<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<div class="form-body">
	<div class="row">
		<div class="form-holder ">
			<div class="form-content">
				<div class="form-items">
					<h3>Accedi</h3>
					<p>Inserisci i tuoi dati</p>
						<c:if test="${sessionScope.loginFailure}">
							<div>
								<div class="alert alert-danger alert-dismissible mt-4" role="alert">
									<span>Nome utente non esistente o password errata</span>
									<a class="btn-close" href="login/failure"></a>
								</div>
							</div>
						</c:if>											
					<form:form action="login/checkdata"  method="POST" acceptCharset="ISO-8859-1">		
						<div class="row justify-content-center">
							<div class="col-md-12">
								<label for="usernameSp">Nome Utente:</label>
								<input id="usernameSp" type="text" name="username" class="form-control" required="required" />
							</div>
						</div>
						<div class="row justify-content-center">
							<div class="col-md-12">
								<label for="passwordSp">Password:</label>
								<input id="passwordSp" type="password" name="password" class="form-control" required="required" />
							</div>
						</div>
						<div class="form-button mt-3  d-flex justify-content-center">
							<input type="submit" value="Accedi" class="btn btn-main mt-4">
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>