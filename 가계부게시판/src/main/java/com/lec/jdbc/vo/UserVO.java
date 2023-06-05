package main.java.com.lec.jdbc.vo;



public class UserVO {

	private int id;
	private String email;
	private String password;
	private String name;
	private String username;
	
	
	

	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}



	@Override
	public String toString() {
		return "UserVO [email=" + email + ", password=" + password + ", name=" + name + ", username=" + username
				
				+ "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}	
}