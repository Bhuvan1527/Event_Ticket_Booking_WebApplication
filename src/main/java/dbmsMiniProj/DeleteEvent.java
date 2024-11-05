package dbmsMiniProj;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteEvent
 */
@WebServlet("/DeleteEvent")
public class DeleteEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] pkey = request.getParameter("key").split("!");
		DataBaseCon dbc = new DataBaseCon();
		try {
			Connection con = dbc.getConnection();
			String query = "delete from Events where eventCategory = '"+pkey[0]+"' and eventName = '"+pkey[1]+"' and cityName = '"+pkey[2]+"'";
			Statement stmt = con.createStatement();
			stmt.executeUpdate(query);
			con.close();
			dbc.closeConnection();
			response.sendRedirect("booking.jsp?deleteMesg=Successfully Deleted the Event");
		}
		catch(Exception ex) {
			response.sendRedirect("booking.jsp?deleteMesg=Sorry there was an error while deleting. Please try again.");
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
