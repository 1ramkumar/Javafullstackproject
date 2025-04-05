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

@WebServlet("/agentsservlet")
public class agentsservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public agentsservlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<agent> agents = new ArrayList<>();
        
        // Get location parameter from the request
        String location = request.getParameter("location");

        Connection co = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            co = DriverManager.getConnection("jdbc:mysql://localhost:3306/newproject", "root", "Root");

            // SQL query with location filter
            String sql = "SELECT id, email, name, phno, location FROM agents";
            if (location != null && !location.isEmpty()) {
                sql += " WHERE location = ?";
            }

            PreparedStatement ps = co.prepareStatement(sql);
            if (location != null && !location.isEmpty()) {
                ps.setString(1, location);
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                agent agent = new agent();
                agent.setId(rs.getInt("id"));
                agent.setEmail(rs.getString("email"));
                agent.setEname(rs.getString("name"));
                agent.setPhno(rs.getLong("phno"));
                agent.setLocation(rs.getString("location"));
                agents.add(agent);
            }

            request.setAttribute("agentList", agents);
            RequestDispatcher rd = request.getRequestDispatcher("agents.jsp");
            rd.forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
            RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
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
