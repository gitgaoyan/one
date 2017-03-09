
Login.jsp
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
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
 String errMess= (String)request.getAttribute("error");
 if(null!=errMess){
   %>
   <p><font color="red"><%=errMess %></font></p>
   <%} %>
    <form action="cookie/LoginValidate.jsp" method="post"> 
    <p>用户名： <input type="text" name="loginId"/></p>
    <P>密码：<input type="text" name="pass"/></P>
    <p><input type="checkbox" name="keep" value="2"/>两周内不再重新登陆</p>
    <br/>
    <p><input type="submit" value="登陆"/></p>
    </form>

  </body>
</html>

LoginValidate.jsp


<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'LoginValidate.jsp' starting page</title>

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
		String userName = request.getParameter("loginId");
		String password = request.getParameter("pass");
		//如果为正确的用户名为 123  密码 123 转向登陆成功页面
		if ("123".equals(userName) && "123".equals(password)) {
			String keep = request.getParameter("keep");
			if ("2".equals(keep)) {
				//创建Cookie，创建用户名和密码的键值对
				Cookie c1 = new Cookie("loginId", userName);
				Cookie c2 = new Cookie("pass", password);
				//cookie对象的生命周期 设置为两周
				c1.setMaxAge(14 * 24 * 3600);
				c2.setMaxAge(14 * 24 * 3600);
				//cookie对象添加到客户端
				response.addCookie(c1);
				response.addCookie(c2);
			}
			session.setAttribute("loginId", userName);//欢迎您时候用
			//转发重定向
			response.sendRedirect("/jsp03/cookie/LoginSuccess.jsp");
			//response.sendRedirect("/jsp02/index.jsp");哇塞
	%>
	<%
		} else {
			//错误的用户名或密码，重新转向登陆页面   redirect方式转发
			request.setAttribute("error", "login error");
			//request.removeAttribute("error");
		    //response.sendRedirect("/jsp03/cookie/Login.jsp");
		    request.getRequestDispatcher("/cookie/Login.jsp").forward(request, response);
	%>
	<%
		}
	%>
</body>
</html>




LoginSuccess.jsp

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'LoginSuccess.jsp' starting page</title>
    
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

    <% //如果session中没有用户信息，说明该用户没有登录过,看看cookie里面有保存的信息吗
if(null==session.getAttribute("loginId")){
  //看cookie中有没有用户信息
  Cookie[] cookies=request.getCookies();
  String loginId="";
  String pass="";
		  if(null!=cookies){
		    //从cookie中得到用户名和密码，进行合法性校验
			  for(int i=0;i<cookies.length;i++){
			  		Cookie c=cookies[i];
			  
				  if("loginId".equals(c.getName())){
				  loginId=c.getValue();
				  }else if("pass".equals(c.getName())){
			  		pass=c.getValue();
			  	  }
			  }
		  }
		  
	  if((null != loginId) && (loginId != "") && (null != pass) && (pass != "")){
	  response.sendRedirect("LoginValidate.jsp?loginId="+loginId+"&pass="+pass);
	  }
     %>
        	您还未登陆，请先登陆！<br/>
     5秒后，自动跳到登陆页面，如果不跳转，请点击<a href="cookie/Login.jsp">登陆</a>!
     <%
     response.setHeader("refresh", "5;url=../cookie/Login.jsp");
     return;
    } %>
     登陆成功！欢迎你<%=session.getAttribute("loginId")%>
   <a href="cookie/logout.jsp">注销</a>
     
  </body>
</html>


logout.jsp
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'logout.jsp' starting page</title>
    
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
 
    <form action="cookie/LoginValidate.jsp" method="post"> 
    <p>用户名： <input type="text" name="loginId" value="<%=session.getAttribute("loginId")%>" /></p>
    <P>密码：<input type="text" name="pass"/></P>
    <p><input type="checkbox" name="keep" value="2"/>两周内不再重新登陆</p>
    <br/>
    <p><input type="submit" value="登陆"/></p>
    </form>
       <%session.invalidate();%>
    <a href="cookie/LoginSuccess.jsp">再次登录</a>
  </body>
</html>
