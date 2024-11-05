package dbmsMiniProj;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseCon {
	private String url;
	private String user;
	private String pass;
	private Connection c;
	
	public DataBaseCon(){
		this.url = "jdbc:mysql://localhost:3306/miniProj";
		this.user = "root";
		this.pass = "Bala@123";
	}
	
	public Connection getConnection() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.cj.jdbc.Driver");
		this.c = DriverManager.getConnection(this.url, this.user, this.pass);
		return this.c;
	}
	
	public void closeConnection() throws SQLException{
		this.c.close();
	}
}
