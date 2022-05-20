<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!-- NAVBAR -->
<header class="p-3 bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">

                <li><a href='<spring:url value="/"/>' class="nav-link px-2 text-secondary" ><font style="vertical-align: inherit;">Home</font></a></li>

                <li><a href='<spring:url value="/categories"/>' class="nav-link px-2 text-white"><font style="vertical-align: inherit;">Categorie</font></a></li>
            </ul>
			<div class="card bg-light text-white">
				  <img src="<c:url value="/static/image/headerimage.png"/>" class="card-img" alt="Header">
					  <div class="card-img-overlay">
						    <h2 class="card-title">Benvenuto in O'Giurnal do Profssor</h2>
						    <h5 class="card-text">Se o'dic iss, è o'ver</h5>
					  </div>
			</div>
            <form class="col-10 col-lg-auto mb-3 mb-lg-0 me-lg-4" role="search">
                <input type="search" class="form-control form-control-dark text-white bg-dark" placeholder="Ricerca..." aria-label="Ricerca">
            </form>

            <div class="text-end">
                <a href='<spring:url value="/login"/>' class="btn btn-outline-light me-2">Login</a>
                <a href='<spring:url value="/registration"/>' class="btn btn-warning">Iscriviti</a>
            </div>
        </div>
    </div>
</header>
<!-- CARDS IMAGE OVERLAY -->
<div class="card bg-light text-white">
  <img src="<c:url value="/static/image/headerimage.png"/>" class="card-img" alt="Header">
  <div class="card-img-overlay">
    <h2 class="card-title">Benvenuto in AlphaStore</h2>
    <h5 class="card-text">Qui puoi trovare tutto quello che cerchi</h5>
  </div>
</div>