-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 12, 2022 lúc 05:54 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'admin', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 1641509311);


-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

CREATE TABLE `catalog` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Thời trang', '', 0, 1, '2021-01-01 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2021-01-01 05:35:48'),
(3, 'Khuyến mại', '', 0, 3, '2021-01-01 05:35:59'),
(4, 'Tin tức', '', 0, 4, '2021-01-01 05:36:13'),
(5, 'Giỏ hàng', '', 0, 6, '2021-01-01 05:36:49'),
(6, 'Liên hệ', '', 0, 5, '0000-00-00 00:00:00'),
(7, 'Thời trang nam', '', 1, 1, '2021-01-01 05:37:23'),
(8, 'Thời trang nữ', '', 1, 2, '2021-01-01 05:37:36'),
(9, 'Thời trang trẻ em', 'trẻ em', 1, 4, '2021-01-01 00:00:00'),
(10, 'Áo Hoodie, Áo Len , Áo Nỉ', '', 7, 1, '2021-01-01 09:08:19'),
(11, 'Áo sơ mi nam', '', 7, 2, '2021-01-01 09:08:36'),
(12, 'Quần Jeans', '', 7, 3, '2021-01-01 09:09:01'),
(13, 'Quần Kali', '', 7, 4, '2021-01-01 09:09:14'),
(14, 'Quần Short', '', 7, 5, '2021-01-01 09:09:31'),
(15, 'Áo thun nữ', '', 8, 1, '2021-01-01 09:09:46'),
(16, 'Áo khoác, Áo choàng , Vest', '', 8, 2, '2021-01-01 09:10:10'),
(17, 'Đầm, váy', '', 8, 3, '2021-01-01 09:23:39'),
(18, 'Áo công sở', '', 8, 4, '2021-01-01 09:23:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `image_link` text NOT NULL,
  `rate` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`id`, `product_id`, `content`, `image_link`, `rate`, `date`, `user_id`) VALUES
