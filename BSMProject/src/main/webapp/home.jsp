<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Dashboard - Material Management</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #e9ecef; /* Light grey background */
	margin: 0;
	padding: 0;
}

#header {
	background-color: #007BFF; /* Primary blue */
	color: white;
	padding: 15px;
	text-align: left;
	font-size: 18px;
	font-weight: bold;
	position: relative;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

#button-container {
	position: relative;
}

#button-container form {
	display: inline-block;
}

#nav-menu {
	background-color: #343a40; /* Dark grey */
	padding: 10px;
	color: white;
}

#nav-menu a {
	color: #ced4da; /* Light grey */
	text-decoration: none;
	padding: 10px;
	display: inline-block;
}

#nav-menu a:hover {
	background-color: #495057; /* Slightly lighter grey */
	color: white;
}

#content {
	padding: 20px;
}

.dashboard-card {
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	padding: 20px;
	margin-bottom: 20px;
}

.dashboard-card h2 {
	margin-top: 0;
	color: #007BFF; /* Primary blue for headings */
}

.material-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.material-table th, .material-table td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

.material-table th {
	background-color: #f1f1f1; /* Light grey for table headers */
	color: #007BFF; /* Primary blue for table headers */
}

.material-table tr:nth-child(even) {
	background-color: #f9f9f9; /* Alternating row colors */
}

.profile-section {
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	margin-top: 20px;
}

.profile-section h2 {
	color: #28a745; /* Green color for profile section heading */
}

.profile-section input {
	padding: 10px;
	width: calc(100% - 22px);
	margin-bottom: 10px;
	border: 1px solid #ced4da; /* Light grey border */
	border-radius: 4px;
}

.profile-section button {
	background-color: #28a745; /* Green background */
	color: white;
	border: none;
	padding: 10px 20px;
	border-radius: 4px;
	cursor: pointer;
}

.profile-section button:hover {
	background-color: #218838; /* Darker green for hover effect */
}
</style>
</head>
<body>
	<div id="header">
		<h1>WELCOME USER</h1>
		<div id="button-container">
			<form action="logoutservlet" method="post">
				<button type="submit">Logout</button>
			</form>
		</div>
	</div>
	<div id="nav-menu">
		<a href="#dashboard">Dashboard</a> <a href="#materials">Materials</a>
		<a href="#profile">Profile</a>
	</div>
	<div id="content">
		<!-- Dashboard Section -->
		<div id="dashboard" class="dashboard-card">
			<h2>Dashboard</h2>
			<p>Welcome to your dashboard. Here you can see an overview of
				your recent activities and important notifications.</p>
			<!-- Add additional dashboard features here -->
		</div>

		<!-- Materials Overview Section -->
		<div id="materials" class="dashboard-card">
			<h2>Materials Overview</h2>
			<table class="material-table">
				<thead>
					<tr>
						<th>Material ID</th>
						<th>Name</th>
						<th>Quantity</th>
						<th>Location</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Material A</td>
						<td>100</td>
						<td>Warehouse 1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Material B</td>
						<td>50</td>
						<td>Warehouse 2</td>
					</tr>
					<!-- Add more rows as needed -->
				</tbody>
			</table>
		</div>

		<!-- Profile Management Section -->
		<div id="profile" class="profile-section">
			<h2>Profile Management</h2>
			<form action="updateProfileServlet" method="post">
				<input type="text" name="username" placeholder="Username" required />
				<input type="email" name="email" placeholder="Email" required />
				<input type="password" name="password" placeholder="New Password" />
				<input type="password" name="confirm_password" placeholder="Confirm Password" />
				<button type="submit">Update Profile</button>
			</form>
		</div>
	</div>
</body>
</html>
