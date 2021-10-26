import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddServlet
 */
@WebServlet("/DisplayDonors")
public class DisplayDonors extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayDonors() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		out.println("<html><body>");
				try
		{
	
		//getting input values from jsp page
		
			
		


		Connection con = null;
 		String url = "jdbc:mysql://localhost:3306/bloodbank"; //MySQL URL and followed by the database name
 		String username = "project1"; //MySQL username
 		String password = "password"; //MySQL password
		
 		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
 		System.out.println("Printing connection object "+con);
 		
 		Statement stmt = con.createStatement();
 		ResultSet rs = stmt.executeQuery("select * from Donor");
 		out.println("<table border = 1 width = 50% height = 50%");
 		System.out.println("Printing connection object 2"+con);
 		out.println("<tr><th>ID</th><th>Name</th><th>Gender</th><th>Date of Birth</th><th>Address</th><th>Is Smoker</th><th>Major Diseases</th><th>Contact No</th><th>Blood Type</th><th>Edit</th><th>Delete</th><tr>");  
		while(rs.next())
		{
			System.out.println("Printing connection object 3"+con);
			int donorID = rs.getInt("donorID");
			String name = rs.getString("name");
			String gender = rs.getString("gender");
			Date date = rs.getDate("DOB");
			String address = rs.getString("address");
			int isSmoker = rs.getInt("isSmoker");
			int majorDiseases = rs.getInt("majorDiseases");
			String contactNo = rs.getString("contactNo");
			int typeID = rs.getInt("typeID");
			String BloodType = null;
			switch(typeID)
			{
			case 1:
				BloodType = "O +ve";
				break;
			case 2:
				BloodType = "O -ve";
				break;
			case 3:
				BloodType = "A +ve";
				break;
			case 4:
				BloodType = "A -ve";
				break;
			case 5:
				BloodType = "B +ve";
				break;
			case 6:
				BloodType = "B -ve";
				break;
			case 7:
				BloodType = "AB +ve";
				break;
			case 8:
				BloodType = "AB -ve";
				break;
			default:
				BloodType = "O +ve";
				break;
			}
			out.println("<tr><td>" + donorID + "</td><td>"+ name + "</td><td>" + gender + "</td><td>" + date + "</td><td>" + address + "</td><td>" + isSmoker + "</td><td>" + majorDiseases + "</td><td>" + contactNo + "</td><td>" + BloodType+ "</td><td>" + "<a href = \"updateDonor.jsp\" id =\""+donorID+"\"> Edit </a>" + "</td><td>" + "<a href = \"deleteDonor.jsp\" id =\""+donorID+"\" > Delete </a>" + "</td></tr>");
		}
		 out.println("</table>");  
		 out.println("</html></body>");  
         con.close();  

		//Checks if insert is successful.If yes,then redirects to Result.jsp page 
		

		}
		 catch (Exception e) 
 		{
 			out.println("Error");
 		}

		
	}

}