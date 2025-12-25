package com.pets.dao;

import com.pets.util.DBUtil;
import java.sql.*;
import java.util.*;

public class PetPhotoDAO {

    // Insert a photo
    public void insert(int petID, String photoURL, boolean isPrimary) throws SQLException {

        String sql = "INSERT INTO PetPhotos (petID, photoURL, isPrimary) VALUES (?, ?, ?)";

        Connection con = DBUtil.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, petID);
        ps.setString(2, photoURL);
        ps.setBoolean(3, isPrimary);

        ps.executeUpdate();
    }

    // Get all photos for a pet
    public List<String> getPhotosByPet(int petID) throws SQLException {

        List<String> photos = new ArrayList<>();

        String sql = "SELECT photoURL FROM PetPhotos WHERE petID=?";
        Connection con = DBUtil.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, petID);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            photos.add(rs.getString("photoURL"));
        }

        return photos;
    }

    // Get primary photo for pet (used on homepage)
    public String getPrimaryPhoto(int petID) throws SQLException {

        String sql = "SELECT photoURL FROM PetPhotos WHERE petID=? AND isPrimary=true";
        Connection con = DBUtil.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, petID);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return rs.getString("photoURL");
        }
        return null;
    }

    // Delete all photos of a pet (when deleting pet)
    public void deleteByPet(int petID) throws SQLException {

        String sql = "DELETE FROM PetPhotos WHERE petID=?";
        Connection con = DBUtil.getConnection();
        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, petID);
        ps.executeUpdate();
    }
}
