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
	width: 1050px;
	background-color: #F3F3F3;
	margin-left: auto;
	margin-right: auto;
	border: 1px dashed black;
}

h1 {
	font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
	font-size: 40px;
	line-height: 40px;
	margin: 0;
	position: relative;
	font-weight: 300;
	color: #498ea5;
	padding: 5px 0px;
	text-shadow: 1px 1px 1px rgba(255,255,255,0.7);
	text-align : center;
}

h2 {
	font-family: "Nanum Gothic", Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
	font-size: 14px;
	font-weight: 300;
	letter-spacing: 2px;
	text-transform: uppercase;
	margin: 0;
	padding: 15px 0 5px 0;
	color: #6190ca;
	text-shadow: 1px 1px 1px rgba(255,255,255,0.7);
	text-align : center;
}

#board_id {
	color: #F15F5F;
}

#wrap_contents {
	width: 950px;
	margin-left: auto;
	margin-right: auto;
}

.article {
/* 	text-indent: 20px;
	font-size: 25px;
	margin-bottom: 10px;
	border: 1px solid black; */
	font-weight: bold;
	font-size: 18px;
	font-family: "Nanum Gothic";
	box-shadow: 0 1px 0 #f5f5f5 inset;
	-webkit-transition: all 0.5s linear;
	-moz-transition: all 0.5s linear;
	-o-transition: all 0.5s linear;
	-ms-transition: all 0.5s linear;
	transition: all 0.5s linear;
	
	padding: 15px 20px 15px 20px;
}

.feedback{
	width: 850px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 5px;
	margin-bottom: 20px;
	font-size: 14px;
	font-family: "Nanum Gothic";
	padding: 10px 10px 5px 30px;
	
	box-shadow: 0 1px 0 #f5f5f5 inset;
	-webkit-transition: all 0.5s linear;
	-moz-transition: all 0.5s linear;
	-o-transition: all 0.5s linear;
	-ms-transition: all 0.5s linear;
	transition: all 0.5s linear;
}

.feedback b{
	color: #6190ca;
}

.comment {
	width: 100px;
	word-break:break-all; 
	word-wrap:break-word;
}

.new_comment{
	width: 650px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 10px;
	margin-bottom: 10px;
}