(1, 1, 'Áo đẹp quá!', 'sp1_2.jpg', 5, 1642006097, 1),
(2, 6, 'Váy quá xịn luôn hihi !!!!', 'sp6_3.jpg', 5, 1642006155, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT 0,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` int(11) NOT NULL DEFAULT 0,
  `size_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`, `size_id`) VALUES
(1, 1, 1, 1, '200000.00', 0, '01'),
(2, 1, 1, 2, '400000.00', 0, '02'),
(3, 1, 6, 1, '159000.00', 0, '01'),
(4, 2, 1, 2, '400000.00', 0, '01'),
(5, 2, 4, 1, '150000.00', 0, '01'),
(6, 2, 17, 1, '244000.00', 0, '01'),
(7, 2, 27, 2, '518000.00', 0, '01'),
(8, 2, 16, 1, '150000.00', 0, '02'),
(9, 3, 6, 1, '159000.00', 0, '02'),
(10, 3, 25, 1, '268000.00', 0, '01'),

(14, 5, 18, 1, '248000.00', 0, '01'),
(15, 5, 15, 1, '74000.00', 0, '01'),
(16, 5, 21, 1, '175000.00', 0, '01'),
(17, 6, 22, 1, '150000.00', 0, '02'),
(18, 7, 21, 3, '525000.00', 0, '02'),
(19, 8, 21, 2, '350000.00', 0, '01'),
(20, 8, 21, 1, '175000.00', 0, '02'),
(21, 9, 10, 1, '130000.00', 0, '01'),
(22, 10, 24, 1, '269000.00', 0, '01'),
(23, 11, 4, 1, '150000.00', 0, '01'),
(24, 12, 21, 1, '175000.00', 0, '02'),
(25, 12, 21, 2, '350000.00', 0, '01'),
(26, 13, 22, 1, '150000.00', 0, '01'),
(27, 14, 27, 1, '259000.00', 0, '01'),
(28, 15, 6, 1, '159000.00', 0, '01'),
(29, 15, 6, 2, '318000.00', 0, '03'),
(30, 16, 11, 2, '140000.00', 0, '01'),
(31, 17, 19, 2, '168000.00', 0, '02'),
(32, 18, 20, 2, '300000.00', 0, '02'),
(33, 18, 20, 1, '150000.00', 0, '03'),
(34, 19, 1, 1, '200000.00', 0, '01'),
(35, 20, 26, 2, '700000.00', 0, '01'),
(36, 21, 21, 1, '175000.00', 0, '01'),
(37, 21, 10, 2, '260000.00', 0, '01'),
(38, 21, 24, 2, '538000.00', 0, '01'),
(39, 21, 24, 1, '269000.00', 0, '02'),
(40, 22, 18, 3, '744000.00', 0, '01'),
(41, 23, 7, 2, '500000.00', 0, '01'),
(42, 23, 7, 3, '750000.00', 0, '02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) NOT NULL,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `discount` int(11) DEFAULT 0,
  `image_link` varchar(100) NOT NULL,
  `image_list` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT 0,
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT 4,
  `rate_count` int(255) NOT NULL DEFAULT 1,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(1, 16, 'Áo blazer nữ 2 lớp', '<p><strong>Th&ocirc;ng tin sản phẩm:</strong></p>\r\n\r\n<p>&Aacute;o blazer nữ 2 lớp - &aacute;o vest nữ 2 lớp chất dạ kẻ (h&agrave;ng đẹp) phong c&aacute;ch Ulzzang H&agrave;n Quốc Kanimi Một trong những m&oacute;n đồ kh&ocirc;ng thể thiếu cho c&aacute;c n&agrave;ng trong m&ugrave;a thu đ&ocirc;ng 2020. Đ&oacute; ch&iacute;nh l&agrave; &aacute;o kho&aacute;c blazer, &aacute;o vest kẻ 2 lớp vừa trẻ trung năng động m&agrave; cũng rất style nha.</p>\r\n\r\n<p>&Aacute;o trơn th&igrave; trend b&acirc;y giờ l&agrave; free size phom rộng mặc cho đẹp kh&aacute;ch nha! Mặc kho&aacute;c ngo&agrave;i trong thời tiết m&ugrave;a đ&ocirc;ng qu&aacute; l&agrave; hợp l&yacute; lu&ocirc;n ạ!</p>\r\n\r\n<p><strong>M&ocirc; tả:</strong></p>\r\n\r\n<p>&Aacute;o gồm 2 lớp: b&ecirc;n trong l&agrave; lớp l&oacute;t lụa xịn x&ograve;, ngo&agrave;i l&agrave; chất dạ kẻ d&agrave;y mềm ấm. &Aacute;o cầm nặng tay, rất d&agrave;y ấm kh&aacute;ch nha! &Aacute;o form d&aacute;ng rộng, dễ mặc dễ phối đồ. Chất dạ kh&ocirc;ng bị bai x&ugrave; &Aacute;o nh&agrave; m&igrave;nh l&agrave; đặt trực tiếp Nh&agrave; m&aacute;y chuy&ecirc;n may h&agrave;ng xuất dư n&ecirc;n c&aacute;c n&agrave;ng ko phải lo chất lượng nha, cam kết đẹp chuẩn h&agrave;ng VNXK lu&ocirc;n ạ!&nbsp;</p>\r\n', '250000.00', 50000, 'sp1_1.jpg', '[\"sp1_2.jpg\",\"sp1_3.jpg\",\"sp1_4.jpg\"]', 27, 6, 10, 2, 1493983674),
(2, 16, 'ÁO KHOÁC JEAN TRƠN BASIC', '<p>✨ <strong>Jacket Jean Trơn BASIC </strong>chất v&agrave; xinh qu&aacute; chừng ☺️☺️</p>\r\n\r\n<p>✨Th&ecirc;m 1 si&ecirc;u phẩm qu&aacute; tuyệt vời cho m&ugrave;a xu&acirc;n hạ&nbsp;</p>\r\n\r\n<p>✨ Mặc đ&ocirc;i hay đơn cũng iu lu&ocirc;n , nhớ tag bạn th&acirc;n v&agrave;o c&ugrave;ng mua &aacute;o nhaaa&nbsp;</p>\r\n\r\n<p>✨ B&ecirc;n m&igrave;nh về đủ size nam nữ M - L - XL nh&eacute; ạ , chất Jean d&agrave;y dặn kh&ocirc;ng bai x&ugrave; hay bạc m&agrave;u đ&acirc;u nhaaa&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Size M: 1m50-1m6 và 45kg-55kg</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Size L: 1m6-1m67 và 55kg-60kg</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; + Size XL: 1m67-1m7 và 60kg-75kg</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;(T&ugrave;y theo h&igrave;nh thể mỗi người, c&oacute; thể ch&ecirc;nh lệch&nbsp;một t&iacute; ạ)</p>\r\n\r\n<p>✨H&igrave;nh chủ shop mặc mẫu nh&eacute; !!!</p>\r\n', '235000.00', 0, 'sp2_1.jpg', '[\"sp2_2.jpg\",\"sp2_3.jpg\"]', 5, 0, 5, 1, 1493983674),
(3, 16, 'Áo hoddie Unisex Nữ', '<p><strong>TH&Ocirc;NG TIN SẢN PHẨM</strong></p>\r\n\r\n<p>&Aacute;o Hoddie Unisex Freesize Ulzang Năng Động, C&aacute; T&iacute;nh</p>\r\n\r\n<p>Chất liệu: Nỉ</p>\r\n\r\n<p>In cao cấp 5D đặc biệt kh&ocirc;ng ra m&agrave;u, KH&Ocirc;NG BONG TR&Oacute;C v&agrave; AN TO&Agrave;N với sức khoẻ</p>\r\n\r\n<p>M&agrave;u &aacute;o : Như h&igrave;nh</p>\r\n\r\n<p>&nbsp;Form &aacute;o rộng r&atilde;i dưới 65kg (ph&ugrave; hợp với nhũng bạn m68 đổ lại nh&eacute; cả nh&agrave;)</p>\r\n\r\n<p>Th&ocirc;ng số &aacute;o : d&agrave;i 70cm - ngang 59cm</p>\r\n\r\n<p>*&Aacute;o Hoddie Unisexi được thiết kế tinh tế với m&agrave;u sắc kh&aacute;c nhau, t&ugrave;y theo sở th&iacute;ch m&agrave; bạn lựa chọn. Ngo&agrave;i ra, đường may &aacute;o rất tỉ mỉ, chất liệu nỉ mềm mịn đẹp, kh&ocirc;ng x&ugrave;, form d&aacute;ng khỏe khoắn tạo cảm gi&aacute;c thoải m&aacute;i v&agrave; phong c&aacute;ch trẻ trung, lịch l&atilde;m cho người mặc.</p>\r\n\r\n<p>M&agrave;u sắc trang nh&atilde; dễ d&agrave;ng mix c&ugrave;ng c&aacute;c trang phục kh&aacute;c như &aacute;o sơ mi, quần jean, short &hellip; đều tr&ocirc;ng rất tuyệt. Set đồ n&agrave;y đi l&agrave;m, đi học, dạo phố, đi chơi, du lịch trong m&ugrave;a thu đ&ocirc;ng đều hợp thời trang nh&eacute;</p>\r\n\r\n<p>Đặc điểm nổi bật của Hoodie oversize Unisex form rộng:</p>\r\n\r\n<p>&nbsp; &nbsp; - L&agrave; item kh&ocirc;ng thể thiếu trong tủ đồ v&igrave; sự thoải m&aacute;i, dễ chịu, lại rất dễ phối đồ trong m&ugrave;a thu đ&ocirc;ng</p>\r\n\r\n<p>&nbsp; &nbsp; - Hoodie unisex th&iacute;ch hợp với cả nam v&agrave; nữ. Mặc l&agrave;m &aacute;o thun cặp, &aacute;o nh&oacute;m rất ph&ugrave; hợp.</p>\r\n\r\n<p>&nbsp; &nbsp; - Hoodie form rộng dễ d&agrave;ng phối đồ, thời trang phong c&aacute;ch H&agrave;n Quốc</p>\r\n', '200000.00', 20000, 'sp3_1.jpg', '[\"sp3_41.jpg\"]', 51, 0, 5, 1, 1493983674),
(4, 17, 'Đầm suông tay bèo đính hột thiết kế ', '<p><strong>TH&Ocirc;NG TIN SẢN PHẨM</strong></p>\r\n\r\n<p>Free size dưới 60kg 2 m&agrave;u: đen, đỏ tươi</p>\r\n\r\n<p><strong>Chất vải boi</strong></p>\r\n\r\n<p>-V&ograve;ng ngực: 95 cm</p>\r\n\r\n<p>-V&ograve;ng eo:k&egrave;m d&acirc;y cột nơ</p>\r\n\r\n<p>-Chiều d&agrave;i: 88 cm</p>\r\n\r\n<p>_____________________________________</p>\r\n\r\n<p><strong>Đảm bảo FORM đẹp như h&igrave;nh ảnh</strong></p>\r\n\r\n<p>H&agrave;ng sẽ được đổi mẫu khi mặc kh&ocirc;ng vừa/đổi trả khi h&agrave;ng bị lỗi trong v&ograve;ng 48h</p>\r\n\r\n<p>H&atilde;y y&ecirc;n t&acirc;m l&agrave; bạn mua được với mức gi&aacute; cực k&igrave; hợp l&iacute;</p>\r\n\r\n<p>&nbsp;Đảm bảo sản phẩm bạn nhận được đ&uacute;ng với số tiền bạn bỏ ra</p>\r\n\r\n<p>Giao h&agrave;ng đ&uacute;ng hẹn, h&agrave;ng đến tận tay mới trả tiền</p>\r\n\r\n<p>_____________________________________</p>\r\n', '250000.00', 100000, 'sp4_1.jpg', '[\"sp4_2.jpg\",\"sp4_3.jpg\"]', 23, 2, 5, 1, 1493983674),
(5, 17, 'Đầm maxi  trắng ', '<p><strong>M&Ocirc; TẢ SẢN PHẨM</strong></p>\r\n\r\n<p>Kh&aacute;ch xem kĩ SỐ ĐO tại phần m&ocirc; tả sản phẩm</p>\r\n\r\n<p>Quyền lợi: Khuyến kh&iacute;ch kh&aacute;ch CHAT tư vấn số đo sản phẩm</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>⭕️⭕️ Trắng linen g&acirc;n c&oacute; độ co d&atilde;n như thun thấm h&uacute;t mồ h&ocirc;i tốt cực k&igrave; m&aacute;t mịn rũ đẹp</p>\r\n\r\n<p>⭕️⭕️ Trắng trơn &iacute;t co d&atilde;n v&agrave; thấm h&uacute;t mồ h&ocirc;i, bề mặc l&aacute;ng tạo cảm gi&aacute;c bồng bềnh</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>-V&ograve;ng ngực: 88 cm</p>\r\n\r\n<p>-V&ograve;ng eo:78 cm</p>\r\n\r\n<p>-Chiều d&agrave;i: 100 cm</p>\r\n\r\n<p>_____________________________________</p>\r\n\r\n<p>- Đảm bảo FORM đẹp như h&igrave;nh ảnh</p>\r\n\r\n<p>- H&agrave;ng lỗi bao đổi trả</p>\r\n\r\n<p>- H&atilde;y y&ecirc;n t&acirc;m l&agrave; bạn mua được với mức gi&aacute; cực k&igrave; hợp l&iacute;</p>\r\n\r\n<p>_____________________________________</p>\r\n', '200000.00', 0, 'sp5_1.jpg', '[\"sp5_2.jpg\",\"sp5_3.jpg\",\"sp5_4.jpg\"]', 28, 0, 5, 1, 1641422911),
(6, 17, 'Đầm hai dây đầm noel trắng', '<p><strong>M&Ocirc; TẢ SẢN PHẨM</strong></p>\r\n\r\n<p>Đầm 2 d&acirc;y trắng thời trang nữ sang chảnh bo ngực vải CAO C&Acirc;́P</p>\r\n\r\n<p>M&agrave;u trắng</p>\r\n\r\n<p>H&agrave;ng cam kết chuẩn Form, chuẩn h&igrave;nh</p>\r\n\r\n<p>Chất liệu cao cấp, may 2 lớp, đường may tinh tế, cam kết b&aacute;n h&agrave;ng Store kh&ocirc;ng phải h&agrave;ng chợ</p>\r\n\r\n<p>Chất vải mềm mịn, kh&ocirc;ng bai, kh&ocirc;ng x&ugrave;, kh&ocirc;ng d&atilde;o</p>\r\n\r\n<p>Thật dịu d&agrave;ng =&gt; T&ocirc;n n&eacute;t đẹp thuần khiết.</p>\r\n\r\n<p>--------------------------------------</p>\r\n\r\n<p><strong>CAM KẾT CHẤT LƯỢNG</strong></p>\r\n\r\n<p>- H&agrave;ng sẽ được đổi mẫu khi mặc kh&ocirc;ng vừa/đổi trả khi h&agrave;ng bị lỗi - H&atilde;y y&ecirc;n t&acirc;m l&agrave; bạn mua được với mức gi&aacute; cực rẻ so với chất lượng sản phẩm</p>\r\n\r\n<p>--------------------------------------</p>\r\n\r\n<p>HƯỚNG DẪN BẢO QUẢN</p>\r\n\r\n<p>- N&ecirc;n giặt với nước ở nhiệt độ thường.</p>\r\n\r\n<p>- N&ecirc;n phơi sản phẩm ở nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t, hạn chế &aacute;nh nắng trực tiếp.</p>\r\n\r\n<p>- Kh&ocirc;ng n&ecirc;n ng&acirc;m qu&aacute; l&acirc;u hoặc sử dụng c&aacute;c chất c&oacute; t&iacute;nh tẩy mạnh, tr&aacute;nh ch&agrave; x&aacute;t bằng b&agrave;n chải</p>\r\n\r\n<p>- Kh&ocirc;ng xoắn vắt mạnh, n&ecirc;n giặt bằng tay hoặc m&aacute;y giặt với lực quay nhẹ</p>\r\n\r\n<p>--------------------------------------</p>\r\n', '179000.00', 20000, 'sp6_1.jpg', '[\"sp6_2.jpg\",\"sp6_3.jpg\"]', 7, 5, 9, 2, 1493983674),
(7, 18, 'Áo sơ mi lụa cổ nơ tay bồng', '<p><strong>M&Ocirc; TẢ SẢN PHẨM:</strong></p>\r\n\r\n<p>✔️ Kiểu d&aacute;ng: &aacute;o sơ mi lụa cổ nơ tay bồng</p>\r\n\r\n<p>✔️ M&agrave;u sắc: xanh đ&aacute;, trắng, hồng</p>\r\n\r\n<p>✔️ Chiều d&agrave;i: 63-65cm</p>\r\n\r\n<p>✔️ Chất liệu: vải lụa mờ HQ</p>\r\n\r\n<p>*** Xin qu&yacute; kh&aacute;ch h&agrave;ng lưu &yacute;***: Trong qu&aacute; tr&igrave;nh vận chuyển h&agrave;ng đến tay qu&yacute; kh&aacute;ch,sản phẩm c&oacute; thể bị nh&agrave;u do qu&aacute; tr&igrave;nh vận chuyển v&igrave; vậy rất mong qu&yacute; kh&aacute;ch th&ocirc;ng cảm cho shop. Qu&yacute; kh&aacute;ch n&ecirc;n giặt ủi trước khi sử dụng . Một số sản phẩm c&oacute; thể sai kh&aacute;c do g&oacute;c chụp, &aacute;nh s&aacute;ng, độ tương phản... Nếu kiểm tra sản phẩm bị lỗi hoặc c&aacute;c vấn đề kh&aacute;c li&ecirc;n quan vui l&ograve;ng giữ nguy&ecirc;n hiện trạng ban đầu (tem, m&aacute;c, bao b&igrave;...) v&agrave; li&ecirc;n hệ với shop để được hỗ trợ trong thời gian sớm nhất.</p>\r\n', '299000.00', 49000, 'sp7_1.jpg', '[\"ao-kieu-cong-so-a0122-1m4G3-o0hhot_simg_d0daf0_800x1200_max.png\",\"ao-kieu-cong-so-a0122-1m4G3-qXBUW2_simg_d0daf0_800x1200_max.png\",\"ao-kieu-cong-so-a0122-1m4G3-vS6ei3_simg_d0daf0_800x1200_max.png\"]', 3, 5, 4, 1, 1493983674),
(8, 18, 'ÁO SƠ MI NỮ THIẾT KẾ BÈO NHÚN AM249 ROSARA', '<p><strong>TH&Ocirc;NG TIN SẢN PHẨM:</strong></p>\r\n\r\n<p>- Chất liệu vải: Lụa h&agrave;n</p>\r\n\r\n<p>- Hướng dẫn giặt ủi: n&ecirc;n giặt tay, kh&ocirc;ng giặt c&ugrave;ng sản phẩm m&agrave;u</p>\r\n\r\n<p>-------------------------------&nbsp;</p>\r\n', '210000.00', 30000, 'sp8_1.jpg', '[\"sp8_2.jpg\",\"sp8_3.jpg\"]', 25, 0, 4, 1, 1493983674),
(9, 15, 'Áo Thun Nữ - T shirt Penny Building - 2N Unisex', '<p>Bạn ơi đừng ngại nữa, nh&agrave; m&igrave;nh c&ograve;n g&igrave; đ&acirc;u.</p>\r\n\r\n<p>Chỉ to&agrave;n l&agrave; &aacute;o xịn, mua rồi l&agrave; nghiện đ&oacute;!!!!</p>\r\n\r\n<p>⚡️&Aacute;O THUN TAY LỠ FORM RỘNG UNISEX/ &Aacute;O PH&Ocirc;NG RỘNG⚡️</p>\r\n\r\n<p>✔ Với chất liệu thun cotton d&agrave;y mịn được lựa chọn kĩ lưỡng để phù hợp với mọi hoàn cảnh.</p>\r\n\r\n<p>✔ Thiết kế Unisex sẽ mang đến một outfit năng động và cá tính dù không cần mix-match cầu kì.</p>\r\n\r\n<p>✔ Form &aacute;o unisex nam nữ đều mặc được. ▪ Chiều d&agrave;i &aacute;o: 70cm ▪ Ngang ngực: 52cm ▪ Tay &aacute;o d&agrave;i: 26cm ▪ Ngang vai: 53cm =&gt; 45kg-65kg/ 1m50-1m75: L&ecirc;n form rộng thoải m&aacute;i. =&gt; 66kg-72kg/ 1m60-1m75: L&ecirc;n form rộng vừa. =&gt; Nếu bạn không rõ m&igrave;nh mặc như thế n&agrave;o, bạn có thể inbox chiều cao và cân nặng cho 2N ngay nhé, ch&uacute;ng m&igrave;nh sẽ cho bạn lời khuyên chuẩn không cần chỉnh lunnnn!!!</p>\r\n\r\n<p>&nbsp;</p>\r\n', '125000.00', 10000, 'sp9_1.jpg', '[\"sp9_2.jpg\",\"sp9_3.jpg\"]', 4, 0, 4, 1, 1493983674),
(10, 15, 'Áo thun nữ chất tăm ôm bassic dáng hàn cực xinh', '<p>&Aacute;o thun &ocirc;m basic croptop loại đẹp t&uacute;i zip form H&agrave;n Quốc (Ảnh thật v&agrave; video thật )</p>\r\n\r\n<p>Số đo: &Aacute;o d&agrave;i 52cm, ngang &aacute;o 35cm ( Mẫu cao m65 , nặng 53kg ) cả nh&agrave; c&oacute; đang t&igrave;m 1 chiếc &aacute;o đơn giản m&agrave; c&oacute; v&otilde; như chiếc &aacute;o n&agrave;y kh&ocirc;ng</p>\r\n\r\n<p>✔️✔️ Em &aacute;o H&agrave;n Quốc đẹp như 1 giấc mơ đ&acirc;yy, qu&aacute; rẻ m&agrave; qu&aacute; xịn x&ograve;. &Aacute;o chất thun tăm g&acirc;n d&agrave;y đẹp, sờ v&agrave;o l&agrave; thấy kh&aacute;c biệt hẳn với những chiếc &aacute;o thun th&ocirc;ng thường, t&uacute;i zip c&aacute;c thứ đ&agrave;ng ho&agrave;ng lun nh&eacute;.</p>\r\n\r\n<p>Form &aacute;o kh&ocirc;ng &ocirc;m b&oacute; chặt qu&aacute; m&agrave; chỉ &ocirc;m nhẹ đủ t&ocirc;n d&aacute;ng cơ thể. Đừng mua loại rẻ v&agrave;i chục ngh&igrave;n m&agrave; giặt v&agrave;i lần hỏng &aacute;o, thử em n&agrave;y tha hồ bền bỉ kh&ocirc;ng mất form nha&nbsp;</p>\r\n\r\n<p>Freesize dưới&nbsp;60kg</p>\r\n\r\n<p>**LƯU &Yacute;: Shop chỉ nhặt đơn theo ph&acirc;n loại h&agrave;ng kh&aacute;ch chọn, KH&Ocirc;NG nhặt đồ theo ghi ch&uacute; ạ, kh&aacute;ch h&agrave;ng lưu &yacute; nhaa * CHÍNH SÁCH ĐỔI SẢN PHẨM - Shop CHỈ NHẬN đổi sản phẩm bị lỗi do nh&agrave; sản xuất (shop hỗ trợ ph&iacute; ship) v&agrave; đổi size (&aacute;p dụng cho sản phẩm c&oacute; size, shop kh&ocirc;ng hỗ trợ ph&iacute; ship). KH&Ocirc;NG NHẬN đổi mẫu, đổi m&agrave;u. - Thời gian đổi sản phẩm: Trong v&ograve;ng 7 ng&agrave;y kể từ ng&agrave;y nhận - Sản phẩm phải c&ograve;n nguy&ecirc;n m&aacute;c, chưa qua sử dụng, giặt tẩy, kh&ocirc;ng bị dơ, bẩn hoặc bị hư hỏng bởi c&aacute;c t&aacute;c nh&acirc;n b&ecirc;n ngo&agrave;i.</p>\r\n', '130000.00', 0, 'sp10_1.jpg', '[\"sp10_2.jpg\",\"sp10_3.jpg\"]', 37, 3, 4, 1, 1493983674),
(11, 15, 'Áo thun tay lỡ form rộng', '<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>&Aacute;o thun tay lỡ form rộng Chất liệu : thun cotton d&agrave;y dặn như h&igrave;nh form rộng</p>\r\n', '100000.00', 30000, 'sp11_1.jpg', '[\"sp11_2.jpg\",\"sp11_3.jpg\"]', 8, 2, 5, 1, 1493983674),
(12, 17, 'Đầm tay phồng cổ u cột nơ sau', '<p><strong>M&Ocirc; TẢ SẢN PHẨM</strong></p>\r\n\r\n<p>Sản phẩm: Đầm tay phồng cổ u cột nơ sau ullzang thời trang nữ FMStyle SaiGon 21VD06KI1302</p>\r\n\r\n<p>- Sản phẩm được kiểm tra kĩ c&agrave;ng, cẩn thận v&agrave; tư vấn nhiệt t&igrave;nh trước khi g&oacute;i h&agrave;ng giao cho Qu&yacute; Kh&aacute;ch</p>\r\n\r\n<p>- H&agrave;ng c&oacute; sẵn, giao h&agrave;ng ngay khi nhận được đơn</p>\r\n\r\n<p><strong>BẢNG SIZE</strong></p>\r\n\r\n<p>- SIZE S: Chiều d&agrave;i 70cm - Ngực 39cm - Eo 32cm - Vai xuống cổ 15cm</p>\r\n\r\n<p>- SIZE M: Chiều d&agrave;i 70cm - Ngực 42cm - Eo 35cm - Vai xuống cổ 15cm</p>\r\n\r\n<p>Lưu &yacute; 1 t&iacute; ạ: Số đo n&agrave;y mọi người tự ướm l&ecirc;n quần &aacute;o của ch&iacute;nh m&igrave;nh đang mặc vừa để chọn size ph&ugrave; hợp chứ đừng nh&acirc;n đ&ocirc;i l&ecirc;n nha. Ch&ecirc;nh lệch 1,2cm vẫn oke nh&eacute;</p>\r\n\r\n<p>✔ Do m&agrave;n h&igrave;nh kh&aacute;c nhau v&agrave; hiệu ứng &aacute;nh s&aacute;ng, m&agrave;u sắc thực tế sản phẩm sẽ kh&aacute;c so với h&igrave;nh ảnh, vui l&ograve;ng lấy sản phẩm thật l&agrave;m ti&ecirc;u chuẩn</p>\r\n\r\n<p>✔ Xin h&atilde;y tin rằng shop sẽ nỗ lực hết sức để hỗ trợ bạn khi c&oacute; vấn đề về h&agrave;ng h&oacute;a , v&igrave; vậy h&atilde;y để lại cho tụi m&igrave;nh mức đ&aacute;nh gi&aacute; tốt bạn nh&eacute;</p>\r\n', '330000.00', 50000, 'sp12_1.jpg', '[\"sp12_2.jpg\",\"sp12_3.jpg\"]', 5, 0, 5, 1, 1493983674),
(13, 8, 'Quần Jogger Kaki Ulzzang', '<p>M&Ocirc; TẢ SẢN PHẨM</p>\r\n\r\n<p>Quần Jogger Kaki Ulzzang Thời Trang Nữ</p>\r\n\r\n<p>M&agrave;u Đen, Sữa, V&agrave;ng B&ograve; Mặc Đi Chơi</p>\r\n\r\n<p>- Mặc Ở Nh&agrave; Phong C&aacute;ch M&agrave;u sắc: Đen - Sữa - V&agrave;ng B&ograve;</p>\r\n\r\n<p>Chất liệu: Quần Kaki C&aacute;c sản phẩm b&ecirc;n Shop đều c&oacute; chụp ảnh thật; c&aacute;c bạn lưu &yacute; n&ecirc;n đọc kỹ nội dung v&agrave; chọn sản phẩm đ&uacute;ng m&agrave;u sắc.</p>\r\n\r\n<p>Chuy&ecirc;n sản xuất quần &aacute;o bốn m&ugrave;a; gi&aacute; tại xưởng kh&ocirc;ng qua trung gian. H&agrave;ng quần&nbsp;&aacute;o nữ của shop l&agrave; h&agrave;ng thời trang ph&ugrave; hợp xu hướng hiện nay.</p>\r\n\r\n<p>Chất co gi&atilde;n thoải m&aacute;i, tho&aacute;ng m&aacute;t</p>\r\n\r\n<p>Thiết kế kiểu d&aacute;ng đa dạng phong c&aacute;ch, hợp thời trang.</p>\r\n\r\n<p>&Aacute;o được may&nbsp;tinh tế sắc sảo, thiết kế đẹp, chuẩn form, vải cotton d&agrave;y, mịn thấm h&uacute;t mồ h&ocirc;i, tho&aacute;ng m&aacute;t</p>\r\n\r\n<p>Dễ d&agrave;ng phối s&eacute;t trang phục, th&iacute;ch hợp đi chơi, đi l&agrave;m hay dạo phố. Đặc biệt cho c&aacute;c bạn trẻ năng động c&aacute; t&iacute;nh. Sự kết hợp ho&agrave;n hảo giữa &aacute;o&nbsp; với quần Jean; quần sooc; quần kaki cực k&igrave; cute, sang chảnh</p>\r\n\r\n<p><em>Cảm ơn c&aacute;c bạn đ&atilde; d&agrave;nh thời gian gh&eacute; thăm gian h&agrave;ng v&agrave; ủng hộ Shop! Ch&uacute;c c&aacute;c bạn lu&ocirc;n vui vẻ hạnh ph&uacute;c&quot;</em></p>\r\n', '100000.00', 0, 'sp13_1.jpg', '[\"sp13_2.jpg\",\"sp13_3.jpg\"]', 5, 0, 5, 1, 1493983674),
(14, 8, 'Quần Dài Ống Rộng Lưng Cao', '<p><strong>M&ocirc; tả sản phẩm</strong></p>\r\n\r\n<p>[G&oacute;i h&agrave;ng bao gồm]: 1 * Quần d&agrave;i Chất liệu: Cotton + sợi polyester + kh&aacute;c</p>\r\n\r\n<p>K&iacute;ch thước</p>\r\n\r\n<p>S Chiều d&agrave;i quần 99cm V&ograve;ng eo 64cm H&ocirc;ng 94cm Chu vi v&ograve;ng đ&ugrave;i 62cm</p>\r\n\r\n<p>M Chiều d&agrave;i quần 100cm V&ograve;ng eo 68cm H&ocirc;ng 98cm Chu vi v&ograve;ng đ&ugrave;i 64cm</p>\r\n\r\n<p>L Chiều d&agrave;i quần 101cm V&ograve;ng eo 72cm H&ocirc;ng 102cm Chu vi v&ograve;ng đ&ugrave;i 66cm</p>\r\n\r\n<p>XL Chiều d&agrave;i quần 102cm V&ograve;ng eo 76cm H&ocirc;ng 106cm Chu vi v&ograve;ng đ&ugrave;i 68cm</p>\r\n\r\n<p>▼ C&aacute;ch giặt ▼</p>\r\n\r\n<p>◆ N&ecirc;n giặt sản phẩm bằng tay, kh&ocirc;ng cho v&agrave;o m&aacute;y giặt</p>\r\n\r\n<p>◆ Quần &aacute;o sẫm m&agrave;u bị phai m&agrave;u sau khi giặt l&agrave; chuyện b&igrave;nh thường, vui l&ograve;ng giặt ri&ecirc;ng</p>\r\n\r\n<p>◆ Để tr&aacute;nh bạc m&agrave;u v&agrave; phai m&agrave;u, vui l&ograve;ng kh&ocirc;ng phơi dưới trời nắng gắt</p>\r\n\r\n<p>▼Lưu &yacute; khi mua sắm ▼</p>\r\n\r\n<p>◆ M&agrave;u sắc sản phẩm thực tế c&oacute; thể hơi kh&aacute;c so với h&igrave;nh ảnh hiển thị tr&ecirc;n trang web, do nhiều yếu tố g&acirc;y ra như độ s&aacute;ng của m&agrave;n h&igrave;nh v&agrave; độ s&aacute;ng của &aacute;nh s&aacute;ng. Vui l&ograve;ng cho ph&eacute;p một ch&uacute;t sai số (&plusmn; 3cm) do đo lường thủ c&ocirc;ng ~</p>\r\n', '140000.00', 10000, 'sp14_1.jpg', '[\"sp14_2.jpg\",\"sp14_3.jpg\"]', 4, 0, 5, 3, 1493983674),
(15, 17, 'Chân váy tennis ngắn xếp ly thời trang nữ Hàn Quốc', '<p><strong>M&Ocirc; TẢ SẢN PHẨM :</strong></p>\r\n\r\n<p>T&Ecirc;N : Ch&acirc;n v&aacute;y tennis ngắn xếp ly thời trang nữ h&agrave;ng Quảng Ch&acirc;u cao cấp</p>\r\n\r\n<p>Chất liệu ch&acirc;n v&aacute;y : Chất vải tuyết mưa</p>\r\n\r\n<p>Ch&acirc;n v&aacute;y l&agrave; một trong những items kinh điển trong tủ đồ của tất cả chị em phụ nữ. Thiếu đi ch&acirc;n v&aacute;y l&agrave; thiếu đi sự điệu đ&agrave; nữ t&iacute;nh, thiếu đi một n&eacute;t đặc trưng của con g&aacute;i. Ch&acirc;n v&aacute;y c&oacute; nhiều loại: ch&acirc;n v&aacute;y chữ A mang m&agrave;u sắc retro basic đơn giản, ch&acirc;n v&aacute;y midi điệu đ&agrave; duy&ecirc;n d&aacute;ng, ch&acirc;n v&aacute;y x&ograve;e đỏng đảnh đ&aacute;ng y&ecirc;u, ch&acirc;n v&aacute;y maxi chạm g&oacute;t thướt tha quyến rũ, ch&acirc;n v&aacute;y xếp ly dịu d&agrave;ng, ch&acirc;n v&aacute;y tầng ngắn thướt tha, ch&acirc;n v&aacute;y d&agrave;i c&ocirc;ng sở lịch sự m&agrave; vẫn kh&ocirc;ng k&eacute;m phần c&aacute; t&iacute;nh&hellip;. Mỗi chiếc ch&acirc;n v&aacute;y mang trong m&igrave;nh một n&eacute;t đẹp ri&ecirc;ng biệt kh&ocirc;ng trộn lẫn. Ch&acirc;n v&aacute;y tennis lại mang lại sự thanh lịch, dịu d&agrave;ng m&agrave; trang nh&atilde; tới lại kỳ. Bạn c&oacute; thể mặc đi l&agrave;m. đi chơi, đi biển đều xinh lắm nha. Kiếm t&igrave;m đ&acirc;u nữa bạn ơi, nhanh tay đặt h&agrave;ng th&ocirc;i !</p>\r\n\r\n<p><strong>LƯU &Yacute; :</strong></p>\r\n\r\n<p>⚡️Kh&aacute;ch h&agrave;ng mua ch&acirc;n v&aacute;y nếu c&oacute; thắc mắc th&ecirc;m về sản phẩm vui l&ograve;ng inbox với shop để được tư vấn v&agrave; chọn m&agrave;u đ&uacute;ng &yacute; nh&eacute;!</p>\r\n\r\n<p>⚡️Tất cả sản phẩm ch&acirc;n v&aacute;y chữ A ở shop đều l&agrave; h&agrave;ng C&Oacute; SẴN.</p>\r\n\r\n<p>⚡️Tất cả ch&acirc;n v&aacute;y xếp ly m&agrave; shop đưa ra đều l&agrave; h&agrave;ng chuẩn ảnh, chuẩn form, d&aacute;ng, thiết kế, chất liệu.</p>\r\n\r\n<p>⚡️Shop lu&ocirc;n c&oacute; NHIỀU ƯU Đ&Atilde;I d&agrave;nh cho kh&aacute;ch h&agrave;ng, lu&ocirc;n kiểm tra kĩ sản phẩm trước khi giao.</p>\r\n\r\n<p>⚡️Kh&aacute;ch kh&ocirc;ng ưng cứ back lại cho em nha ĐẶC BIỆT :</p>\r\n\r\n<p>⚡️ SHOP Đ&Oacute;NG H&Agrave;NG THEO PHIẾU GIAO.PHIẾU IN KH&Ocirc;NG XEM ĐƯỢC TIN NHẮN CHAT V&Agrave; GHI CH&Uacute;.C&Aacute;C CHI CH&Uacute; &Yacute; CẦN NHIỀU MẪU NHIỀU M&Agrave;U ĐẶT CHUẨN GI&Uacute;P EM Ạ Hướng dẫn c&aacute;ch sử dụng v&agrave; chăm s&oacute;c ch&acirc;n v&aacute;y mới : - Khi nhận sản phẩm, bạn h&atilde;y giặt tay nhẹ nh&agrave;ng với nước sạch 1 lượt. - Khuyến kh&iacute;ch giặt tay, nếu giặt m&aacute;y h&atilde;y sử dụng t&uacute;i giặt, giặt ở chế độ &quot;&quot;giặt nhẹ&quot;&quot; v&agrave; t&aacute;ch ri&ecirc;ng với c&aacute;c sp dễ phai m&agrave;u</p>\r\n', '150000.00', 76000, 'sp15_1.jpg', '[\"sp15_2.jpg\",\"sp15_3.jpg\"]', 37, 1, 5, 4, 1493983674),
(16, 10, 'Áo Nỉ Nam Thời Trang Trẻ Trung', '<p><strong>&Aacute;o Nỉ Nam Thời Trang Trẻ Trung</strong></p>\r\n\r\n<p>Chất Vải Co D&atilde;n ZERO</p>\r\n\r\n<p>------------------------------------</p>\r\n\r\n<p><strong>TH&Ocirc;NG TIN CHI TIẾT</strong></p>\r\n\r\n<p>- Chất liệu:Chất nỉ b&ocirc;ng</p>\r\n\r\n<p>- Size: M - L &ndash; XL- XXL</p>\r\n\r\n<p>- M&agrave;u sắc: Đen - Xanh Than- Ghi Đậm- Trắng XÁM- Be Sữa- Tím- Ghi Đ&ocirc;́m</p>\r\n\r\n<p>- Xuất xứ: Việt Nam</p>\r\n\r\n<p>------------------------------------</p>\r\n\r\n<p>Chất vải len cao cấp, kh&ocirc;ng nhăn, kh&ocirc;ng bai</p>\r\n\r\n<p>Đường may tinh tế, chỉn chu, n&uacute;t đơm kh&eacute;o l&eacute;o, chắc chắn</p>\r\n\r\n<p>M&agrave;u sắc đa dạng, trẻ trung</p>\r\n\r\n<p>Form body H&agrave;n Quốc mang lại phong c&aacute;ch lịch l&atilde;m, sang trọng</p>\r\n\r\n<p>Cổ &aacute;o được c&aacute;ch điệu theo d&aacute;ng cổ tr&ograve;n , độc đ&aacute;o</p>\r\n\r\n<p>Gi&aacute; cả hợp l&iacute;, chất lượng sản phẩm tốt &Aacute;o nỉ l&agrave; gợi &yacute; tuyệt vời cho nam giới trong những ng&agrave;y thời tiết se lạnh. Thiết kế phối bo tay &aacute;o v&agrave; bo gấu đơn giản, tinh tế mang đến phong c&aacute;ch trẻ trung v&agrave; thanh lịch.Chất liệu nỉ cao cấp d&agrave;y dặn, mềm mịn, kh&ocirc;ng x&ugrave;, co gi&atilde;n nhẹ. Nhờ đặc t&iacute;nh nổi trội, khả năng giữ ấm tốt, t&iacute;nh tiện lợi v&agrave; thoải m&aacute;i, &aacute;o nỉ chắc chắn sẽ l&agrave;m vừa l&ograve;ng c&aacute;c ch&agrave;ng. Kết hợp &aacute;o nỉ c&ugrave;ng &aacute;o sơ mi trắng đơn giản đều gi&uacute;p bạn trở n&ecirc;n nổi bật v&agrave; phong c&aacute;ch với gu thời trang tinh tế. Với bốn m&agrave;u: đen, xanh than, x&aacute;m đậm, x&aacute;m nhạt c&aacute;c ch&agrave;ng thoải m&aacute;i lựa chọn những gam m&agrave;u ph&ugrave; hợp với sở th&iacute;ch.</p>\r\n', '150000.00', 0, 'sp16_1.jpg', '[\"sp16_2.jpg\"]', 2, 1, 5, 1, 0),
(17, 10, 'Áo hoodies có nón dài tay thời trang nam', '<p><strong>TH&Ocirc;NG TIN SẢN PHẨM&nbsp;</strong></p>\r\n\r\n<p>✨Cảm ơn bạn đ&atilde; v&agrave;o cửa h&agrave;ng của t&ocirc;i!T&ocirc;i c&oacute; mục đ&iacute;ch mua bất cứ thứ g&igrave; hoặc chỉ t&igrave;m kiếm ti&ecirc;u d&ugrave;ng, bởi v&igrave; chỉ những thương gia mới c&oacute; thể thực hiện những đặc điểm của anh ấy v&agrave; cung cấp cho bạn dịch vụ h&oacute;a học, v&igrave; vậy t&ocirc;i cũng muốn mang lại đề xuất n&agrave;y cho mọi kh&aacute;ch h&agrave;ng, h&atilde;y chọn, h&atilde;y chọn cao- Dịch vụ chăm s&oacute;c chất lượng, ️ Theo d&otilde;i cửa h&agrave;ng n&agrave;y</p>\r\n\r\n<p>Si&ecirc;u lửa &aacute;o thun nam ba phần tư &aacute;o thun phong c&aacute;ch Hồng K&ocirc;ng xu hướng sinh vi&ecirc;n tr&ugrave;m đầu thương hiệu hợp thời trang &aacute;o len ngắn tay nam</p>\r\n', '249000.00', 5000, 'sp17_1.jpg', '[\"sp17_2.jpg\",\"sp17_3.jpg\",\"sp17_4.jpg\"]', 4, 1, 5, 1, 1493983674),
(18, 11, 'Áo Sơ Mi cotton Lanh Mỏng Tay Ngắn Cổ Bẻ', '<p>✨Về sự kh&aacute;c biệt m&agrave;u sắc.N&oacute; l&agrave; b&igrave;nh thường cho h&agrave;ng h&oacute;a c&oacute; một ch&uacute;t kh&aacute;c biệt m&agrave;u sắc so với h&igrave;nh ảnh.</p>\r\n\r\n<p>️ ✨Vui l&ograve;ng kh&ocirc;ng đưa ra đ&aacute;nh gi&aacute; từ bốn sao trở xuống m&agrave; kh&ocirc;ng c&oacute; l&yacute; do, nếu kh&ocirc;ng n&oacute; sẽ bị kh&oacute;a v&agrave; kh&ocirc;ng c&ograve;n giao dịch. &Aacute;o sơ mi ngắn tay vải lanh trung ni&ecirc;n v&agrave; gi&agrave; &aacute;o sơ mi nam cotton v&agrave; lanh ve &aacute;o sơ mi grandpa mỏng người gi&agrave; &aacute;o sơ mi inch</p>\r\n', '308000.00', 60000, 'sp18_1.jpg', '[\"sp18_2.jpg\",\"sp18_3.jpg\",\"sp18_4.jpg\"]', 32, 4, 5, 1, 1493983674),
(19, 7, 'Áo thun tay lỡ form rộng - T shirt sọc tem tròn', '<p>⚡️&Aacute;O THUN TAY LỠ FORM RỘNG UNISEX/ &Aacute;O PH&Ocirc;NG RỘNG⚡️</p>\r\n\r\n<p>✔ Với chất liệu thun cotton d&agrave;y mịn được lựa chọn kĩ lưỡng để phù hợp với mọi hoàn cảnh.</p>\r\n\r\n<p>✔ Thiết kế Unisex sẽ mang đến một outfit năng động và cá tính dù không cần mix-match cầu kì.</p>\r\n\r\n<p>✔ Form &aacute;o unisex nam nữ đều mặc được.</p>\r\n\r\n<p>▪ Chiều d&agrave;i &aacute;o: 70cm ▪ Ngang ngực: 52cm ▪ Tay &aacute;o d&agrave;i: 26cm ▪ Ngang vai: 53cm</p>\r\n\r\n<p>=&gt; 45kg-65kg/ 1m50-1m75: L&ecirc;n form rộng thoải m&aacute;i.</p>\r\n\r\n<p>=&gt; 66kg-72kg/ 1m60-1m75: L&ecirc;n form rộng vừa.</p>\r\n', '119000.00', 35000, 'sp19_1.jpg', '[\"sp19_2.jpg\"]', 0, 2, 5, 1, 1493983674),
(20, 7, 'Áo Thun Trơn Nam Ngắn tay Có Cổ Áo Polo ', '<p><strong>M&ocirc; tả :</strong></p>\r\n\r\n<p>- Chất liệu: cotton co gi&atilde;n, vải mềm, vải mịn, tho&aacute;ng m&aacute;t, kh&ocirc;ng x&ugrave; l&ocirc;ng.</p>\r\n\r\n<p>- Đường may chuẩn chỉnh, tỉ mỉ, chắc chắn.</p>\r\n\r\n<p>- Mặc ở nh&agrave;, mặc đi chơi hoặc khi vận động thể thao. Ph&ugrave; hợp khi mix đồ với nhiều loại.</p>\r\n\r\n<p>- Thiết kế hiện đại, trẻ trung, năng động. Dễ phối đồ.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng sản phẩm:</strong></p>\r\n\r\n<p>- Nhớ lộn tr&aacute;i &aacute;o khi giặt v&agrave; kh&ocirc;ng giặt ng&acirc;m</p>\r\n\r\n<p>- Kh&ocirc;ng giặt m&aacute;y trong 10 ng&agrave;y đầu</p>\r\n\r\n<p>- Kh&ocirc;ng sử dụng thuốc tẩy</p>\r\n\r\n<p>- Khi phơi lộn tr&aacute;i v&agrave; kh&ocirc;ng phơi trực tiếp dưới &aacute;nh nắng mặt trời</p>\r\n', '150000.00', 0, 'sp20_1.jpg', '[\"sp20_2.jpg\",\"sp20_3.jpg\"]', 1, 3, 5, 1, 1493983674),
(21, 12, 'Quần jean nam baggy kiểu ống rộng dáng suông chất bò QD04', '<p><strong>TH&Ocirc;NG TIN SẢN PHẨM&nbsp;</strong></p>\r\n\r\n<p>- H&igrave;nh ảnh Quần jean nam ống su&ocirc;ng được shop tự chụp, đảm bảo mặc l&ecirc;n form đẹp như ảnh</p>\r\n\r\n<p>&nbsp;- Vải đẹp , kh&ocirc;ng x&ugrave; , kh&ocirc;ng co r&uacute;t , mềm mịn d&agrave;y dặn , h&uacute;t mồ h&ocirc;i cực nhanh, mặc si&ecirc;u m&aacute;t</p>\r\n\r\n<p>- Quần jean ống rộng được may bằng loại vải jean d&agrave;y lại cho người mặc cảm gi&aacute;c thật thoải m&aacute;i dể chịu cực k&igrave; khi hoạt động đặc biệt thấm h&uacute;t tốt tho&aacute;ng kh&iacute; gi&uacute;p bạn năng động hơn trong mọi thời tiết&nbsp;</p>\r\n\r\n<p>- Mẫu quần jean nam ống rộng s&aacute;ng mầu n&agrave;y sẽ gi&uacute;p bạn dể phối đồ cho d&ugrave; bạn phối với loại &aacute;o n&agrave;o hay m&agrave;u n&agrave;o củng hợp ko bao giờ bị lỗi, đ&oacute; l&agrave; l&iacute; do m&agrave; mẫu quần n&agrave;y rất được đại đa số kh&aacute;ch h&agrave;ng chọn lựa v&agrave; l&agrave;m mưa l&agrave;m gi&oacute; tr&ecirc;n thi trường thời trang</p>\r\n', '175000.00', 0, 'sp21_1.jpg', '[\"sp21_2.jpg\",\"sp21_3.jpg\"]', 23, 11, 5, 5, 1493983674),
(22, 14, 'Quần short nam ROWAY Fullbox', '<p><strong>M&ocirc; tả :</strong></p>\r\n\r\n<p>⏩ Chi tiết Quần Short Roway</p>\r\n\r\n<p>- Chất liệu:Umi co gi&atilde;n nhẹ kh&ocirc;ng nhăn form regular su&ocirc;ng mặc thoải m&aacute;i</p>\r\n\r\n<p>- H&agrave;ng c&ograve;n nguy&ecirc;n tem m&aacute;c, cực sang chảnh (xem video tr&ecirc;n ảnh sản phẩm).</p>\r\n\r\n<p>- Basic phối Sơ mi hay &aacute;o ph&ocirc;ng đều đẹp. Mặc dạo phố, du lịch hay đến c&aacute;c buổi tiệc đều mang đến sự tự tin đẳng cấp d&agrave;nh cho kh&aacute;ch h&agrave;ng.</p>\r\n\r\n<p>⏩ Bảng size mẫu Roway Size M: Nặng 50-60kg Size L: Nặng 60-70kg Size XL: Nặng 70-80kg&nbsp;</p>\r\n\r\n<p>⏩ Hướng dẫn sử dụng sản phẩm Quần Roway - Giặt ở nhiệt độ b&igrave;nh thường, với đồ c&oacute; m&agrave;u tương tự. - Kh&ocirc;ng được d&ugrave;ng h&oacute;a chất tẩy. - Hạn chế sử dụng m&aacute;y sấy v&agrave; ủi (nếu c&oacute;) th&igrave; ở nhiệt độ th&iacute;ch hợp.</p>\r\n', '160000.00', 10000, 'sp22_1.jpg', '[\"sp22_2.jpg\",\"sp22_3.jpg\"]', 38, 2, 5, 2, 1493983674),
(23, 8, 'Quần jeans cắt gấu nữ LYRA', '<p><strong>TH&Ocirc;NG TIN SẢN PHẨM</strong></p>\r\n\r\n<p>✪ T&ecirc;n sản phẩm: <strong>Quần jeans cắt gấu nữ LYRA, quần b&ograve; cạp cao xẻ gấu c&aacute; t&iacute;nh-VSYQD0107</strong></p>\r\n\r\n<p>✪ Thương hiệu: LYRA</p>\r\n\r\n<p>✪ M&agrave;u Sắc: Xanh</p>\r\n\r\n<p>✪ Chất liệu: Vật liệu kh&aacute;c</p>\r\n\r\n<p>----------------------------------</p>\r\n\r\n<p>Bảng SIZE chart</p>\r\n\r\n<p>Size&nbsp; &nbsp; &nbsp;V&ograve;ng 2&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; V&ograve;ng 3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; C&acirc;n nặng</p>\r\n\r\n<p>&nbsp;S&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;58 -65 cm&nbsp; &nbsp; &nbsp; &nbsp; 85-87 cm&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 40-48 Kg</p>\r\n\r\n<p>&nbsp;M&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;66- 69cm&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;88-90 cm&nbsp; &nbsp; &nbsp; &nbsp; 49-52 Kg</p>\r\n\r\n<p>----------------------------------</p>\r\n', '280000.00', 1000, 'sp23_1.jpg', '[\"sp23_2.jpg\",\"sp23_3.jpg\"]', 4, 0, 5, 2, 1493983674),
(24, 11, 'Blentino áo sơ mi kẻ đỏ sọc ngắn tay cotton BCV15', '<p><strong>M&Ocirc; TẢ SẢN PHẨM</strong></p>\r\n\r\n<p>Chất liệu: 60% Cotton, 40% Polyester</p>\r\n\r\n<p>Kiểu d&aacute;ng: Regular Fit</p>\r\n\r\n<p>- Kiểu d&aacute;ng : &Aacute;o sơ mi cộc tay, kiểu d&aacute;ng Regular fit su&ocirc;ng nhẹ, thoải m&aacute;i</p>\r\n\r\n<p>- Chi tiết :&Aacute;o Polo tay d&agrave;i, thiết kế chỉnh chu, lịch sự, ph&ugrave; hợp với mọi v&oacute;c d&aacute;ng.</p>\r\n\r\n<p>- Chất liệu : Chất liệu Bamboo từ sợi tre thi&ecirc;n nhi&ecirc;n gi&uacute;p bề mặt vải mềm nhẹ, tho&aacute;ng m&aacute;t, thấm h&uacute;t tốt tạo cảm gi&aacute;c dễ chịu cho người mặc kết hợp c&ocirc;ng nghệ nano gi&uacute;p sản phẩm kh&aacute;ng khuẩn v&agrave; chống nhăn hiệu quả. tencel kh&ocirc;ng bị co r&uacute;t sợi</p>\r\n\r\n<p>Thương hiệu: Blentino Nh&agrave; sản xuất: C&ocirc;ng Ty TNHH sản xuất v&agrave; thương mại Ph&uacute;c Quang Minh</p>\r\n', '289000.00', 20000, 'sp24_1.jpg', '[\"sp24_2.jpg\",\"sp24_3.jpg\",\"sp24_4.jpg\"]', 16, 5, 5, 2, 1493983674),
(25, 13, 'Quần nam vải kaki LADOS', '<p><strong>M&Ocirc; TẢ SẢN PHẨM</strong></p>\r\n\r\n<p>Quần kaki d&agrave;i nam chất vải cotton c&oacute; gi&atilde;n si&ecirc;u đẹp LADOS - 4032 thiết kế t&ocirc;n d&aacute;ng trẻ trung</p>\r\n\r\n<p>⏩ Th&ocirc;ng tin sản phẩm:</p>\r\n\r\n<p>- Chất kaki cotton c&oacute; d&atilde;n , mặc cực thoải m&aacute;i</p>\r\n\r\n<p>- Chất liệu: Chất Vải d&agrave;y đẹp, mềm</p>\r\n\r\n<p>- Co gi&atilde;n nhẹ, kh&ocirc; tho&aacute;ng</p>\r\n\r\n<p>- Đường may cực tỉ mỉ cực đẹp</p>\r\n\r\n<p>- C&oacute; thể mặc đi l&agrave;m, đi chơi, dễ phối đồ, kh&ocirc;ng k&eacute;n người mặc</p>\r\n\r\n<p>- Kiểu d&aacute;ng: Thiết kế theo form Slimfit , d&aacute;ng gọn, t&ocirc;n d&aacute;ng trẻ trung- th&ocirc;ng số ph&ugrave; hợp với người việt nam</p>\r\n\r\n<p>⏩Được sản xuất v&agrave; bảo h&agrave;nh bởi C&ocirc;ng ty TNHH MTV LADOS VIỆT NAM</p>\r\n', '358000.00', 90000, 'sp25_1.jpg', '[\"sp25_2.jpg\",\"sp25_3.jpg\"]', 16, 5, 5, 1, 1493983674),
(26, 10, 'Áo Nỉ Hoodie Họa Tiết Ban Sunling', '<p>&Aacute;o Nỉ Hoodie Họa Tiết Ban Sunling si&ecirc;u d&agrave;y,si&ecirc;u ấm</p>\r\n\r\n<p>K&iacute;ch thước : free sz &lt;65kg.</p>\r\n\r\n<p>Mũ &aacute;o l&ocirc; mới may 2 lớp, si&ecirc;u to&nbsp;</p>\r\n\r\n<p>Chất liệu : nỉ d&agrave;y mịn, form to cho c&aacute;c bạn chiều cao dưới m70, 65 kg&nbsp;</p>\r\n\r\n<p>&nbsp;LƯU &Yacute; KHI SỬ DỤNG C&Aacute;C SẢN PHẨM CỦA SHOP</p>\r\n\r\n<p>- Đối vơi sản phẩm đa dạng về chất liệu, kiểu d&aacute;ng, m&agrave;u sắc, c&aacute;ch bảo quản sản phẩm tốt nhất l&agrave; ph&acirc;n loại v&agrave; giặt c&aacute;c sản phẩm c&ugrave;ng m&agrave;u để giữ được độ bền v&agrave; m&agrave;u sắc của vải, tr&aacute;nh bị phai m&agrave;u từ c&aacute;c loại quần &aacute;o kh&aacute;c.</p>\r\n\r\n<p>- Đối với những sản phẩm c&oacute; thể giặt m&aacute;y, chỉ n&ecirc;n để ở chế độ giặt nhẹ, hoặc mức trung b&igrave;nh</p>\r\n\r\n<p>- N&ecirc;n lộn &aacute;o sang mặt tr&aacute;i trước khi phơi sản phẩm ở nơi tho&aacute;ng m&aacute;t, tr&aacute;nh &aacute;nh nắng trực tiếp dễ bị phai bạc m&agrave;u, n&ecirc;n l&agrave;m kh&ocirc; quần &aacute;o bằng c&aacute;ch phơi ở những điểm đ&oacute;n gi&oacute; sẽ giữ được m&agrave;u vải tốt hơn.</p>\r\n', '350000.00', 0, 'sp26_1.jpg', '[\"sp26_2.jpg\",\"sp26_3.jpg\"]', 31, 2, 5, 18, 1493983674),
(27, 7, 'Áo thun nam Cotton Compact phiên bản Premium', '<p><strong>M&Ocirc; TẢ SẢN PHẨM</strong></p>\r\n\r\n<p>Vẫn l&agrave; Cotton, nhưng đ&acirc;y l&agrave; Cotton Compact - với độ bền v&agrave; mượt hơn gấp 2 lần cotton thường.</p>\r\n\r\n<p>Chỉ cần chạm v&agrave;o l&agrave; bạn sẽ cảm nhận ngay sự kh&aacute;c biệt: Mềm - M&aacute;t r&otilde; rệt.</p>\r\n\r\n<p>Premium Tshirt Coolmate chống nhăn m&agrave;u XANH LAM ch&iacute;nh l&agrave; chiếc &aacute;o thun d&agrave;nh cho bạn, một phi&ecirc;n bản &aacute;o thun ho&agrave;n to&agrave;n mới v&agrave; đầy sự cải tiến được Coolmate team nghi&ecirc;n cứu kỹ lưỡng v&agrave; ng&agrave;y c&agrave;ng cải tiến hơn với chất liệu Cotton Compact chất lượng cao.</p>\r\n\r\n<p><strong>Đặc điểm nổi bật </strong></p>\r\n\r\n<p>- Chất liệu: 95% Cotton Compact 5% Spandex Mềm mại v&agrave; kh&ocirc;ng g&acirc;y kh&oacute; chịu khi mặc Chất liệu co gi&atilde;n 4 chiều đem lại sự thoải m&aacute;i suốt ng&agrave;y d&agrave;i Bền dai, kh&ocirc;ng bai, nh&atilde;o, x&ugrave; l&ocirc;ng Tự h&agrave;o sản xuất tại Việt Nam</p>\r\n\r\n<p>Những chiếc &aacute;o của Coolmate sử dụng chất liệu cotton compact, một dạng cotton chất lượng cao đem đến cho người mặc trải nghiệm tuyệt vời nhất. &quot;Cotton Compact&quot; l&agrave; c&acirc;u trả lời cho c&aacute;c bạn đang t&igrave;m kiếm cho m&igrave;nh một chiếc &aacute;o thun mặc l&ecirc;n nh&igrave;n đẹp trai hơn một ch&uacute;t, bền hơn v&agrave; tho&aacute;ng m&aacute;t hơn.</p>\r\n', '259000.00', 0, 'sp27_1.jpg', '[\"sp27_2.jpg\",\"sp27_3.jpg\",\"sp27_4.jpg\"]', 37, 3, 5, 5, 1493983674);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shipping`
--

CREATE TABLE `shipping` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `id_province` int(11) NOT NULL,
  `id_district` int(11) NOT NULL,
  `name_province` varchar(200) NOT NULL,
  `name_district` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `shipping`
--

INSERT INTO `shipping` (`id`, `name`, `id_province`, `id_district`, `name_province`, `name_district`) VALUES
(1, 'GHN-Giao Hàng Nhanh', 260, 2206, 'Phú Yên', 'Huyện Sông Hinh');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizedetail`
--

CREATE TABLE `sizedetail` (
  `id` int(11) NOT NULL,
  `product_id` int(255) NOT NULL,
  `size_id` varchar(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sizedetail`
--

INSERT INTO `sizedetail` (`id`, `product_id`, `size_id`, `quantity`) VALUES
(1, 1, '02', 8),
(2, 1, '01', 6),
(3, 2, '04', 30),
(4, 2, '03', 5),
(5, 2, '02', 10),
(6, 3, '04', 12),
(7, 3, '03', 10),
(8, 3, '02', 20),
(9, 3, '01', 10),
(10, 4, '03', 20),
(11, 4, '02', 10),
(12, 4, '01', 8),
(13, 5, '04', 20),
(14, 5, '03', 20),
(15, 5, '02', 20),
(16, 5, '01', 10),
(17, 6, '04', 10),
(18, 6, '03', 28),
(19, 6, '02', 14),
(20, 6, '01', 9),
(21, 7, '03', 10),
(22, 7, '02', 17),
(23, 7, '01', 8),
(24, 8, '03', 10),
(25, 8, '02', 30),
(26, 8, '01', 10),
(27, 9, '04', 10),
(28, 9, '03', 10),
(29, 9, '02', 20),
(30, 9, '01', 10),
(31, 10, '03', 20),
(32, 10, '02', 10),
(33, 10, '01', 7),
(34, 11, '04', 20),
(35, 11, '03', 10),
(36, 11, '02', 20),
(37, 11, '01', 8),
(38, 12, '02', 20),
(39, 12, '01', 20),
(40, 13, '03', 10),
(41, 13, '02', 20),
(42, 13, '01', 10),
(43, 14, '03', 20),
(44, 14, '02', 20),
(45, 14, '01', 20),
(46, 15, '04', 10),
(47, 15, '03', 10),
(48, 15, '02', 20),
(49, 15, '01', 19),
(50, 16, '03', 20),
(51, 16, '02', 19),
(52, 16, '01', 15),
(53, 17, '04', 10),
(54, 17, '03', 10),
(55, 17, '02', 10),
(56, 17, '01', 9),
(57, 18, '03', 10),
(58, 18, '02', 10),
(59, 18, '01', 6),
(60, 19, '04', 20),
(61, 19, '03', 20),
(62, 19, '02', 18),
(63, 19, '01', 20),
(64, 20, '04', 5),
(65, 20, '03', 9),
(66, 20, '02', 8),
(67, 21, '03', 20),
(68, 21, '02', 15),
(69, 21, '01', 14),
(70, 22, '03', 20),
(71, 22, '02', 19),
(72, 22, '01', 19),
(73, 23, '02', 20),
(74, 23, '01', 20),
(75, 24, '02', 19),
(76, 24, '01', 16),
(77, 25, '04', 10),
(78, 25, '03', 17),
(79, 25, '02', 9),
(80, 25, '01', 9),
(81, 26, '03', 10),
(82, 26, '02', 10),
(83, 26, '01', 18),
(84, 27, '03', 20),
(85, 27, '02', 20),
(86, 27, '01', 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sizes`
--

CREATE TABLE `sizes` (
  `id` varchar(11) NOT NULL,
  `name` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `sizes`
--

INSERT INTO `sizes` (`id`, `name`) VALUES
('01', 'S'),
('02', 'M'),
('03', 'L'),
('04', 'XL');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

CREATE TABLE `slider` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image_link` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(1, '1', 'slide1.jpg', 'http://localhost/shopbanquanao/thoi-trang-nam-c7', 1, '2022-01-02 15:24:43'),
(2, '2', 'slide2.jpg', 'http://localhost/shopbanquanao/ao-phong-nam-c10', 2, '2022-01-02 15:36:41'),
(3, '3', 'slide3.jpg', 'http://localhost/shopbanquanao/thoi-trang-nu-c8', 3, '2022-01-02 13:47:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone` varchar(100) NOT NULL,
  `user_address` varchar(100) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `payment` varchar(32) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `message`, `amount`, `payment`, `created`) VALUES
(1, 1, 1, 'Hoàng Ngọc Nguyên', NULL, '0123456001', 'Hòa Bình, Huyện Mai Châu, Xã Tân Thành - 24 Nguyễn Trãi', ' Phí Ship: 47,000VNĐ', '806000.00', '', 1609454911),
(2, 1, 2, 'Trần Thanh Nam', NULL, '0123456002', 'Hồ Chí Minh, Huyện Củ Chi, Xã Tân Thạnh Tây - 101 Hà Thanh', ' Phí Ship: 47,000VNĐ', '1509000.00', '', 1609886911),
(3, 1, 3, 'Trần Văn Tới', NULL, '0123456003', 'Bình Dương, Huyện Dầu Tiếng, Xã Minh Tân - 10 Lê Lợi', ' Phí Ship: 47,000VNĐ', '474000.00', '', 1612565311),
(5, 1, 0, 'Nguyễn Ngọc Phong', NULL, '0975697002', 'Đà Nẵng, Quận Hải Châu, Phường Hòa Cường Nam - ', ' Phí Ship: 22,000VNĐ', '519000.00', '', 1614984511),
(6, 1, 0, 'Nguyễn Cao Duy Linh', NULL, '0975697003', 'Ninh Thuận, Huyện Ninh Hải, Xã Tri Hải - 10 Lê Lai', ' Phí Ship: 47,000VNĐ', '197000.00', '', 1617662911),
(7, 1, 4, 'Hồ Duy Ninh', NULL, '0123456004', 'Ninh Thuận, Thành phố Phan Rang – Tháp Chàm, Phường Phước Mỹ - 34 Trần Quốc Toản', ' Phí Ship: 37,000VNĐ', '562000.00', '', 1620254911),
(8, 1, 4, 'Hồ Duy Ninh', NULL, '0123456004', 'Ninh Thuận, Thành phố Phan Rang – Tháp Chàm, Phường Phước Mỹ - 34 Trần Quốc Toản', ' Phí Ship: 37,000VNĐ', '562000.00', '', 1620254911),
(9, 1, 5, 'Trần Ngọc Sang', NULL, '0123456005', 'Lào Cai, Huyện Mường Khương, Xã Tả Thàng - 101 Hà Nguyễn', ' Phí Ship: 47,000VNĐ', '177000.00', '', 1622933311),
(10, 1, 6, 'Đào Nguyễn Phương Hoa', NULL, '0123456006', 'Hà Nội, Huyện Ba Vì, Xã Khánh Thượng - ', ' Phí Ship: 47,000VNĐ', '316000.00', '', 1625525311),
(11, 1, 7, 'Lê Trần Công', NULL, '0123456007', 'Phú Yên, Huyện Đồng Xuân, Xã Xuân Sơn Bắc - 21 Trần Thánh Tông', ' Phí Ship: 47,000VNĐ', '197000.00', '', 1628203711),
(12, 1, 8, 'Nguyễn Đức Mạnh', NULL, '0123456008', 'Quảng Ngãi, Huyện đảo Lý Sơn, Xã An Hải - ', ' Phí Ship: 47,000VNĐ', '572000.00', '', 1628203711),
(13, 1, 9, 'Đỗ Trung Nhân', NULL, '0123456009', 'Sóc Trăng, Huyện Long Phú, Xã Tân Thạnh - ', ' Phí Ship: 47,000VNĐ', '197000.00', '', 1630882111),
(14, 1, 10, 'Bùi Tấn Khoa', NULL, '0123456010', 'Thừa Thiên - Huế, Huyện Phú Lộc, Thị trấn Lăng Cô - ', ' Phí Ship: 47,000VNĐ', '306000.00', '', 1635806911),
(15, 1, 0, 'Lê Thùy Linh', NULL, '0975697006', 'Kon Tum, Huyện Sa Thầy, Xã Ya Tăng - ', ' Phí Ship: 47,000VNĐ', '524000.00', '', 1633128511),
(16, 1, 0, 'Mai Thùy Anh', NULL, '0975697009', 'Hà Nội, Huyện Sóc Sơn, Xã Hồng Kỳ - ', ' Phí Ship: 47,000VNĐ', '187000.00', '', 1638398911),
(17, 1, 0, 'Ngô Phúc Hưng', NULL, '0975697010', 'Điện Biên, Thị xã Mường Lay, Phường Sông Đà - ', ' Phí Ship: 47,000VNĐ', '215000.00', '', 1638398911),
(18, 1, 0, 'Hà Anh Tuấn', NULL, '0975697112', 'Lạng Sơn, Huyện Cao Lộc, Xã Công Sơn - ', ' Phí Ship: 47,000VNĐ', '497000.00', '', 1627858111),
(19, 1, 0, 'Hoàng Xuân Mai', NULL, '0975697113', 'Sơn La, huyện Sốp Cộp, Xã Sốp Cộp - 10 Lê Lai', ' Phí Ship: 47,000VNĐ', '247000.00', '', 1622587711),
(20, 1, 0, 'Nguyễn Trần Huy', NULL, '0975697211', 'Bắc Ninh, Huyện Tiên Du, Xã Tri Phương - 56 Nguyễn Cừ', ' Phí Ship: 47,000VNĐ', '747000.00', '', 1633128511),
(21, 1, 0, 'Trần Minh Hoàng', NULL, '0975697444', 'Phú Yên, Thị xã Đông Hòa, Xã Hòa Xuân Nam - ', ' Phí Ship: 47,000VNĐ', '1289000.00', '', 1622587711),
(22, 1, 0, 'Nguyễn Lê Tuấn', NULL, '0975697661', 'Kon Tum, Huyện Đắk Tô, Xã Pô Kô - ', ' Phí Ship: 47,000VNĐ', '791000.00', '', 1633128511),
(23, 0, 0, 'Lê Trân', NULL, '0975697771', 'Phú Yên, Huyện Sơn Hòa, Xã Sơn Nguyên - ', ' Phí Ship: 47,000VNĐ', '1297000.00', '', 1642005766);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` varchar(255) NOT NULL,
  `created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(1, 'Hoàng Ngọc Nguyên', 'ngocnguyen@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456001', '', 1638830911),
(2, 'Trần Thanh Nam', 'namthanh@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456002', '', 1638830911),
(3, 'Trần Văn Tới', 'tranvantoi@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456003', '', 1638830911),
(4, 'Hồ Duy Ninh', 'ninhho@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456004', '', 1641509311),
(5, 'Trần Ngọc Sang', 'sangtran12@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456005', '', 1625525311),
(6, 'Đào Nguyễn Phương Hoa', 'hoadao@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456006', '', 1625525311),
(7, 'Lê Trần Công', 'congtran23@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456007', '', 1625525311),
(8, 'Nguyễn Đức Mạnh', 'manhduc@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456008', '', 1625525311),
(9, 'Đỗ Trung Nhân', 'dotrungnhan@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456009', '', 1625525311),
(10, 'Bùi Tấn Khoa', 'khoatanbui123@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0123456010', '', 1625525311);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `catalog`
--
ALTER TABLE `catalog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_userID` (`user_id`),
  ADD KEY `fk_productID` (`product_id`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product` (`product_id`),
  ADD KEY `fk_size` (`size_id`) USING BTREE,
  ADD KEY `fk_transation` (`transaction_id`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_catalog` (`catalog_id`);

--
-- Chỉ mục cho bảng `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sizedetail`
--
ALTER TABLE `sizedetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sizes` (`size_id`),
  ADD KEY `fk_sizedelta_product` (`product_id`);

--
-- Chỉ mục cho bảng `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `catalog`
--
ALTER TABLE `catalog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `shipping`
--
ALTER TABLE `shipping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sizedetail`
--
ALTER TABLE `sizedetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT cho bảng `slider`
--
ALTER TABLE `slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_productID` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_userID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_size` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`),
  ADD CONSTRAINT `fk_transation` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_catalog_product` FOREIGN KEY (`catalog_id`) REFERENCES `catalog` (`id`);

--
-- Các ràng buộc cho bảng `sizedetail`
--
ALTER TABLE `sizedetail`
  ADD CONSTRAINT `fk_sizedelta_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `fk_sizes` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
