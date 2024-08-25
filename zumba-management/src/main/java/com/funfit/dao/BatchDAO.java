package com.funfit.dao;

import com.funfit.model.Batch;
import com.funfit.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BatchDAO {

    // Add a new batch to the database
    public void addBatch(Batch batch) throws SQLException {
        String sql = "INSERT INTO batches (name, time_slot) VALUES (?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, batch.getName());
            stmt.setString(2, batch.getTimeSlot());
            stmt.executeUpdate();
        }
    }

    // Retrieve a batch by ID
    public Batch getBatchById(int id) throws SQLException {
        String sql = "SELECT * FROM batches WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String name = rs.getString("name");
                String timeSlot = rs.getString("time_slot");
                return new Batch(name, timeSlot);
            }
        }
        return null;
    }

    // Update an existing batch
    public void updateBatch(Batch batch) throws SQLException {
        String sql = "UPDATE batches SET name = ?, time_slot = ? WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, batch.getName());
            stmt.setString(2, batch.getTimeSlot());
            stmt.setInt(3, batch.getId());
            stmt.executeUpdate();
        }
    }

    // Delete a batch by ID
    public void deleteBatch(int id) throws SQLException {
        String sql = "DELETE FROM batches WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    // Retrieve all batches
    public List<Batch> getAllBatches() throws SQLException {
        List<Batch> batches = new ArrayList<>();
        String sql = "SELECT * FROM batches";
        try (Connection conn = DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                int id = rs.getInt("id");  
                String name = rs.getString("name");
                String timeSlot = rs.getString("time_slot");
                batches.add(new Batch(id, name, timeSlot));  
            }
        }
        return batches;
    }

}
