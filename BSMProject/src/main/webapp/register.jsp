<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>College Project - Registration</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-image:
		url("https://i.pinimg.com/564x/4b/fc/65/4bfc655d8840cfc67b35567d767cd09f.jpg");
	/* Replace with your image URL */
	background-size: cover;
	/* Ensure the image covers the entire viewport */
	background-position: center; /* Center the image */
	background-repeat: no-repeat; /* Prevent the image from repeating */
	background-color: #f0f2f5; /* Fallback color */
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh; /* Use viewport height for full height */
	margin: 0;
}

.registration-container {
	width: 550px;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
	background-color: #ffffff; /* White background for the container */
	color: #333; /* Dark text color for contrast */
}

.registration-container h2 {
	text-align: center;
	color: #333; /* Dark text color */
}

.registration-container table {
	width: 100%;
	max-width: 500px; /* Limit the width of the table */
	border-radius: 5px;
	border-collapse: collapse;
	margin: 0 auto; /* Center the table within the container */
}

.registration-container table td {
	padding: 10px;
	vertical-align: top; /* Align labels to the top */
}

.registration-container td.label {
	width: 30%; /* Shorter width for labels */
	text-align: right; /* Align labels to the right */
}

.registration-container td.input {
	width: 70%; /* Adjusted width for input fields */
}

.registration-container input[type="text"], .registration-container input[type="tel"],
	.registration-container input[type="email"], .registration-container input[type="password"]
	{
	width: 100%; /* Input fields take full width of their container */
	max-width: 300px; /* Maximum width of the input fields */
	padding: 8px; /* Reduced padding */
	font-size: 14px; /* Smaller font size */
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #f8f8f8; /* Light grey background for input fields */
	color: #333; /* Dark text color */
}

.registration-container input[type="submit"] {
	display: block;
	width: 50%; /* Adjusted width to be smaller */
	padding: 8px; /* Reduced padding */
	background-color: #007BFF; /* Blue background */
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 14px; /* Reduced font size */
	margin: 0 auto; /* Center the button */
	margin-top: 8px;
}

.registration-container input[type="submit"]:hover {
	background-color: #0056b3; /* Darker blue on hover */
}
</style>
</head>
<body>
	<div class="registration-container">
		<h2>Registration Page</h2>
		<form action="registerservlet" method="post">
			<table>
				<tr>
					<td class="label"><label for="name">Name:</label></td>
					<td class="input"><input type="text" id="name" name="name"
						required="required" /></td>
				</tr>
				<tr>
					<td class="label"><label for="phno">Phone Number:</label></td>
					<td class="input"><input type="tel" id="phno" name="phno"
						required="required" pattern="[0-9]{10}" /></td>
				</tr>
				<tr>
					<td class="label"><label for="email">Email:</label></td>
					<td class="input"><input type="email" id="email" name="email"
						required="required" /></td>
				</tr>
				<tr>
					<td class="label"><label for="password">Password:</label></td>
					<td class="input"><input type="password" id="password"
						name="password" required="required" /></td>
				</tr>
				<tr>
					<td class="label"><label for="confirm_password">Confirm
							Password:</label></td>
					<td class="input"><input type="password" id="confirm_password"
						name="confirm_password" required="required" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="submit" value="Register" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
