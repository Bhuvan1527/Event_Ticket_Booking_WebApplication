

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbmsMiniProj.User;

/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
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
		User usr = new User(request.getParameter("usrname"),request.getParameter("passwd"),request.getParameter("emailID"),request.getParameter("phno"),request.getParameter("name"));
		int ans = usr.signUp();
		if(ans == 0) {
			HttpSession session = request.getSession();
			synchronized (session) {
				session.setAttribute("usrname", request.getParameter("usrname"));
				session.setAttribute("name", request.getParameter("name"));
				session.setAttribute("type", "user");
			}
			response.sendRedirect("booking.jsp");
		}
		else if(ans == 1) {
			response.sendRedirect("main.jsp?sue=Please Select a Different User Name.#signup");
		}
		else {
			response.sendRedirect("main.jsp?sue=Error on server side, please try again later#signup");
		}
	}

}
