/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DBConnect;

/**
 *
 * @author tranh
 */
public class OrderDAO extends DBConnect {

    public int addOrders(int cusId, String status, String shipName, String shipAddress, String shipCity) {
        int n = 0;
        String sql = "INSERT INTO [Orders]\n"
                + "           ([CustomerID]\n"
                + "           ,[Status]\n"
                + "           ,[OrderDate]\n"
                + "           ,[ShipName]\n"
                + "           ,[ShipAddress]\n"
                + "           ,[ShipCity])\n"
                + "     VALUES\n"
                + "           (?,?,GETDATE(),?,?,?)";
        try {
            PreparedStatement pre = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setInt(1, cusId);
            pre.setString(2, status);
            pre.setString(3, shipName);
            pre.setString(4, shipAddress);
            pre.setString(5, shipCity);
            pre.executeUpdate();
            ResultSet rs = pre.getGeneratedKeys();
            if (rs.next()) {
                n = rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ResultSet getAllOrder() {
        String sql = "select OrderID, CustomerID, [Status], OrderDate, ShipName,"
                + " CONCAT(ShipAddress, ', ', ShipCity) from Orders\n"
                + "Order BY OrderID DESC";
        return getData(sql);
    }

    public Order findByOID(int id) {
        Order ord = null;
        String sql = "select * from Orders where OrderID =" + id;
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                int oid = rs.getInt(1);
                int cusid = rs.getInt(2);
                int empid = rs.getInt(3);
                String status = rs.getString(4);
                String orderDate = rs.getString(5);
                String shipDate = rs.getString(6);
                String shipName = rs.getString(7);
                String shipAddress = rs.getString(8);
                String shipCity = rs.getString(9);
                ord = new Order(oid, cusid, empid, status, orderDate, shipDate, shipName, shipAddress, shipCity);
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ord;
    }

    public ResultSet findByStatus(String status) {
        String sql = "select OrderID, CustomerID, [Status], OrderDate, ShipName,"
                + " CONCAT(ShipAddress, ', ', ShipCity) from Orders\n"
                + "where \"Status\" = '" + status + "'";
        return getData(sql);
    }

    public int updateOrder(int oid, int eid, String status, String orderDate,
            String ShippedDate, String ShipName, String ShipAddress, String ShipCity) {
        int n = 0;
        String sql = "UPDATE [Orders]\n"
                + "   SET [Status] = ?\n"
                + "      ,[EmployeeID] = ?\n"
                + "      ,[OrderDate] = ?\n"
                + "      ,[ShippedDate] = ?\n"
                + "      ,[ShipName] = ?\n"
                + "      ,[ShipAddress] = ?\n"
                + "      ,[ShipCity] = ?\n"
                + "  WHERE OrderID = ?";
        PreparedStatement pre;
        try {
            pre = con.prepareStatement(sql);
            pre.setString(1, status);
            pre.setInt(2, eid);
            pre.setString(3, orderDate);
            pre.setString(4, ShippedDate);
            pre.setString(5, ShipName);
            pre.setString(6, ShipAddress);
            pre.setString(7, ShipCity);
            pre.setInt(8, oid);

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();

    }
}
