





-- 7. Tìm kiếm sản phẩm dựa trên mức đánh giá trung bình

-- 9. Tổng doanh thu từng tháng trong năm

-- 1. Báo cáo tổng doanh thu từng đơn hàng
select o.*, sum(ord.Price*ord.Quantity) as TotalIncome
	from Orders o
    inner join orderdetails ord ON o.OrderID = ord.OrderID
    group by o.OrderID
;

-- 2. Báo cáo số lượng sản phẩm đã bán theo danh mục
select c.* , sum(ord.Quantity) as TotalCategorySold
	from Categories c
    left join Products p  on c.CategoryID = p.CategoryID 
    left join OrderDetails ord on ord.ProductID = p.ProductID
    group by c.CategoryID
    having TotalCategorySold > 0
;
-- 3. Báo cáo danh sách khách hàng và số lượng đơn hàng mỗi khách hàng đã đặt
select cus.*, sum(ord.Quantity) as TotalBought
	from Customers cus
    left join Orders o on o.CustomerID = cus.CustomerID
    left join OrderDetails ord on ord.OrderID = o.OrderID
    group by cus.CustomerID
;

-- 4. Báo cáo tỷ lệ đơn hàng đã giao thành công
select o.Status, count(o.Status)*100/(select count(*) from orders) as RateDelivered
	from orders o
	where o.Status = 'Delivered'
	group by o.Status
;
select * from orders;

-- 5. Báo cáo đánh giá sản phẩm và điểm đánh giá trung bình cho mỗi sản phẩm


-- 6. Liệt kê các sản phẩm được đặt hàng nhiều nhất
select  p.* , sum(ord.Quantity) as MaxOrder
	from Products p
    left join OrderDetails ord on ord.ProductID = p.ProductID
    group by p.ProductID
    order by MaxOrder desc 
	limit 1
;

-- 8. Tìm khách hàng có đơn hàng có giá trị cao nhất
select cus.*, sum(ord.Price*ord.Quantity) as MaxPriceOrder
	from Customers cus
    left join Orders o on o.CustomerID = cus.CustomerID
    left join OrderDetails ord on ord.OrderID = o.OrderID
    group by cus.CustomerID
    order by MaxPriceOrder desc 
    limit 1
;

