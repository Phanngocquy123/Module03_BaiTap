package service;

import entity.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();
    Customer insert(Customer customer);
    void update(int customerId, Customer customerUpdate);
    void delete(int customerId);
}
