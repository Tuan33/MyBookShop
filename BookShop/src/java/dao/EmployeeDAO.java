/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Book;
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
public class EmployeeDAO extends DBConnect {

    public Employee login(String user, String pass) {
        String sql = "select * from Employees\n"
                + "where Username = '" + user + "' and Password = '" + pass + "'";
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                int employeeID = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String name = rs.getString(4);
                String email = rs.getString(5);
                String phoneNumber = rs.getString(6);
                String address = rs.getString(7);
                Date hireDate = rs.getDate(8);
                double salary = rs.getDouble(9);
                String role = rs.getString(10);
                return new Employee(employeeID, username, password, name, email,
                        phoneNumber, address, hireDate, salary, role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public boolean checkLogin(String user, String pass) {
        String sql = "select * from Employees\n"
                + "where Username = ? and Password = ?";
        try {
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
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public Employee findByID(String eid) {
        Employee emp = null;
        String sql = "select * from Employees where EmployeeID = " + eid;
        ResultSet rs = getData(sql);
        if (rs == null) {
            return null;
        }
        try {
            while (rs.next()) {
                int employeeID = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String name = rs.getString(4);
                String email = rs.getString(5);
                String phoneNumber = rs.getString(6);
                String address = rs.getString(7);
                Date hireDate = rs.getDate(8);
                double salary = rs.getDouble(9);
                String role = rs.getString(10);
                emp = new Employee(employeeID, username, password, name, email,
                        phoneNumber, address, hireDate, salary, role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emp;
    }

    public Employee findByUserName(String user) {
        Employee emp = null;
        String sql = "select * from Employees where Username like '" + user + "'";
        ResultSet rs = getData(sql);
        if (rs == null) {
            return null;
        }
        try {
            while (rs.next()) {
                int employeeID = rs.getInt(1);
                String username = rs.getString(2);
                String password = rs.getString(3);
                String name = rs.getString(4);
                String email = rs.getString(5);
                String phoneNumber = rs.getString(6);
                String address = rs.getString(7);
                Date hireDate = rs.getDate(8);
                double salary = rs.getDouble(9);
                String role = rs.getString(10);
                emp = new Employee(employeeID, username, password, name, email,
                        phoneNumber, address, hireDate, salary, role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return emp;
    }

}
