<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="row">
		<div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       Articoli
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <div class="dropdown-item">
                     <div class="row">
                     	<div class="col-2 text-end">
        					<a href='<spring:url value="/articleform"/>' class="btn btn-success">Nuovo Articolo</a>
    					</div>
    				</div>
                    <c:forEach items="${articles}" var="article">
                    
                        <div class="row"> 
                        	<div class="col-8"><a href='<spring:url value="/article?id=${id}"/>'>${article.title}</a></div>
                        	<div class="col-2"><a href='<spring:url value="/articleform?id=${id}"/>'>Modifica</a></div>
                        	<div class="col-2"><a href='<spring:url value="admin/deletearticle?id=${id}"/>'>Elimina</a></div>
                        	
                        </div>	
                    
					</c:forEach>
					</div>
                    </div>
                </div>
	</div>
	
	<div class="row">
		<div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       Categorie
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <div class="dropdown-item">
                     <div class="row">
                     	<div class="col-2 text-end">
        					<a href='<spring:url value="/categoryform"/>' class="btn btn-success">Nuova Categoria</a>
    					</div>
    				</div>
                    <c:forEach items="${categories}" var="category">
                    
                        <div class="row"> 
                        	<div class="col-8">${category.description}</div>
                        	<div class="col-2"><a href='<spring:url value="/categoryform?id=${id}"/>'>Modifica</a></div>
                        	<div class="col-2"><a href='<spring:url value="admin/deletecategory?id=${id}"/>'>Elimina</a></div>
                        	
                        </div>	
                    
					</c:forEach>
					</div>
                    </div>
                </div>
	</div>
	
		<div class="row">
		<div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       Utenti
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                    <div class="dropdown-item">
                     <div class="row">
    				</div>
                    <c:forEach items="${users}" var="user">
                    
                        <div class="row"> 
                        	<div class="col-8"><a href='<spring:url value="/user?id=${id}"/>'>${user.username}</a></div>
                        	<div class="col-2"><a href='<spring:url value="admin/change?id=${id}"/>'>Cambia Ruolo</a></div>
                        	<div class="col-2"><a href='<spring:url value="admin/deleteuser?id=${id}"/>'>Elimina</a></div>
                        	
                        </div>	
                    
					</c:forEach>
					</div>
                    </div>
                </div>
	</div>