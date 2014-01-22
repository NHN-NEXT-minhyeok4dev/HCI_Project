<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div id="wrap">
		<div id="new_post">
			<form action="/board" method="POST" enctype="multipart/form-data">
				<input type="text" name="title" size="45" placeholder="제목을 입력하세요"><br>
				<textarea name="contents" rows="10" cols="40" placeholder="내용을 입력하세요"></textarea><br>
				<input type="file" name="file" size ="20" accept="image/*" value="파일"><br>
				<input type="submit" value="제출">
				<button type="button" name="cancel" onclick="location.href='/'">취소</button>
			</form>
		</div>
		<br><br>
		<a href = "/board/list">go to list</a>
	</div>
</body>
</html>