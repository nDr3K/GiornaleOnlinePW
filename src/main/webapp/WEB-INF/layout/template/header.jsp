<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
				
<div class="d-flex justify-content-center bg-nav">
	<img src="<spring:theme code='styleBanner'/>" style="height:'50px'; width:'auto'" />
</div>

<nav class="p-3 bg-nav">
	<div class="container">
		<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start ">
			<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 align-items-center">
				<li><img src="<spring:theme code='styleIcon'/>" style="margin-right:20px"/></li>
				<li><a class="nav-link text-nav px-2" style="font-size:20px; margin-left:8px" href='<spring:url value="/"/>'>Home</a></li>
				<li><a class="nav-link text-nav px-2" style="font-size:20px; margin-left:8px" href='<spring:url value="/categories?id=0"/>'>Categories</a></li>
			</ul>
			<form class="d-flex col-10 col-lg-auto mb-lg-0 me-lg-4" action="articles" method="GET">
				<input type="search" class="form-control searchBar" name="searchText" placeholder="Ricerca..." aria-label="Ricerca">
				<input class="btn btn-second" type="submit" value="Cerca"/>
			</form>
			<c:if test="${sessionScope.user == null}">
				<div class="d-flex text-end">
					<a class="nav-link btn btn-alternative me-2" href='<spring:url value="/login"/>'>
					<font style="text-align: center;">Accedi</font></a> 
					<a class="nav-link btn btn-second" href='<spring:url value="/registration"/>'>Registrati</a>
				</div>

			</c:if>
			<c:if test="${sessionScope.user != null}">
				<div class="dropdown">
					<button class="btn btn-dropdown dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						&nbsp;<i style="font-size:2rem" class="fa-regular fa-circle-user"></i>&nbsp;
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
			<div>
				<form action="<c:url value='/'/>" method="POST" name="themeChangeForm" id="themeChangeForm">
					<button class="disappear" type="submit" name="theme" value="light"><i style="font-size:2rem" class="fa-solid fa-sun iconColor iconLight"></i></button>
	                <button class="disappear" type="submit" name="theme" value="dark"><i style="font-size:2rem" class="fa-solid fa-moon iconColor iconDark"></i></button>
				</form>
			</div>
		</div>
	</div>
</nav>

<script type="text/javascript">
            function submitForm() {
                document.themeChangeForm.submit();
            }
        </script>
