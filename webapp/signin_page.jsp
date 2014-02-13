<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HCI Project List Page (Test)</title>
<style>
body {
	background-color: #EAEAEA;
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

.wrapper h3 {
	margin: 0px;
	color: #444;
	padding: 10px;
}

.buttons {
	margin-left: -10px;
}
	
input[type="submit"], button[type="button"] {
	border: 1px solid #EF9309;
	text-shadow: 0px 1px 1px rgba(255,255,255,0.4);
	color: #724C04;
	display: inline-block;
	border-radius: 4px;
	margin-top: 10px;
	margin-left: 10px;
	padding: 6px 15px;
	font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
	font-weight: bold;
	background: #ffaf4b;
	background: -moz-linear-gradient(top, #ffaf4b 0%, #ff920a 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffaf4b), color-stop(100%,#ff920a));
	background: -webkit-linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	background: -o-linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	background: -ms-linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	background: linear-gradient(top, #ffaf4b 0%,#ff920a 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffaf4b', endColorstr='#ff920a',GradientType=0 );
	box-shadow: 0px 1px 2px rgba(0,0,0,0.2);
}
input[type="submit"]:active, button[type="button"]:active {
	box-shadow: 0px 1px 2px rgba(255,255,255,0.5);
	background: #ffaf4b;
}

#request input[type=text],
#request input[type=password] {
	border: 1px solid #ddd;
	padding: 10px;
	font-weight: bold;
	text-shadow: 0 1px 1px rgba(255,255,255,0.8);
	color: #666;
	width: 33%;
	background: #ffffff;
	background: -moz-linear-gradient(top, #ffffff 0%, #f7f7f7 7%, #f7f7f7 22%, #ffffff 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(7%,#f7f7f7), color-stop(22%,#f7f7f7), color-stop(100%,#ffffff));
	background: -webkit-linear-gradient(top, #ffffff 0%,#f7f7f7 7%,#f7f7f7 22%,#ffffff 100%);
	background: -o-linear-gradient(top, #ffffff 0%,#f7f7f7 7%,#f7f7f7 22%,#ffffff 100%);
	background: -ms-linear-gradient(top, #ffffff 0%,#f7f7f7 7%,#f7f7f7 22%,#ffffff 100%);
	background: linear-gradient(top, #ffffff 0%,#f7f7f7 7%,#f7f7f7 22%,#ffffff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#ffffff',GradientType=0 );
	box-shadow: 0px 1px 1px rgba(255,255,255,0.7), 1px 1px 2px rgba(0,0,0,0.1) inset;
}
</style>
</head>
<body>
<div id="wrap_body">
	<section class = "wrapper">
		<h3>New Member</h3>
		<div id="request">
		 	<form action="/signin" method="POST" enctype="multipart/form-data">
		 	<input type="text" id="name" name="name" size="45" placeholder="name"><br>
		 	<input type="text" id="userid" name="userid" size="45" placeholder="user id"><br>
		 	<input type="password" id="password" name="password" size="45" placeholder="password"><br>
		 	<input type="password" id="confirm" name="confirm" size="45" placeholder="password for confirmation"><br>
		 	<div class=buttons>
		 		<input type="submit" value="SUBMIT">
		 		<button type="button" name="cancel" onclick="location.href='/'">CANCEL</button>
		 	</div>
		 	</form>
		</div>
	</section>
</div>
</body>
</html>