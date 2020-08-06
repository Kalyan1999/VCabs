

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import view.DatabaseConnection;

/**
 * Servlet implementation class RideController
 */
@WebServlet("/RideController")
public class RideController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RideController() {
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
		
		
		PrintWriter out = response.getWriter();
		System.out.println("in RideController");
		
	try {
		Connection connection = DatabaseConnection.initializeDatabase();
		System.out.println("connected...");

		String source1=(String)request.getParameter("source");
		String destination1=(String)request.getParameter("destination");
		Double amount1=Double.parseDouble(request.getParameter("costEstimate"));
		String carType1=null;
		String val = request.getParameter("type");
		String type = null;
		if(val.equals("6")){
		   carType1 = "Micro";
		 }if(val.equals("8")){
		   carType1 = "Mini";
		 }if(val.equals("18")){
		   carType1 ="SUV";
		 }

		HttpSession session = request.getSession();
		String customerID1 = (String) (session.getAttribute("customerID"));


	    PreparedStatement query = connection.prepareStatement(
				   "insert into Ride(driverId,customerId,source,destination,amount,carType,bookingTime) values(?,?,?,?,?,?,NOW())");

		
		
	    query.setString(2,customerID1);
	    query.setString(3,source1);
	    query.setString(4,destination1);
	    query.setDouble(5,amount1);
	    query.setString(6,carType1);
	     
	    PreparedStatement query1 = connection.prepareStatement("select phoneNumber from Driver where status = 'Available'");
		ResultSet resultSet = query1.executeQuery();
	    String currPhoneNumber=null;

		if(resultSet.next()){
			currPhoneNumber=resultSet.getString(1);
			System.out.println(currPhoneNumber);
			query.setString(1, resultSet.getString(1));
		}
		else
		{
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("HomePage.jsp");
			requestDispatcher.forward(request, response);

		}

		
	    query.executeUpdate();
	    System.out.println(currPhoneNumber);
	    PreparedStatement query2=connection.prepareStatement("update Driver set status='No' where phoneNumber="+currPhoneNumber);
		query2.executeUpdate();
		System.out.println("update successful....");



		RequestDispatcher requestDispatcher = request.getRequestDispatcher("ConfirmBookingPage.jsp");
		requestDispatcher.forward(request, response);



		}catch(Exception e){
			
	
		}
        
        
		



		

	}

}
