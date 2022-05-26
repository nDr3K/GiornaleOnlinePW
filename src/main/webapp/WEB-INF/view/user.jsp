<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

	<div class="myProfile">
		<h3>IL MIO PROFILO</h3>
	</div>
<div class="container">
	<div class="containerProfileImage">
		<span><img class="profileImage mt-3" src='<spring:url value="${user.image}"/>'></span>
		<div class="row mt-3 justify-content-center">
			<div class="col-3">
				<div class="form-body">
					<div class="form-content">
						<div class="form-items">
							<h3>Inserisci un avatar</h3>
							<form method="POST" action="user/changeavatar" accept-charset="ISO-8859-1" enctype="multipart/form-data">
								<label for="image">Inserisci immagine</label>
								<input type="file" class="form-control mt-2 btn" id="image" name="image">
								<input type="hidden" value="${user.id}" name="id"/>
								<input type="submit" value="Conferma" class="btn btn-primary mt-4">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="icona-tema">
			<img id="cambiaTema" src="cambiatemagiallo.png">
		</div>
	</div>
	<div id="alignmentFavorite" style="clear:both">
		<br>
		<hr>
		<div class="row row-cols-1 row-cols-md-1 g-4" style="margin-top: 10px; margin-left: 150px; margin-right: 150px; margin-bottom: 10px; text-align: center; justify-content: center">
				<div class="col">
					<div class="card h-100">
						<div class="card-body">
							<button class="btn formatButtonCategory" type="button" onclick="showElements('favorites')">I MIEI PREFERITI</button>
						</div>
					</div>
				</div>
			</div>
			<div id="favorites" class="row row-cols-1 row-cols-md-1 g-4" style="margin-left: 150px; margin-right: 150px; border-radius: 5px; display:none">
				<div class="card">
					<div class="card-body">
						<table class="tableFavorite">
							<c:forEach items="${articles}" var="article">
							<tr>
								<td><a class="nav-link nav-link-white" href='<spring:url value="article?id=${article.id}"/>'>${article.title}</a></td>
							</tr>			
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		<div class="form-body">
			<div class="row">
				<div class="form-holder ">
					<div class="form-content">
						<div class="form-items">
							<h3>Modifica i tuoi dati</h3>
							<p></p>
							<form method="POST" action="user/changemail" accept-charset="ISO-8859-1">
								<div class="row">
									<div class="col-12">
										<input type="hidden" value="${user.id}" name="id"/>
										<label for="title">e-mail:</label>
										<input name="mail" id="mail" type="email" class="form-control" required="required" value="${user.mail}"/>
									</div>
								</div>	
								<div class="row">
									<div class="col-12 text-center">
										<input type="submit" value="Cambia mail" class="btn btn-primary mt-4">
									</div>
								</div>
							</form>
							<form method="POST" action="user/changepassword" accept-charset="ISO-8859-1">
								<div class="row">
									<div class="col-12">
										<input type="hidden" value="${user.id}" name="id"/>
										<label for="author">Password corrente:</label>
										<input name="passwordCorrente" id="passwordCorrente" type="password" class="form-control" required="required"/>
										<c:if test="${notMatches}">
											<span class="text-danger">La password non corrisponde a quella attuale</span>
										</c:if>
									</div>
									<div class="col-12">
										<label for="author">Nuova password:</label>
										<input name="passwordNuova" id="passwordNuova" type="password" class="form-control" required="required"/>
										<c:if test="${weak}">
											<span class="text-danger">la password deve contenere almeno 1 carattere minuscolo, maiuscolo, un carattere speciale (@#$%^&+=.!?-_) e deve essere lunga almeno 8 caratteri</span>
										</c:if>
									</div>
								    <div class="col-12">
										<label for="author">Conferma nuova password:</label>
										<input name="passwordConferma" id="passwordConferma" type="password" class="form-control" required="required"/>
										<c:if test="${notSame}">
											<span class="text-danger">Le due password devono corrispondere</span>
										</c:if>
									</div>
								</div>
								<div class="row">
									<div class="col-12 text-center">
										<input type="submit" value="Cambia password" class="btn btn-primary mt-4">
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="<c:url value="/static/javascript/script.js" />"></script>