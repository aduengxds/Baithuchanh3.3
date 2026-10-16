
# AI Prompt Log — FlashMart JOIN

## Prompt 1: INNER JOIN và LEFT JOIN

**Câu hỏi:** Trong MySQL, JOIN mặc định là loại nào? Nó xử lý bản ghi không có dòng khớp như thế nào?

**Tóm tắt trả lời:** JOIN mặc định là INNER JOIN. Chỉ các dòng có điều kiện ON khớp ở cả hai bảng mới được trả về. LEFT JOIN giữ toàn bộ dòng của bảng bên trái; nếu không có dòng tương ứng bên phải, các cột bên phải có giá trị NULL.

## Prompt 2: COUNT khi sử dụng LEFT JOIN

**Câu hỏi:** Nên dùng COUNT(*) hay COUNT(khóa chính của bảng Orders) để đếm đơn hàng khi LEFT JOIN?

**Tóm tắt trả lời:** Nên dùng COUNT(o.order_id). COUNT(cột) bỏ qua giá trị NULL nên khách hàng không có đơn sẽ có kết quả 0. COUNT(*) vẫn đếm dòng mà LEFT JOIN giữ lại, nên có thể trả về 1.

## Prompt 3: Anti-Join

**Câu hỏi:** Tại sao LEFT JOIN kết hợp WHERE o.order_id IS NULL tìm được sản phẩm chưa bán?

**Tóm tắt trả lời:** LEFT JOIN giữ mọi sản phẩm. Sản phẩm không có đơn hàng khớp sẽ có o.order_id = NULL. Điều kiện WHERE lọc ra những sản phẩm đó. Với INNER JOIN, các dòng không khớp đã bị loại bỏ nên không thể tìm ra sản phẩm chưa bán theo cách này.

## Prompt 4: LEFT JOIN IS NULL và NOT IN

**Câu hỏi:** So sánh LEFT JOIN ... IS NULL với NOT IN khi tìm bản ghi không tồn tại trong bảng khác.

**Tóm tắt trả lời:** Cả hai cách đều có thể dùng. Tuy nhiên, NOT IN có thể cho kết quả không mong muốn nếu truy vấn con trả về NULL. LEFT JOIN ... IS NULL và NOT EXISTS thường là các cách thể hiện anti-join rõ ràng. Hiệu năng phụ thuộc dữ liệu, chỉ mục và bộ tối ưu MySQL; có thể dùng EXPLAIN để kiểm tra.

## Prompt 5: Nested-Loop Join và Cross Join

**Câu hỏi:** Nested-Loop Join là gì? Cross Join có thể xảy ra khi nào?

**Tóm tắt trả lời:** Nested-Loop Join duyệt các dòng của một tập dữ liệu và tìm dòng phù hợp trong tập còn lại. Chỉ mục trên cột JOIN có thể giúp giảm chi phí tìm kiếm. Cross Join tạo tích Descartes, kết hợp mỗi dòng của bảng này với mọi dòng của bảng kia. Thiếu điều kiện JOIN hoặc sử dụng CROSS JOIN ngoài ý muốn có thể khiến số dòng tăng rất lớn.
