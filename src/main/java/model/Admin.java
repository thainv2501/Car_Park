package model;

public class Admin {
	private String account;
	private String password;
	
	public Admin() {
		// TODO Auto-generated constructor stub
	}

	public Admin(String account, String password) {
		super();
		this.account = account;
		this.password = password;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Admin [account=" + account + ", password=" + password + "]";
	}
	
	
	
	

}
