<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.pets.model.Pet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pet Adoption</title>
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
    <link href="./css/main.css" rel="stylesheet" />
</head>
<body>
    <h1>Find yourself a little furry friend now!</h1>
    <div class="pet-list">
        <%
            List<Pet> pets = (List<Pet>) request.getAttribute("petList");
            if (pets != null && !pets.isEmpty()) {
                for (Pet pet : pets) {
        %>
        <div class="pet-card">
            <div class="pet-photo">
                <img src="<%= pet.getMainPhotoURL() %>" alt="<%= pet.getName() %>" width="150" />
            </div>
            <div class="pet-info">
                <h2><%= pet.getName() %></h2>
                <p><strong>Category:</strong> <%= pet.getCategory() %></p>
                <p><strong>Breed:</strong> <%= pet.getBreed() %></p>
                <p><strong>Age:</strong> <%= pet.getAgeInMonths() / 12 %> years, <%= pet.getAgeInMonths() % 12 %> months</p>
                <p><strong>Gender:</strong> <%= pet.getGender() %></p>
                <p><strong>City:</strong> <%= pet.getLocationCity() %></p>
                <p><strong>Adoption Fee:</strong> $<%= String.format("%.2f", pet.getAdoptionFee()) %></p>
                <p><strong>Description:</strong> <%= pet.getDescription() %></p>
            </div>
        </div>
        <%      }
            } else { %>
            <p>No pets available for adoption at the moment.</p>
        <% } %>
    </div>
</body>
</html>
