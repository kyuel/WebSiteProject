package models;

public class PostModel {
	public String title;
	public String content;
	public String id;
	public String num;
	
	public PostModel(String title, String content, String id, String num){
		this.id = id;
		this.title = title;
		this.content = content;
		this.num = num;
	}
}
