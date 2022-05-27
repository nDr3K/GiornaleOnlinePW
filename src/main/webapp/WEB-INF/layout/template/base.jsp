<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="it" class="h-100">
    <head>
    <meta charset="UTF-8">
    <title><tiles:insertAttribute name="title"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="static/image/sparviero.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
	<link rel="stylesheet" href="<spring:theme code='styleSheet'/>">
    </head>
    <body class="d-flex flex-column h-100">
    
    	<div class="container mw-100">
    		<tiles:insertAttribute name="header"/>
   		</div>
   		<tiles:insertAttribute name="content"/>        
        <tiles:insertAttribute name="footer"/>
    </body>
</html>