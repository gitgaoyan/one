<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'calc.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
			function calc()
			{
			  var x=document.getElementById("x").value;
				var y=document.getElementById("y").value;
				var z =document.getElementById("z");
				var sele = document.getElementById("sel");
				var ope = sele.options[sele.selectedIndex].value;
				if(x==""||y=="")
				{
					alert("输入数值！！！");
				}
				else
				{
						switch(ope)
						{
							case"+":
							z.setAttribute("value",parseFloat(x)+parseFloat(y));
							break;
							case"-":
							z.setAttribute("value",parseFloat(x)-parseFloat(y));
							break;
							case"*":
							z.setAttribute("value",parseFloat(x)*parseFloat(y));
							break;
							default:
							{
								if(y==0)
								{
									alert("被除数不能为0！！！");
								}
								else
								{
									z.setAttribute("value",parseFloat(x)/parseFloat(y));
								}
							}						
						}
				}
			}
		
		</script>
  </head>
  
  <body>
   		<input id="x" type="text" />
		<select id = "sel">
			<option value ="+">+</option>
			<option value ="-">-</option>
			<option value ="*">x</option>
			<option value ="/">/</option>
		</select>
		<input id="y" type="text" />
		=
		<input id="z" type="text"/>
		<button onclick="calc()">calc</button>
  </body>
</html>
