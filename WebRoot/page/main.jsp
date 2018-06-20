<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- JSTL核心标签库 -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页 | MyBlog</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">

<link type="text/css" rel="stylesheet" href="./css/main.css" />
</head>
<body>
	<div class="head_line"></div>

	<div class="container" id="main">

		<div id="header"></div>

		<div class="row c_center">
			<div class="col-md-3" id="left_content">

				<div id="title">
					<h2>
						<a href="/Blog/login.jsp">MyBlog</a>
					</h2>
					<h5 class="text-muted">Here to find something new!</h5>
				</div>
				<br>
				<c:choose>
				    
					<c:when test="${sessionScope.user.user_name=='游客'}">
					
					<br>
						    <span style="font-size: 16px;">欢迎来到Myblog！<br></span>
						    <span style="font-size: 16px;">请登录，体验更多功能！<br><br></span>
							<form class="form-signin" id="form" action="LoginServlet"
								method="post">

								<label for="input" class="sr-only">用户名</label> <input
									type="text" id="input" class="form-control" placeholder="用户名"
									name="username" style="width:100%" required> <label for="inputPassword"
									class="sr-only">密码</label> <input type="password"
									id="inputPassword" class="form-control" placeholder="密码"
									name="password" required> <span id="message"></span>

								<button class="btn btn-lg btn-primary btn-block" type="submit"
									id="submit">登录</button>
								<a href="register.jsp">注册</a>
                                <br>
                                <br>
                                
							</form>
						
					</c:when>
					<c:otherwise>
						<div class="c_center" id="person_info">
							<img src="/Blog/img/header.jpg" height="130" width="130"
								alt="丢失了我的头像?" class="img-circle">
							<h4 class="text-muted">
								<span>${user.user_name}</span>
							</h4>
							<h5 class="text-muted">这里可以是个人简介.</h5>
						</div>
					</c:otherwise>
				</c:choose>




				<c:if test="${sessionScope.user.user_name!='游客'}">
					<div id="list">
						<table class="table table-hover c_center">

							<tr>
								<td><a href="/Blog/AddServlet"><span
										class="glyphicon glyphicon-plus"></span> &nbsp;&nbsp;写新文章</a></td>
							</tr>
							<tr>
								<td><a href="/Blog/AdminServlet"><span
										class="glyphicon glyphicon-user"></span> &nbsp;&nbsp;管理文章</a></td>
							</tr>
							<tr>
								<td><a href="/Blog/AxisServlet"><span
										class="glyphicon glyphicon-book"></span>&nbsp;&nbsp;&nbsp;&nbsp;时间轴
										&nbsp;&nbsp;</a></td>
							</tr>

						</table>
					</div>
				</c:if>
				<!-- list -->
				<br />
				<c:if test="${sessionScope.user.user_name!='游客'}">
					<div class="sort">
						<div class="list-group">
							<span class="list-group-item active">我的文章</span>
							<!-- 这里初始化分类 -->
							<c:forEach var="myArticle" begin="0" end="4" items="${myArticle_list}">
								<a href="/Blog/ArticleServlet?id=${myArticle.id}"
									class="list-group-item">${myArticle.title}
									</a>
							</c:forEach>
							<!-- 初始化结束 -->
							<a href="/Blog/SortServlet?get=${entity.key}" style="color: #337ab7"
									 class="list-group-item glyphicon glyphicon-plus">&nbsp;查看更多</a>
						</div>
					</div>
				</c:if>
				<br>
				<!-- sort -->

                 <div class="sort">
					<div class="list-group">
						<span class="list-group-item active">分类热文</span>						
						<!-- 这里初始化分类 -->
						<c:forEach var="entity"  items="${sort_count_map}">
						 <a href="/Blog/SortServlet?get=${entity.key}" class="list-group-item">${entity.key}</a>						
						</c:forEach>									
						<!-- 初始化结束 -->						
					</div>
					<br>
					
				</div><!-- sort -->

				<div class="visit">
					<div class="list-group">
						<span class="list-group-item active">阅读排行</span>
						<!-- 这里初始化阅读排行 -->
						<c:forEach var="a" begin="0" end="7" items="${visit_rank}">
							<a href="/Blog/ArticleServlet?id=${a.id}" class="list-group-item">${a.title}&nbsp;&nbsp;
								<span class="c_right">(${a.visit})</span>
							</a>
						</c:forEach>
						<a href="/Blog/SortServlet?get=${entity.key}" style="color: #337ab7"
									 class="list-group-item glyphicon glyphicon-plus">&nbsp;查看更多</a>
						<!-- 初始化结束 -->
					</div>
				</div>
				<!-- visit-->



				<!-- admin here -->

				<!--  -->

			</div>
			<div class="col-md-2" id="center_content"></div>


			<div class="col-md-7 " id="right_Content">
				<br /> <br />
				<div class="list-group">
					<a href="#" class="list-group-item active">最新文章</a>
					<!-- 这里初始化文章列表 -->
					<c:forEach var="article" items="${article_list}">
						<div class="list-group-item">
							<h4>
								<a href="/Blog/ArticleServlet?id=${article.id}">${article.title}</a>
							</h4>

							作者：${article.author}&nbsp;&nbsp;<br /> <span>${article.time}&nbsp;&nbsp;|</span>
							<a href="/Blog/SortServlet?get=${article.sort}">${article.sort}</a>&nbsp;&nbsp;|
							<span>阅读次数: ${article.visit}</span> <br /> <br /> <span>${article.content}</span>
							<br /> <br /> <br /> <a
								href="/Blog/ArticleServlet?id=${article.id}">阅读全文</a> <br />
						</div>
					</c:forEach>
					<!-- 初始化文章列表完成 -->
				</div>
			</div>
		</div>
		<div class="foot_line"></div>
	</div>
	<!-- container -->
	<div id="footer">
		<div>
			<a href="https://github.com/CserLun/Blog"><img
				src="/Blog/img/github.png" width="20px" height="20px"
				class="img-circle">&nbsp;&nbsp;GitHub</a> &nbsp;| <a href="http://www.scnu.edu.cn/">&nbsp;&nbsp;SCNU</a>
			<br /> copyright © 2017
		</div>

		<div class="r_div">
			<a href="#"><input class="btn btn-default" value="返回顶部"
				style="width:50%;" /></a>
			<h6>被访问了 ${visited } 次</h6>
			<h6>你是第 ${member}个访问者</h6>
		</div>

	</div>
	<!-- footer -->
</body>
</html>