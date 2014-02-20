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
	font-family: "Nanum Gothic", Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
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
	margin: 0 2px;
	border-radius: 4px;
	padding: 15px 15px;
	font-family: "Nanum Gothic", Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
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
	font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
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
	font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
	color: #aaa;
	text-shadow: 1px 1px 1px rgba(255,255,255,0.7);
}

header c{
	font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
	color: #6e6e6e;
	font-weight: bold;
	text-shadow: 1px 1px 1px rgba(255,255,255,0.7);
}


footer {
	font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
	margin : 5px;
	color: #aaa;
	text-shadow: 1px 1px 1px rgba(255,255,255,0.7);
	text-align: center;
}
</style>
</head>
<body>
<div id="wrap_body">
	<header>
		<h1>HCI Project Community Board</h1>
		<p align="justify"><c>Human–computer interaction (HCI)</c> involves the study, planning, design and uses of the interaction between people (users) and computers. 
		It is often regarded as the intersection of computer science, behavioral sciences, design and several other fields of study. 
		The term was popularized by Card, Moran, and Newell in their seminal 1983 book, The Psychology of Human-Computer Interaction, 
		although the authors first used the term in 1980, and the first known use was in 1975. The term connotes that, 
		unlike other tools with only limited uses (such as a hammer, useful for driving nails, but not much else), 
		a computer has many affordances for use and this takes place in an open-ended dialog between the user and the computer.
		Because human–computer interaction studies a human and a machine in conjunction, it draws from supporting knowledge on both the machine and the human side.
		On the machine side, techniques in computer graphics, operating systems, programming languages, and development environments are relevant. 
		On the human side, communication theory, graphic and industrial design disciplines, linguistics, 
		social sciences, cognitive psychology, and human factors such as computer user satisfaction are relevant. 
		Engineering and design methods are also relevant. Due to the multidisciplinary nature of HCI, people with different backgrounds contribute to its success.
		HCI is also sometimes referred to as man–machine interaction (MMI) or computer–human interaction (CHI).
		Attention to human-machine interaction is important because poorly designed human-machine interfaces can lead to many unexpected problems. 
		A classic example of this is the Three Mile Island accident, a nuclear meltdown accident, 
		where investigations concluded that the design of the human–machine interface was at least partially responsible for the disaster.
		Similarly, accidents in aviation have resulted from manufacturers' decisions to use non-standard flight instrument and/or 
		throttle quadrant layouts: even though the new designs were proposed to be superior in regards to basic human–machine interaction, 
		pilots had already ingrained the "standard" layout and thus the conceptually good idea actually had undesirable results.
		</p>
		<section class = "wrapper">
			<a href = "/login_page">Log-in</a>
			<a href = "/signin_page">Sign-in</a>
		</section>
		<p><c:if test="${not empty error}">${error}</c:if></p>
	</header>
</div>
<footer>
		Copyright © 2014 Design by astomusic & onlycesc (HCI Project in NHNNEXT)
</footer>
</body>
</html>