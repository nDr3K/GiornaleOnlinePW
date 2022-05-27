<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row row-cols-1 row-cols-md-1 g-4" style="margin-top: 10px; margin-left: 150px; margin-right: 150px; margin-bottom: 10px; text-align: center; justify-content: center">
		<div class="col">
			<div class="card h-100">
				<div class="card-body">
					<div class="row">
						<div class="col-10">
							<button class="btn formatButtonCategory" type="button" onclick="showElements('articles')">Articoli</button>
						</div>
						<div class="col-2">
							<a href='<spring:url value="/articleform?id=0"/>' class="btn btn-second">Aggiungi</a>
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
					<div id="article${article.id}" class="checkBox" style="display: none ">
					    <br/>
					    <h4 class="checkBoxFixed">Sei sicuro di voler cancellare l'articolo?</h4> <br/>
					    <div class="row">
					        <div class="col-6 text-center">
					            <a class="btn btn-danger" href='<spring:url value="admin/deletearticle?id=${article.id}"/>'>Elimina</a>
					        </div>
					        <div class="col-6 text-center">
					        	<a class="btn btn-admin" onclick="showElements('article${article.id}')">Annulla</a>
					        </div>
					    </div>
					</div>
					<tr>
						<td width="70%">	
							<a class="nav-link nav-link-white" href='<spring:url value="/article?id=${article.id}"/>'>${article.title}</a>
						</td>
						<td valign="middle" width="10%" align="right">
							<a class="btn btn-admin" href='<spring:url value="admin/hidearticle?id=${article.id}"/>'>${!article.visible ? "Nascondi" : "Mostra" }</a>
						</td>
						<td valign="middle" width="10%" align="right">
							<a class="btn btn-admin" href='<spring:url value="/articleform?id=${article.id}"/>'>Modifica</a>
						</td>
						<td valign="middle" width="10%">
							<button class="btn btn-danger" onclick="showElements('article${article.id}')">Elimina</button>
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
							<button class="btn formatButtonCategory" type="button" onclick="showElements('categories')">Categorie</button>
						</div>
						<div class="col-2">
							<a href='<spring:url value="/categoryform?id=0"/>' class="btn btn-second">Aggiungi</a>						
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
					<div id="category${category.id}" class="checkBox" style="display: none ">
					    <br/>
					    <h4 class="checkBoxFixed">Sei sicuro di voler cancellare la categoria?</h4> <br/>
					    <div class="row">
					        <div class="col-6 text-center">
					            <a class="btn btn-danger" href='<spring:url value="admin/deletecategory?id=${category.id}"/>'>Elimina</a>
					        </div>
					        <div class="col-6 text-center">
					        	<a class="btn btn-admin" onclick="showElements('category${category.id}')">Annulla</a>
					        </div>
					    </div>
					</div>
					<tr>
						<td width="73%">
							<span class="nav-link nav-link-white">${category.description}</span>
						</td>
						<td valign="middle" width="17%" align="right">
							<a class="btn btn-admin" href='<spring:url value="/categoryform?id=${category.id}"/>'>Modifica</a>
						</td>
						<td valign="middle" width="10%">
							<button class="btn btn-danger" onclick="showElements('category${category.id}')">Elimina</button>
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
							<button class="btn formatButtonCategory" type="button" onclick="showElements('users')">Utenti</button>
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
					<div id="user${user.id}" class="checkBox" style="display: none ">
					    <br/>
					    <h4 class="checkBoxFixed">Sei sicuro di voler cancellare l' utente?</h4> <br/>
					    <div class="row">
					        <div class="col-6 text-center">
					            <a class="btn btn-danger" href='<spring:url value="admin/deleteuser?id=${user.id}"/>'>Elimina</a>
					        </div>
					        <div class="col-6 text-center">
					        	<a class="btn btn-admin" onclick="showElements('user${user.id}')">Annulla</a>
					        </div>
					    </div>
					</div>
					<tr>
						<td width="73%">
							<span class="nav-link nav-link-white">${user.username}</span>
						</td>
						<td valign="middle" width="17%" align="right">
							<a class="btn btn-admin" href='<spring:url value="admin/change?id=${user.id}"/>'>Cambia ruolo</a>
						</td>
						<td valign="middle" width="10%">
							<button class="btn btn-danger" onclick="showElements('user${user.id}')">Elimina</button>
						</td>
					</tr>
				</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>

<script src="<c:url value="/static/javascript/script.js" />"></script>