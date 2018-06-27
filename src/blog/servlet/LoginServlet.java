package blog.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.Tag;

import blog.dao.ArticleDao;
import blog.dao.UserDao;
import blog.daoImpl.UserDaoImpl;
import blog.db.VisitorDB;
import blog.model.Article;
import blog.model.User;
import blog.service.ArticleService;
import blog.service.TagService;
import blog.utils.LoginUtils;

/**
 * Login->index.jsp->init data
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		LoginUtils.login(request);    //连接mysql，验证账号密码。把用户信息user对象存入session
		HttpSession session = request.getSession();
		User user=(User) session.getAttribute("user");
		if(user==null)  //返回user为空，说明账号密码有误
		{
			//System.out.println("账号密码有误");
			request.setAttribute("message","账号密码有误");
			request.getRequestDispatcher("/login.jsp").forward(request, response);	//转发到登录JSP
			return;
		}
		
		request.setAttribute("user", user);
		
		//初始化分类
		ArticleService as =  ArticleService.getInstance();		
		request.setAttribute("sort_count_map", as.getSortAndCount());
		//初始化文章列表（所有文章，按时间倒序排序）
		
		request.setAttribute("article_list", as.getArticle());  
		//初始化获取标签
		TagService ts = TagService.getInstance();			
		request.setAttribute("tag_list", ts.getAllTag());	
		
		//初始化侧边栏 日志、分类、标签的个数
		request.setAttribute("article_number", as.getCount(ArticleDao.SEARCH_ARTICLE));		
		request.setAttribute("sort_number", as.getCount(ArticleDao.SEARCH_SORT));		
		request.setAttribute("tags_number", ts.getTagCount());
		
		//阅读排行
		request.setAttribute("visit_rank", as.getVisitRank());
		
		//传网站的统计数据
		request.setAttribute("visited", VisitorDB.totalVisit());
		request.setAttribute("member", VisitorDB.totalMember());
		
		request.setAttribute("myArticle_list", as.getMyArticle(user.getUser_name()));
		
		//转发到 博客主页 界面
		request.getRequestDispatcher("/page/main.jsp").forward(request, response);	
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
