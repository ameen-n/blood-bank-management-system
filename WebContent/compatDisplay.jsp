<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.lang.Exception" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <title>IIT Blood Bank</title>
</head>
<body>
   <div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
      <a href="Home.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32"><use href="logo.jpeg"/></svg>
        <span class="fs-4">IIT Blood Bank</span>
      </a>

      <ul class="nav nav-pills">
        <li class="nav-item"><a href="adminHome.jsp" class="nav-link" aria-current="page">Home</a></li>
        <li class="nav-item">
	        <form class="navbar-form" action = "DisplayDonors" method = POST>
				<button type="submit" class="btn text-primary">Donors</button>
			</form>
		</li>
        <li class="nav-item"> 
        <form class="navbar-form" action = "DisplayRequests" method = POST>
				<button type="submit" class="btn text-primary">Requests</button>
			</form>
        <li class="nav-item">
        <li class="nav-item"><a href="compatDisplay.jsp" class="nav-link active" aria-current="page">Compatibility Chart</a></li>
        <li class="nav-item"><a href="newDonation.jsp"class="nav-link">New Donation </a></li>
        <li class="nav-item"><a href="processRequest.jsp" class="nav-link">Process request </a></li>
        <li class="nav-item"> 
        <form class="navbar-form" action = "viewBloodStock" method = POST>
				<button type="submit" class="btn text-primary">Blood Stock</button>
			</form>
        <li class="nav-item">
        <li class="nav-item"> 
        <form class="navbar-form" action = "viewPast" method = POST>
				<button type="submit" class="btn text-primary">Past Transfusions</button>
			</form>
        <li class="nav-item">
         <li class="nav-item"><a href="Home.jsp" class="nav-link">Logout </a></li>
      </ul>
    </header>
  </div>

<!-- Begin page content -->
<main class="flex-shrink-0">
  <div style="width: 60%;" class="container">
    <h1 class="mt-5">Compatibility Chart</h1>
    <p class="lead">Blood Group in row can donate to Blood Group in column</p>
    <div class="bd-example">
        <table class="table table-striped">
          <thead>
          <tr>
          	<th scope="col">Can donate to</th>
            <th scope="col">O+</th>
            <th scope="col">O-</th>
            <th scope="col">A+</th>
            <th scope="col">A-</th>
            <th scope="col">B+</th>
            <th scope="col">B-</th>
            <th scope="col">AB+</th>
            <th scope="col">AB-</th>
            </tr>
          </thead>
          <tbody>
          <% 
          try{
         Connection con = null;
   		String url = "jdbc:mysql://localhost:3306/bloodbank"; //MySQL URL and followed by the database name
   		String username = "bbmsuser"; //MySQL username
   		String password = "Pass@123"; //MySQL password
  		
   		Class.forName("com.mysql.jdbc.Driver");
  		con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
   		//System.out.println("Printing connection object "+con);
   		
   		Statement stmt = con.createStatement();
   		ResultSet rs = stmt.executeQuery("select * from canDonate");
   		int arr[][] = new int[8][8];
   		for(int i=0; i<8; i++)
   			for(int j=0; j<8; j++)
   				arr[i][j]=0;
   		//System.out.println("Printing connection object 2"+con);
   		ArrayList Rows = new ArrayList();
  		while(rs.next())
  		{
  			int typeIDDonor = rs.getInt("typeIDDonor");
			int typeIDRecipient = rs.getInt("typeIDRecipient");
			arr[typeIDRecipient-1][typeIDDonor-1] = 1;
  		}
  		for(int i = 0; i < 8; i++){
	    	%> 
	    	<tr><th><%
	    	String BloodTypeR;
	    	switch(i+1)
			{
			case 1:
				BloodTypeR = "O+";
				break;
			case 2:
				BloodTypeR = "O-";
				break;
			case 3:
				BloodTypeR = "A+";
				break;
			case 4:
				BloodTypeR = "A-";
				break;
			case 5:
				BloodTypeR = "B+";
				break;
			case 6:
				BloodTypeR = "B-";
				break;
			case 7:
				BloodTypeR = "AB+";
				break;
			case 8:
				BloodTypeR = "AB-";
				break;
			default:
				BloodTypeR = "O+";
				break;
			}
			out.println(BloodTypeR);%></th>
	    	<% 
		 	for(int j = 0; j < 8; j++){
			 		%> <td> <% if(arr[i][j]==0) out.println("No");
			 		else out.println("Yes");
			 		}
			 			 %> </td> <%
			 	}
		 	%>
		 	</tr>
	    	<% 
  		}
  		
          catch(Exception e){
        	  out.println(e);
          }
		 %>
		
          </tbody>
        </table>
        </div>
    

  </div>
</main>

<div class="fixed-bottom container">
  <footer class="py-3 my-4">
    <hr/>
    <p class="text-center text-muted">&copy; IIT Dharwad, 2021</p>
  </footer>
</div>

</body>
</html>