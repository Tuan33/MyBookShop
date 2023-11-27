/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

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
public class OrderDetailDAO extends DBConnect {

    public int addOrderDetail(
            int orderId,
            int bookId,
            int quantity,
            double price
    ) {
        int n = 0;
        String sql = "INSERT INTO [OrderDetails]\n"
                + "           ([OrderID]\n"
                + "           ,[BookID]\n"
                + "           ,[Quantity]\n"
                + "           ,[PricePerUnit])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?)";
        try {
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, orderId);
            pre.setInt(2, bookId);
            pre.setInt(3, quantity);
            pre.setDouble(4, price);

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public ResultSet getAllOrderDetailByOid(String oid) {
        String sql = "select * from OrderDetails where OrderID = " + oid;
        return getData(sql);
    }

    public int updateOrderDetail(int quantity, double price, int oid, int bid) {
        int n = 0;
        String sql = "UPDATE [OrderDetails]\n"
                + "   SET [Quantity] = ?\n"
                + "      ,[PricePerUnit] = ?\n"
                + " WHERE OrderID = ? and BookID = ?";
        try {
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, quantity);
            pre.setDouble(2, price);
            pre.setInt(3, oid);
            pre.setInt(4, bid);

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeOrderDetail(int oid, int bid) {
        int n = 0;
        String sql = "DELETE FROM OrderDetails\n"
                + "WHERE OrderID = ? and BookID = ?";
        try {
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setInt(1, oid);
            pre.setInt(2, bid);

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(OrderDetailDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
        OrderDetailDAO dao = new OrderDetailDAO();
        System.out.println(dao.removeOrderDetail(2, 1));
    }
}
