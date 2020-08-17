

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * Servlet implementation class CreateDriver
 */
@WebServlet("/CreateDriver")
public class CreateDriver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateDriver() {
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
        	
        	PrintWriter out = response.getWriter();
        	
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
			
			PreparedStatement query1 = con.prepareStatement(
					"insert into Driver(firstName,lastName,emailID,phoneNumber,DOB,cabNumber,status) values(?,?,?,?,?,?,?)");
			
		query1.setString(1, request.getParameter("firstName"));
		query1.setString(2, request.getParameter("lastName"));
		query1.setString(3, request.getParameter("emailID"));
		query1.setString(4, request.getParameter("mobileNumber"));
		query1.setString(5, request.getParameter("dateOfBirth"));
		query1.setString(6, request.getParameter("cabNumber"));
		query1.setNString(7, "Available");

		query1.executeLargeUpdate();

			
			RequestDispatcher rd = request.getRequestDispatcher("index.html");
			rd.forward(request, response);

			}
			else
			{

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
