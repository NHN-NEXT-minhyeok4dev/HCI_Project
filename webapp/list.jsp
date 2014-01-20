<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<c:forEach items="${boards}" var="board"> ${board.title}<br />
		<c:if test="${not empty board.fileName}"><img src="/images/${board.fileName }"></c:if>
		
			<hr />
		</c:forEach>
		
		<br>
		
		<a href = "/board/form"><button>uploaod</button></a>
	 </div>
</body>
</html>