/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tranh
 */
public class DBConnect {
    public Connection con=null;
    public DBConnect(){
        try {
            //call driver : co the chay nhieu lan de goi nhieu driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //connection
            con=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=BookShop",
                    "sa","123456");
            System.out.println("Connected");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public ResultSet getData(String sql){
        ResultSet rs = null;
        try{
            //create statement
            Statement statement = con.createStatement(
            ResultSet.TYPE_SCROLL_SENSITIVE,
            /*chuan 4 giup quay lai tim du lieu, neu co su thay doi du lieu
            , he thong se phat sinh va xu li thread safe*/
            ResultSet.CONCUR_UPDATABLE
            );
            //runandget
           rs = statement.executeQuery(sql);
    }catch(SQLException ex){
        ex.printStackTrace();
    }
    return rs;
    }
}
        