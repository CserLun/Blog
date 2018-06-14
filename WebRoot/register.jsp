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
>注册 | MyBlog</title>

<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<link type="text/css" rel="stylesheet" href="css/register.css" />
</head>
<body>

	<div class="container" id="main">
		<form class="form-signin" id="form" action="RegisterServlet"
			method="post">
			<h2 class="form-signin-heading">注册<small> &nbsp; &nbsp;register here!</small></h2>
			<label for="input" class="sr-only">用户名</label> <input type="text"
				id="input" class="form-control" placeholder="新用户名" name="newusername"
				required> <label for="inputPassword" class="sr-only">密码</label>
			<input type="password" id="inputPassword" class="form-control"
				placeholder="密码" name="newpassword" required> <span id="message"></span>

			<button class="btn btn-lg btn-primary btn-block" type="submit"
				id="submit">注册</button>
			<a href="login.jsp">返回登录</a>
		</form>
		<!-- /form -->
	</div>

	<!-- /container -->

	<div id="footer">
		<div>
			<a href="https://github.com/Lemonreds"><img src="img/github.png"
				width="20px" height="20px" class="img-circle">&nbsp;&nbsp;GitHub</a>
			&nbsp;| <a href="#">&nbsp;&nbsp;Sakura</a>
		</div>
	</div>
	<!-- footer -->
	
	<%
	String message=(String)request.getAttribute("registermessage");
	if(message!=null&&message.equals("注册失败"))
	{%>
	<script>
	document.getElementById("message").innerHTML="用户名已被注册，请重新输入";
	</script>
	<% }
	if(message!=null&&message.equals("注册成功"))
	{%>
	<script>
	document.getElementById("message").innerHTML="注册成功，请登录";
	</script>
	<% }
	
	
	%>
	
	 

</body>
</html>
