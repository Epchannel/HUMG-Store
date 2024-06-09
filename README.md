# HUMG Store

HUMG Store là một dự án website thương mại điện tử được xây dựng bằng PHP và MySQL. Dự án này cung cấp một nền tảng mua sắm trực tuyến đầy đủ tính năng với giao diện thân thiện và hiện đại.

## Tính Năng Chính

- Đăng ký/Đăng nhập người dùng
- Quản lý sản phẩm và đơn hàng
- Tích hợp thanh toán trực tuyến
- Tìm kiếm và lọc sản phẩm
- Giỏ hàng và thanh toán bảo mật

## Cài Đặt

### Yêu Cầu Hệ Thống
- XAMPP hoặc LAMP
- PHP >= 8.2.12
- MySQL

### Hướng Dẫn Cài Đặt

1. **Clone repository:**
    ```bash
    git clone https://github.com/Epchannel/HUMG-Store.git
    cd HUMG-Store
    ```

2. **Cấu hình database:**
    - Tạo một cơ sở dữ liệu mới trong MySQL.
    - Import file `webshop.sql` vào cơ sở dữ liệu vừa tạo.

3. **Cập nhật cấu hình kết nối database:**
    - Mở file `config.php` và cập nhật thông tin kết nối database.

    ```php
    <?php
    define('DB_SERVER', 'localhost');
    define('DB_USERNAME', 'root');
    define('DB_PASSWORD', '');
    define('DB_NAME', 'ten_cua_database');
    ```

4. **Khởi động XAMPP:**
    - Khởi động Apache và MySQL từ XAMPP Control Panel.

5. **Truy cập website:**
    - Mở trình duyệt và truy cập `http://localhost/HUMG-Store`.

## Video Giới Thiệu

[Xem video giới thiệu về HUMG Store trên YouTube](https://youtu.be/emztfbT4y0E)

[![HUMG Store - Video Giới Thiệu](https://img.youtube.com/vi/emztfbT4y0E/0.jpg)](https://youtu.be/emztfbT4y0E)

## Đóng Góp

Nếu bạn muốn đóng góp cho dự án, vui lòng fork repository này và gửi pull request. Chúng tôi rất hoan nghênh sự đóng góp từ cộng đồng!

## Giấy Phép

Dự án này được cấp phép theo giấy phép MIT. Xem file [LICENSE](LICENSE) để biết thêm chi tiết.

