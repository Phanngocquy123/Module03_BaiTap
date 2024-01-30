create database TicketFilm;
use TicketFilm;

create table tblPhim(
PhimID int,
Ten_phim nvarchar(30),
Loai_phim nvarchar(25),
Thoi_gian int
);
alter table tblPhim
	add primary key (PhimID);
    
create table tblVe(
PhimID int,
GheID int,
Ngay_chieu datetime,
Trang_thai nvarchar(20)
);
alter table tblVe
	add foreign key(PhimID) references tblPhim(PhimID),
    add foreign key(GheID) references tblGhe(GheID);
    
create table tblGhe(
GheID int,
PhongID int,
So_ghe varchar(10)
);
alter table tblGhe
	add primary key(GheID),
    add foreign key(PhongID) references tblPhong(PhongID);
    
    
create table tblPhong(
PhongID int,
Ten_phong nvarchar(20),
Trang_thai tinyint
);
alter table tblPhong
	add primary key(PhongID);
    
    
insert into tblPhim(PhimID, Ten_phim, Loai_phim, Thoi_gian) values
(1,'Em bé Hà Nội', 'Tâm lý', 90),
(2,'Nhiệm vụ bất khả thi', 'Hành động', 100),
(3,'Dị nhân', 'Viễn tưởng', 90),
(4,'Cuốn theo chiều gió', 'Tình cảm', 120)
;

SELECT CONVERT('10-20-2008', datetime);
SELECT DATE_FORMAT(ve.Ngay_chieu, '%m/%d/%Y') AS formatted_Ngay_chieu
FROM tblVe ve;
insert into tblVe(PhimID, GheID, Ngay_chieu, Trang_thai) values 
(1, 1 ,'2008-10-20 12:34:56', 'Đã bán'),
(1, 3 ,'2008-11-20 12:34:56', 'Đã bán'),
(1, 4 ,'2008-12-23 12:34:56', 'Đã bán'),
(2, 1 ,'2009-02-14 12:34:56', 'Đã bán'),
(3, 1 ,'2009-02-14 12:34:56', 'Đã bán'),
(2, 5 ,'2009-03-08 12:34:56', 'Chưa bán'),
(2, 3 ,'2009-03-08 12:34:56', 'Chưa bán')
;
select * from tblVe;
drop table tblVe;

insert into tblGhe(GheID, PhongID, So_ghe) values 
(1, 1, 'A3'),
(2, 1, 'B5'),
(3, 1, 'A7'),
(4, 1, 'D1'),
(5, 1, 'T2')
;

insert into tblPhong(PhongID, Ten_phong, Trang_thai) values
(1, 'Phòng chiếu 1', 1),
(2, 'Phòng chiếu 2', 1),
(3, 'Phòng chiếu 3', 0)
;

-- 2. Hiển thị danh sách các phim (chú ý: danh sách phải được sắp xếp theo trường Thoi_gian)
create view VW_LIST_PHIM
as
select * from tblPhim ph
	order by ph.Thoi_gian desc
;
select * from VW_LIST_PHIM;

-- 3. Hiển thị Ten_phim có thời gian chiếu dài nhất
select * from VW_LIST_PHIM
limit 1;

-- 4. Hiển thị Ten_Phim có thời gian chiếu ngắn nhất
select * from tblPhim ph
	where ph.Thoi_gian = (select min(vwPh.Thoi_gian) from VW_LIST_PHIM as vwPh)
;

-- 5. Hiển thị danh sách So_Ghe mà bắt đầu bằng chữ ‘A’
select * from tblGhe
	where So_ghe like 'A%'
;

-- 6. Sửa cột Trang_thai của bảng tblPhong sang kiểu nvarchar(25)
alter table tblPhong
	modify column Trang_thai nvarchar(25)
;

-- 7. Cập nhật giá trị cột Trang_thai của bảng tblPhong theo các luật sau:
-- •	Nếu Trang_thai=0 thì gán Trang_thai=’Đang sửa’
-- •	Nếu Trang_thai=1 thì gán Trang_thai=’Đang sử dụng’
-- •	Nếu Trang_thai=null thì gán Trang_thai=’Unknow’
-- Sau đó hiển thị bảng tblPhong
SET SQL_SAFE_UPDATES = 0; -- fix lỗi 1175
update tblPhong
	set Trang_thai =
		case
			when Trang_thai = 0 then 'Đang sửa'
			when Trang_thai = 1 then 'Đang sử dụng'
            else 'Unknow'
		end;
select * from tblPhong;

-- 8. Hiển thị danh sách tên phim mà có độ dài >15 và < 25 ký tự
select * from VW_LIST_PHIM
	where length(Ten_phim) > 10 and  length(Ten_phim) < 25
;
SELECT LENGTH('Em bé Hà Nội') AS SoKyTu;

-- 9.	Hiển thị Ten_Phong và Trang_Thai trong bảng tblPhong 
-- trong 1 cột với tiêu đề ‘Trạng thái phòng chiếu’
select concat(Ten_phong,' - ',Trang_thai) as 'Trạng thái phòng chiếu'
	from tblPhong;
    
    
-- 10.Tạo bảng mới có tên tblRank với các cột sau: 
-- STT(thứ hạng sắp xếp theo Ten_Phim), TenPhim, Thoi_gian
-- Tạo bảng tblRank
create table tblRank (
STT int primary key auto_increment,
TenPhim nvarchar(30),
Thoi_gian int
);
-- Chèn dữ liệu từ bảng tblPhim vào bảng tblRank
insert into tblRank ( TenPhim, Thoi_gian)
	select Ten_phim as TenPhim, Thoi_gian
	from tblPhim;
-- Hiển thị dữ liệu trong bảng tblRank
select * from tblRank;

-- 11. Trong bảng tblPhim :
-- a. Thêm trường Mo_ta kiểu nvarchar(max)
alter table tblPhim
	add Mo_ta nvarchar(500)
;

-- b. Cập nhật trường Mo_ta: thêm chuỗi “Đây là bộ phim thể loại ” + nội dung trường LoaiPhim
update tblPhim
	set Mo_ta = concat('Đây là bộ phim thể loại ' ,Loai_phim) 
;

-- d. Cập nhật trường Mo_ta: thay chuỗi “bộ phim” thành chuỗi “film”
update tblPhim
	set Mo_ta = replace(Mo_ta, 'bộ phim', 'film')
;

-- c, e. Hiển thị bảng tblPhim sau khi cập nhật
select * from tblPhim;



-- 12.	Xóa tất cả các khóa ngoại trong các bảng trên.
alter table tblVe 
	drop constraint PhimID,
    drop constraint GheID
;
alter table tblGhe 
	drop constraint PhongID
;

-- 13.	Xóa dữ liệu ở bảng tblGhe
delete from tblGhe;

-- 14.	Hiển thị ngày giờ hiện tại và ngày giờ hiện tại cộng thêm 5000 phút
select 
	now() as 'Ngày giờ hiện tại',
	now() + interval 5000 minute as 'Ngày giờ hiện tại cộng thêm 5000 phút'
;