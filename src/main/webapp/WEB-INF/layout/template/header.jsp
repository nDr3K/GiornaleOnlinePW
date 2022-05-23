<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- NAVBAR -->

	<div class="d-flex justify-content-center bg-dark">
        <img src="static/image/sparvierodark.png"/>
    </div>


<div class="row">
	<img src=""/>
</div>
<nav class="p-3 bg-dark text-white">
  <div class="container">
    <img src="static/image/iconaDark.png"/>
    
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
    
      <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
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
	<span>PORCODDIO</span>
</div>