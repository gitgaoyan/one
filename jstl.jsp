<%@ page language="java" import="java.util.*,com.inspur.entity.User" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>迭代标签forEach</title>
    
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
<%
String strArray[]={"111","222","333","444"};
request.setAttribute("strArray", strArray);

List namesList=new ArrayList();
namesList.add("zhangsan");
namesList.add("lisi");
namesList.add("wangwu");
request.setAttribute("namesList", namesList);

Map map=new HashMap();
map.put("zhangsan", "1000");
map.put("lisi", "5000");
request.setAttribute("map", map);

List userList=new ArrayList();
User user=new User();
user.setUserId(1);
user.setUserName("alice");
userList.add(user);
User user2=new User();
user2.setUserId(2);
user2.setUserName("jack");
userList.add(user2);
request.setAttribute("userList", userList);
 %>
  <h1>forEach标签  遍历strArray</h1>
 <c:forEach items="${strArray}" var="i" begin="0" end="3" step="2">
 <c:out value="${i}"/><br/>
 </c:forEach>
  <h1>forEach标签  遍历strArray</h1>
  <c:forEach items="${strArray}" var="element" varStatus="status">
 <c:out value="${element}"/>
  <c:out value="${status.index}"/>//从0开始
  <c:out value="${status.count}"/>//从1开始
  <c:out value="${status.first}"/>//是不是第一个，返回Boolean
  <c:out value="${status.last}"/><br/>//是不是最后一个，返回boolean
 </c:forEach>
 <h1>forEach标签  遍历list</h1>
 <c:forEach items="${namesList}" var="element">
  <c:out value="${element}"/>
 </c:forEach>
  <h1>forEach标签  遍历Map</h1>
 <c:forEach items="${map}" var="element">
  <c:out value="${element.key}"/>&nbsp;
  <c:out value="${element.value}"/><br/>
 </c:forEach>
   <h1>forEach标签  遍历复杂list，list里面是一个javabean对象</h1>
 <c:forEach items="${userList}" var="element">
  <c:out value="${element.userId}"/>&nbsp;
  <c:out value="${element.userName}"/>
 </c:forEach>
  </body>
</html>
