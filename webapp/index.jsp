<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HCI_Project</title>
<style>
body {
	background-color: #EAEAEA;
	font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
	font-weight: 400;
	font-size: 15px;
	color: #333;
	-webkit-font-smoothing: antialiased;
	-moz-font-smoothing: antialiased;
	font-smoothing: antialiased;
}

#wrap_body {
	width: 800px;
	background-color: #F3F3F3;
	margin-left: auto;
	margin-right: auto;
	border: 1px dashed black;
}

h1,h2 {
	text-align: center;
}

#board_id {
	color: #F15F5F;
}

#wrap_contents {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
}

a{
    border: 1px solid #EF9309;
	text-shadow: 0px 1px 1px rgba();
	display: inline-block;
	margin: 0 2px;
	border-radius: 4px;
	padding: 15px 15px;
	font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;;
	font-weight: bold;
	font-size: 15px;
	background: #ffaf4b;
	background: -moz-linear-gradient(top, #ffaf4b 0%, #ff920a 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffaf4b), color-stop(100%,#ff920a));
	background: -webkit-linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	background: -o-linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	background: -ms-linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	background: linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffaf4b', endColorstr='#ff920a',GradientType=0 );
	box-shadow: 0px 1px 2px rgba(0,0,0,0.2);
	color: #555;
	text-decoration: none;
}

header{
	margin: 10px;
	padding: 20px 10px 10px 10px;
	position: relative;
	display: block;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
    text-align: center;
}

header h1{
	font-size: 40px;
	line-height: 40px;
	margin: 0;
	position: relative;
	font-weight: 300;
	color: #498ea5;
	padding: 5px 0px;
	text-shadow: 1px 1px 1px rgba(255,255,255,0.7);
}

header p{
	font-style: italic;
	color: #aaa;
	text-shadow: 1px 1px 1px rgba(255,255,255,0.7);
}
</style>
</head>
<body>
<div id="wrap_body">
	<header>
		<h1>HCI Board</h1>
		<a href = "/login_page">Log-in</a>
		<a href = "/signin_page">Sign-in</a>
		
		<p><c:if test="${not empty error}">${error}</c:if></p>
	</header>
	
	
		
</div>
</body>
</html>