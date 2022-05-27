<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="form-body">
	<div class="row">
		<div class="form-holder ">
			<div class="form-content">
				<div class="form-items">
					<h3>${mode ? 'Crea Categoria' : 'Modifica Categoria'}</h3>
					<p></p>
					<form:form method="POST" modelAttribute="category" acceptCharset="ISO-8859-1">
						<div class="row justify-content-center">
							<div class="col-md-12">
								<form:hidden path="id" />
								<label for="description">Nome Categoria</label>
								<form:input path="description" id="description" type="text" cssClass="form-control" required="required" />
								<form:errors path="description" id="descriptionError" cssClass="text-danger" />
							</div>
						</div>
						<div class="form-button mt-3  d-flex justify-content-center">
							<input type="submit" value='${mode ? "Aggiungi Categoria" : "Modifica Categoria"}' class="btn btn-main mt-4">
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>
