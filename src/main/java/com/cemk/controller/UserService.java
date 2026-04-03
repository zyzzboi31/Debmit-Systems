package com.cemk.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserService {

    public boolean validateUser(UserProfile userProfile) {
        boolean flag = false;
        Connection con = new DbConnection().dbConnect();

        // FIX: try-with-resources ensures PreparedStatement and ResultSet are closed
        try (PreparedStatement pstmt = con.prepareStatement(
                "SELECT COUNT(*) AS result FROM user_info WHERE user_id=? AND user_pwd=? AND user_role=?")) {

            pstmt.setString(1, userProfile.getUserId());
            pstmt.setString(2, userProfile.getUserpwd());
            pstmt.setString(3, userProfile.getUserRole());

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    flag = rs.getInt("result") > 0;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbConnection.closeConnection(con); // FIX: Close connection
        }
        return flag;
    }
}
