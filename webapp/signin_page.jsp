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
</style>
</head>
<body>
<div id="wrap_body">
	<header>
		<h1>New Member</h1>
	</header>
	<div id="request">
	 	<form action="/signin" method="POST" enctype="multipart/form-data">
	 	<input type="text" id="name" name="name" size="45" placeholder="name"><br>
	 	<input type="text" id="userid" name="userid" size="45" placeholder="user id"><br>
	 	<input type="password" id="password" name="password" size="45" placeholder="password"><br>
	 	<div class=buttons>
	 		<input type="submit" value="제출">
	 		<button type="button" name="cancel" onclick="location.href='/'">취소</button>
	 	</div>
	 	</form>
	</div>
</div>
</body>
</html>