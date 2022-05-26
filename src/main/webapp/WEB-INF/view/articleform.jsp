<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="form-body">
	<div class="row">
		<div class="form-holder ">
			<div class="form-content">
				<div class="form-items">
					<h3>${id > 0 ? 'Modifica Articolo' : 'Inserisci Articolo'}</h3>
					<p>Compila i campi sottostanti</p>
					<form method="POST" action="articleform/savearticle" accept-charset="ISO-8859-1" enctype="multipart/form-data">
					<div class="row">
						<div class="col-6">
							<input type="hidden" value="${id}" name="id"/>
							<input type="hidden" value="sonounimmagine" name="imageLink"/>
							<label for="title">Titolo:</label>
							<input name="title" id="title" type="text" class="form-control" required="required" value="${id > 0 ? article.title : ''}"/>
						</div>
						<div class="col-6">
							<label for="author">Autore:</label>
							<input name="author" id="author" type="text" class="form-control" required="required" value="${id > 0 ? article.author : ''}"/>
						</div>
						<div class="col-6">
							<label for="abstract">Didascalia:</label>
							<textarea name="caption" id="caption" class="form-control" rows="3" style="resize:none;" required="required">${id > 0 ? article.caption : ''}</textarea>
						</div>
						<div class="col-6">
							<label for="category">Categoria:</label>
							<select name="category" id="category">
								<c:forEach items="${categories}" var="category">
									<c:if test="${category.id == article.category.id}">
										<option value="${category.id}" selected> ${category.description} </option>
									</c:if>
									<c:if test="${category.id != article.category.id}">
										<option value="${category.id}"> ${category.description} </option>
									</c:if>	
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<label for="content">Parole chiave (separale con una ,):</label>
							<input type="text" name="keywords" id="keywords" class="form-control" required="required" value="${id > 0 ? article.keywords : ''}">
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<label for="content">Descrizione:</label>
							<textarea name="content" id="content" class="form-control" rows="12" style="resize:none;" required="required">${id > 0 ? article.content : ''}</textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-6">
							<label for="image">Inserisci immagine</label>
							<input type="file" class="form-control mt-2 btn-warning" id="image" name="image">
						</div>
					</div>
					<div class="row">
						<div class="col-12 text-center">
							<input type="submit" value="${id > 0 ? 'Aggiorna Articolo' : 'Aggiungi Articolo'}" class="btn btn-primary mt-4">
						</div>
					</div>
				</form>
				</div>
			</div>
		</div>
	</div>
</div>