<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarNav"
      aria-controls="navbarNav"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="fas fa-bars"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href='<spring:url value="/"/>'>Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href='<spring:url value="/categories"/>'>Categories</a>
        </li>
        <li>
             <input type="search" class="form-control form-control-dark text-white bg-dark" placeholder="Ricerca..." aria-label="Ricerca">
        </li>
        
         <li class="nav-item text-end">
         <c:if test="${sessionScope.user == null}">
         <div class="text-end">
                <a class="nav-link btn btn-outline-light me-2" href='<spring:url value="/login"/>'><font style="text-align: center;">Accedi</font></a>
         		<a class="nav-link btn btn-warning" href='<spring:url value="/registration"/>'>Registrati</a>
            </div>
         
         </c:if>
         <c:if test="${sessionScope.user != null}">
         	<div class="dropdown">
				  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				   	<i class="fa-regular fa-circle-user"></i>
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
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- CARDS IMAGE OVERLAY -->
<div>
	<span>questo è un bel banner</span>
</div>