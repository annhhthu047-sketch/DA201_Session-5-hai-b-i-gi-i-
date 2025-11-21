use sakila;
SELECT customer_id, amount, payment_date
FROM sakila.payment
WHERE payment_date > '2005-08-01'
  AND amount > 9.00
ORDER BY amount DESC;
SELECT payment_id, customer_id, staff_id, amount
FROM sakila.payment
WHERE amount = 0.00
   OR (staff_id = 1 AND amount > 10.00)
ORDER BY customer_id ASC;
/*
Nhận định:

1. Khách hàng VIP:
- Dựa vào Nhiệm vụ 1, nhóm khách hàng có amount > 9.00 sau ngày 2005-08-01 chi tiêu nhiều, tức là những khách hàng thường xuyên thực hiện các giao dịch giá trị cao.
- Việc sắp xếp theo amount giảm dần giúp quản lý dễ dàng nhận ra những khách hàng chi tiêu cao nhất, từ đó xác định nhóm VIP để ưu tiên chăm sóc hoặc gửi khuyến mãi đặc biệt.

2. Giao dịch Bất thường:
- Những giao dịch có amount = 0.00 có thể xuất phát từ nhiều nguyên nhân: chương trình khuyến mãi, phiếu quà tặng, hoặc lỗi nhập liệu hệ thống.
- Quản lý cần quan tâm đến các giao dịch này để kiểm soát doanh thu thực, tránh sai sót kế toán và đảm bảo chương trình khuyến mãi được áp dụng chính xác.

3. Hiệu suất Nhân viên:
- Kết quả từ Nhiệm vụ 2 cho thấy nhân viên có staff_id = 1 xử lý các giao dịch có giá trị > 10.00. Đây có thể là dấu hiệu nhân viên đảm nhận các giao dịch quan trọng hoặc khách hàng lớn.
- Tuy nhiên, để kết luận chắc chắn về hiệu suất, cần thêm thông tin: số lượng giao dịch thành công/thất bại, tổng doanh thu do nhân viên này thực hiện, đánh giá phản hồi khách hàng và mức độ rủi ro của các giao dịch.
*/