package service.impl;

import entity.Order;
import service.OrderService;
import util.MySQLConnect;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class OrderServiceImpl implements OrderService {

    @Override
    public List<Order> findAll() {
        List<Order> result = new ArrayList<>();
        Connection connection = null;
        try {
            connection = MySQLConnect.open();
            String query = "{CALL sp_orders_findAll()}";
            CallableStatement cs = connection.prepareCall(query);
            ResultSet rs = cs.executeQuery();
            while (rs.next()){
                Order order = new Order();
                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setStatus(rs.getString("Status"));
                result.add(order);
                            }
        }catch (Exception ex){
            ex.printStackTrace();
        } finally {
            MySQLConnect.close(connection);
        }
        return result;
    }

    @Override
    public Order insert(Order order) {
        List<Order> result = new ArrayList<>();
        Connection connection = null;
        try {
            connection = MySQLConnect.open();
            String query = "{CALL sp_orders_add(?,?,?,?,?)}";
            CallableStatement cs = connection.prepareCall(query);
            cs.registerOutParameter(1, Types.INTEGER);

            ResultSet rs = cs.executeQuery();
            while (rs.next()){

                order.setOrderId(rs.getInt("OrderID"));
                order.setCustomerId(rs.getInt("CustomerID"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setStatus(rs.getString("Status"));
                result.add(order);
            }
        }catch (Exception ex){
            ex.printStackTrace();
        } finally {
            MySQLConnect.close(connection);
        }
        return result;
    }
}
