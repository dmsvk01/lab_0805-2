<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>		<!-- 이 페이지에서 tag library를 사용하겠다 그중에서 core 부분을 사용하겠다 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Practice</title>
</head>
<body>
	
	<hr>
	<hr>
	
	<h2>Vegetable Information:</h2>  
	<c:set var="vegetables">  
	<vegetables>  
		<vegetable>  
			<name>onion</name>  
			<price>40</price>  
	    	</vegetable>  
	 	<vegetable>  
	      	<name>Potato</name>  
	      	<price>30</price>  
		</vegetable>  
	 	<vegetable>  
	      	<name>Tomato</name>  
	      	<price>90</price>  
	   	</vegetable>  
	</vegetables>  
	</c:set>  
	<x:parse xml="${vegetables}" var="output"/>  
	<x:if select="$output/vegetables/vegetable/price < 100">  
		Vegetables prices are very low.  
	</x:if>  
	
	<hr>
	
<h3>Books Information:</h3>  
  
	<c:set var="xmltext">  
	<books>  
		<book>  
			<name>Three mistakes of my life</name>  
			<author>Chetan Bhagat</author>  
			<price>200</price>  
		</book>  
		<book>  
			<name>Tomorrow land</name>  
			<author>Brad Bird</author>  
			<price>2000</price>  
		</book>  
	</books>  
	</c:set>
	
	<x:parse xml="${xmltext}" var="output"/>  
	<x:choose>  
	   	<x:when select="$output//book/author = 'Chetan bhagat'">  
	      	Book is written by Chetan bhagat  
	   	</x:when>  
	   	<x:when select="$output//book/author = 'Brad Bird'">  
	      	Book is written by Brad Bird  
	   	</x:when>  
	   	<x:otherwise>  
			The author is unknown...  
	   	</x:otherwise>  
	</x:choose>  
	
	<hr>
	
	<h3>Books Information:</h3>  
	<c:set var="book">  
	<books>  
		<book>  
		  	<name>Three mistakes of my life</name>  
			<author>Chetan Bhagat</author>  
			<price>200</price>  
	</book>  
		<book>  
			<name>Tomorrow land</name>  
			<author>Brad Bird</author>  
			<price>2000</price>  
		</book>  
	</books>  
	</c:set>  
	<x:parse xml="${book}" var="output"/>  
	<x:set var="fragment" select="$output/books/book[2]/price"/>  
	<b>The price of the Tomorrow land book</b>:  
	<x:out select="$fragment" /> 
	
	<hr>
	
	<h2>Books Info:</h2>  
	<c:import var="bookInfo" url="novels.xml"/>  
	  
	<x:parse xml="${bookInfo}" var="output"/>  
	<p>First Book title: <x:out select="$output/books/book[1]/name" /></p>  
	<p>First Book price: <x:out select="$output/books/book[1]/price" /></p>  
	<p>Second Book title: <x:out select="$output/books/book[2]/name" /></p>  
	<p>Second Book price: <x:out select="$output/books/book[2]/price" /></p>  
	
	<hr>
	
	<h2>Vegetable Information:</h2>  
	<c:set var="vegetable">  
		<vegetables>  
			<vegetable>  
			   	<name>onion</name>  
			    <price>40/kg</price>  
			</vegetable>  
			<vegetable>  
				<name>Potato</name>  
			    <price>30/kg</price>  
			</vegetable>  
			<vegetable>  
				<name>Tomato</name>  
				<price>90/kg</price>  
			</vegetable>  
		</vegetables>  
	</c:set>  
	<x:parse xml="${vegetable}" var="output"/>  
	<b>Name of the vegetable is</b>:  
	<x:out select="$output/vegetables/vegetable[1]/name" /><br>  
	<b>Price of the Potato is</b>:  
	<x:out select="$output/vegetables/vegetable[2]/price" />
	
	<hr>
	<hr>
	
	<h2>Different Formats of the Date</h2>  
	<c:set var="Date" value="<%=new java.util.Date()%>" />  
	<p>  
		Formatted Time :  
		<fmt:formatDate type="time" value="${Date}" />  
	</p>  
	<p>  
		Formatted Date :  
		<fmt:formatDate type="date" value="${Date}" />  
	</p>  
	<p>
		Formatted Date and Time :  
		<fmt:formatDate type="both" value="${Date}" />  
	</p>  
	<p>  
		Formatted Date and Time in short style :  
		<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${Date}" />  
	</p>  
	<p>  
		Formatted Date and Time in medium style :  
		<fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" value="${Date}" />  
	</p>  
	<p>  
		Formatted Date and Time in long style :  
		<fmt:formatDate type="both" dateStyle="long" timeStyle="long" value="${Date}" />  
	</p>
	
	<hr>
	
	<fmt:setBundle basename="com.javatpoint.Main" var="lang"/>
	<fmt:message key="vegetable.Potato" bundle="${lang}"/><br/>
	<fmt:message key="vegetable.Tomato" bundle="${lang}"/><br/> 
	<fmt:message key="vegetable.Carrot" bundle="${lang}"/><br/>

	<hr>
	
	<c:set var="date" value="<%=new java.util.Date()%>" />  
	<p><b>Date and Time in Korean Standard Time(KST) Zone:</b> <fmt:formatDate value="${date}"  
	             type="both" timeStyle="long" dateStyle="long" />
	</p>  
	<fmt:setTimeZone value="GMT-10" />  
	<p><b>Date and Time in GMT-10 time Zone: </b><fmt:formatDate value="${date}"  
	             type="both" timeStyle="long" dateStyle="long" />
	</p>
	
	<hr>
	
	<fmt:bundle basename="com.javatpoint.Simple" prefix="colour.">  
	  <fmt:message key="Violet"/><br/>  
	  <fmt:message key="Indigo"/><br/>  
		<fmt:message key="Blue"/><br/>    
	</fmt:bundle>
	
	<hr>
	
	<h3>Parsed Date:</h3>  
	<c:set var="date" value="12-08-2016" />  
	  
	<fmt:parseDate value="${date}" var="parsedDate"  pattern="dd-MM-yyyy" />  
	<p><c:out value="${parsedDate}" /></p>  
	
	<hr>
	
	<h3>Formatting of Number:</h3>  
	<c:set var="Amount" value="9850.14115" />  
	<p> Formatted Number-1:  
		<fmt:formatNumber value="${Amount}" type="currency" />
	</p>  
	<p>Formatted Number-2:  
		<fmt:formatNumber type="number" groupingUsed="true" value="${Amount}" />
	</p>  
	<p>Formatted Number-3:  
		<fmt:formatNumber type="number" maxIntegerDigits="3" value="${Amount}" />
	</p>  
	<p>Formatted Number-4:  
		<fmt:formatNumber type="number" maxFractionDigits="6" value="${Amount}" />
	</p>  
	<p>Formatted Number-5:  
		<fmt:formatNumber type="percent" maxIntegerDigits="4" value="${Amount}" />
	</p>  
	<p>Formatted Number-6:
		<fmt:formatNumber type="number" pattern="###.###$" value="${Amount}" />
	</p>  
	
	<hr>
	
	<c:set var="str" value="<%=new java.util.Date()%>" />  
    <table border="2" width="100%">  
      	<tr>  
        	<td width="100%" colspan="2" bgcolor="#FF7F50">  
	          	<p align="center">  
		            <b>  
		              <font color="#000000" size="6">Formatting:  
			              <fmt:formatDate value="${str}" type="both"  
			              timeStyle="long" dateStyle="long" />  
		              </font>  
		         	</b>  
	          	</p>
        	</td>  
      	</tr>  
  
      	<c:forEach var="zone" items="<%=java.util.TimeZone.getAvailableIDs()%>">  
	       	<tr>
	       	<td width="50%"  bgcolor="#C0C0C0">  
	          	<c:out value="${zone}" />  
	      	</td>  
	        <td width="50%" bgcolor="#FFEBCD">  
	          	<fmt:timeZone value="${zone}">  
	           	<fmt:formatDate value="${str}" timeZone="${zn}" type="both"/></fmt:timeZone>
	      	</td>  
	        </tr>  
      	</c:forEach>  
    </table>  
	
	<hr>
	
	<h3>The fmt:parseNumber tag Example is:</h3>  
	<c:set var="Amount" value="786.970" />

    <fmt:parseNumber var="j" type="number" value="${Amount}" />  
    <p><i>Amount is:</i>  <c:out value="${j}" /></p>  
  
    <fmt:parseNumber var="j" integerOnly="true" type="number" value="${Amount}" />  
    <p><i>Amount is:</i>  <c:out value="${j}" /></p>  
	
	<hr>
	<hr>
	
	<c:set var="author" value="Ramesh Kumar"/>  
	<c:set var="string" value="pqr xyz abc PQR"/>  
	${fn:replace(author, "Ramesh", "Suresh")}  
	${fn:replace(string, "pqr", "hello")}  
	
	<hr>
	
	<c:set var="str1" value="This is first string"/>  
	<c:set var="str2" value="Hello"/>  
	Length of the String-1 is: ${fn:length(str1)}<br>  
	Length of the String-2 is: ${fn:length(str2)}

	<hr>
	
	<c:set var="string" value="Hi, This is JAVATPOINT.COM developed by SONOO JAISWAL."/>  
	${fn:substringBefore(string, "developed")}  

	<hr>
	
	<c:set var="string" value="Nakul Jain"/>  
	${fn:substringAfter(string, "Nakul")}
	
	<hr>
	
	<c:set var="string" value="This is the first string."/>  
	${fn:substring(string, 5, 17)}  
	
	<hr>
	
	 <c:set var="site" value="javatpoint.com"/>  
	 <c:set var="author" value="Sonoo Jaiswal"/>  
	 Hi, This is ${fn:toUpperCase(site)} developed by ${fn:toUpperCase(author)}. 
	
	<hr>
	
	<c:set var="string" value="Welcome to JSP Programming"/>  
	${fn:toLowerCase("HELLO,")}  
	${fn:toLowerCase(string)}  

	<hr>
	
	<c:set var="str1" value="Welcome-to-JSP-Programming."/>  
	<c:set var="str2" value="${fn:split(str1, '-')}" />  
	<c:set var="str3" value="${fn:join(str2, ' ')}" />  
	  
	<p>String-3 : ${str3}</p>  
	<c:set var="str4" value="${fn:split(str3, ' ')}" />  
	<c:set var="str5" value="${fn:join(str4, '-')}" />  
	  
	<p>String-5 : ${str5}</p>  
	
	<hr>
	
	<c:set var="msg" value="The Example of JSTL fn:startsWith() Function"/>  
	The string starts with "The": ${fn:startsWith(msg, 'The')}  
	<br>The string starts with "Example": ${fn:startsWith(msg, 'Example')}  
	
	<hr>
	
	<c:set var="str1" value="Welcome to JSP        programming         "/>  
	<p>String-1 Length is : ${fn:length(str1)}</p>  
	  
	<c:set var="str2" value="${fn:trim(str1)}" />  
	<p>String-2 Length is : ${fn:length(str2)}</p>  
	<p>Final value of string is : ${str2}</p>
	
	<hr>
	
	<c:set var="string1" value="It is first String."/>  
	<c:set var="string2" value="It is <xyz>second String.</xyz>"/>  
	  
	<p>Index-1 : ${fn:indexOf(string1, "first")}</p>  
	<p>Index-2 : ${fn:indexOf(string2, "second")}</p>  

	<hr>
	
	<c:set var="string1" value="It is first String."/>  
	<c:set var="string2" value="It is <xyz>second String.</xyz>"/>  
	  
	<p>With escapeXml() Function:</p>  
	<p>string-1 : ${fn:escapeXml(string1)}</p>  
	<p>string-2 : ${fn:escapeXml(string2)}</p>  
	  
	<p>Without escapeXml() Function:</p>  
	<p>string-1 : ${string1}</p>  
	<p>string-2 : ${string2}</p>  
	
	<hr>
	
	<c:set var="String" value="Welcome to JSP programming"/>  
	  
	<c:if test="${fn:endsWith(String, 'programming')}">  
	   <p>String ends with programming<p>  
	</c:if>  
	  
	<c:if test="${fn:endsWith(String, 'JSP')}">  
	   <p>String ends with JSP<p>  
	</c:if>  
	
	<hr>
	
	<c:set var="String" value="Welcome to javatpoint"/>  
	  
	<c:if test="${fn:containsIgnoreCase(String, 'javatpoint')}">  
	   <p>Found javatpoint string<p>  
	</c:if>  
	  
	<c:if test="${fn:containsIgnoreCase(String, 'JAVATPOINT')}">  
	   <p>Found JAVATPOINT string<p>  
	</c:if> 
	
	<hr>
	
	<c:set var="String" value="Welcome to javatpoint"/>  
  
	<c:if test="${fn:contains(String, 'javatpoint')}">  
	   <p>Found javatpoint string<p>  
	</c:if>  
	  
	<c:if test="${fn:contains(String, 'JAVATPOINT')}">  
	   <p>Found JAVATPOINT string<p>  
	</c:if>  
	
	<hr>
	<hr>
	
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