package blog.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import blog.utils.LoginUtils;
import blog.utils.RegisterUtils;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  // 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
 
  
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
		response.setContentType("text/html");
        response.setCharacterEncoding("GBK");
        request.setCharacterEncoding("GBK");
        
        SmartUpload smart=new SmartUpload();
        
        //PageContext是jsp的内置对象，在servlet不能直接使用，需要做一些处理
        JspFactory _jspxFactory = null;
         PageContext pageContext = null;
         _jspxFactory = JspFactory.getDefaultFactory();
         pageContext = _jspxFactory.getPageContext(this,request,response,"",true,8192,true);

        smart.initialize(pageContext);//初始化上传操作
        try {
			smart.upload();
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //String ext=smart.getFiles().getFile(0).getFileExt();//此为得到文件的扩展名,getFile(0)为得到唯一的一个上传文件
        String fileName=smart.getFiles().getFile(0).getFileName();			//获取表单上传文件名
        System.out.println(fileName);
        
        //由于前面的form表单已经进行了封装，这里就不能简单的用request.getparameter()来获取表单参数
        String username = smart.getRequest().getParameter("newusername");//获取表单非文件类型的字段
        String password = smart.getRequest().getParameter("newpassword");
        String motto = smart.getRequest().getParameter("newmotto");
        String imagename=username+fileName;					//存储文件名
        System.out.println("用户名："+username+"密码"+password+"座右铭"+motto+"图片名"+imagename);
        
        
        RegisterUtils.register(request,username,password,motto,imagename);    //连接mysql，把新用户信息user对象存入session
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
			  
	        try {
				smart.getFiles().getFile(0).saveAs(getServletContext().getRealPath("/")+ UPLOAD_DIRECTORY +File.separator +username+fileName);//存储路径
				System.out.println("写入成功");
				System.out.println("注册成功");
				request.setAttribute("registermessage","注册成功");
				request.getRequestDispatcher("/register.jsp").forward(request, response);	//转发到登录JSP
			} catch (SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				request.setAttribute("registermessage","上传头像失败");
				request.getRequestDispatcher("/register.jsp").forward(request, response);	//转发到登录JSP
			}
	       
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
