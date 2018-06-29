<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新的文章 | Emm</title>


<!-- Bootstrap core CSS -->
<link	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="./css/add.css" />

<link rel="stylesheet" href="./editormd/css/style.css" />
<link rel="stylesheet" href="./editormd/css/editormd.css" />
 
<script src="./editormd/js/zepto.min.js"></script>
<script src="./editormd/js/editormd.js"></script>  

<script src="./js/add.js"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container-fluid">
	    <div class="pull-center">
	        <ul class="nav navbar-nav">
	            <li class="active"><a href="#">Emm</a></li>
	         	<li><a href="/Blog/index.jsp">首页</a></li>
	            </li>
	        </ul>
	    </div>
    </div>
	</nav>
	<div class="container" id="main">		
		<div id="title"><h2><a href="#">Write Something here.....</a></h2></div>	
							
		   <form action="/Blog/NewArticleServlet" method="post">
		   		
		   		<div class="clearfix" >
		   		
		   		<!-- title -->
		   		<div class="div-inline" >
		   		<span class="help">标题：</span>
				<input type="text" name="title" style="width:30%">
				<!-- time -->
				<span class="help">时间:</span>
		   		<input type="text"  name="time" style="width:20%" value="${time}" >
				</div>
		   		
		   		
		   		<br>
		   		<br>

		   		<!-- content -->   
                <div class="editormd" id="mdView">                
                    <textarea name="content"></textarea>
                </div>
                
                <!-- sort --> 	
		   		<br>			
		   		<span class="help">选择所属分类</span><br/><br>
 				<c:forEach var="s"  items="${sort_count}">
 				<input class="btn btn-default sort-btn" type="button" value="${s.key}" onclick="sort_click(this)"> &nbsp;					
 				</c:forEach> 	 			
 				<input type="text" class="form-control" style="display:none" id="sort" name="sort">		
 				
				<!-- tag -->	
				<br>
				<br>
		   		<span class="help">标签（选择或者下方输入新标签名）</span><br/><br>
		   		<c:forEach var="tag" items="${all_tag}">
		   		<input class="btn btn-default" type="button" value="${tag.tag}" onclick="tags_click(this)">&nbsp;
		   		</c:forEach>
		   		<br>
		   		<input type="text" class="help" style="text-align:center;" id="tags" placeholder="新标签名"  name="tags" style="width:10%">	
		   		</div>   	

                <button class="btn btn-lg btn-primary" type="submit" style="color: blue;">提交</button>
           </form>
		
		<div class="foot_line"></div>
			<!-- container -->
		</div><!-- container -->
	
		<div id="footer">

		
	</div> <!-- footer -->		
		
	<script type="text/javascript">
			var testEditor;
			var jQuery = Zepto;
            $(function() {
					testEditor = editormd("mdView", {
						width  : "90%",
						height : 720,
						path   : './editormd/lib/',
                        codeFold : true,
                        searchReplace : true,
                        saveHTMLToTextarea : true,    // 保存 HTML 到 Textarea                   
                        htmlDecode : "style,script,iframe|on*", // 开启 HTML 标签解析，为了安全性，默认不开启
                        emoji : true,
                        taskList : true,
                        tocm: true,      
                        tex : true,  
                        flowChart : true,  
                        sequenceDiagram : true,   
                        imageUpload : true,
				        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],				        
				        imageUploadURL : "/Blog/UploadPic",
				        //后台只需要返回一个 JSON 数据				      
						onload : function() {
							//console.log("onload =>", this, this.id, this.settings);
						}
					});				
					editor.setToolbarAutoFixed(false);//工具栏自动固定定位的开启与禁用               
            });
        </script>	
	
</body>
</html>