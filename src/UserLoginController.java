

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import view.DatabaseConnection;

/**
 * Servlet implementation class UserLoginController
 */
@WebServlet("/UserLoginController")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginController() {
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
		doGet(request, response);
		String phoneNum = request.getParameter("phoneNumber");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(true);
		session.setAttribute("customerID", phoneNum);
		request.setAttribute("customerID", phoneNum);
		
		
		//Connecting to Database
		
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			
			System.out.println("Again");		
			
			
			String phoneNumber = null;
			String password1 = null;
			System.out.println(phoneNum);
			Statement statement = con.createStatement();
			String query = "select password from Customer where phoneNumber ='" + phoneNum + "'";
			String query1 = "SELECT MD5('" + password + "')";
			ResultSet resultSet = statement.executeQuery(query);
			boolean result=false;
		

			if (resultSet.next()) {
				password1 = resultSet.getString(1);

			}
			resultSet.close();
			ResultSet resultSet2 = statement.executeQuery(query1);
			if (resultSet2.next()) {
				password = resultSet2.getString(1);

			}
			resultSet2.close();
			
			
			if ((password.equals(password1))) {
				result=true;
               }
			
			if (result) {
				RequestDispatcher requestDispatcher = request.getRequestDispatcher("SelectionPage.jsp");
				requestDispatcher.forward(request, response);
				System.out.println("final...");

			} else {
				
				out.println("<meta http-equiv='refresh' content='3;URL=index.jsp'>");//redirects after 3 seconds
				out.println("<p style='color:red;'>User or password incorrect!</p>");

				RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.html");
				requestDispatcher.forward(request, response);
				
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

}
