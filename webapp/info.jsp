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
	background: #fff no-repeat 99% 30px;
	position: relative;
	padding: 20px;
	box-shadow: 1px 2px 4px rgba(0,0,0,0.2);
}

a{
	text-shadow: 0px 1px 1px rgba();
	display: inline-block;
	margin: 10px 2px;
	padding: 1px 10px;
	font-family: "Nanum Gothic", Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;;
	font-weight: bold;
	font-size: 15px;
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

.wrapper h3 {
	margin : 0px 0px 10px 0px;
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
	margin: 2px 2px 2px 2px;
	padding: 5px 5px;
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

input[type=text], input[type=password] {
	border: 1px solid #ddd;
	padding: 10px;
	font-weight: bold;
	margin: 5px 10px 15px 20px;
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
<script>
function registerEvents() {
	if (location.search != "") {
		var error = decodeURIComponent(location.search);
		error = error.replace("?error=","");
		error = error.replace("+"," ");
		alert(error);
	}
	
	icnArr = document.getElementsByClassName('name_modify')
	for (i = 0; i < icnArr.length; i++) {
		icnArr[i].addEventListener('click', toggleNewName, false);
	}
	
	icnArr = document.getElementsByClassName('password_modify')
	for (i = 0; i < icnArr.length; i++) {
		icnArr[i].addEventListener('click', toggleNewPassword, false);
	}
	
	icnArr = document.getElementsByClassName('team_modify')
	for (i = 0; i < icnArr.length; i++) {
		icnArr[i].addEventListener('click', toggleNewTeam, false);
	}
}


function toggleNewName(e) {
	// if showing
	if (document.querySelector(".new_name").style.display == "") {
		document.querySelector(".new_name").style.display = "none";
	}
	// if not showing
	else if (document.querySelector(".new_name").style.display == "none") {
		var pw = prompt("비밀번호 재확인","");
		if(pw == ${user.password}) {
			document.querySelector(".new_name").style.display = "";
		} else {
			alert("잘못된 비밀번호 입니다.");
		}
		
	}
}

function toggleNewPassword(e) {
	// if showing
	if (document.querySelector(".new_password").style.display == "") {
		document.querySelector(".new_password").style.display = "none";
	}
	// if not showing
	else if (document.querySelector(".new_password").style.display == "none") {
		var pw = prompt("비밀번호 재확인","");
		if(pw == ${user.password}) {
			document.querySelector(".new_password").style.display = "";
		} else {
			alert("잘못된 비밀번호 입니다.");
		}
		
	}
}

function toggleNewTeam(e) {
	// if showing
	if (document.querySelector(".new_team").style.display == "") {
		document.querySelector(".new_team").style.display = "none";
	}
	// if not showing
	else if (document.querySelector(".new_team").style.display == "none") {
		var pw = prompt("비밀번호 재확인","");
		if(pw == ${user.password}) {
			document.querySelector(".new_team").style.display = "";
		} else {
			alert("잘못된 비밀번호 입니다.");
		}
		
	}
}

window.onload = registerEvents;
</script>
</head>
<body>
<div id=wrap_body>
	<header>
		${user.name}님 환영합니다.
		<a href = "/main/${curSem}">Main</a>
		<a href = "/write">Write</a>
		<a href = "/info">Info</a>
		<c:if test='${user.userid == "admin"}'> 
			<a href = "/admin/${curSem}">Admin</a>
		</c:if>
		<a href = "/logout">Logout</a>
	</header>
	<section class = "wrapper">
		<h3>Account Infomation</h3>
			<a>USERID : ${user.userid}</a><br>
			
			<a>USERNAME : ${user.name}</a>
	 		<button type="button" class="name_modify">MODIFY</button><br>
		 		<div class="new_name" style="display:none">
					<form name="new_name" action="/info/newname"  method="POST">
						<input type="text" name="newname" placeholder="새로운 이름">
						<input type="submit" value="SUBMIT">
						<br>
					</form>
				</div>
				
			<a>TEAM : ${user.user_team.name}</a>
	 		<button type="button" class="team_modify">MODIFY</button><br>
	 			<div class="new_team" style="display:none">
					<form name="new_team" action="/info/newteam"  method="POST">
						<input type="text" name="newteam" placeholder="새로운 팀">
						<input type="submit" value="SUBMIT">
						<br>
					</form>
				</div>
	 		
	 		<a>TEAM MEMBERS :
	 		<c:forEach items="${team}" var="member">
	 			<c:if test="${member.user_team.name == user.user_team.name}">
	 				 ${member.name} 
	 			</c:if>
	 		</c:forEach>
	 		</a><br>
	 		
	 		<a>PASSWAORD : *****</a>
	 		<button type="button" class="password_modify">MODIFY</button>
	 			<div class="new_password" style="display:none">
					<form name="new_password" action="/info/newpassword" method="POST">
						<input type="password" name="newpassword" placeholder="새로운 비밀번호"><br>
						<input type="password" name="newpassword_confirm" placeholder="새로운 비밀번호 확인">
						<input type="submit" value="SUBMIT">
						<br>
					</form>
				</div>
	</section>
</div>
</body>
<footer>
		Copyright © 2014 Design by astomusic & onlycesc (HCI Project in NHNNEXT)
</footer>
</html>
