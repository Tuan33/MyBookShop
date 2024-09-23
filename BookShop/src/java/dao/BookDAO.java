/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import entity.Book;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.DBConnect;

/**
 *
 * @author tranh
 */
public class BookDAO extends DBConnect {

    // Connection con = null;//ket noi sql
    // PreparedStatement ps = null;//dua query sang sql
    // ResultSet rs = null;// nhan ket qua tu sql
    // statement dung cho sql don gian,ko truyen tham so
    // prepare phuc tap, co truyen tham so
    // public ResultSet getAll() {
    // String sql = "select * from Books";
    // ResultSet rs = getData(sql);
    // return rs;
    // }
    // public ResultSet getAllBookByCID(int cid) {
    // String sql = "select * from Books where CategoryID = " + cid;
    // ResultSet rs = getData(sql);
    // return rs;
    // }
    public ResultSet getAllBook() {
        String sql = "select b.BookID,b.Title,a.\"Name\"as AuthorName,b.\"Description\",b.Price,b.PublicationDate,b.Publisher,b.QuantityInStock,c.CategoryName,b.\"Image\" \n"
                + "from Books b, Authors a, Categories c\n"
                + "where b.AuthorID = a.AuthorID and b.CategoryID=c.CategoryID";
        ResultSet rs = getData(sql);
        System.out.println("ádasd");
        return rs;
    }

    public Book findByID(int bid) {
        Book book = null;
        String sql = "select * from Books where BookID = " + bid;
        ResultSet rs = getData(sql);
        try {
            while (rs.next()) {
                int bookid = rs.getInt(1);
                String title = rs.getString(2);
                int authorid = rs.getInt(3);
                String des = rs.getString(4);
                double price = rs.getDouble(5);
                Date publisherdate = rs.getDate(6);
                String publisher = rs.getString(7);
                int quantity = rs.getInt(8);
                String cateid = rs.getString(9);
                String image = rs.getString(10);
                book = new Book(bookid, title, authorid, des,
                        price, publisherdate, publisher, quantity, cateid, image);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return book;
    }

    public ResultSet getBookByBID(int bid) {
        String sql = "select b.BookID,b.Title,a.\"Name\"as AuthorName,b.\"Description\",b.Price,b.PublicationDate,b.Publisher,b.QuantityInStock,c.CategoryName,b.\"Image\",b.CategoryID,b.AuthorID\n"
                + "from Books b, Authors a, Categories c\n"
                + "where b.AuthorID = a.AuthorID and b.CategoryID=c.CategoryID\n"
                + "and b.BookID = "
                + bid;
        ResultSet rs = getData(sql);
        return rs;
    }

    public ResultSet getBookByCID(int cid) {
        String sql = "select b.BookID,b.Title,a.\"Name\"as AuthorName,b.\"Description\",b.Price,b.PublicationDate,b.Publisher,b.QuantityInStock,c.CategoryName,b.\"Image\" \n"
                + "from Books b, Authors a, Categories c\n"
                + "where b.AuthorID = a.AuthorID and b.CategoryID=c.CategoryID\n"
                + "and b.CategoryID = "
                + cid;
        ResultSet rs = getData(sql);
        return rs;
    }

    public ResultSet getBookByName(String name) {
        String sql = "select b.BookID,b.Title,a.\"Name\"as AuthorName,b.\"Description\",b.Price,b.PublicationDate,b.Publisher,b.QuantityInStock,c.CategoryName,b.\"Image\" \n"
                + "from Books b, Authors a, Categories c\n"
                + "where b.AuthorID = a.AuthorID and b.CategoryID=c.CategoryID\n"
                + "and Title like '%" + name + "%'";
        ResultSet rs = getData(sql);
        return rs;
    }

    public Vector<Book> getAllBookByName(String name) {
        Vector<Book> list = new Vector<>();
        String sql = "select * from Books\n"
                + "where Title like '%" + name + "%'";

        try {
            ResultSet rs = getData(sql);
            while (rs.next()) {
                int bookID = rs.getInt(1);
                String title = rs.getString(2);
                int authorID = rs.getInt(3);
                String description = rs.getString(4);
                double price = rs.getDouble(5);
                Date publicationDate = rs.getDate(6);
                String publisher = rs.getString(7);
                int quantityInStock = rs.getInt(8);
                String categoryID = rs.getString(9);
                String image = rs.getString(10);
                Book book = new Book(bookID, title, authorID, description, price,
                        publicationDate, publisher, quantityInStock, categoryID, image);
                list.add(book);
            }
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public int updateBook(int bid, String title, int aid, String descrip, double price,
            String publisdate, String publisher, int quantity, int cateid, String img) {
        int n = 0;
        String sql = "UPDATE [Books]\n"
                + "   SET [Title] = ?\n"
                + "      ,[AuthorID] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[PublicationDate] = ?\n"
                + "      ,[Publisher] = ?\n"
                + "      ,[QuantityInStock] = ?\n"
                + "      ,[CategoryID] = ?\n"
                + "      ,[Image] = ?\n"
                + " WHERE BookID = ?";
        try {
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, title);
            pre.setInt(2, aid);
            pre.setString(3, descrip);
            pre.setDouble(4, price);
            pre.setString(5, publisdate);
            pre.setString(6, publisher);
            pre.setInt(7, quantity);
            pre.setInt(8, cateid);
            pre.setString(9, img);
            pre.setInt(10, bid);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(BookDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public static void main(String[] args) {
        BookDAO dao = new BookDAO();
        Book book = dao.findByID(1);
        System.out.println(book);

    }

}
