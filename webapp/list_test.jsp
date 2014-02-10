<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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

.feedback {
	margin-left: auto;
	margin-right: auto;
	margin-bottom: 10px;
	text-indent: 25px;
	border: 1px solid black;
}

.icn_dropdown {
	width:25px;
	margin:3px;
}

.rating {
	width : 200px;
	overflow: hidden;
	display: inline-block;
	text-align: right;
	padding-top : 4px;
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
    background: url('../img/star.png') 0 -16px;
}
      
</style>
<script>
function registerEvents(){
	// add event to icons
	icnArr = document.getElementsByClassName('icn_dropdown')
	for(i=0;i<icnArr.length;i++){
		icnArr[i].addEventListener('click', toggleFile, false);
	}
	// add event for rating
	rating = document.getElementsByClassName('rating')
	for(i=0;i<rating.length;i++){
		rating[i].addEventListener('click', checkrate, false);
	}
}

function toggleFile(e){
	// if showing
	if(document.querySelector("#file_" + e.target.id).style.display == ""){
		document.querySelector("#file_" + e.target.id).style.display = "none";
	}
	// if not showing
	else if(document.querySelector("#file_" + e.target.id).style.display == "none"){
		document.querySelector("#file_" + e.target.id).style.display = "";
	}
}

function checkrate(e) {
	var checked = e.target.id;
	debugger;
	
}

window.onload = registerEvents;
</script>
</head>

<body>
	<div id="wrap_body">
		<h1>HCI 프로젝트 계획서 제목</h1>
		<h2>설명을 적습니다. - NHN NEXT 김민혁</h2>

		<!-- 글의 한 세트 !-->
		<div id="wrap_contents">
			<c:forEach items="${board}" var="board">
				<div class="article" id="article_${board.id}">
					<span id="board_id">${board.id} >></span> ${board.title} <span style="float:right;margin-right:10px;"><img class="icn_dropdown" id="${board.id}" src = "/img/icn_dropdown.png"></span>
					<c:if test="${not empty board.fileName}">
						
						<object id ="file_${board.id}"
							data="/pdf/${board.fileName}"
							type="application/pdf" width="100%" height="600px" style="display:none"></object>
					</c:if>
					<br>
				</div>

				<!--  feedback -->
				<c:forEach items="${comment}" var="comm">
					<c:if test="${comm.board.id == board.id}">
						<div class="feedback">
							${comm.name} : ${comm.contents} 
							<span class="rating">
								<input type="radio" class="rating-input" id="rating-input-1-10-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-1-10-${comm.id}" class="rating-star"></label>
								<input type="radio" class="rating-input" id="rating-input-1-9-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-1-9-${comm.id}" class="rating-star"></label>
								<input type="radio" class="rating-input" id="rating-input-1-8-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-1-8-${comm.id}" class="rating-star"></label>
								<input type="radio" class="rating-input" id="rating-input-1-7-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-1-7-${comm.id}" class="rating-star"></label>
								<input type="radio" class="rating-input" id="rating-input-1-6-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-1-6-${comm.id}" class="rating-star"></label>
						        <input type="radio" class="rating-input" id="rating-input-1-5-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-1-5-${comm.id}" class="rating-star"></label>
						        <input type="radio" class="rating-input" id="rating-input-1-4-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-1-4-${comm.id}" class="rating-star"></label>
						        <input type="radio" class="rating-input" id="rating-input-1-3-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-1-3-${comm.id}" class="rating-star"></label>
						        <input type="radio" class="rating-input" id="rating-input-1-2-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-1-2-${comm.id}" class="rating-star"></label>
						        <input type="radio" class="rating-input" id="rating-input-1-1-${comm.id}" name="rating-input-${comm.id}">
						        <label for="rating-input-1-1-${comm.id}" class="rating-star"></label>
						    </span>
						</div>
					</c:if>
				</c:forEach>
				<br>
			</c:forEach>

		</div>
	</div>
</body>
</html>