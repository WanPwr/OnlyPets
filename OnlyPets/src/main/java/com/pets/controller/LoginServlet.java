package com.pets.controller;

import com.pets.dao.ListerDAO;
import com.pets.model.Lister;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/loginHandler")
public class LoginServlet extends HttpServlet {

    private ListerDAO listerDAO = new ListerDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Lister lister = listerDAO.authenticate(email, password);
            if (lister != null) {
                // Successful login
                HttpSession session = request.getSession();
                session.setAttribute("lister", lister);
                response.sendRedirect("index.jsp"); // Redirect to homepage
            } else {
                // Failed login
                response.sendRedirect("login.jsp?error=1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
