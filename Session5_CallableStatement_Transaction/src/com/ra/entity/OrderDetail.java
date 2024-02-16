package com.ra.entity;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderDetail implements IEntity{
    private int orderDetailId;
    private int orderId;
    private int productId;
    private int quantity;
    private float price;

    public OrderDetail() {
    }

    public OrderDetail(int orderDetailId, int orderId, int productId, int quantity, float price) {
        this.orderDetailId = orderDetailId;
        this.orderId = orderId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOrderDetailId() {
        return orderDetailId;
    }

    public void setOrderDetailId(int orderDetailId) {
        this.orderDetailId = orderDetailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    @Override
    public void init(ResultSet rs) throws SQLException {
        setOrderDetailId(rs.getInt("OrderDetailID"));
        setOrderId(rs.getInt("OrderID"));
        setProductId(rs.getInt("ProductID"));
        setQuantity(rs.getInt("Quanttity"));
        setPrice(rs.getFloat("Price"));
    }
}
