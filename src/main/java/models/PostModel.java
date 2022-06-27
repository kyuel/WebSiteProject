package models;

public class PostModel {
	public String title;
	public String content;
	public String id;
	
	public PostModel(String title, String content, String id){
		this.id = id;
		this.title = title;
		this.content = content;
	}
}
