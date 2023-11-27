/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author tranh
 */
public class OrderDetail {
    int orderId;
    int bookId;
    int quantity;
    double pricePerUnit;

    public OrderDetail() {
    }

    public OrderDetail(int orderId, int bookId, int quantity, double pricePerUnit) {
        this.orderId = orderId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.pricePerUnit = pricePerUnit;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPricePerUnit() {
        return pricePerUnit;
    }

    public void setPricePerUnit(double pricePerUnit) {
        this.pricePerUnit = pricePerUnit;
    }

    @Override
    public String toString() {
        return "OrderDetails{" + "orderId=" + orderId + ", bookId=" + bookId + ", quantity=" + quantity + ", pricePerUnit=" + pricePerUnit + '}';
    }
    
    
}
