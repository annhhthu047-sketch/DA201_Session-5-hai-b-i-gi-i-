USE sakila;
INSERT INTO customer (store_id, first_name, last_name, email, address_id, active, create_date)
VALUES (2, 'ANNA', 'HILL', 'ANNA.HILL@sakilacustomer.org', 5, 1, NOW());
set sql_safe_updates=0;
UPDATE customer
SET email = REPLACE(email, '@sakilacustomer.org', '@sakilacustomer.com')
WHERE first_name = 'JENNIFER';
UPDATE customer
SET active = 0
WHERE customer_id = 25;
/*
Lý do ưu tiên soft delete thay vì hard delete:

1. Lưu giữ lịch sử giao dịch:
- Khách hàng vẫn tồn tại trong hệ thống để phục vụ báo cáo, phân tích doanh thu, hoặc truy vết lịch sử giao dịch.  
- Nếu xóa vĩnh viễn, sẽ mất thông tin quan trọng phục vụ quản lý và kế toán.

2. Giảm rủi ro mất dữ liệu:
- Soft delete cho phép khôi phục tài khoản khi khách hàng quay lại hoặc khi cần điều tra dữ liệu.  
- Hard delete sẽ xóa hoàn toàn, khó phục hồi và có thể gây sai lệch dữ liệu tổng quan.

3. Dễ dàng quản lý trạng thái hoạt động:
- Các báo cáo có thể lọc `active = 1` để chỉ lấy khách hàng đang hoạt động.  
- Giúp hệ thống và phân tích dữ liệu minh bạch, đồng thời tránh lỗi khi xóa dữ liệu liên quan.
*/