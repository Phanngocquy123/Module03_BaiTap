package service;

import entity.Order;

import java.util.List;

public interface OrderService {
    List<Order> findAll();
    Order insert(Order order);
}
