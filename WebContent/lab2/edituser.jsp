<%@page import="lab2.UserDao"%>
<jsp:useBean id="u" class="lab2.User"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
<%
	int i = UserDao.update(u);
response.sendRedirect("viewusers.jsp");
%>
