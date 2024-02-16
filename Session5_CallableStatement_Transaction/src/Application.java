import com.ra.entity.Order;
import com.ra.entity.OrderDetail;
import com.ra.repository.IRepository;
import com.ra.repository.impl.OrderDetailRepository;
import com.ra.repository.impl.OrderRepository;

import java.sql.SQLException;
import java.util.Scanner;

public class Application {
    public static void main(String[] args) throws SQLException {
        Scanner sc = new Scanner(System.in);
        IRepository<Order, Integer> orderRepository = new OrderRepository();
        IRepository<OrderDetail, Integer> orderDetailRepository = new OrderDetailRepository();
        do {
            System.out.println("1- Show All");
            System.out.println("2- Find Id");
            System.out.println("3- Insert");
            System.out.println("4- Update");
            System.out.println("5- Delete");
            System.out.println("6- Kết thúc");
            System.out.print("Nhập lựa chọn: ");
            int choice = Integer.parseInt(sc.nextLine());
            switch (choice){
                case 1:
                    for (Order order: orderRepository.findAll()){
                        System.out.printf("OrderId: %d - CustomerId: %d - OrderDate: %s - TotalAmount:%f - Status: %s\n",
                                order.getOrderId(), order.getCustomerId(), order.getOrderDate(), order.getTotalAmount(), order.getStatus());
                    }
                    break;
                case 2:
                    System.out.print("Nhập Id tìm kiếm: ");
                    int findId = Integer.parseInt(sc.nextLine());
                    Order foundId = orderRepository.findId(findId);
                    if (foundId != null){
                        System.out.printf("OrderId: %d - CustomerId: %d - OrderDate: %s - TotalAmount:%f - Status: %s\n",
                                foundId.getOrderId(), foundId.getCustomerId(), foundId.getOrderDate(), foundId.getTotalAmount(), foundId.getStatus());
                    } else
                        System.out.println("Không tìm thấy Id: " +findId);
                    break;
                case 3:
                    Order order = new Order();
                    order.setCustomerId(2);
                    order.setOrderDate(new java.sql.Date(System.currentTimeMillis()));
                    order.setTotalAmount(55);
                    order.setStatus("Delivered");
                    orderRepository.add(order);
                    System.out.println("new id là" + order.getOrderId());
                    break;
                case 4:
                    System.out.print("Nhập orderId muốn cập nhật: ");
                    int updateId = Integer.parseInt(sc.nextLine());
                    Order resultUpdate = orderRepository.findId(updateId);
                    if (resultUpdate != null){
                        Order orderUpdate = new Order();
                        orderUpdate.setOrderId(updateId);
                        orderUpdate.setCustomerId(1);
                        orderUpdate.setOrderDate(new java.sql.Date(System.currentTimeMillis()));
                        orderUpdate.setTotalAmount(66);
                        orderUpdate.setStatus("Delivered");
                        orderRepository.edit(orderUpdate);
                        System.out.println("Cập nhật thành công");
                    }
                    break;
                case 5:
                    System.out.print("Nhập orderId muốn xóa: ");
                    int deleteId = Integer.parseInt(sc.nextLine());
                    Order resultDelete = orderRepository.findId(deleteId);
                    if ( resultDelete != null){
                        orderRepository.remove(deleteId);
                        System.out.println("Xóa thành công");
                    } else {
                        System.out.println("Không tìm thấy Id: " +deleteId);
                    }

                    break;
                case 6:
                    System.exit(0);
                    break;
                default:
                    System.out.println("Hãy nhập từ 1-6");
            }

        } while (true);
    }


    public void showOrder(){

    }
}
