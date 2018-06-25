package blog.dao;

import blog.model.User;

public interface UserDao {

	/**
	 * 注册用户
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	boolean register(String username, String password, String motto);

	/**
	 * 登录验证
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	User login(String username, String password);

}