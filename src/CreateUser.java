

import java.io.IOException;
import javax.swing.JOptionPane;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import view.DatabaseConnection;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/CreateUser")
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	private void msgbox(String s){
		JOptionPane.showMessageDialog(null, s);
	}
	
    public CreateUser() {
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
        try {
			Connection con = DatabaseConnection.initializeDatabase();
			System.out.println("conn established...");
			String name=request.getParameter("firstName");
			PreparedStatement query = con.prepareStatement(
					"insert into Customer(firstName,lastName,emailID,phoneNumber,gender,DOB,password) values(?,?,?,?,?,?,md5(?))");
			
			if(request.getParameter("password").equals(request.getParameter("reEnterPassword"))) {
			query.setString(1, request.getParameter("firstName"));
			query.setString(2, request.getParameter("lastName"));
			query.setString(3, request.getParameter("emailID"));
			query.setString(5, request.getParameter("gender"));
			query.setString(6, request.getParameter("dateOfBirth"));
			query.setString(4, request.getParameter("mobileNumber"));
			query.setString(7, request.getParameter("password"));
			
			query.executeLargeUpdate();

			System.out.println("inserted..");
			
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);

			}
			else
			{
				msgbox("Passwords do not match!!");
				RequestDispatcher rd = request.getRequestDispatcher("Register.jsp");
				rd.forward(request, response);

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
