package blog.servlet;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import blog.service.ArticleService;
import blog.utils.StringUtils;


@WebServlet("/RankingServlet")
public class RankingServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//获取的是所有分类 还是一个分类的文章
		//String get = StringUtils.pareCode(request.getParameter("get"));	
		String get=request.getParameter("get");
		//初始化分类和和文章
		ArticleService as = ArticleService.getInstance();		
		request.setAttribute("ranking_list",as.getVisitRank());					
		//转发		
		request.getRequestDispatcher("/page/ranking.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
