<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="./img/nhnnext_favicon.ico">
<link rel="stylesheet" type="text/css" href="./stylesheets/style.css">
<link rel="stylesheet" type="text/css" href="./stylesheets/reset.css">
<title>HCI_Project</title>
</head>
<body>
	<c:if test="${not empty error}">
		${error}
	</c:if>
	<div>
		<a href = "/main">go to main</a><br>
		<a href = "/login_page">go to login</a><br>
		<a href = "/signin_page">go to signin</a><br>
	</div>
</body>
</html>