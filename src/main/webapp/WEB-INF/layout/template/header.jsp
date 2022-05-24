<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="d-flex justify-content-center bg-dark">
	<img src="static/image/sparvierodark.png" style="height:'50px'; width:'auto'" />
</div>

<nav class="p-3 bg-dark text-white">
	<div class="container">
		<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start ">
			<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 align-items-center">
				<li><img src="static/image/iconaDark.png" style="margin-right:20px"/></li>
				<li><a class="nav-link text-white px-2" style="font-size:20px; margin-left:8px" href='<spring:url value="/"/>'>Home</a></li>
				<li><a class="nav-link text-white px-2" style="font-size:20px; margin-left:8px" href='<spring:url value="/categories"/>'>Categories</a></li>
			</ul>
			<form class="col-10 col-lg-auto mb-3 mb-lg-0 me-lg-4" role="search">
				<input type="search" class="form-control form-control-dark text-white bg-dark" placeholder="Ricerca..." aria-label="Ricerca">
			</form>
			<c:if test="${sessionScope.user == null}">
				<div class="d-flex text-end">
					<a class="nav-link btn btn-outline-light me-2 text-secondary" href='<spring:url value="/login"/>'>
					<font style="text-align: center;">Accedi</font></a> 
					<a class="nav-link btn btn-warning text-secondary" href='<spring:url value="/registration"/>'>Registrati</a>
				</div>

			</c:if>
			<c:if test="${sessionScope.user != null}">
				<div class="dropdown">
					<button class="btn btn-warning dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i style="font-size:2rem" class="fa-regular fa-circle-user"></i>
					</button>
					<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						<a class="dropdown-item" href='<spring:url value="/user?id=${sessionScope.user.id}"/>'>Gestione Account</a>
						<c:if test="${sessionScope.user.role.id == 2}">
							<a class="dropdown-item" href='<spring:url value="/admin?id=${sessionScope.user.id}"/>'>Pannello Admin</a>
						</c:if>
						<a class="dropdown-item" href='<spring:url value="/user/logout?id=${sessionScope.user.id}"/>'>Esci</a>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</nav>
