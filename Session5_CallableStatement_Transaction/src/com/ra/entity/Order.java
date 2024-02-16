package com.ra.entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class Order implements IEntity{
    private int orderId;
    private int customerId;
    private Date orderDate;
    private float  totalAmount;
    private String status;

    public Order() {
    }

    public Order(int orderId, int customerId, Date orderDate, float totalAmount, String status) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public java.sql.Date getOrderDate() {
        return (java.sql.Date) orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public float getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(float totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public void init(ResultSet rs) throws SQLException {
        setOrderId(rs.getInt("OrderID"));
        setCustomerId(rs.getInt("CustomerID"));
        setOrderDate(rs.getDate("OrderDate"));
        setTotalAmount(rs.getFloat("TotalAmount"));
        setStatus(rs.getString("Status"));
    }
}
