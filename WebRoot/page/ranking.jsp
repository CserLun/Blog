<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>阅读排行 | MyBlog</title>


<!-- Bootstrap core CSS -->
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">


<link type="text/css" rel="stylesheet" href="/Blog/css/public.css" />
<link type="text/css" rel="stylesheet" href="/Blog/css/sort.css" />
</head>
<body>
	<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container-fluid">
	    <div class="pull-right">
	        <ul class="nav navbar-nav">
	            <li class="active"><a href="#">Emm</a></li>
	         	<li><a href="/Blog/login.jsp">退出</a></li>
	            </li>
	        </ul>
	    </div>
    </div>
	</nav>

	<div class="container" id="main">

		<div id="header"></div>

		<div class="row c_center">
			<div class="col-md-3" id="left_content">

				<div id="title">
					<h2>
						<a href="/Blog/index.jsp">MyBlog</a>
					</h2>
					<h5 class="text-muted">&nbsp;</h5>
				</div>

				<div class="c_center" id="person_info">
					<img src="/Blog/upload/${user.user_image}" height="130" width="130"
						alt="what?" class="img-circle">
					<h5 class="text-muted">${user.user_motto}</h5>
				</div>


				<div id="list">
					<table class="table table-hover c_center">
						<tr>
							<td><a href="/Blog/index.jsp	"><span class="glyphicon glyphicon-home"></span>
								&nbsp;&nbsp;首页</a></td>
						</tr>
						<tr>	
							<td ><a href="/Blog/SortServlet?get=all"><span class="glyphicon glyphicon-list"></span>
								&nbsp;&nbsp;分类</a></td>
						</tr>
						<tr>
							<td><a href="/Blog/TagsServlet?get=all"><span class="glyphicon glyphicon-tags"></span>
								&nbsp;&nbsp;标签</a></td>
						</tr>		
						<tr>
							<td ><a href="/Blog/MyArticleServlet"><span class="glyphicon  glyphicon-th-large"></span>
								&nbsp;&nbsp;我的</a></td>
						</tr>	
						<tr>
							<td class="active"><a href="/Blog/RankingServlet"><span class="glyphicon glyphicon-fire"></span>
								&nbsp;&nbsp;排行</a></td>
						</tr>				
						<tr>
							<td><a href="/Blog/AxisServlet"><span class="glyphicon glyphicon-book"></span>
								&nbsp;&nbsp;时间轴</a></td>
						</tr>
						<tr>
							<td><a href="/Blog/page/about.html"><span class="glyphicon glyphicon-user"></span>
								&nbsp;&nbsp;关于</a></td>
						</tr>
					</table>
				</div>
				<!-- list -->
				<br />
			</div>
			<div class="col-md-2" id="center_content"></div>
			<div class="col-md-7 " id="right_Content">
				<br /> <br />
				<div class="list-group">
					<a href="#" class="list-group-item active">阅读排行</a>
					<!-- 这里初始化列表 -->					
									
					
					<div>
					<!-- 分类信息 -->
					<ul class="list-group">
					
					<c:forEach var="list" items="${ranking_list}">
					<li class="list-group-item">
								<div>
									<div>
										<a href="/Blog/ArticleServlet?id=${list.id}">${list.title}</a>
									</div>
									<div class="c_right">
									<img src="/Blog/img/time.png">
									${list.time}&nbsp;&nbsp; 
									<span class="visit"><img src="/Blog/img/visit.png">
									${list.visit}	</span>
									</div>
								</div>
					</li>
					</c:forEach>					
					</ul>
					</div>								
									
					<!-- 初始化列表完成 -->

				</div>
			</div>
		</div>

		<div class="foot_line"></div>
	</div>
	<!-- container -->


	<div id="footer">
		<a href="#">&nbsp;&nbsp;Emm</a>
	</div>
	<!-- footer -->

</body>
</html>