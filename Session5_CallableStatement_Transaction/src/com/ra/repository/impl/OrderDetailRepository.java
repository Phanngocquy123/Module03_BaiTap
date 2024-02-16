package com.ra.repository.impl;

import com.ra.entity.OrderDetail;

import java.sql.CallableStatement;
import java.sql.SQLException;

public class OrderDetailRepository extends Repository<OrderDetail, Integer>{
    public OrderDetailRepository(){
        this.clazz = OrderDetail.class;
        this.sp_findAll = "{call sp_orderDetails_findAll()}";
    }

    @Override
    public void setInsertParam(CallableStatement cs, OrderDetail entity) throws SQLException {

    }

    @Override
    public void handleInsert(CallableStatement cs, OrderDetail entity) throws SQLException {

    }

    @Override
    public void setUpdateParam(CallableStatement cs, OrderDetail entity) throws SQLException {

    }

    @Override
    public void handleUpdate(CallableStatement cs, OrderDetail entity) throws SQLException {

    }
}
