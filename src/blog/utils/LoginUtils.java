package blog.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import blog.dao.UserDao;
import blog.daoImpl.UserDaoImpl;
import blog.model.User;

public class LoginUtils {
	
	public static void login(HttpServletRequest request){
		
		String username= request.getParameter("username");   //从表单获取账号密码
		String password= request.getParameter("password");
		
		//if( StringUtils.isEmpty(username) || StringUtils.isEmpty(password))  //空检查
		//return ;	
		
			
		UserDao dao = UserDaoImpl.getInstance();
		User user = dao.login(username, password);  //无该账号则返回user=null
		//if(user==null)    //账号密码有误
			//return ;
		
		if(username.equals("unknown_visitor"))  //游客
		{
		user=new User();
		user.setUser_name("游客");
		user.setUser_id(-1);
		}
		
		//写入session
		HttpSession session = request.getSession();
		session.setAttribute("user", user);   //把user对象(账号信息)存入session
		
	}
	
}
