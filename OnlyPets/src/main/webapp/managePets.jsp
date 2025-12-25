<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, com.pets.model.Pet, com.pets.dao.PetDAO" %>
<%
    String username = (String) session.getAttribute("username");
    List<Pet> petList = PetDAO.getPetsByOwner(username);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Manage Pets</title>
    <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Font+Awesome+5+Free&display=swap" rel="stylesheet" />
    <link href="./css/main.css" rel="stylesheet" />
</head>
<body>
<div class="v99_576">
    <!-- Navbar -->
    <div class="v102_2362">
        <div class="v102_2363">
            <span class="v102_2364"><a href="home.jsp">Home</a></span>
            <span class="v102_2371"><a href="profile.jsp">Profile</a></span>
            <span class="v102_2365"><a href="dashboard.jsp">Dashboard</a></span>
            <span class="v102_2366"><a href="managePets.jsp">Manage Pet</a></span>
            <div class="v102_2367"><span class="v102_2368"><a href="logout">Logout</a></span></div>
        </div>
        <div class="v102_2369"><span class="v102_2370">Only Pets</span></div>
    </div>

    <!-- Header & Add Button -->
    <div class="v99_657">
        <div class="v99_658">
            <div class="v99_662">
                <div class="v99_664"><span class="v99_665">My Pet Listings</span></div>
                <div class="v99_669"><span class="v99_670">Manage the animals you have put up for adoption.</span></div>
            </div>
            <div class="v99_674">
                <div class="v99_677"><span class="v99_678">+</span></div>
                <span class="v99_679"><a href="addPet.jsp">List New Pet</a></span>
            </div>
        </div>

        <!-- Table Header -->
        <div class="v99_681">
            <div class="v99_682">
                <div class="v99_683"><span class="v99_687">Photo</span></div>
                <div class="v99_689"><span class="v99_690">Name & ID</span></div>
                <div class="v99_692"><span class="v99_693">Category</span></div>
                <div class="v99_694"><span class="v99_695">Date Listed</span></div>
                <div class="v99_696"><span class="v99_697">Status</span></div>
                <div class="v99_699"><span class="v99_700">Actions</span></div>
            </div>

            <!-- Dynamic Pet Listing -->
            <%
                for(Pet pet : petList) {
            %>
            <div class="v99_701">
                <div class="v99_702">
                    <div class="v99_703">
                        <div class="v99_704">
                            <div class="v99_706">
                                <img src="uploads/<%= pet.getMainPhotoURL() %>" alt="Pet Photo" width="50" height="50"/>
                            </div>
                        </div>
                    </div>
                    <div class="v99_711">
                        <div class="v99_712"><span><%= pet.getName() %></span></div>
                        <span>#<%= pet.getPetID() %></span>
                    </div>
                    <div class="v99_717"><span><%= pet.getCategory() + " / " + pet.getBreed() %></span></div>
                    <div class="v99_720"><span><%= pet.getDateListed() != null ? pet.getDateListed() : "N/A" %></span></div>
                    <div class="v99_723">
                        <div class="v99_724">
                            <span><%= pet.isAdopted() ? "Adopted" : "Available" %></span>
                        </div>
                    </div>
                    <div class="v99_731">
                        <div class="v99_733">
                            <div class="v99_735">
                                <a href="editPet.jsp?id=<%= pet.getPetID() %>"><span class="v99_736">✏️</span></a>
                            </div>
                        </div>
                        <div class="v99_737">
                            <div class="v99_740">
                                <a href="deletePet?id=<%= pet.getPetID() %>" onclick="return confirm('Are you sure?')">
                                    <span class="v99_741">🗑️</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%
                }
            %>

        </div>
    </div>
</div>
</body>
</html>
