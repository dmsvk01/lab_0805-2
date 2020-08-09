<%@page import="lab2.UserDao"%>
<jsp:useBean id="u" class="lab2.User"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
<%
	UserDao.delete(u);
response.sendRedirect("viewusers.jsp");
%>
