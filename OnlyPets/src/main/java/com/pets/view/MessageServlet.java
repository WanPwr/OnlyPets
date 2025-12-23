import java.io.IOException;
// Replaced javax.servlet with jakarta.servlet
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "MessageServlet", urlPatterns = {"/contactHandler"})
public class MessageServlet extends HttpServlet {
    // Placeholder classes for compilation reference
    private static class Message { 
        public void setPetID(int id) {}
        public void setInquireEmail(String email) {}
        public void setInquireName(String name) {}
        public void setMessage(String msg) {}
    }
    private static class MessageDAO { public static void insertMessage(Message msg) throws Exception {} }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Extract form data
        String petIdStr = request.getParameter("petID");
        String inquireEmail = request.getParameter("emailAddress");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String messageBody = request.getParameter("message");
        
        int petID = 0;
        try {
            petID = Integer.parseInt(petIdStr);
            
            // 2. Create the Message object 
            Message message = new Message();
            message.setPetID(petID);
            message.setInquireEmail(inquireEmail);
            message.setInquireName(firstName + " " + lastName);
            message.setMessage(messageBody);
            
            // 3. Insert into the Message table
            MessageDAO.insertMessage(message); 
            
            // 4. Redirect back to the pet detail page with a success message
            request.getSession().setAttribute("successMessage", "Your inquiry has been sent!");
            response.sendRedirect("petDetail?petID=" + petID);

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Pet ID or other data format.");
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("errorMessage", "Failed to send message.");
            response.sendRedirect("petDetail?petID=" + petID); 
        }
    }
}