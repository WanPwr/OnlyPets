package com.pets.dao;

import com.pets.model.Lister;
import com.pets.util.DBUtil;

import java.sql.*;

public class ListerDAO {

    // Authenticate a lister using email/username and password
    public Lister authenticate(String emailOrUsername, String password) throws SQLException {
        String sql = "SELECT * FROM Listers WHERE (email=? OR username=?) AND password=?";
        try (Connection con = DBUtil.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, emailOrUsername);
            ps.setString(2, emailOrUsername);
            ps.setString(3, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Lister l = new Lister();
                l.setListerID(rs.getInt("listerID"));
                l.setEmail(rs.getString("email"));
                l.setUsername(rs.getString("username"));
                l.setFname(rs.getString("fname"));
                l.setLname(rs.getString("lname"));
                return l;
            }
        }
        return null; // authentication failed
    }
}
