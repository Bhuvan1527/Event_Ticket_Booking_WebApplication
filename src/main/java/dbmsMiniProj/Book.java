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
 * Servlet implementation class Book
 */
@WebServlet("/Book")
public class Book extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Book() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		DataBaseCon dbc = new DataBaseCon();
		PrintWriter out = response.getWriter();
		String[] pkey = request.getParameter("key").split("!");
		out.append(request.getParameter("ticketCount")+" 1 "+pkey[0]+" 2 "+pkey[1]+" 3 "+pkey[2]);
		try {
			Connection con = dbc.getConnection();
			String query = "select * from Events where eventCategory = '"+pkey[0]+"' and eventName = '"+pkey[1]+"' and cityName = '"+pkey[2]+"'";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			int tc = Integer.parseInt(request.getParameter("ticketCount"));
			if(rs.next()) {
				double tPrice = rs.getDouble("ticketPrice");
				if(rs.getInt("availableSeats") < tc) {
					con.close();
					dbc.closeConnection();
					response.sendRedirect("booking.jsp?bookMesg=Invalid Ticket Count");
				}
				con.setAutoCommit(false);
				query = "insert into orders(username, eventName, cityName, numberOfTickets, orderPrice, status, bookingDate, eventCat) values(?,?,?,?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, (String)request.getSession().getAttribute("usrname"));
				ps.setString(2, pkey[1]);
				ps.setString(3, pkey[2]);
				ps.setInt(4, Integer.parseInt(request.getParameter("ticketCount")));
				ps.setDouble(5, tPrice*Integer.parseInt(request.getParameter("ticketCount")));
				ps.setString(6, "Booked");
				long millis=System.currentTimeMillis();  
				ps.setDate(7, new java.sql.Date(millis));
				ps.setString(8, pkey[0]);
				ps.executeUpdate();
				query = "update Events set availableSeats = availableSeats - "+tc+" where eventCategory = '"+pkey[0]+"' and eventName = '"+pkey[1]+"' and cityName = '"+pkey[2]+"'";
				stmt.executeUpdate(query);
				con.commit();
				con.close();
				dbc.closeConnection();
				request.getRequestDispatcher("billDetails.jsp").forward(request, response);
			}
			
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
