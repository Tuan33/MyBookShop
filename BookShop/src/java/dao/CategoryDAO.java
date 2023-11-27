/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import model.DBConnect;

/**
 *
 * @author tranh
 */
public class CategoryDAO extends DBConnect {

    public ResultSet getAllCategory() {
        String sql = "select * from Categories";
        ResultSet rs = getData(sql);
        return rs;
    }

    public static void main(String[] args) throws SQLException {
        CategoryDAO categoryDAO = new CategoryDAO();

        ResultSet rs = categoryDAO.getAllCategory();

        // Iterate through the ResultSet and print the category data
        while (rs.next()) {
            int categoryId = rs.getInt("CategoryID");
            String categoryName = rs.getString("CategoryName");
            System.out.println("Category ID: " + categoryId + ", Category Name: " + categoryName);
        }

        // Close the ResultSet (and associated resources) when done
        rs.close();
    }
}
