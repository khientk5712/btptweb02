-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 16, 2021 lúc 06:36 PM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `u116687685_ptweb02`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `custId` bigint(20) NOT NULL COMMENT 'Id',
  `custNumber` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã số',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0 - cá nhân ; 1 - doanh nghiệp',
  `fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `county` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `discount` decimal(10,0) DEFAULT NULL,
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'link ảnh',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoiceitems`
--

CREATE TABLE `invoiceitems` (
  `invoiceItemId` bigint(20) NOT NULL,
  `invoiceId` bigint(20) NOT NULL,
  `itemNo` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã hàng hóa',
  `quantity` decimal(10,0) NOT NULL COMMENT 'Số lượng bán hoặc trả lại(âm)',
  `price` decimal(10,0) NOT NULL COMMENT 'Giá bán',
  `amount` decimal(10,0) NOT NULL COMMENT '=quantity*price',
  `discount` decimal(10,0) NOT NULL COMMENT 'Số tiền chiết khấu/ giảm giá riêng cho mặt hàng',
  `discountPerent` decimal(10,0) NOT NULL COMMENT 'Phần trăm chiết khấu/giảm giá',
  `tax` decimal(10,0) NOT NULL COMMENT 'Số tiền thuế',
  `percentTax` double NOT NULL COMMENT 'Tỷ lệ % thuế',
  `preTaxAmount` decimal(10,0) NOT NULL COMMENT 'Tổng tiền trước thuế',
  `afterTaxAmount` decimal(10,0) NOT NULL,
  `distributedDiscount` decimal(10,0) NOT NULL COMMENT 'Số tiền chiết khấu chung theo hóa đơn',
  `notes` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `lotId` bigint(20) NOT NULL COMMENT 'Ghi nhận lotId khi thực hiện đặt hàng/hoàn thành hóa đơn',
  `totalCost` decimal(10,0) NOT NULL COMMENT 'Tổng tiền vốn(chi phí)',
  `itemIndex` smallint(6) NOT NULL COMMENT 'Số thứ tự của mặt hàng trong hóa đơn',
  `returnFrom` bigint(20) DEFAULT NULL COMMENT 'là invoiceItemId của hóa đơn trả hàng',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `invoiceId` bigint(20) NOT NULL,
  `invoiceNumber` varchar(12) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Số hóa đơn user nhập hoặc = invoiceId',
  `invoiceDate` datetime NOT NULL COMMENT 'Ngày hóa đơn',
  `custId` bigint(20) NOT NULL COMMENT 'Mã khách hàng',
  `subTotal` decimal(10,0) NOT NULL COMMENT 'Tổng cộng tiền (trước thuế)',
  `discount` decimal(10,0) NOT NULL COMMENT 'Sô tiền chiết khấu/giảm giá',
  `discountPercent` decimal(10,0) NOT NULL COMMENT 'Phần trăm chiết khấu. giảm giá',
  `tax` decimal(10,0) NOT NULL COMMENT 'Số tiền thuế',
  `amountDue` decimal(10,0) NOT NULL COMMENT 'Số tiền phải thanh toán',
  `notes` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú/nội dung',
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Pending, Quote, Resered, Sold, Lost_sale',
  `reservedDate` datetime DEFAULT NULL COMMENT 'Ngày đặt hàng/nhận cọc',
  `soldDate` datetime DEFAULT NULL COMMENT 'Ngày hoàn thành hóa đơn (Closed Date)',
  `createdBy` bigint(20) NOT NULL COMMENT 'Id người tạo hóa đơn',
  `soldBy` bigint(20) NOT NULL COMMENT 'Id người hoàn thành hóa đơn',
  `returnFrom` bigint(20) DEFAULT NULL COMMENT 'Id hóa đơn gốc nếu đây là hóa đơn trả hàng',
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên hóa đơn',
  `discountByPercentage` tinyint(1) NOT NULL COMMENT 'Để biết hóa đơn này giảm giá/chiết khấu theo số tiền hay theo phần trăm',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `itempurchaseorderdetails`
--

CREATE TABLE `itempurchaseorderdetails` (
  `poLineId` bigint(20) NOT NULL,
  `poId` bigint(20) NOT NULL COMMENT 'Mã đơn hàng',
  `itemNo` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã hàng hóa',
  `qty` decimal(10,0) NOT NULL COMMENT 'Số lượng đặt hàng',
  `qtyReceived` decimal(10,0) NOT NULL COMMENT 'Số lượng đã nhận',
  `cost` decimal(10,0) NOT NULL COMMENT 'Giá nhập dự kiến',
  `amount` decimal(10,0) NOT NULL COMMENT 'thành tiền',
  `note` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày sửa gần nhất'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `itempurchaseorderdetails`
--

INSERT INTO `itempurchaseorderdetails` (`poLineId`, `poId`, `itemNo`, `qty`, `qtyReceived`, `cost`, `amount`, `note`, `created_date`, `updated_date`) VALUES
(1, 6789, '45366', '45', '656', '565456', '676', 'gygyuyua', '2021-03-10 00:00:00', '2021-03-19 00:00:00'),
(2, 432536547, '45366', '231231', '1231231', '31131', '231313', 'aaaa', '2021-03-16 23:52:12', '2021-03-16 23:52:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `itempurchaseorderreceiveds`
--

CREATE TABLE `itempurchaseorderreceiveds` (
  `lotId` bigint(20) NOT NULL COMMENT 'LOT ID',
  `poLineId` bigint(20) NOT NULL,
  `receiveDate` date NOT NULL COMMENT 'Ngày nhận <= create date && >=orderDate',
  `amountReceived` decimal(10,0) NOT NULL COMMENT 'Tổng tiền nhập dự kiến/ thực tế sau khi thanh toán',
  `qtySold` decimal(10,0) NOT NULL,
  `qtyReceiveda` decimal(10,0) NOT NULL,
  `amountSold` decimal(10,0) NOT NULL COMMENT 'Tiền vốn tương ứng số lượng đã bán',
  `notea` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày tạo',
  `updated_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Ngày sửa gần nhất'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `itempurchaseorderreceiveds`
--

INSERT INTO `itempurchaseorderreceiveds` (`lotId`, `poLineId`, `receiveDate`, `amountReceived`, `qtySold`, `qtyReceiveda`, `amountSold`, `notea`, `created_date`, `updated_date`) VALUES
(34567, 1, '2021-03-27', '852', '4523', '512', '48523', 'hihi', '2021-03-16 21:45:20', '2021-03-16 21:45:20'),
(111211, 2, '2021-04-22', '231231', '1231231211', '1111', '1313123', 'ádasdassdasda', '2021-03-17 00:07:39', '2021-03-17 00:07:39'),
(21313123, 2, '2021-03-26', '423424234', '24234234', '4223424', '23423423', 'adas', '2021-03-17 00:34:10', '2021-03-17 00:34:10'),
(123123141421, 2, '2021-04-02', '53453', '5345345', '323425435', '353453453', 'aa', '2021-03-17 00:09:34', '2021-03-17 00:09:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `itempurchaseorders`
--

CREATE TABLE `itempurchaseorders` (
  `poId` bigint(20) NOT NULL COMMENT 'Mã đơn hàng',
  `orderDate` datetime NOT NULL COMMENT 'Ngày thực hiện đặt',
  `poNumber` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Số đơn hàng - tự sinh hoặc nhập vào',
  `supplierId` bigint(20) NOT NULL COMMENT 'Id nhà cung cấp',
  `remark` varchar(300) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ghi chú',
  `paymentTermld` bigint(20) DEFAULT NULL COMMENT 'Điều kiện thanh toán',
  `staffId` bigint(20) NOT NULL COMMENT 'Mã nhân viên tạo đơn hàng',
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'PENDING, OPEN or DONE',
  `receiveDate` datetime DEFAULT NULL COMMENT 'ngày dự kiến nhận hàng',
  `billingStatus` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Trạng thái thanh toán: NO_BILL, HAS_BILL, DONE',
  `created_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngày tạo',
  `updated_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'ngày sửa gần nhất'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `itempurchaseorders`
--

INSERT INTO `itempurchaseorders` (`poId`, `orderDate`, `poNumber`, `supplierId`, `remark`, `paymentTermld`, `staffId`, `status`, `receiveDate`, `billingStatus`, `created_date`, `updated_date`) VALUES
(6789, '2021-03-09 10:11:24', '657869', 78908, 'yjukiluyo;y.g,kmgnhfbg', 697083, 568790234, 'fjndbfsv', '2021-03-17 00:00:00', 'lmnbvsd', '2021-03-11 10:25:08', '2021-03-11 10:25:08'),
(432536547, '2021-03-09 00:00:00', '4365475', 64758697, 'fsegrdhtfjy', 4675, 879, 'dhfjgkh', '2021-03-09 00:00:00', 'rẻtyuklj', '2021-03-10 00:00:00', '2021-03-11 10:12:29');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `items`
--

CREATE TABLE `items` (
  `itemNo` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã hàng hóa',
  `itemName` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên hàng hóa',
  `otherName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Tên khác-English Name etc',
  `colorId` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mã màu sắc',
  `decription` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Mô tả',
  `makeId` bigint(20) NOT NULL COMMENT 'Mã sản xuất',
  `location` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Vị trí trong kho:R1C2',
  `usefor` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Sử dụng cho',
  `qty_available` decimal(10,0) NOT NULL COMMENT 'Số lượng đang có trong kho',
  `qtyOnOrder` decimal(10,0) NOT NULL COMMENT 'Sô lượng đang đặt hàng',
  `cost` decimal(10,0) NOT NULL COMMENT 'Giá nhập dự kiến',
  `price` decimal(10,0) NOT NULL COMMENT 'Giá bán lẻ',
  `wholeSalePrice` decimal(10,0) NOT NULL COMMENT 'Giá bán buôn',
  `specialPrice` decimal(10,0) NOT NULL COMMENT 'Giá đặc biệt',
  `tax` decimal(10,0) DEFAULT NULL COMMENT 'Tỷ lệ % thuế: 0,10',
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình ảnh',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `items`
--

INSERT INTO `items` (`itemNo`, `itemName`, `otherName`, `colorId`, `decription`, `makeId`, `location`, `usefor`, `qty_available`, `qtyOnOrder`, `cost`, `price`, `wholeSalePrice`, `specialPrice`, `tax`, `image`, `created_date`, `updated_date`) VALUES
('234556', 'aesrdthfyjguk', 'ửetrytuytu', '456rtry', 'qdwfesgrdhtfjygkuhhg', 324354, 'reytykyulu', 'ưertyjukl', '346576', '2345', '534', '12345', '3647', '1324', '3245', 'etrytuyt', '2021-03-10 00:00:00', '2021-03-11 10:15:03'),
('45366', 'sdhfjg', 'sdghfjghkjl', 'sdfjgkhjl', 'sgdhfjkglh;j', 43645, '65787e', 'ẻhtjykj', '4565', '9700', '423545', '465768', '45676', '253678', '56', 'wertjykguiluo;h.,gmfgndfbsdva', '2021-03-10 00:00:00', '2021-03-11 10:23:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `makes`
--

CREATE TABLE `makes` (
  `makeId` bigint(20) NOT NULL,
  `makeName` int(11) NOT NULL COMMENT 'Tên nhà sản xuất',
  `remark` int(11) DEFAULT NULL COMMENT 'Ghi chú',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `makes`
--

INSERT INTO `makes` (`makeId`, `makeName`, `remark`, `created_date`, `updated_date`) VALUES
(6513, 46513, 1111, '2021-03-16 21:58:48', '2021-03-16 21:59:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staffs`
--

CREATE TABLE `staffs` (
  `staffId` bigint(20) NOT NULL COMMENT 'Id',
  `staffNumber` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã nhân viên',
  `fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên đầy đủ',
  `birthday` date DEFAULT NULL COMMENT 'Ngày sinh',
  `email` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `county` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'link ảnh',
  `managerId` bigint(20) DEFAULT NULL COMMENT 'mã người quản lý',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `supplierId` bigint(20) NOT NULL COMMENT 'Id',
  `supplierNumber` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã số nhà cung cấp',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0-cá nhân; 1-doanh nghiệp',
  `supplierName` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên của nhà cung cấp',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `county` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `image` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Link ảnh',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `userid` bigint(20) NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'login name',
  `fullname` varchar(80) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `role` int(11) NOT NULL COMMENT 'for permission',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `lastsigned_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `web_contacts`
--

CREATE TABLE `web_contacts` (
  `id` bigint(20) NOT NULL,
  `custName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `custAddress` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `custPhone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `custMessage` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung, lời nhắn',
  `inputSource` int(11) NOT NULL COMMENT '1 - từ Web, 2 - Mobile app',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `web_product_registrations`
--

CREATE TABLE `web_product_registrations` (
  `id` bigint(20) NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên tổ chức / công ty',
  `fullname` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên người liên hệ',
  `serviceType` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Loại hình dịch vụ',
  `address` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Địa chỉ doanh nghiệp / dịch vụ',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `numberOfBranch` int(11) NOT NULL COMMENT 'Số chi nhánh / cơ sở',
  `businessField` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Ngành kinh doanh',
  `informationSource` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Bạn biết đến tôi qua kênh nào',
  `contactTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Giờ  muốn được tư vấn',
  `yourNeeds` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung muốn được tư vấn',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`custId`),
  ADD UNIQUE KEY `custNumber` (`custNumber`);

--
-- Chỉ mục cho bảng `invoiceitems`
--
ALTER TABLE `invoiceitems`
  ADD PRIMARY KEY (`invoiceItemId`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoiceId`),
  ADD UNIQUE KEY `invoiceNumber` (`invoiceNumber`);

--
-- Chỉ mục cho bảng `itempurchaseorderdetails`
--
ALTER TABLE `itempurchaseorderdetails`
  ADD PRIMARY KEY (`poLineId`),
  ADD KEY `FK_PO` (`poId`),
  ADD KEY `FK_ITEM` (`itemNo`);

--
-- Chỉ mục cho bảng `itempurchaseorderreceiveds`
--
ALTER TABLE `itempurchaseorderreceiveds`
  ADD PRIMARY KEY (`lotId`),
  ADD KEY `poLineId` (`poLineId`);

--
-- Chỉ mục cho bảng `itempurchaseorders`
--
ALTER TABLE `itempurchaseorders`
  ADD PRIMARY KEY (`poId`),
  ADD UNIQUE KEY `poNumber` (`poNumber`);

--
-- Chỉ mục cho bảng `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`itemNo`);

--
-- Chỉ mục cho bảng `makes`
--
ALTER TABLE `makes`
  ADD PRIMARY KEY (`makeId`);

--
-- Chỉ mục cho bảng `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staffId`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplierId`),
  ADD UNIQUE KEY `supplierNumber` (`supplierNumber`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- Chỉ mục cho bảng `web_contacts`
--
ALTER TABLE `web_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `web_product_registrations`
--
ALTER TABLE `web_product_registrations`
  ADD PRIMARY KEY (`id`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `itempurchaseorderdetails`
--
ALTER TABLE `itempurchaseorderdetails`
  ADD CONSTRAINT `FK_ITEM` FOREIGN KEY (`itemNo`) REFERENCES `items` (`itemNo`),
  ADD CONSTRAINT `FK_PO` FOREIGN KEY (`poId`) REFERENCES `itempurchaseorders` (`poId`);

--
-- Các ràng buộc cho bảng `itempurchaseorderreceiveds`
--
ALTER TABLE `itempurchaseorderreceiveds`
  ADD CONSTRAINT `itempurchaseorderreceiveds_ibfk_1` FOREIGN KEY (`poLineId`) REFERENCES `itempurchaseorderdetails` (`poLineId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
