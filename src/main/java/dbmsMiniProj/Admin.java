package dbmsMiniProj;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Admin {
	private String usrname;
	private String passwd;
	private String name;
	
	public Admin(String usrname, String passwd, String name) {
		this.usrname = usrname;
		this.passwd = passwd;
		this.name = name;
	}

	public Admin(String usrname, String passwd) {
		this.usrname = usrname;
		this.passwd = passwd;
	}
	
	public int login() {
		DataBaseCon dbc = new DataBaseCon();
		int res = 0;
		try {
			Connection con = dbc.getConnection();
			String query = "select username, passwd from admins where username = '"+this.usrname+"'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()) {
				if(this.passwd.equals(rs.getString("passwd"))) {
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
			String query = "select name from admins where username = '"+this.usrname+"'";
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
