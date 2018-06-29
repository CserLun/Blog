package blog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.model.User;
import blog.service.ArticleService;


@WebServlet("/MyArticleServlet")
public class MyArticleServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		
		//获取我的文章类型的数据
		ArticleService as=  ArticleService.getInstance();		
		request.setAttribute("axis_list",as.getMyAxis(user.getUser_name()));
		
		//转发
		request.getRequestDispatcher("/page/myArticle.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
