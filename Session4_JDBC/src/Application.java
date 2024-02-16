import entity.Customer;
import entity.Order;
import service.CustomerService;
import service.OrderService;
import service.impl.CustomerServiceImpl;
import service.impl.OrderServiceImpl;
import util.MySQLConnect;

import java.sql.Connection;
import java.util.Scanner;

public class Application {
    public static void main(String[] args) {
//        Connection conn = MySQLConnect.open();
//        if (conn != null)
//            System.out.println("Success");
//        else
//            System.out.println("Failed");
        Scanner sc = new Scanner(System.in);
        CustomerService customerService = new CustomerServiceImpl();
        OrderService orderService = new OrderServiceImpl();
        do {
            System.out.println("1- Hiển thị");
            System.out.println("2- Thêm");
            System.out.print("Nhập lựa chọn: ");
            int choice = Integer.parseInt(sc.nextLine());
            switch (choice){
                case 1:
                    for (Order or : orderService.findAll()) {
                        System.out.printf("OrderId: %d, CustomerId: %d, OrderDate: %s\n",
                                or.getOrderId(), or.getCustomerId(), or.getOrderDate());
                    }
                    break;
                case 2:
                    break;
                case 3:
                    break;
            }
        } while (true);

//        do {
//            System.out.println("1- Hiển thị danh sách khách hàng");
//            System.out.println("2- Thêm");
//            System.out.println("3- Cập nhật");
//            System.out.println("4- Xóa");
//            System.out.println("5- Thoát");
//            System.out.print("Nhập lựa chọn: ");
//            int choice = Integer.parseInt(sc.nextLine());
//            switch (choice){
//                case 1:
//                    for (Customer c : customerService.findAll()) {
//                        System.out.printf("Id: %d, Fullname: %-13s, Email: %-17s, Phone: %-12s, Address: %s\n",
//                                c.getCustomerId(), c.getFullName(), c.getEmail(), c.getPhone(), c.getAddress());
//                    }
//                    break;
//                case 2:
//                    Customer customer = new Customer();
//                    System.out.print("Nhập Id: ");
//                    customer.setCustomerId(Integer.parseInt(sc.nextLine()));
//                    System.out.print("Nhập FullName: ");
//                    customer.setFullName(sc.nextLine());
//                    System.out.print("Nhập Email: ");
//                    customer.setEmail(sc.nextLine());
//                    System.out.print("Nhập Phone: ");
//                    customer.setPhone(sc.nextLine());
//                    System.out.print("Nhập Address: ");
//                    customer.setAddress(sc.nextLine());
//                    customerService.insert(customer);
//                    System.out.println("Thêm thành công");
//                    break;
//                case 3:
//                    Customer customerUp = new Customer();
//                    System.out.print("Nhập Id: ");
//                    int idUpdate = Integer.parseInt(sc.nextLine());
//                    customerUp.setCustomerId(idUpdate);
//                    System.out.print("Nhập FullName: ");
//                    customerUp.setFullName(sc.nextLine());
//                    System.out.print("Nhập Email: ");
//                    customerUp.setEmail(sc.nextLine());
//                    System.out.print("Nhập Phone: ");
//                    customerUp.setPhone(sc.nextLine());
//                    System.out.print("Nhập Address: ");
//                    customerUp.setAddress(sc.nextLine());
//                    customerService.update(idUpdate,customerUp);
//                    break;
//                case 4:
//                    System.out.print("Nhập ID muốn xóa: ");
//                    customerService.delete(Integer.parseInt(sc.nextLine()));
//                    break;
//                case 5:
//                    System.exit(0);
//                default:
//                    System.out.println("Hãy nhập từ 1-4");
//                    break;
//            }
//        } while (true);


    }
}
