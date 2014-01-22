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

#wrap_contents {
	width: 700px;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid black;
}

#feedback,#feedback_needs {
	width: 600px;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid black;
}

#feedback_needs {
	background-color: #FFFFE4;
}
</style>
</head>

<body>
	<div id="wrap_body">
		<h1>HCI ������Ʈ ��ȹ�� ����</h1>
		<h2>������ �����ϴ�. - NHN NEXT �����</h2>
		<hr>

		<!-- ���� �� ��Ʈ !-->
		<div id="wrap_contents">

			<!-- #1  |  ������ ����  | PDF -->
			<c:forEach items="${board}" var="board"> ${board.title}<br />
				<div id="article">
					board.title => ${board.title }
					<c:if test="${not empty board.fileName}"> ${board.fileName }
					</c:if>

					<hr />
				</div>
			</c:forEach>
			
			<br>
			<br>



			<!-- 
            <div id = "feedback">
                ��> �ǵ�� | �ǵ�� ����
                <br><br>
            </div>
            <div id = "feedback_needs">
                ��> �ǵ�� | �ǵ�� ���� �߰� �ʿ�
                <br><br>
            </div>
        </div>
        <hr> -->
			<!----------------->

		</div>
</body>
</html>