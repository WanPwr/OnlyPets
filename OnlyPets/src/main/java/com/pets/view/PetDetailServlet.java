import java.io.IOException;
import java.util.List;
// Replaced javax.servlet with jakarta.servlet
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "PetDetailServlet", urlPatterns = {"/petDetail"})
public class PetDetailServlet extends HttpServlet {
    // Placeholder classes for compilation reference
    private static class Pet { public String getCategory() { return ""; } } 
    private static class PetPhoto { } 
    private static class PetDAO { 
        public static Pet findPetById(int id) { return new Pet(); } 
        public static List<Pet> findRelatedPets(int id, String category) { return List.of(); } 
    }
    private static class PetPhotoDAO { 
        public static List<PetPhoto> findPhotosByPetId(int id) { return List.of(); } 
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Get petID from URL parameter
        String petIdStr = request.getParameter("petID");
        if (petIdStr == null || petIdStr.isEmpty()) {
            response.sendRedirect("home"); 
            return;
        }

        try {
            int petID = Integer.parseInt(petIdStr);
            
            // 2. Fetch main pet details
            Pet pet = PetDAO.findPetById(petID);
            
            if (pet == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Pet not found.");
                return;
            }
            
            // 3. Fetch pet photos
            List<PetPhoto> photos = PetPhotoDAO.findPhotosByPetId(petID);

            // 4. Fetch related pets
            List<Pet> relatedPets = PetDAO.findRelatedPets(petID, pet.getCategory());
            
            // 5. Set attributes and forward
            request.setAttribute("pet", pet);
            request.setAttribute("photos", photos);
            request.setAttribute("relatedPets", relatedPets);
            
            request.getRequestDispatcher("/pet_detail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Pet ID format.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading pet details.");
        }
    }
}