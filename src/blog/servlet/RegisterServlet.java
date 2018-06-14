package blog.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import blog.utils.LoginUtils;
import blog.utils.RegisterUtils;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RegisterUtils.register(request);    //连接mysql，把新用户信息user对象存入session
		HttpSession session = request.getSession();
		boolean register_result=(boolean)session.getAttribute("result");
		if(!register_result)  //返回注册信息为失败，说明注册失败
		{
			//System.out.println("账号密码有误");
			request.setAttribute("registermessage","注册失败");
			request.getRequestDispatcher("/register.jsp").forward(request, response);	//转发到登录JSP
			return;
		}
		else {
			//System.out.println("注册成功");
			request.setAttribute("registermessage","注册成功");
			request.getRequestDispatcher("/register.jsp").forward(request, response);	//转发到登录JSP
			return;
		}
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
