

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbmsMiniProj.Admin;
import dbmsMiniProj.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		int ans = 0;
		String name = "";
		if(request.getParameter("usrType").equals("user")) {
			User usr = new User(request.getParameter("usrname"), request.getParameter("passwd"));
			ans = usr.login();
			name = usr.getName();
		}
		else {
			Admin ad = new Admin(request.getParameter("usrname"), request.getParameter("passwd"));
			ans = ad.login();
			name = ad.getName();
		}
		
		if(ans == 0) {
			HttpSession session = request.getSession();
			
			synchronized (session) {
				session.setAttribute("usrname", request.getParameter("usrname"));
				if(name != null) session.setAttribute("name", name);
				if(request.getParameter("usrType").equals("user")) {
					session.setAttribute("type", "user");
				}
				else {
					session.setAttribute("type", "admin");
				}
			}
			response.sendRedirect("booking.jsp");
		}
		else if(ans == 1) {
			response.sendRedirect("main.jsp?loginError=Incorrect Password#login");
		}
		else if(ans == 2) {
			response.sendRedirect("main.jsp?loginError=Incorrect Username#login");
		}
		else {
			response.sendRedirect("main.jsp?loginError=Error at server side, please try again later.#login");
		}
	}

}
