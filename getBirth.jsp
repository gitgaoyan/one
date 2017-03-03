<%@ page language="java" import="java.util.*,java.awt.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- html无法实现表格的上下居中 -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'getBirth.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
   <style type="text/css">
   td{
   border:1px solid black;
   width:200px;
   height:45px;
   text-align: center;
   }
   table{
   border:4px solid black;
   margin-top:<%=(Toolkit.getDefaultToolkit().getScreenSize().getHeight())/2-(45*3+8)/2%>;
   } 
 /* html 对table 没有直接的指令来设置垂直居中， 只能用margin来手动设置  */
   </style>


  </head>
  
  <body>
    <%
    
    String one = request.getParameter("one").substring(6, 14); 
    StringBuffer sbo = new StringBuffer(one);
    
  
	     for(int i = 0; i < sbo.length(); i++)
	     {
	     if(i == 4 || i == 7)
	    	sbo.insert(i,"-");
	     }
	     
    String two = request.getParameter("two").substring(6, 14); 
    StringBuffer sbt = new StringBuffer(two);
    
    for(int i = 0; i < sbt.length(); i++)
	     {
	     if(i == 4 || i == 7)
	    	sbt.insert(i,"-");
	     }
    
     %>
     
     <table align="center"  cellspacing="0px" cellpadding="1px">
     <%
     for(int i = 0; i < 3; i++)
     {
		     if(i == 0)
		     {
			     %>
			     <tr style="background-color: pink">
			     <td>
			     身份证号
			     </td>
			      <td>
			      生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
			     </td>
			     </tr>
			      <%
			  }
			   if(i == 1)
		     {
			     %>
			     <tr>
			     <td>
			     <% out.write(one); %>
			     </td>
			      <td>
			      <% out.write(sbo.toString()); %>
			     </td>
			     </tr>
			      <%
			  }
			  
			  if(i == 2)
		     {
			     %>
			     <tr>
			     <td>
			     <% out.write(two); %>
			     </td>
			      <td>
			      <% out.write(sbt.toString()); %>
			     </td>
			     </tr>
			      <%
			  }
     }  
      %>
     </table>
    
  </body>
</html>









<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    
    <title>My JSP 'input.jsp' starting page</title>
    
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
    <jsp:include page="getBirth.jsp">
    <jsp:param value="11111119980923" name="one"/>
    <jsp:param value="11111119981023" name="two"/>
    </jsp:include>
    
  </body>
</html>
