

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dbmsMiniProj.*;
import java.sql.*;

/**
 * Servlet implementation class AddEvent
 */
@WebServlet("/AddEvent")
public class AddEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getParameter("category")+" "+request.getParameter("eventName")+" "+ request.getParameter("city")
//		+" "+request.getParameter("eventDate")+" "+request.getParameter("eventTime")+" "
//		+ request.getParameter("totSeats") + " "+request.getParameter("availableSeats")
//		+ request.getParameter("price")+" "+request.getParameter("desc"));
		DataBaseCon dbc = new DataBaseCon();
		try {
			Connection con = dbc.getConnection();
			String query = "insert into Events values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, request.getParameter("category"));
			ps.setString(2, request.getParameter("eventName"));
			ps.setString(3, request.getParameter("city"));
			ps.setString(4,request.getParameter("eventDate"));
			ps.setString(5, request.getParameter("eventTime"));
			ps.setInt(6, Integer.parseInt(request.getParameter("totSeats")));
			ps.setInt(7, Integer.parseInt(request.getParameter("availableSeats")));
			ps.setDouble(8, Double.parseDouble(request.getParameter("price")));
			ps.setString(9, request.getParameter("desc"));
			ps.executeUpdate();
			con.close();
			dbc.closeConnection();
			response.sendRedirect("booking.jsp?addEventMesg=Successfully Added an Event.#addEvent");
		}
		catch(Exception ex) {
			response.sendRedirect("booking.jsp?addEventMesg=There is an error at server side. Please wait and try again.#addEvent");
			ex.printStackTrace();
		}
		
	}

}
