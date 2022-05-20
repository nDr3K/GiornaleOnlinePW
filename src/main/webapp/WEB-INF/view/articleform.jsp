<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="row mt-4">
	<div class="col-6">
		<div class="row">
			<div class="col-12 text-center">
				<h5>articoli robbe</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<form method="POST" action="articleform/savearticle" accept-charset="ISO-8859-1">
					<div class="row">
						<div class="col-6">
							<input type="hidden" value="${id}" name="id"/>
							<input type="hidden" value="sonounimmagine" name="image"/>
							<label for="title">Titolo:</label>
							<input name="title" id="title" type="text" class="form-control" required="required" />
						</div>
						<div class="col-6">
							<label for="abstract">Didascalia:</label>
							<textarea name="caption" id="caption" 
								class="form-control" rows="2" style="resize:none;" 
								required="required" ></textarea>
						</div>
						<div class="row">
						<div class="col-6">
							<select name="category" id="category">
								<c:forEach items="${categories}" var="category">
									<option value="${category.id}"> ${category.description} </option>	
								</c:forEach>
							</select>
						</div>

						<div class="col-6">
							<label for="author">Autore:</label>
							<input name="author" id="author" type="text" 
								class="form-control" required="required" />
						</div>
						</div>
					</div>
					<div class="row">
						<div class="col-12">
							<label for="content">Descrizione:</label>
							<textarea name="content" id="content" 
								class="form-control" rows="4" style="resize:none;" 
								required="required" ></textarea>
						</div>
					</div>
					<div class="row">
						<div class="col-6 text-center">
							<input type="submit" value="Aggiorna Articolo" 
								class="btn btn-primary mt-4">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>