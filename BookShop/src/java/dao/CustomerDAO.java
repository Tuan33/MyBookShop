/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Customer;
import entity.Employee;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DBConnect;

/**
 *
 * @author tranh
 */
public class CustomerDAO extends DBConnect {

    public boolean checkLogin(String user, String pass) {
        try {
            String sql = "select * from Customers\n"
                    + "where Username = ? and Password = ?";

            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, user);
            pre.setString(2, pass);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return true;
            }
            rs.close();
            pre.close();

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public int addCustomer(Customer cus) {
        int n = 0;
        String sql = "INSERT INTO Customers (Username, Password, Name, Email, Address, PhoneNumber) "
                + "VALUES (?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, cus.getUsername());
            pre.setString(2, cus.getPassword());
            pre.setString(3, cus.getName());
            pre.setString(4, cus.getEmail());
            pre.setString(5, cus.getAddress());
            pre.setString(6, cus.getPhoneNumber());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public Customer checkAccount(String user) {
        String sql = "select * from Customers\n"
                + "where Username = '" + user + "'";
        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                int customerID = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String name = rs.getString(4);
                String email = rs.getString(5);
                String address = rs.getString(6);
                String phoneNumber = rs.getString(7);
                return new Customer(customerID, username, password, name,
                        email, address, phoneNumber);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Customer findByID(String cid) {
        Customer cus = null;
        String sql = "select * from Customers where CustomerID = " + cid;
        ResultSet rs = getData(sql);
        if (rs == null) {
            return null;
        }
        try {
            while (rs.next()) {
                int customerID = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String name = rs.getString(4);
                String email = rs.getString(5);
                String address = rs.getString(6);
                String phoneNumber = rs.getString(7);
                cus = new Customer(customerID, username, password, name,
                        email, address, phoneNumber);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cus;
    }

    public Customer findByUserName(String user) {
        Customer cus = null;
        String sql = "select * from Customers where Username like '" + user + "'";
        ResultSet rs = getData(sql);
        if (rs == null) {
            return null;
        }
        try {
            while (rs.next()) {
                int customerID = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String name = rs.getString(4);
                String email = rs.getString(5);
                String address = rs.getString(6);
                String phoneNumber = rs.getString(7);
                cus = new Customer(customerID, username, password, name,
                        email, address, phoneNumber);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cus;
    }

    public static void main(String[] args) {
        CustomerDAO customerDAO = new CustomerDAO();
        Customer cus = new Customer("test1", "test1", "test1", "test1", "test1", "test1");
        int result = customerDAO.addCustomer(cus);

        if (result > 0) {
            System.out.println("Customer added successfully.");
        } else {
            System.out.println("Failed to add customer.");
        }
    }

}
