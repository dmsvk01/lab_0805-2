<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@page import="lab2.UserDao"%>
	<jsp:useBean id="u" class="lab2.User"></jsp:useBean>
	<jsp:setProperty property="*" name="u" />

	<%
		int i = UserDao.save(u);
		if (i > 0) {
			response.sendRedirect("adduser-success.jsp");
		}
		else {
			response.sendRedirect("adduser-error.jsp");
		}
	%>

</body>
</html>