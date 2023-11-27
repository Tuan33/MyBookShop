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
public class Order {
    private int orderID;
    private int customerId;
    private int employeeId;
    private String status;
    private String orderDate;
    private String shippedDate;
    private String shipName;
    private String shipAddress;
    private String shipCity;
    
    
    public Order() {
    }

    public Order(int orderID, int customerId, int employeeId, String status, String orderDate, String shippedDate, String shipName, String shipAddress, String shipCity) {
        this.orderID = orderID;
        this.customerId = customerId;
        this.employeeId = employeeId;
        this.status = status;
        this.orderDate = orderDate;
        this.shippedDate = shippedDate;
        this.shipName = shipName;
        this.shipAddress = shipAddress;
        this.shipCity = shipCity;
    }

    public Order(int customerId, int employeeId, String status, String orderDate, String shippedDate, String shipName, String shipAddress, String shipCity) {
        this.customerId = customerId;
        this.employeeId = employeeId;
        this.status = status;
        this.orderDate = orderDate;
        this.shippedDate = shippedDate;
        this.shipName = shipName;
        this.shipAddress = shipAddress;
        this.shipCity = shipCity;
    }


    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getShippedDate() {
        return shippedDate;
    }

    public void setShippedDate(String shippedDate) {
        this.shippedDate = shippedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShipName() {
        return shipName;
    }

    public void setShipName(String shipName) {
        this.shipName = shipName;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public String getShipCity() {
        return shipCity;
    }

    public void setShipCity(String shipCity) {
        this.shipCity = shipCity;
    }

    @Override
    public String toString() {
        return "Order{" + "orderID=" + orderID + ", customerId=" + customerId + ", employeeId=" + employeeId + ", status=" + status + ", orderDate=" + orderDate + ", shippedDate=" + shippedDate + ", shipName=" + shipName + ", shipAddress=" + shipAddress + ", shipCity=" + shipCity + '}';
    }



    
}
