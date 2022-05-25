<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row row-cols-1 row-cols-md-1 g-4" style="margin-top: 10px; margin-left: 150px; margin-right: 150px; margin-bottom: 10px; text-align: center; justify-content: center">
		<div class="col">
			<div class="card h-100 bordo">
				<div class="card-body">
					<div class="row">
						<div class="col-10">
							<button class="btn categorie" type="button" onclick="showElements('articles')">Articoli</button>
						</div>
						<div class="col-2">
							<a href='<spring:url value="/articleform?id=0"/>' class="btn btn-warning">Aggiungi</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="articles" class="row row-cols-1 row-cols-md-1 g-4" style="margin-left: 150px; margin-right: 150px; border-radius: 5px; display:none">
		<div class="card">
			<div class="card-body">
				<table class="table">
				<c:forEach items="${articles}" var="article">
					<tr>
						<td width="73%">	
							<a class="nav-link nav-link-white" href='<spring:url value="/article?id=${article.id}"/>'>${article.title}</a>
						</td>
						<td valign="middle" width="17%" align="right">
							<a class="btn btn-primary" href='<spring:url value="/articleform?id=${article.id}"/>'>Modifica</a>
						</td>
						<td valign="middle" width="10%">
							<a class="btn btn-danger" href='<spring:url value="admin/deletearticle?id=${article.id}"/>'>Elimina</a>
						</td>
					</tr>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div class="row row-cols-1 row-cols-md-1 g-4" style="margin-top: 10px; margin-left: 150px; margin-right: 150px; margin-bottom: 10px; text-align: center; justify-content: center">
		<div class="col">
			<div class="card h-100 bordo">
				<div class="card-body">
					<div class="row">
						<div class="col-10">
							<button class="btn categorie" type="button" onclick="showElements('categories')">Categorie</button>
						</div>
						<div class="col-2">
							<a href='<spring:url value="/categoryform?id=0"/>' class="btn btn-warning">Aggiungi</a>						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="categories" class="row row-cols-1 row-cols-md-1 g-4" style="margin-left: 150px; margin-right: 150px; border-radius: 5px; display:none">
		<div class="card">
			<div class="card-body">
				<table class="table">
				<c:forEach items="${categories}" var="category">
					<tr>
						<td width="73%">
							<span class="nav-link nav-link-white">${category.description}</span>
						</td>
						<td valign="middle" width="17%" align="right">
							<a class="btn btn-primary" href='<spring:url value="/categoryform?id=${category.id}"/>'>Modifica</a>
						</td>
						<td valign="middle" width="10%">
							<a class="btn btn-danger" href='<spring:url value="admin/deletecategory?id=${category.id}"/>'>Elimina</a>
						</td>
					</tr>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<div class="row row-cols-1 row-cols-md-1 g-4" style="margin-top: 10px; margin-left: 150px; margin-right: 150px; margin-bottom: 10px; text-align: center; justify-content: center">
		<div class="col">
			<div class="card h-100 bordo">
				<div class="card-body">
					<div class="row">
						<div class="col-10">
							<button class="btn categorie" type="button" onclick="showElements('users')">Utenti</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="users" class="row row-cols-1 row-cols-md-1 g-4" style="margin-left: 150px; margin-right: 150px; border-radius: 5px; display:none">
		<div class="card">
			<div class="card-body">
				<table class="table">
				<c:forEach items="${users}" var="user">
					<tr>
						<td width="73%">
							<span class="nav-link nav-link-white">${user.username}</span>
						</td>
						<td valign="middle" width="17%" align="right">
							<a class="btn btn-primary" href='<spring:url value="admin/change?id=${user.id}"/>'>Cambia ruolo</a>
						</td>
						<td valign="middle" width="10%">
							<a class="btn btn-danger" href='<spring:url value="admin/deleteuser?id=${user.id}"/>'>Elimina</a>
						</td>
					</tr>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>

<script src="<c:url value="/static/javascript/script.js" />"></script>