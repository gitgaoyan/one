<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>流程控制的标签</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
 <c:if test="true">
 如果条件为true，则输出结果
 </c:if>
  <c:if test="false">
 如果条件为false，则不输出结果
 </c:if>
 <c:if test="${4>3}" var="flag" scope="request">
 4>3
 </c:if>
 <c:out value="${flag}"/>
 <h1>choose标签的使用</h1>
 <c:choose>
 <c:when test="${param.condition1=='true'}">
 condition1=true
 </c:when>
  <c:when test="${param.condition2=='false'}">
 condition2=false
 </c:when>
 <c:otherwise>
 otherwise语句执行
 </c:otherwise>
 </c:choose>
	  
<h1>out标签的使用</h1>
  <%
  request.setAttribute("username", "zhangsan");
   %>
    <c:out value="${3+4}"></c:out><br/>
    <c:out value="${requestScope.username}"></c:out>
     <c:out value="${param.username}" default="lisi"></c:out>
    <h1>set标签的使用</h1>
    <c:set value="${requestScope.username}" var="username"/>
    <c:out value="${pageScope.username}"/>
    <c:set value="${requestScope.username}" var="username1" scope="request"/>
   使用remove标签 移除前：
    <c:out value="${requestScope.username1}"/><br/>
    <c:remove var="username1"/>
       使用remove标签 移除后：
    <c:out value="${requestScope.username1}"/><br/>
    <%
    User user=new User();
    request.setAttribute("user", user);
     %>
    <c:set target="${user}" property="userName" value="wangwu"/>
    <c:out value="${requestScope.user.userName}"/><br>
      <h1>catch标签的使用</h1>
      <c:catch var="error">
      <% int i=9/0;
      System.out.println("以下代码不会被执行！");
      %>
      </c:catch>
      <c:out value="${error}"/><br>	  
	  
	  
 
  </body>
</html>
