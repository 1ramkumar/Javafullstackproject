package com.klef.model;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/alluserservlet")
public class alluserservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public alluserservlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> emails = new ArrayList<>();
        
        Connection co = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            co = DriverManager.getConnection("jdbc:mysql://localhost:3306/newproject", "root", "Root");

            PreparedStatement ps = co.prepareStatement("SELECT email FROM login");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                emails.add(rs.getString("email"));
            }
            
            request.setAttribute("emailList", emails);
            RequestDispatcher rd = request.getRequestDispatcher("allusers.jsp");
            rd.forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
            RequestDispatcher rd = request.getRequestDispatcher("error.jsp"); // Redirect to an error page if needed
            rd.forward(request, response);
        } finally {
            if (co != null) {
                try {
                    co.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
