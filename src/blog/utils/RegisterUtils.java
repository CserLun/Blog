package blog.utils;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import blog.dao.UserDao;
import blog.daoImpl.UserDaoImpl;
import blog.model.User;

public class RegisterUtils {
	static boolean result;
	public static void register(HttpServletRequest request,String username,String password,String motto,String imagename) throws ServletException, IOException{

		UserDao dao = UserDaoImpl.getInstance();
		
		result=dao.register(username, password,motto,imagename);
		if(result) {
			//System.out.print("注册成功");
			//写入session
			HttpSession session = request.getSession();
			session.setAttribute("result", result);   //把注册信息存入session
		}
		else {
			//写入session
			HttpSession session = request.getSession();
			session.setAttribute("result", result);   //把注册信息存入session
			//System.out.print("注册失败");
		}
		/*
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
		session.setAttribute("user", user);   //把user对象(账号信息)存入session*/
		
	}

}
