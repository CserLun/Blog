<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="blog.model.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Emm</title>
</head>
<body>
	<!---jsp:forward page="/LoginServlet?username=unknown_visitor&password=null"/-->
</body>
<%
	String username = request.getParameter("username");
	//System.out.print("空"+username);
	String password = request.getParameter("password");
	if (username != null) //由登陆页面进入
	{
		if (username.equals("unknown_visitor")) //游客进入
			request.getRequestDispatcher("/LoginServlet?username=unknown_visitor&password=null")
					.forward(request, response);
		else //用户登陆
			request.getRequestDispatcher("/LoginServlet?username=" + username + "&password=" + password)
					.forward(request, response);
	}

	else { //内部跳转
		HttpSession mySession = request.getSession();
		User user = (User) session.getAttribute("user");

		if (user != null && !user.getUser_name().equals("游客")) //已登录用户跳转
		{
			request.getRequestDispatcher(
					"/LoginServlet?username=" + user.getUser_name() + "&password=" + user.getUser_password())
					.forward(request, response);
			//System.out.print(user.getUser_name()+"\n"+user.getUser_password());
		} else //为登录游客跳转
			request.getRequestDispatcher("/LoginServlet?username=unknown_visitor&password=null")
					.forward(request, response);
	}
%>


</html>