package blog.daoImpl;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;

import blog.dao.TagDao;
import blog.dao.UserDao;
import blog.db.C3P0Connection;
import blog.model.User;
import blog.utils.DBUtils;

/**
 * 用户服务的具体实现类
 *
 */
public class UserDaoImpl implements UserDao {

	private Connection conn;

	private UserDaoImpl() {
		conn = C3P0Connection.getInstance().getConnection();
	}

	private static UserDao instance;

	public static final UserDao getInstance() {
		if (instance == null) {
			try {
				instance = new UserDaoImpl();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return instance;
	}

	/* (non-Javadoc)
	 * @see blog.daoImpl.UserDao#register(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean register(String username, String password) {
		// todo
		String sql="select * from t_user where user_name=?";
		PreparedStatement ps = null;
		PreparedStatement pastmt = null;			//写入数据库用

		boolean abletowrite=false;		//默认账号已存在数据库，不能写入
		boolean ifregister=false;		//默认注册未成功
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			// bean导入
			if (rs.next()) {   //数据库已存在该账号
				abletowrite=false;
				ifregister=false;
			}
			else
				{
					//表示数据库不存在该账号，允许插入数据
					String sqlinsert="Insert into t_user(user_name,user_password) values(?,?)";
					pastmt=conn.prepareStatement(sqlinsert);
					pastmt.setString(1, username);
					pastmt.setString(2, password);
					int n=pastmt.executeUpdate();
					if(n==1) {
						ifregister=true;
					}
					else
						ifregister=false;
				
				}
			DBUtils.Close(ps, rs);   //关闭数据库查询
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(ifregister) {
			return true;
		}
		else
			return false;
	}

	/* (non-Javadoc)
	 * @see blog.daoImpl.UserDao#login(java.lang.String, java.lang.String)
	 */
	@Override
	public User login(String username, String password) {

		User user = null;

		String sql = "select * from t_user where user_name=? and user_password=?";
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			// bean导入
			if (rs.next()) {   //账号密码正确
				Map<String, String> map = new HashMap<String, String>();
				user = new User();
				map.put("user_name", rs.getString("user_name"));
				map.put("user_password", rs.getString("user_password"));
				//map.put("user_id", rs.getString("user_id"));
				try {
					BeanUtils.populate(user, map);   //把map赋值给bean
				} catch (Exception e) {
					throw new RuntimeException();
				}
			}
			
			DBUtils.Close(ps, rs);   //关闭数据库查询
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;   //返回user这个javabean对象
	}

	
	
}
