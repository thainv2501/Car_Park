package model;

public class Employee {
private int id;
private String account;
private String department;
private String address;
private String dob;
private String email;
private String name;
private String phone;
private String password;
private String sex;

public Employee() {
	// TODO Auto-generated constructor stub
}

public Employee(int id, String account, String department, String address, String dob, String email, String name,
		String phone, String password, String sex) {
	super();
	this.id = id;
	this.account = account;
	this.department = department;
	this.address = address;
	this.dob = dob;
	this.email = email;
	this.name = name;
	this.phone = phone;
	this.password = password;
	this.sex = sex;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getAccount() {
	return account;
}

public void setAccount(String account) {
	this.account = account;
}

public String getDepartment() {
	return department;
}

public void setDepartment(String department) {
	this.department = department;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getDob() {
	return dob;
}

public void setDob(String dob) {
	this.dob = dob;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public String getPhone() {
	return phone;
}

public void setPhone(String phone) {
	this.phone = phone;
}

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getSex() {
	return sex;
}

public void setSex(String sex) {
	this.sex = sex;
}

@Override
public String toString() {
	return "Employee [id=" + id + ", account=" + account + ", department=" + department + ", address=" + address
			+ ", dob=" + dob + ", email=" + email + ", name=" + name + ", phone=" + phone + ", password=" + password
			+ ", sex=" + sex + "]";
}



}
