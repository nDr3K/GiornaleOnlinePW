<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="it" class="h-100">
    <head>
    <meta charset="UTF-8">
    <title><tiles:insertAttribute name="title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
   	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
    </head>
    <body class="d-flex flex-column h-100">
    
    	<div class="container">
    		<tiles:insertAttribute name="header"/>
        	<tiles:insertAttribute name="content"/>
        </div>        
        <tiles:insertAttribute name="footer"/>
    </body>
</html>