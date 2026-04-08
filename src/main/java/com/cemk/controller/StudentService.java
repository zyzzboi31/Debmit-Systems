package com.cemk.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StudentService {

    public String registerStudent(StudentDTO studentDTO) {
        String message = null;
        Connection con = new DbConnection().dbConnect();

        // FIX: Use try-with-resources so PreparedStatement is auto-closed
        try (PreparedStatement pstmt = con.prepareStatement(
                "INSERT INTO student (student_id, student_name, student_email, student_city, student_age) VALUES (?,?,?,?,?)")) {

            pstmt.setString(1, studentDTO.getStudentID());
            pstmt.setString(2, studentDTO.getStudentName());
            pstmt.setString(3, studentDTO.getStudentEmail());
            pstmt.setString(4, studentDTO.getStudentCity());
            pstmt.setInt(5,    studentDTO.getStudentAge());

            int rowsUpdated = pstmt.executeUpdate();
            message = (rowsUpdated > 0) ? "Record Stored" : "Record Storing Failed";

        } catch (SQLException e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        } finally {
            DbConnection.closeConnection(con); // FIX: Always close connection
        }
        return message;
    }

    public List<StudentDTO> getAllStudents() {
        // FIX: Use typed ArrayList<> — was raw type before
        List<StudentDTO> studentList = new ArrayList<>();
        Connection con = new DbConnection().dbConnect();

        // FIX: try-with-resources closes Statement and ResultSet automatically
        try (Statement stmt = con.createStatement();
             ResultSet rs   = stmt.executeQuery("SELECT * FROM student ORDER BY student_id")) {

            while (rs.next()) {
                StudentDTO studentDTO = new StudentDTO();
                studentDTO.setStudentID(rs.getString("student_id"));
                studentDTO.setStudentName(rs.getString("student_name"));
                studentDTO.setStudentEmail(rs.getString("student_email"));
                studentDTO.setStudentCity(rs.getString("student_city"));
                studentDTO.setStudentAge(rs.getInt("student_age"));
                studentList.add(studentDTO);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbConnection.closeConnection(con); // FIX: Close connection
        }
        return studentList;
    }

    public String updateStudent(StudentDTO studentDTO) {
        String message = null;
        Connection con = new DbConnection().dbConnect();

        try (PreparedStatement pstmt = con.prepareStatement(
                "UPDATE student SET student_name=?, student_email=?, student_city=?, student_age=? WHERE student_id=?")) {

            pstmt.setString(1, studentDTO.getStudentName());
            pstmt.setString(2, studentDTO.getStudentEmail());
            pstmt.setString(3, studentDTO.getStudentCity());
            pstmt.setInt(4,    studentDTO.getStudentAge());
            pstmt.setString(5, studentDTO.getStudentID());

            int rowsAffected = pstmt.executeUpdate();
            message = (rowsAffected > 0)
                    ? "Record updated successfully"
                    : "No record found with ID: " + studentDTO.getStudentID();

        } catch (SQLException e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        } finally {
            DbConnection.closeConnection(con); // FIX: Close connection
        }
        return message;
    }

    public String deleteStudent(String studentID) {
        String message = null;
        Connection con = new DbConnection().dbConnect();

        try (PreparedStatement pstmt = con.prepareStatement(
                "DELETE FROM student WHERE student_id=?")) {

            pstmt.setString(1, studentID);
            int rowsAffected = pstmt.executeUpdate();
            message = (rowsAffected > 0)
                    ? "Record deleted successfully"
                    : "No record found with ID: " + studentID;

        } catch (Exception e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
        } finally {
            DbConnection.closeConnection(con); // FIX: Close connection
        }
        return message;
    }

    // FIX: Returns null instead of empty StudentDTO when not found,
    //      so callers can properly detect "record not found"
    public StudentDTO getSingleStudent(String studentID) {
        StudentDTO studentDTO = null;
        Connection con = new DbConnection().dbConnect();

        try (PreparedStatement pstmt = con.prepareStatement(
                "SELECT * FROM student WHERE student_id=?")) {

            pstmt.setString(1, studentID);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    studentDTO = new StudentDTO();
                    studentDTO.setStudentID(rs.getString("student_id"));
                    studentDTO.setStudentName(rs.getString("student_name"));
                    studentDTO.setStudentEmail(rs.getString("student_email"));
                    studentDTO.setStudentCity(rs.getString("student_city"));
                    studentDTO.setStudentAge(rs.getInt("student_age"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbConnection.closeConnection(con); // FIX: Close connection
        }
        return studentDTO;
    }
}
