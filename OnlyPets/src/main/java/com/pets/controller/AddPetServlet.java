package com.pets.controller;

import com.pets.dao.PetDAO;
import com.pets.model.Pet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addPetHandler")
public class AddPetServlet extends HttpServlet {

    private PetDAO petDAO = new PetDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Get the logged-in lister ID from session
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("listerID") == null) {
            response.sendRedirect("login.jsp"); // Redirect if not logged in
            return;
        }
        int listerID = (Integer) session.getAttribute("listerID");

        Pet pet = new Pet();
        pet.setName(request.getParameter("name"));
        pet.setCategory(request.getParameter("category"));
        pet.setBreed(request.getParameter("breed"));

        String ageStr = request.getParameter("ageInMonths");
        pet.setAgeInMonths(ageStr == null || ageStr.isEmpty() ? 0 : Integer.parseInt(ageStr));

        pet.setGender(request.getParameter("gender"));
        pet.setDescription(request.getParameter("description"));

        pet.setVaccinated("true".equals(request.getParameter("isVaccinated")));
        pet.setDewormed("true".equals(request.getParameter("isDewormed")));
        pet.setNeutered("true".equals(request.getParameter("isNeutered")));

        pet.setLocationCity(request.getParameter("locationCity"));

        String feeStr = request.getParameter("adoptionFee");
        pet.setAdoptionFee(feeStr == null || feeStr.isEmpty() ? 0.0 : Double.parseDouble(feeStr));

        // Placeholder for photo upload
        pet.setMainPhotoURL("uploads/default.jpg");

        try {
            // Pass the listerID to the DAO
            petDAO.insert(pet, listerID);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addPet.jsp?error=1");
            return;
        }

        response.sendRedirect("index.jsp");
    }
}
