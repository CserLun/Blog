package blog.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
 
    // 上传配置
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
       
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
		
		RegisterUtils.register(request,response,this.getServletConfig());    //连接mysql，把新用户信息user对象存入session
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
			  System.out.print("注册成功1");
			/*SmartUpload su = new SmartUpload();//新建一个SmartUpload对象
			 // Initialization 
			 su.initialize(this.getServletConfig(),request,response); 
			 su.setMaxFileSize(10*1024*1024);//限制上传文件的大小 
			 try {
			     su.upload();
			} catch (SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 String username=su.getRequest().getParameter("newusername");
			 System.out.print(username);*/
			
			 if (!ServletFileUpload.isMultipartContent(request)) {
		            // 如果不是则停止
		            PrintWriter writer = response.getWriter();
		            writer.println("Error: 表单必须包含 enctype=multipart/form-data");
		            writer.flush();
		            return;
		        }
			 System.out.print("注册成功2");
		        // 配置上传参数
		        DiskFileItemFactory factory = new DiskFileItemFactory();
		        // 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
		        factory.setSizeThreshold(MEMORY_THRESHOLD);
		        // 设置临时存储目录
		        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		 
		        ServletFileUpload upload = new ServletFileUpload(factory);
		         
		        // 设置最大文件上传值
		        upload.setFileSizeMax(MAX_FILE_SIZE);
		         
		        // 设置最大请求值 (包含文件和表单数据)
		        upload.setSizeMax(MAX_REQUEST_SIZE);
		        
		        // 中文处理
		        upload.setHeaderEncoding("UTF-8"); 

		        // 构造临时路径来存储上传的文件
		        // 这个路径相对当前应用的目录
		        String uploadPath = getServletContext().getRealPath("/") + UPLOAD_DIRECTORY;
		        System.out.println();

		        System.out.print("注册成功3");
		        System.out.println(uploadPath);
		        System.out.println();
		        // 如果目录不存在则创建
		        File uploadDir = new File(uploadPath);
		        if (!uploadDir.exists()) {
		            uploadDir.mkdir();
			        System.out.print("注册成功4");
		        }
		 
		        try {
		            // 解析请求的内容提取文件数据
		            @SuppressWarnings("unchecked")
		            List<FileItem> formItems = upload.parseRequest(request);
			        System.out.print("注册成功5");
		            if (formItems != null && formItems.size() > 0) {
		                // 迭代表单数据
		                for (FileItem item : formItems) {
		                    // 处理不在表单中的字段
		                    if (!item.isFormField()) {
		                        String fileName = new File(item.getName()).getName();
		                        String filePath = uploadPath + File.separator +fileName;
		                        File storeFile = new File(filePath);
		                        // 在控制台输出文件的上传路径
		                        System.out.println(filePath);
		                        // 保存文件到硬盘
		                        item.write(storeFile);
		                        System.out.print("写入成功");
		                    }
		                }
		               
		            }
		            request.setAttribute("registermessage","注册成功");
        			request.getRequestDispatcher("/register.jsp").forward(request, response);	//转发到登录JSP
		        } catch (Exception ex) {
		            request.setAttribute("message",
		                    "错误信息: " + ex.getMessage());
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
