<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

.article {
	text-indent: 20px;
	font-size: 25px;
	margin-bottom: 10px;
	border: 1px solid black;
}


.feedback{
	width: 650px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 10px;
	text-indent: 25px;
	border: 1px solid black;
}


.new_comment{
	width: 650px;
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 10px;
}

.icn_dropdown,.icn_comment{
	width: 25px;
	margin: 3px;
}

.rating {
	width : 200px;
	overflow: hidden;
	display: inline-block;
	text-align: right;
	padding-top : 4px;
	padding-bottom : 1px;
}
.rating-input {
    position: absolute;
    left: 0;
    top: -50px;
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
	
	//add event for rating
	rating = document.getElementsByClassName('rating-input')
	for(i=0;i<rating.length;i++){
		rating[i].addEventListener('click', checkrate, false);
	}
	
	markoldrate();
}

function markoldrate() {
	oldrate = document.getElementsByClassName('rating')
	for(i=0;i<oldrate.length;i++){
		var old = oldrate[i].title;
		var eachcomment = oldrate[i].getElementsByClassName('rating-input');
		if(old != 0) {
			eachcomment[eachcomment.length-old].checked = true;
		}
	}
}

function checkrate(e) {
	var checked = e.target.id;
	
	var checkedArray = checked.split('-');
	var commentid = checkedArray[3];
	var rate = checkedArray[2];
	var url = "comment/rateupload";
	
	var formdata = new FormData();
	formdata.append('commentid', commentid);
	formdata.append('rate', rate);
	
	var request = new XMLHttpRequest();
	request.open("POST" , url, true);
	request.send(formdata);
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


/* function fncEnCode(param)
{
var encode = '';

for(i=0; i<param.length; i++)
{
var len  = ''+param.charCodeAt(i);
var token = '' + len.length;
encode  += token + param.charCodeAt(i);
}

return encode;
}

function fncSubmit(num)
{
	var fm = document.getElementById('new_comment_' + num).children[0];
	var raw = fm.contents.value;
	debugger;
    raw = fncEnCode(raw);
    console.log(raw);
    fm.submit();
} */
	window.onload = registerEvents;
</script>
</head>

<body>
	<div id="wrap_body">
		<h1>HCI 프로젝트 계획서 제목</h1>
		<h2>설명을 적습니다. - NHN NEXT  ${member.name} </h2>
		<a href = "/write">go to write</a><br>
		<a href = "/main">go to main</a><br>
		<!-- 글의 한 세트 !-->
		<div id="wrap_contents">
			<c:forEach items="${board}" var="board">
				<div class="article" id="article_${board.id}">
					<span id="board_id">${board.id} >></span> ${board.title}
					
					<span style="float:right; margin-right: 10px;">
						<img class="icn_dropdown" id="${board.id}" src="/img/icn_dropdown.png"></span>
						<span style="float:right;"><img	class="icn_comment" id="${board.id}" src="/img/icn_comment.png"></span>
					
					<c:if test="${not empty board.fileName}">

						<object id="file_${board.id}" data="/pdf/${board.fileName}"
							type="application/pdf" width="100%" height="600px"
							style="display: none"></object>
					</c:if>
					<br>
				</div>
				
				<div class="new_comment" id="new_comment_${board.id}" style="display:none">
					<form name="new_comment_form" action="/board/list/comment/${board.id}/upload"  method="POST">
						<textarea name="contents" style="width:600px" placeholder="리뷰 입력"></textarea>
						<input type="submit" value="등록">
						<br>
					</form>
				</div>
				
				<!--  feedback -->
				<c:forEach items="${comment}" var="comm">
					<c:if test="${comm.board.id == board.id}">
						<div class="feedback">
							${comm.user_comment.name} : ${comm.contents} 
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
								<a href="/board/list/comment/${comm.id}/delete"><img class="icn_delete" id="${board.id}" 
								src="/img/icn_delete.png" width="15px"></a></span>
						</div>
					</c:if>
				</c:forEach>
				<br>
			</c:forEach>

		</div>
	</div>
</body>
</html>
