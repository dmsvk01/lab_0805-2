<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 이 페이지에서 tag library를 사용하겠다 그중에서 core 부분을 사용하겠다 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Practice</title>
</head>
<body>

	Hello!
	<c:out value="${'안녕하세요' }"></c:out>
	<c:out value="안녕하세요"></c:out>
	<br>

	<hr>
	
	<br>
	<c:import var="data" url="https://www.javatpoint.com/" />
	<c:out value="${data}" />
	<br>
	
	<hr>
	
	<br>
	<c:set var="Income" scope="session" value="${4000*4}"/>  
	<c:out value="${Income}"/>
	
	<hr>
	
	<c:set var="income" scope="session" value="${4000*4}"/>  
	<p>Before Remove Value is: <c:out value="${income}"/></p>  
	<c:remove var="income"/>  
	<p>After Remove Value is: <c:out value="${income}"/></p>  
	
	<hr>
	
	<c:catch var ="catchtheException">  
	   <% int x = 2/0;%>  
	</c:catch>  
	  
	<c:if test = "${catchtheException != null}">  
	   <p>The type of exception is : ${catchtheException} <br />  
	   There is an exception: ${catchtheException.message}</p>  
	</c:if>  
	
	<hr>
	
	<c:set var="income" scope="session" value="${4000*4}"/>  
	<c:if test="${income > 8000}">  
	   <p>My income is: <c:out value="${income}"/><p>  
	</c:if>  
	
	<hr>
	
	<c:set var="income" scope="session" value="${4000*4}"/>  
	<p>Your income is : <c:out value="${income}"/></p>  
	<c:choose>  
	    <c:when test="${income <= 1000}">  
	       Income is not good.  
	    </c:when>  
	    <c:when test="${income > 10000}">  
	        Income is very good.  
	    </c:when>  
	    <c:otherwise>  
	       Income is undetermined...  
	    </c:otherwise>  
	</c:choose> 
	
	<hr>
	
	<c:set value='10' var='num'></c:set>
	<c:choose>
		<c:when test="${num%2==0 }">
			<c:out value="${num } is an even number"></c:out>
		</c:when>
		<c:otherwise>
			<c:out value="${num } is an odd number"></c:out>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<c:forEach var="j" begin="1" end="3">  
	   <p>Item <c:out value="${j}"/></p>  
	</c:forEach>  
	
	<hr>
	
	<c:forTokens items="Rahul-Nakul-Rajesh" delims="-" var="name">  
	   <c:out value="${name}"/><p>  
	</c:forTokens>
	
	<hr>
	
	<c:url var="completeURL" value="/index1.jsp">
		<c:param name="trackingId" value="786"/>  
		<c:param name="user" value="Nakul"/>
	</c:url>
	${completeURL}
	
	<hr>
	
	<%-- 
	<c:set var="url" value="0" scope="request"/>  
 	<c:if test="${url<1}">  
    	<c:redirect url="http://javatpoint.com"/>  
  	</c:if>  
  	<c:if test="${url>1}">  
    	<c:redirect url="http://facebook.com"/>  
  	</c:if>  
	 --%>
	
	<hr>
	
	<c:url value="/RegisterDao.jsp"/>  
	

</body>
</html>