<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/img/nhnnext_favicon.ico" />
<title>HCI Project</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	background-color: #EAEAEA;
	font-weight: 400;
	font-size: 15px;
	font-family: "Nanum Gothic";
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

.wrapper {
	width: 94%;
	max-width: 700px;
	min-width: 280px;
	margin: 30px auto 30px auto;
	background: #fff url(../img/try.jpg) no-repeat 99% 30px;
	position: relative;
	padding: 20px;
	box-shadow: 1px 2px 4px rgba(0,0,0,0.2);
}

a{
    border: 1px solid #EF9309;
	text-shadow: 0px 1px 1px rgba();
	display: inline-block;
	margin: 4px 2px;
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

header a{
    border: 1px solid #EF9309;
	text-shadow: 0px 1px 1px rgba();
	color: #fff;
	display: inline-block;
	margin: 0 0;
	border-radius: 4px;
	padding: 2px 5px;
	font-family: "Nanum Gothic", Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
	font-weight: bold;
	font-size: 13px;
	background: #ffaf4b;
	background: -moz-linear-gradient(top, #ffaf4b 0%, #ff920a 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffaf4b), color-stop(100%,#ff920a));
	background: -webkit-linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	background: -o-linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	background: -ms-linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	background: linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffaf4b', endColorstr='#ff920a',GradientType=0 );
	box-shadow: 0px 1px 2px rgba(0,0,0,0.2);
	text-decoration: none;
}

footer {
	font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
	font-size: 15px;
	font-weight: normal;
	-webkit-font-smoothing: antialiased;
	margin : 5px;
	color: #aaa;
	text-shadow: 1px 1px 1px rgba(255,255,255,0.7);
	text-align: center;
}

</style>
</head>
<body>
<div id=wrap_body>
	<header>
		${user.name}님 환영합니다.
		<a href = "/main">Main</a>
		<a href = "/write">Write</a>
		<a href = "/info">Info</a>
		<a href = "/logout">Logout</a>
	</header>
	<section class = "wrapper">
		<c:forEach items="${team}" var="team">
			<a href = "/board/list/${team.name}">${team.name} TEAM's page</a>
		</c:forEach>
	</section>
</div>
</body>
<footer>
		Copyright © 2014 Design by astomusic & onlycesc (HCI Project in NHNNEXT)
</footer>
</html>