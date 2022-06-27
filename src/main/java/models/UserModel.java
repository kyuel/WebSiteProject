package models;

public class UserModel {
	public String id;
	public String pass;
	public String auth;
	
	public UserModel(String id, String pass, String auth){
		this.id = id;
		this.pass = pass;
		this.auth = auth;
	}
	public boolean empty() {
		return this.id.equals("") && this.pass.equals("") && this.auth.equals("");
	}
}
