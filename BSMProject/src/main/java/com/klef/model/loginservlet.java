package com.klef.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginservlet")
public class loginservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/newproject";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Root";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get email and password from the request
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Set response content type
        response.setContentType("text/html;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            // Establish a connection to the database
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Prepare the SQL statement
                String sql = "SELECT * FROM login WHERE email = ? AND pass = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setString(1, email);
                    stmt.setString(2, password);

                    // Execute the query
                    try (ResultSet rs = stmt.executeQuery()) {
                        if (rs.next()) {
                            // User found, create a session
                            HttpSession session = request.getSession();
                            session.setAttribute("user", email);
           
                            // Redirect based on email
                            if ("admin@gmail.com".equals(email)) {
                                response.sendRedirect("adminpage.jsp");
                            } else {
                                response.sendRedirect("userpage.html");
                            }
                        } else {
                            // User not found, show error message
                            out.println("<h3>Invalid email or password. Please try again.</h3>");
                        }
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h3>Database connection problem.</h3>");
            }
        }
    }
}