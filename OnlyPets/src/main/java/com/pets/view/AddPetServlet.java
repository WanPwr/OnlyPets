import java.io.IOException;
// Replaced javax.servlet with jakarta.servlet
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part; // Important for file upload

@WebServlet(name = "AddPetServlet", urlPatterns = {"/addPetHandler"})
// Required for processing file uploads (enctype="multipart/form-data")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class AddPetServlet extends HttpServlet {
    // Placeholder classes for compilation reference
    private static class Pet { 
        public void setListerID(int id) {}
        public void setName(String name) {}
        public void setCategory(String category) {}
        public void setBreed(String breed) {}
    } 
    private static class PetDAO { public static int insertPet(Pet pet) throws Exception { return 1; } }
    private static class PetPhotoDAO { public static void insertPhoto(int petID, String url, boolean isPrimary) {} }
    private static class FileUtil { public static String saveFile(Part part, String path) { return "/path/to/file"; } }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Get the Lister ID (from session, using placeholder for now)
        // int listerID = (int) request.getSession().getAttribute("listerID"); 
        int listerID = 1; 

        try {
            // 2. Extract pet details from request
            Pet pet = new Pet();
            pet.setListerID(listerID);
            pet.setName(request.getParameter("name"));
            pet.setCategory(request.getParameter("category"));
            pet.setBreed(request.getParameter("breed"));
            // ... set all other fields ...
            
            // 3. Insert Pet into database and retrieve the new ID
            int newPetID = PetDAO.insertPet(pet); 

            // 4. Handle Photos
            for (Part part : request.getParts()) {
                if (part.getName().equals("petPhotos") && part.getSize() > 0) {
                    
                    // 5. Save the file
                    String uploadPath = request.getServletContext().getRealPath("/uploads");
                    String photoURL = FileUtil.saveFile(part, uploadPath);
                    
                    // 6. Insert photo reference into PetPhotos table
                    boolean isPrimary = true; 
                    PetPhotoDAO.insertPhoto(newPetID, photoURL, isPrimary);
                    isPrimary = false; 
                }
            }
            
            // 7. Redirect to the newly created pet's detail page
            response.sendRedirect("petDetail?petID=" + newPetID);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Failed to list pet: " + e.getMessage());
            request.getRequestDispatcher("/add_pet.jsp").forward(request, response);
        }
    }
}