package dbmsMiniProj;
import java.sql.*;


public class User {
	private String usrname;
	private String passwd;
	private String email;
	private String phno;
	private String name;
	
	
	public User(String usrname, String passwd, String email, String phno, String name) {
		this.usrname = usrname;
		this.passwd = passwd;
		this.email = email;
		this.phno = phno;
		this.name = name;
	}
	
	public User(String usrname, String passwd) {
		super();
		this.usrname = usrname;
		this.passwd = passwd;
	}
	
	public int signUp() {
		int res = 0;
		DataBaseCon dbc = new DataBaseCon();
		try {
			Connection con = dbc.getConnection();
			String query = "select userName from Users where userName = '"+this.usrname+"'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				res = 1;
			}
			else {
				query = "insert into Users values (?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, this.usrname);
				ps.setString(2,  this.passwd);
				ps.setString(3, this.email);
				ps.setString(4, this.phno);
				ps.setString(5, this.name);
				ps.executeUpdate();
				res = 0;
			}
			con.close();
			dbc.closeConnection();
		}
		catch(Exception ex) {
			ex.printStackTrace();
			res = -1;
		}
		return res;
	}

	public int login() {
		DataBaseCon dbc = new DataBaseCon();
		int res = 0;
		try {
			Connection con = dbc.getConnection();
			String query = "select userName, password from Users where userName = '"+this.usrname+"'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				if(this.passwd.equals(rs.getString("password"))) {
					res = 0;
				}
				else {
					res = 1;
				}
			}
			else {
				res = 2;
			}
			con.close();
			dbc.closeConnection();
		}
		catch(Exception exc) {
			exc.printStackTrace();
			res = -1;
		}
		
		return res;
	}
	
	public String getName() {
		DataBaseCon dbc = new DataBaseCon();
		String ans = "";
		try {
			Connection con = dbc.getConnection();
			Statement stmt = con.createStatement();
			String query = "select name from Users where userName = '"+this.usrname+"'";
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				ans = rs.getString("name");
			}
			con.close();
			dbc.closeConnection();
		}
		catch(Exception exc) {
			exc.printStackTrace();
			ans = null;
		}
		
		return ans;
	}
	
}
