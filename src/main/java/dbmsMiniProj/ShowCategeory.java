package dbmsMiniProj;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowCategeory
 */
@WebServlet("/ShowCategeory")
public class ShowCategeory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowCategeory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		DataBaseCon dbc = new DataBaseCon();
		out.append("Event Category: <select class=\"form-select mb-2\"\n"+ "aria-label=\"eventCat\" id=\"eventCategory\">");
		out.append("<option value=\"default\" selected>Select Event Category</option>");
		try {
			Connection con = dbc.getConnection();
			String query = "select distinct eventCategory from Events where cityName = '"+request.getParameter("city")+"'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while(rs.next()) {
				out.append("<option value=\""+rs.getString("eventCategory")+"\"> "+rs.getString("eventCategory")+"</option>");
			}
			out.append("</select>");
			con.close();
			dbc.closeConnection();
			//System.out.println("Hello");
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
}
