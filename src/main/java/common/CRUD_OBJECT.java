package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

import models.PostModel;
import models.UserModel;

import java.util.ArrayList;
import java.util.List;


public class CRUD_OBJECT {
	private Connection con;
    private ServletContext application;
    
	public CRUD_OBJECT(ServletContext application) {
    	this.application = application;
    }
	private void open() {
		String driver = this.application.getInitParameter("OracleDriver"); 
        String url = this.application.getInitParameter("OracleURL");
        String id = this.application.getInitParameter("OracleId");
        String pwd = this.application.getInitParameter("OraclePwd");
        
        try {
            // JDBC 드라이버 로드
            Class.forName(driver);  
            // DB에 연결
            con = DriverManager.getConnection(url, id, pwd);
        }
        catch (Exception e) {            
            e.printStackTrace();
        }
	}

	public void close() { 
        try {
        	//객체가 생성된것을 확인후 자원 반납 처리
            if (con != null) con.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
	
	public UserModel[] get_users() {
		List<UserModel> models = new ArrayList<UserModel>();
		this.open();
		try {
			Statement stmt = this.con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from member");
			while(rs.next()) {
				models.add(new UserModel(
						rs.getString("ID"),
						rs.getString("PASS"),
						rs.getString("AUTH")
						));	
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		this.close();
		UserModel[] arr = new UserModel[models.size()];
		arr = models.toArray(arr);
		return arr;
	}
	
	public UserModel get_user(String id) {
		this.open();
		UserModel model = new UserModel("", "", "");
		
		try {
			Statement stmt = this.con.createStatement();
			ResultSet rs = stmt.executeQuery(String.format("select * from member where ID='%s'", id));
			
			while(rs.next()) {
				model = new UserModel(
						rs.getString("ID"),
						rs.getString("PASS"),
						rs.getString("AUTH")
						);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		this.close();
		return model;
	}
	
	public UserModel get_user(String id, String pass) {
		this.open();
		UserModel model = new UserModel("", "", "");
		
		try {
			Statement stmt = this.con.createStatement();
			ResultSet rs = stmt.executeQuery(String.format("select * from member where ID='%s' and PASS='%s'", id, pass));
			
			while(rs.next()) {
				model = new UserModel(
						rs.getString("ID"),
						rs.getString("PASS"),
						rs.getString("AUTH")
						);
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		this.close();
		return model;
	}
	
	public boolean register_user(String id, String pass, String auth) {
		boolean res;
		this.open();
		
		try {
			Statement stmt = this.con.createStatement();
			stmt.executeQuery(String.format("insert into MEMBER values ('%s', '%s', '%s')", id, pass, auth));
			res = true;
		}
		catch(SQLException e) {
			res = false;
			e.printStackTrace();
		}
		this.close();
		return res;
	}
	
	public boolean edit_user(String id, String pass,  String auth, String id_old, String pass_old) {
		boolean res;
		this.open();
		
		try {
			Statement stmt = this.con.createStatement();
			stmt.executeQuery(String.format("update MEMBER set ID='%s', PASS='%s', AUTH='%s' where ID='%s' and PASS='%s'", id, pass, auth, id_old, pass_old));
			res = true;
		}
		catch(SQLException e) {
			res = false;
			e.printStackTrace();
		}
		this.close();
		return res;
	}
	
	public boolean delete_user(String id) {
		this.open();
		boolean res;
		try {
			Statement stmt = this.con.createStatement();
			stmt.executeQuery(String.format("delete member where ID='%s'", id));
			res = true;
		}
		catch(SQLException e) {
			res = false;
			e.printStackTrace();
		}
		
		this.close();
		return res;
	}
	
	public PostModel[] get_posts() {
		List<PostModel> models = new ArrayList<PostModel>();
		this.open();
		try {
			Statement stmt = this.con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from post order by NUM desc");
			while(rs.next()) {
				models.add(new PostModel(
						rs.getString("TITLE"),
						rs.getString("CONTENT"),
						rs.getString("ID"),
						rs.getString("NUM")
						));
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		this.close();
		PostModel[] arr = new PostModel[models.size()];
		arr = models.toArray(arr);
		return arr;
	}
	
	public PostModel get_post(String title, String id, String num) {
		PostModel model = null;
		this.open();
		try {
			Statement stmt = this.con.createStatement();
			ResultSet rs = stmt.executeQuery(String.format("select * from POST where TITLE='%s' and ID='%s' and NUM='%s'", title, id, num));
			while(rs.next()) {
				model = new PostModel(
						rs.getString("TITLE"),
						rs.getString("CONTENT"),
						rs.getString("ID"),
						rs.getString("NUM")
						);
			}
			
		}
		catch(SQLException e) {
			e.printStackTrace();
			model = new PostModel("", "", "", "");
		}
		this.close();
		return model;
	}
	public boolean register_post(String title, String content, String id) {
		boolean res;
		this.open();
		
		try {
			Statement stmt = this.con.createStatement();
			stmt.executeQuery(String.format("insert into POST values ('%s', '%s', '%s', seq_board.nextval)", title, content.trim(), id));
			res = true;
		}
		catch(SQLException e) {
			res = false;
			e.printStackTrace();
		}
		
		this.close();
		return res;
	}
	public boolean update_post(String title, String content,  String title_old, String content_old, String id, String num) {
		boolean res;
		this.open();
		
		try {
			Statement stmt = this.con.createStatement();
			stmt.executeQuery(String.format("update post set TITLE='%s', CONTENT='%s' where TITLE='%s' and CONTENT='%s' and ID='%s' and NUM= '%s'", title, content.trim(), title_old, content_old.trim(), id, num));
			res = true;
		}
		catch(SQLException e) {
			res = false;
			e.printStackTrace();
		}
		
		this.close();
		return res;
	}
	public boolean delete_post(String title, String content, String id, String num) {
		this.open();
		boolean res;
		try {
			Statement stmt = this.con.createStatement();
			stmt.executeQuery(String.format("delete POST where TITLE='%s' and CONTENT='%s' and ID='%s' and NUM='%s'", title, content.trim(), id, num));
			res = true;
		}
		catch(SQLException e) {
			res = false;
			e.printStackTrace();
		}
		
		this.close();
		return res;
	}
}