.icn_dropdown,.icn_comment, .icn_board_delete{
	width: 25px;

	display: inline-block;
	margin-left: 10px;
	cursor: pointer;
	padding: 0px 0px;
	text-align: center;
	font-weight: bold;
	border: 1px solid #A8BC65;
	color: #6d7649;
	border-radius: 4px;
	background: #e4efc0;
	text-shadow: 0px 1px 1px rgba(255,255,255,0.4);
	background: #cae082;
	background: -moz-linear-gradient(top, #cae082 0%, #abbd73 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#cae082), color-stop(100%,#abbd73));
	background: -webkit-linear-gradient(top, #cae082 0%,#abbd73 100%);
	background: -o-linear-gradient(top, #cae082 0%,#abbd73 100%);
	background: -ms-linear-gradient(top, #cae082 0%,#abbd73 100%);
	background: linear-gradient(top, #cae082 0%,#abbd73 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cae082', endColorstr='#abbd73',GradientType=0 );
	box-shadow: 0 1px 2px rgba(0,0,0,0.2);
}

.icn_delete {
}
.rating {
	float: right;
	overflow: hidden;
	display: inline-block;
	text-align: right;
	padding-top : 4px;
	padding-bottom : 1px;
}
.rating-input {
    position: absolute;
    left: 0;
    top: -250px;
}
.rating:hover .rating-star:hover,
.rating:hover .rating-star:hover ~ .rating-star,
.rating-input:checked ~ .rating-star {
    background-position: 0 0;
}
.rating-star,
.rating:hover .rating-star {
    float: right;
    display: block;
    width: 16px;
    height: 16px;
    background: url('/img/star.png') 0 -16px;
}


.wrapper {
	width: 94%;
	max-width: 950px;
	min-width: 280px;
	margin: 10px auto 30px auto;
	background: #fff no-repeat 99% 30px;
	position: relative;
	padding: 20px;
	box-shadow: 1px 2px 4px rgba(0,0,0,0.2);
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
	font-family: "Nanum Gothic", Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;;
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

.new_comment textarea {
	height:200px;
	width:630px;
	border: 1px solid #ddd;
	padding: 10px;
	font-weight: bold;
	text-shadow: 0 1px 1px rgba(255,255,255,0.8);
	color: #666;
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

input[type="submit"], button[type="button"] {
	border: 1px solid #EF9309;
	text-shadow: 0px 1px 1px rgba(255,255,255,0.4);
	color: #724C04;
	display: inline-block;
	border-radius: 4px;
	margin-top: 5px;
	margin-left: 0px;
	margin-bottom: 20px;
	padding: 6px 15px;
	font-family: "Nanum Gothic", Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
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

#gap {
	padding: 35px 0px;
}

footer {
	font-family: Cambria, Palatino, "Palatino Linotype", "Palatino LT STD", Georgia, serif;
	margin : 5px;
	color: #aaa;
	text-shadow: 1px 1px 1px rgba(255,255,255,0.7);
	text-align: center;
}
</style>
<script>
function registerEvents() {
	// add event to icons
	icnArr = document.getElementsByClassName('icn_dropdown')
	for (i = 0; i < icnArr.length; i++) {
		icnArr[i].addEventListener('click', toggleFile, false);
	}

	icnArr = document.getElementsByClassName('icn_comment')
	for (i = 0; i < icnArr.length; i++) {
		icnArr[i].addEventListener('click', toggleNewComment, false);
	}
	
	icnArr = document.getElementsByClassName('icn_board_delete')
	for (i = 0; i < icnArr.length; i++) {
		icnArr[i].addEventListener('click', deleteBoard, false);
	}
	
	icnArr = document.getElementsByClassName('icn_delete')
	for (i = 0; i < icnArr.length; i++) {
		icnArr[i].addEventListener('click', deleteComment, false);
	}
	
	//add event for rating
	rating = document.getElementsByClassName('rating-input')
	for(i=0;i<rating.length;i++){
		rating[i].addEventListener('click', checkrate, false);
	}
	
	markoldrate();
	newline();
}

function markoldrate() {
	oldrate = document.getElementsByClassName('rating')
	for(i=0;i<oldrate.length;i++){
		var old = oldrate[i].title;
		var eachcomment = oldrate[i].getElementsByClassName('rating-input');
		if(old != 0) {
			eachcomment[eachcomment.length-old].checked = true;
		} else if (old == 0) {
			for(j=0;j<10;j++) {
				eachcomment[j].checked = false;
			}
		}
	}
}

function checkrate(e) {
	if("${member.userid}" == "${user.userid}") {
		var checked = e.target.id;
		
		var checkedArray = checked.split('-');
		var commentid = checkedArray[3];
		rate = checkedArray[2];
		var url = "comment/rateupload";
		
		var formdata = new FormData();
		formdata.append('commentid', commentid);
		formdata.append('rate', rate);
		
		var request = new XMLHttpRequest();
		request.open("POST" , url, true);
		request.send(formdata);
	} else {
		alert("권한이 없습니다.");
		markoldrate();
	}
	
}

function deleteBoard(e){
	if("${member.userid}" == "${user.userid}") {
		if (confirm('삭제하시겠습니까?')) {
			var url = "/board/delete/" + e.target.id + "/who/${member.userid}";
			
			var formdata = new FormData();
			var request = new XMLHttpRequest();
			request.open("GET" , url, true);
			request.send(formdata); 
			request.onreadystatechange = function(){
				if(request.readyState == 4 && request.status == 200){			
					document.location.reload(true);
				}
			}
		} else {
		}
	} else {
		alert("권한이 없습니다.");
	}
}

function deleteComment(e){
	userid = e.target.id
	commentid = e.target.name
	if(userid == "${user.userid}") {
		if (confirm('삭제하시겠습니까?')) {
			var url = "/board/list/comment/" + commentid + "/delete";
			var formdata = new FormData();
			var request = new XMLHttpRequest();
			request.open("GET" , url, true);
			request.send(formdata); 
			request.onreadystatechange = function(){
				if(request.readyState == 4 && request.status == 200){			
					document.location.reload(true);
				}
			}
		} else {
		}
	} else {
		alert("권한이 없습니다.");
	}
}


function toggleFile(e) {
	// if showing
	if (document.querySelector("#file_" + e.target.id).style.display == "") {
		document.querySelector("#file_" + e.target.id).style.display = "none";
	}
	// if not showing
	else if (document.querySelector("#file_" + e.target.id).style.display == "none") {
		document.querySelector("#file_" + e.target.id).style.display = "";
	}
}

function toggleNewComment(e) {
	// if showing
	if (document.querySelector("#new_comment_" + e.target.id).style.display == "") {
		document.querySelector("#new_comment_" + e.target.id).style.display = "none";
	}
	// if not showing
	else if (document.querySelector("#new_comment_" + e.target.id).style.display == "none") {
		document.querySelector("#new_comment_" + e.target.id).style.display = "";
	}
}

function newline() {
	var comment = document.querySelectorAll('#comm_content');
	for(i=0; i<comment.length ; i++) {
		var temp = comment[i].innerHTML;
		temp = temp.replace(/\r\n/gi, "<br>")
		temp = temp.replace(/\n/gi, "<br>")
		comment[i].innerHTML = temp
	}
}

	window.onload = registerEvents;
</script>
</head>

<body>
<div id="wrap_body">
	<header>
		${user.name}님 환영합니다.
		<a href = "/main">Main</a>
		<a href = "/write">Write</a>
		<a href = "/info">Info</a>
		<a href = "/logout">Logout</a>
	</header>
	<section class = "wrapper">
		<h1>HCI Project</h1>
		<h2>${member.userid}(${member.name})'s PAGE </h2>
		
		
		<!-- 글의 한 세트 !-->
		<div id="wrap_contents">
			<c:forEach items="${board}" var="board">
				<div class="article" id="article_${board.id}">
					<span id="board_id">${board.id} >></span> ${board.title}
					
	<%-- 				<span style="float:right; margin_right:10px"><a href="/board/delete/${board.id}/who/${member.userid}"><img class="icn_board_delete" id="${board.id}" src="/img/icn_board_delete.png"></a></span>
	 --%>				<span style="float:right; margin_right:10px"><img class="icn_board_delete" id="${board.id}" src="/img/icn_board_delete.png"></span>
					<span style="float:right;"><img class="icn_dropdown" id="${board.id}" src="/img/icn_dropdown.png"></span>
					<span style="float:right;"><img	class="icn_comment" id="${board.id}" src="/img/icn_comment.png"></span>
						

				</div>
				
				<c:if test="${not empty board.fileName}">
						<object id="file_${board.id}" data="/pdf/${board.fileName}"
							type="application/pdf" width="100%" height="600px"
							style="display: none; border:3px solid #ddd;"></object>
				</c:if>
				
				
				<div class="new_comment" id="new_comment_${board.id}" style="display:none">
					<form name="new_comment_form" action="/board/list/comment/${board.id}/upload"  method="POST">
						<textarea name="contents" placeholder="리뷰 입력"></textarea>
						<input type="submit" value="SUBMIT">
						<br>
					</form>
				</div>
				
				<!--  feedback -->
				<c:forEach items="${comment}" var="comm">
					<c:if test="${comm.board.id == board.id}">
						<div class="feedback">
							<span class="comment"><b>${comm.user_comment.name}</b> <a id=comm_content>${comm.contents}</a> 
							<img class="icn_delete" id="${comm.user_comment.userid}" name="${comm.id}" src="/img/icn_delete.png" width="10px"></a>
							</span>
							<span class="rating" id="${board.id}" title="${comm.rating}">
								<input type="radio" class="rating-input" id="rating-input-10-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-10-${comm.id}" class="rating-star"></label>
								<input type="radio" class="rating-input" id="rating-input-9-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-9-${comm.id}" class="rating-star"></label>
								<input type="radio" class="rating-input" id="rating-input-8-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-8-${comm.id}" class="rating-star"></label>
								<input type="radio" class="rating-input" id="rating-input-7-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-7-${comm.id}" class="rating-star"></label>
								<input type="radio" class="rating-input" id="rating-input-6-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-6-${comm.id}" class="rating-star"></label>
						        <input type="radio" class="rating-input" id="rating-input-5-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-5-${comm.id}" class="rating-star"></label>
						        <input type="radio" class="rating-input" id="rating-input-4-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-4-${comm.id}" class="rating-star"></label>
						        <input type="radio" class="rating-input" id="rating-input-3-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-3-${comm.id}" class="rating-star"></label>
						        <input type="radio" class="rating-input" id="rating-input-2-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-2-${comm.id}" class="rating-star"></label>
						        <input type="radio" class="rating-input" id="rating-input-1-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-1-${comm.id}" class="rating-star"></label>
						    </span>	
						    
						</div>
					</c:if>
				</c:forEach>
				<div id="gap"></div>
			</c:forEach>
			
		</div>
		
	</section>
</div>
<footer>
		Copyright © 2014 Design by astomusic & onlycesc (HCI Project in NHNNEXT)
</footer>
</body>
</html>
