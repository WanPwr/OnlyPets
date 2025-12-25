package com.pets.dao;

import com.pets.model.Pet;
import com.pets.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PetDAO {

    // Insert a new pet
    public void insert(Pet pet, int listerID) throws SQLException {
        String sql = "INSERT INTO Pets " +
                "(listerID, name, category, breed, ageInMonths, gender, description, " +
                "isVaccinated, isDewormed, isNeutered, adoptionFee, locationCity) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, listerID); // Pass the actual lister ID here
            ps.setString(2, pet.getName());
            ps.setString(3, pet.getCategory());
            ps.setString(4, pet.getBreed());
            ps.setInt(5, pet.getAgeInMonths());
            ps.setString(6, pet.getGender());
            ps.setString(7, pet.getDescription());
            ps.setBoolean(8, pet.isVaccinated());
            ps.setBoolean(9, pet.isDewormed());
            ps.setBoolean(10, pet.isNeutered());
            ps.setDouble(11, pet.getAdoptionFee());
            ps.setString(12, pet.getLocationCity());

            ps.executeUpdate();
        }
    }

    // Get all pets (descending by postedDate)
    public List<Pet> getAll() throws SQLException {
        List<Pet> list = new ArrayList<>();
        String sql = "SELECT * FROM Pets ORDER BY postedDate DESC";

        try (Connection con = DBUtil.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                Pet p = new Pet();
                p.setPetID(rs.getInt("petID"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setBreed(rs.getString("breed"));
                p.setAgeInMonths(rs.getInt("ageInMonths"));
                p.setGender(rs.getString("gender"));
                p.setDescription(rs.getString("description"));
                p.setVaccinated(rs.getBoolean("isVaccinated"));
                p.setDewormed(rs.getBoolean("isDewormed"));
                p.setNeutered(rs.getBoolean("isNeutered"));
                p.setLocationCity(rs.getString("locationCity"));
                p.setAdoptionFee(rs.getDouble("adoptionFee"));
                list.add(p);
            }
        }

        return list;
    }

    // Get pet by ID
    public Pet getById(int id) throws SQLException {
        String sql = "SELECT * FROM Pets WHERE petID = ?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Pet p = new Pet();
                p.setPetID(id);
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setBreed(rs.getString("breed"));
                p.setAgeInMonths(rs.getInt("ageInMonths"));
                p.setGender(rs.getString("gender"));
                p.setDescription(rs.getString("description"));
                p.setVaccinated(rs.getBoolean("isVaccinated"));
                p.setDewormed(rs.getBoolean("isDewormed"));
                p.setNeutered(rs.getBoolean("isNeutered"));
                p.setLocationCity(rs.getString("locationCity"));
                p.setAdoptionFee(rs.getDouble("adoptionFee"));
                return p;
            }
        }

        return null;
    }

    // Optional: Update pet (if you plan to allow edits)
    public void update(Pet pet) throws SQLException {
        String sql = "UPDATE Pets SET name=?, category=?, breed=?, ageInMonths=?, gender=?, " +
                "description=?, isVaccinated=?, isDewormed=?, isNeutered=?, adoptionFee=?, locationCity=?, " +
                "lastUpdated=CURRENT_TIMESTAMP WHERE petID=?";

        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, pet.getName());
            ps.setString(2, pet.getCategory());
            ps.setString(3, pet.getBreed());
            ps.setInt(4, pet.getAgeInMonths());
            ps.setString(5, pet.getGender());
            ps.setString(6, pet.getDescription());
            ps.setBoolean(7, pet.isVaccinated());
            ps.setBoolean(8, pet.isDewormed());
            ps.setBoolean(9, pet.isNeutered());
            ps.setDouble(10, pet.getAdoptionFee());
            ps.setString(11, pet.getLocationCity());
            ps.setInt(12, pet.getPetID());

            ps.executeUpdate();
        }
    }

    // Optional: Delete pet
    public void delete(int id) throws SQLException {
        String sql = "DELETE FROM Pets WHERE petID = ?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }
}
