<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title
>登录 | MyBlog</title>

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<link type="text/css" rel="stylesheet" href="css/login.css" />
</head>
<body>
<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container-fluid">
	    <div class="pull-right">
	        <ul class="nav navbar-nav">
	            <li class="active"><a href="#">MyBlog</a></li>
	         
	            </li>
	        </ul>
	    </div>
    </div>
</nav>

	<div class="container" id="main">
		<form class="form-signin" id="form" action="LoginServlet"
			method="post">
			<h2 class="form-signin-heading">My&nbsp;Blog</h2>
			<label for="input" class="sr-only">用户名</label> <input type="text"
				id="input" class="form-control" placeholder="用户名" name="username"
				required> <label for="inputPassword" class="sr-only">密码</label>
			<input type="password" id="inputPassword" class="form-control"
				placeholder="密码" name="password" required> <span id="message"></span>

			<button class="btn btn-lg btn-primary btn-block" type="submit"
				id="submit">登录</button>
			<a href="register.jsp">注册</a>
			<a>|</a>
			<a href="index.jsp?username=unknown_visitor&password=null">访客登录</a>
		</form>
		<!-- /form -->
	</div>

	<!-- /container -->

	<div id="footer">
		<div>
			<a href="https://github.com/CserLun/Blog"><img src="img/github.png"
				width="20px" height="20px" class="img-circle">&nbsp;&nbsp;GitHub</a>
			&nbsp;| <a href="http://www.scnu.edu.cn/">&nbsp;&nbsp;SCNU</a>
		</div>
	</div>
	<!-- footer -->
	
	
	<%
	String message=(String)request.getAttribute("message");
	if(message!=null&&message.equals("账号密码有误"))
	{%>
	
	<script>
	document.getElementById("message").innerHTML="账号密码有误，请重新输入！";
	</script>
	
	<% }%>
	
	 

</body>
</html>