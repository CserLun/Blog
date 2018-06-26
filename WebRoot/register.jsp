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
	<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Custom styles for this template -->
<script>
function handleFiles(file) {
    var img = document.getElementById("img");
    console.log(file[0])
    img.src = window.URL.createObjectURL(file[0]);
    img.onload = function() {
        window.URL.revokeObjectURL(this.src);
    }
} 
</script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container-fluid">
	    <div class="pull-right">
	        <ul class="nav navbar-nav">
	            <li class="active"><a href="#">MyBlog</a></li>
	            <li><a href="#">写文章</a></li>
	            <li class="dropdown">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                 	   账号 <b class="caret"></b>
	                </a>
	                <ul class="dropdown-menu">
	                    <li><a href="#">设置</a></li>
	                    <li class="divider"></li>
	                    <li><a href="#">退出</a></li>
	                </ul>
	            </li>
	        </ul>
	    </div>
    </div>
</nav>
<div class="container">
		
	<div class="row" >
		<div class="col-md-4">
		<h1 >注册<small> &nbsp; &nbsp;register here!</small></h1>
		</div>
	</div>
	<div class="row" >
        <div class="col-md-4">
		</div>
		<div class="col-md-4" style="margin-top:10rem;">
			<div class="row">
				<form class="form-inline" id="form" action="RegisterServlet" method="post" enctype="multipart/form-data"
				style="width:100%;margin:0 auto;">
					<div class="form-group" style="margin-top:2rem">
						<label for="input" style="line-height:34px;" >用户名&nbsp;&thinsp;&thinsp;</label> 
						<input type="text"
							id="input" class="form-control" placeholder="新用户名" name="newusername"
							required style="margin-left:0.5rem"> 
					</div>
					<div class="form-group" style="margin-top:2rem">
						<label for="inputPassword" >密&emsp;码&nbsp;&thinsp;&thinsp;</label>
						<input type="password" id="inputPassword" class="form-control"
							placeholder="密码" name="newpassword" required
							 style="margin-left:0.5rem"> 
					</div>
					<div class="form-group" style="margin-top:2rem">
						<label for="inputPersonalsign">个性签名&thinsp;</label>
						<textarea class="form-control" name="newmotto" placeholder="留下你最酷的一句话吧"  rows="3"></textarea>
					</div>
					<div class="form-group" style="margin-top:2rem">
						<label for="inputfile">头像设置</label>
   						<input type="file" name="uploadFile" onchange="handleFiles(this.files,this.parentNode)">
   						<img class="img-circle" src="" id="img" width=100 style="margin-top:1rem">
   						<span id="message" style="color:red"></span> 
					</div>
					
					
					<button class="btn btn-lg btn-primary btn-block" type="submit"
						id="submit" style="margin-top:2rem">注册</button>
					<a href="login.jsp" class="pull-right">返回登录</a>
				</form>
				<!-- /form -->
			</div>
			
		</div>
		<div class="col-md-4">

		</div>
    </div> 

</div>


	
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
