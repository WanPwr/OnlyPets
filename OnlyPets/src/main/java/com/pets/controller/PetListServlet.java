package com.pets.controller;

import com.pets.dao.PetDAO;
import com.pets.model.Pet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/pets")
public class PetListServlet extends HttpServlet {

    private PetDAO petDAO = new PetDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch all pets from the database
            List<Pet> petList = petDAO.getAll();
            request.setAttribute("petList", petList);

            // Forward to JSP page to render pet list
            request.getRequestDispatcher("petList.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to error page or show error message
            response.sendRedirect("error.jsp");
        }
    }
}
