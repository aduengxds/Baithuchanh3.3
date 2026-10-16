
# Phân tích COUNT(o.order_id) và COUNT(*)

Khi sử dụng LEFT JOIN, tất cả khách hàng vẫn được giữ lại, kể cả khách hàng chưa có đơn hàng. Với khách hàng không có đơn, các cột thuộc bảng Orders sẽ có giá trị NULL.

COUNT(o.order_id) chỉ đếm các giá trị order_id khác NULL, vì vậy khách hàng Charlie có total_orders bằng 0. Ngược lại, COUNT(*) đếm dòng kết quả sau JOIN. Dòng của Charlie vẫn tồn tại nên COUNT(*) trả về 1, không đúng với số đơn hàng thực tế.

Vì vậy, khi cần đếm số bản ghi khớp từ bảng phụ trong LEFT JOIN, nên sử dụng COUNT() trên cột của bảng phụ có thể xác định bản ghi tồn tại, thường là khóa chính.
