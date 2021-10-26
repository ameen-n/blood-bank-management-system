<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Request Form</title>
</head>
<body>
<h1>Request form</h1>

<form action="AddServlet" method="POST">
			<table style="with: 50%">
				<tr>
					<td>Name</td>
					<td><input type="text" required value ="" name="name" /></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td><input type="text" required value ="" name="gender" /></td>
				</tr>
				<tr>
					<td>Date of Birth (YYYY-MM-DD)</td>
					<td><input type="text" required value ="" name="date" /></td>
				</tr>
					<tr>
					<td>Address</td>
					<td><input type="text" required value ="" name="address" /></td>
				</tr>
					<tr>
					<td>Blood Type</td>
					<td><select name="bloodtype">
							<option value = 1> O +ve </option>
							<option value = 2> O -ve </option>
							<option value = 3> A +ve </option>
							<option value = 4> A -ve </option>
							<option value = 5> B +ve </option>
							<option value = 6> B -ve </option>
							<option value = 7> AB +ve </option>
							<option value = 8> AB -ve </option>
	
						</select>
					</td>
					
					
				</tr>
					<tr>
					<td>Contact Number</td>
					<td><input type="number" required value ="" name="contactno" /></td>
				</tr>

			</table>
			<input type="submit" value="Submit" /></form><br>
Click <a href = Home.jsp>here</a> to go back.
</body>
</html>
