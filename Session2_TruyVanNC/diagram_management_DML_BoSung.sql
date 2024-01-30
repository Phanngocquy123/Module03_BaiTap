-- Tạo index cho các bảng Products, Customers, Orders phù hợp với mục đích truy vấn
CREATE INDEX IDX_PRO_PRODUCTNAME ON Products (ProductName);
SELECT * FROM Products WHERE ProductName = 'Men''s Dress Pants';
-- Tạo thủ tục	
-- 6. Liệt lấy ra n sản phẩm được đặt hàng nhiều nhất    
-- 7. Tìm kiếm sản phẩm dựa trên mức đánh giá trung bình    
-- 9. Tổng doanh thu từng tháng trong của năm x (x là tham số out của thủ tục)    
-- 10. Insert dữ liệu vào bảng order, trả về id của order vừa được insert    
-- (OUT orderId int, IN customerId int, IN orderDate datetime, IN totalAmount decimal(10,2), IN status enum('Pending','Shipped','Delivered','Cancelled')).

-- Tạo VIEW	
-- 2. Báo cáo số lượng sản phẩm đã bán theo danh mục	
-- 3. Báo cáo danh sách khách hàng và số lượng đơn hàng mỗi khách hàng đã đặt	
-- 4. Báo cáo tỷ lệ đơn hàng đã giao thành công

-- 6. Liệt lấy ra n sản phẩm được đặt hàng nhiều nhất   
DELIMITER //
CREATE PROCEDURE SP_ORERED_MAX ()
BEGIN 
	select  p.* , sum(ord.Quantity) as MaxOrder
	from Products p
    left join OrderDetails ord on ord.ProductID = p.ProductID
    group by p.ProductID
    order by MaxOrder desc 
	limit 1;
END
// 
DELIMITER ;
CALL SP_ORERED_MAX;

-- 7. Tìm kiếm sản phẩm dựa trên mức đánh giá trung bình   
DELIMITER //
CREATE PROCEDURE SP_SEARCH_AVGRATE (IN RATE float)
BEGIN 
	select p.*, avg(r.Rating) as AverageRating
	from Products p
	join Reviews r on p.ProductID = r.ProductID
	group by p.ProductID
    having AverageRating > RATE
	order by AverageRating DESC
;
END
// 
DELIMITER ;
CALL SP_SEARCH_AVGRATE(3);

-- 10. Insert dữ liệu vào bảng order, trả về id của order vừa được insert    
-- (OUT orderId int, IN customerId int, IN orderDate datetime, IN totalAmount decimal(10,2), IN status enum('Pending','Shipped','Delivered','Cancelled')).
DELIMITER //
CREATE PROCEDURE ORDER_INSERT ( IN customerId int, IN orderDate datetime, IN totalAmount decimal(10,2), IN status enum('Pending','Shipped','Delivered','Cancelled'), OUT orderId int)
BEGIN 
	declare newOrderId int; -- khai báo tạm
	insert into Orders (CustomerID, OrderDate, TotalAmount, Status) 
    values (CustomerID, OrderDate, TotalAmount, Status);
	set newOrderId = last_insert_id();
    set orderId = newOrderId
;
END
// 
DELIMITER ;
CALL ORDER_INSERT(6, '2024-02-02 17:00:00', 120.50, 'Pending',@newOrderId);
select @newOrderId;
select * from orders;

-- 2. Báo cáo số lượng sản phẩm đã bán theo danh mục	
CREATE VIEW VW_REPORT_PRODUCT_SELL
AS
select c.* , sum(ord.Quantity) as TotalCategorySold
	from Categories c
    left join Products p  on c.CategoryID = p.CategoryID 
    left join OrderDetails ord on ord.ProductID = p.ProductID
    group by c.CategoryID
    having TotalCategorySold > 0
;
SELECT * FROM VW_REPORT_PRODUCT_SELL;

-- 3. Báo cáo danh sách khách hàng và số lượng đơn hàng mỗi khách hàng đã đặt	
CREATE VIEW VW_CUSTOMER_ORDERED
AS
select cus.*, sum(ord.Quantity) as TotalBought
	from Customers cus
    left join Orders o on o.CustomerID = cus.CustomerID
    left join OrderDetails ord on ord.OrderID = o.OrderID
    group by cus.CustomerID
;
SELECT * FROM VW_CUSTOMER_ORDERED;

-- 4. Báo cáo tỷ lệ đơn hàng đã giao thành công
CREATE VIEW VW_RATE_DELIVERED
AS
select o.Status, count(o.Status)*100/(select count(*) from orders) as RateDelivered
	from orders o
	where o.Status = 'Delivered'
	group by o.Status
;
SELECT * FROM VW_RATE_DELIVERED;