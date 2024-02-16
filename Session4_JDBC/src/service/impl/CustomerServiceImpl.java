package service.impl;

import entity.Customer;
import service.CustomerService;
import util.MySQLConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    @Override
    public List<Customer> findAll() {
        List<Customer> result = new ArrayList<>();
        Connection conn = null;
        try {
            // B1. tạo kết nối
            conn = MySQLConnect.open();
            // B2. tạo đối tượng thực thi câu truy vấn
            String query = "SELECT * FROM customers";
            PreparedStatement ps = conn.prepareStatement(query);
            // B3. thực thi câu truy vấn
            ResultSet rs = ps.executeQuery();
            // B4. xử lý ResultSet
            while (rs.next()) {
                Customer customer = new Customer();
                customer.setCustomerId(rs.getInt("CustomerID"));
                customer.setFullName(rs.getString("FullName"));
                customer.setEmail(rs.getString("Email"));
                customer.setPhone(rs.getString("Phone"));
                customer.setAddress(rs.getString("Address"));
                result.add(customer);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            MySQLConnect.close(conn);
        }
        return result;
    }

    @Override
    public Customer insert(Customer customer) {
        Connection conn = null;
        try {
            // B1. tạo kết nối
            conn = MySQLConnect.open();
            // B2. tạo đối tượng thực thi câu truy vấn
            String query = "INSERT INTO Customers(CustomerID, FullName, Email, Phone, Address) VALUES(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            // 2.1 truyền tham số
            ps.setInt(1, customer.getCustomerId());
            ps.setString(2, customer.getFullName());
            ps.setString(3, customer.getEmail());
            ps.setString(4, customer.getPhone());
            ps.setString(5, customer.getAddress());
            // B3. thực thi câu truy vấn
            int result = ps.executeUpdate();
            return customer;
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            MySQLConnect.close(conn);
        }
        return null;
    }

    @Override
    public void delete(int customerId) {
        Connection conn = null;
        try {
            conn = MySQLConnect.open();
            String deleteQuery = "DELETE FROM Customers WHERE CustomerID = ?";
            PreparedStatement ps = conn.prepareStatement(deleteQuery);
            ps.setInt(1, customerId);
            int result = ps.executeUpdate();

            if (result > 0)
                System.out.println("Update thành công khách hàng có ID: " + customerId);
            else
                System.out.println("Update tìm thấy khách hàng có ID: " + customerId);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            MySQLConnect.close(conn);
        }
    }

    @Override
    public void update(int customerId, Customer customerUpdate) {
        Connection conn = null;
        try {
            conn = MySQLConnect.open();
            String updateQuery = "UPDATE Customers SET FullName=?, Email=?, Phone=?, Address=? WHERE CustomerID=?";
            PreparedStatement ps = conn.prepareStatement(updateQuery);
            ps.setString(1, customerUpdate.getFullName());
            ps.setString(2, customerUpdate.getEmail());
            ps.setString(3, customerUpdate.getPhone());
            ps.setString(4, customerUpdate.getAddress());
            ps.setInt(5, customerUpdate.getCustomerId());
            int result = ps.executeUpdate();

            if (result > 0)
                System.out.println("Xóa thành công khách hàng có ID: " + customerId);
            else
                System.out.println("Không tìm thấy khách hàng có ID: " + customerId);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            MySQLConnect.close(conn);
        }
    }


}
