package com.ra.repository.impl;

import com.ra.entity.Order;

import java.lang.reflect.Type;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;

public class OrderRepository extends Repository<Order, Integer>{
    public OrderRepository(){
        this.clazz = Order.class;
        this.sp_findAll = "{call sp_orders_findAll()}";
        this.sp_findId = "{call sp_orders_findId(?)}";
        this.sp_insert = "{call sp_orders_insert(?,?,?,?,?)}";
        this.sp_update = "{call sp_orders_update(?,?,?,?,?)}";
        this.sp_delete = "{call sp_orders_delete(?)}";
    }

    @Override
    public void setInsertParam(CallableStatement cs, Order entity) throws SQLException {
        cs.setInt(1, entity.getCustomerId());
        cs.setDate(2, new java.sql.Date(entity.getOrderDate().getTime()));
        cs.setFloat(3, entity.getTotalAmount());
        cs.setString(4, entity.getStatus());
        cs.registerOutParameter(5, Types.INTEGER);  // Đăng ký tham số OUT
    }

    @Override
    public void handleInsert(CallableStatement cs, Order entity) throws SQLException {
        entity.setOrderId(cs.getInt(5));   // Lấy giá trị orderId từ tham số OUT
    }

    @Override
    public void setUpdateParam(CallableStatement cs, Order entity) throws SQLException {
        cs.setInt(1, entity.getOrderId());
        cs.setInt(2, entity.getCustomerId());
        cs.setDate(3, new java.sql.Date(entity.getOrderDate().getTime()));
        cs.setFloat(4, entity.getTotalAmount());
        cs.setString(5, entity.getStatus());
    }

    @Override
    public void handleUpdate(CallableStatement cs, Order entity) throws SQLException {

    }
}
