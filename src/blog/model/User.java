package blog.model;

public class User {

	private int user_id;
	private String user_name;
	private String user_password;
	private String user_motto;
	private String user_image;
		
	
	public User() {
		super();
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_motto() {
		return user_motto;
	}

	public void setUser_motto(String user_motto) {
		this.user_motto = user_motto;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	
	
	
	
}
