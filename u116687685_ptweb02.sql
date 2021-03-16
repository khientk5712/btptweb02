-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 16, 2021 at 04:17 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u116687685_ptweb02`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `custId` bigint(20) NOT NULL COMMENT 'Id',
  `custNumber` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã số',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0 - cá nhân ; 1 - doanh nghiệp',
  `fullname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `county` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `discount` decimal(10,0) DEFAULT NULL,
  `image` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'link ảnh',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`custId`),
  UNIQUE KEY `custNumber` (`custNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoiceitems`
--

DROP TABLE IF EXISTS `invoiceitems`;
CREATE TABLE IF NOT EXISTS `invoiceitems` (
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
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoiceItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
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
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`invoiceId`),
  UNIQUE KEY `invoiceNumber` (`invoiceNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `itempurchaseorderdetails`
--

DROP TABLE IF EXISTS `itempurchaseorderdetails`;
CREATE TABLE IF NOT EXISTS `itempurchaseorderdetails` (
  `poLineId` bigint(20) NOT NULL,
  `poId` bigint(20) NOT NULL COMMENT 'Mã đơn hàng',
  `itemNo` varchar(25) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã hàng hóa',
  `qty` decimal(10,0) NOT NULL COMMENT 'Số lượng đặt hàng',
  `qtyReceived` decimal(10,0) NOT NULL COMMENT 'Số lượng đã nhận',
  `cost` decimal(10,0) NOT NULL COMMENT 'Giá nhập dự kiến',
  `amount` decimal(10,0) NOT NULL COMMENT 'thành tiền',
  `note` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày sửa gần nhất',
  PRIMARY KEY (`poLineId`),
  KEY `FK_PO` (`poId`),
  KEY `FK_ITEM` (`itemNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `itempurchaseorderdetails`
--

INSERT INTO `itempurchaseorderdetails` (`poLineId`, `poId`, `itemNo`, `qty`, `qtyReceived`, `cost`, `amount`, `note`, `created_date`, `updated_date`) VALUES
(1, 6789, '45366', '45', '656', '565456', '676', 'gygyuyua', '2021-03-10 00:00:00', '2021-03-19 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `itempurchaseorderreceiveds`
--

DROP TABLE IF EXISTS `itempurchaseorderreceiveds`;
CREATE TABLE IF NOT EXISTS `itempurchaseorderreceiveds` (
  `lotId` bigint(20) NOT NULL COMMENT 'LOT ID',
  `poLineId` bigint(20) NOT NULL,
  `receiveDate` date NOT NULL COMMENT 'Ngày nhận <= create date && >=orderDate',
  `amountReceived` decimal(10,0) NOT NULL COMMENT 'Tổng tiền nhập dự kiến/ thực tế sau khi thanh toán',
  `qtySold` decimal(10,0) NOT NULL,
  `qtyReceiveda` decimal(10,0) NOT NULL,
  `amountSold` decimal(10,0) NOT NULL COMMENT 'Tiền vốn tương ứng số lượng đã bán',
  `notea` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày tạo',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Ngày sửa gần nhất',
  PRIMARY KEY (`lotId`),
  KEY `poLineId` (`poLineId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `itempurchaseorderreceiveds`
--

INSERT INTO `itempurchaseorderreceiveds` (`lotId`, `poLineId`, `receiveDate`, `amountReceived`, `qtySold`, `qtyReceiveda`, `amountSold`, `notea`, `created_date`, `updated_date`) VALUES
(2222, 1, '2021-03-13', '623', '84521', '485123', '84512', 'bjk', '2021-03-16 23:01:39', '2021-03-16 23:01:39'),
(34567, 1, '2021-03-11', '852', '4523', '512', '48523', 'drftyugioj', '2021-03-16 21:45:20', '2021-03-16 21:45:20');

-- --------------------------------------------------------

--
-- Table structure for table `itempurchaseorders`
--

DROP TABLE IF EXISTS `itempurchaseorders`;
CREATE TABLE IF NOT EXISTS `itempurchaseorders` (
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
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ngày tạo',
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'ngày sửa gần nhất',
  PRIMARY KEY (`poId`),
  UNIQUE KEY `poNumber` (`poNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `itempurchaseorders`
--

INSERT INTO `itempurchaseorders` (`poId`, `orderDate`, `poNumber`, `supplierId`, `remark`, `paymentTermld`, `staffId`, `status`, `receiveDate`, `billingStatus`, `created_date`, `updated_date`) VALUES
(6789, '2021-03-09 10:11:24', '657869', 78908, 'yjukiluyo;y.g,kmgnhfbg', 697083, 568790234, 'fjndbfsv', '2021-03-17 00:00:00', 'lmnbvsd', '2021-03-11 10:25:08', '2021-03-11 10:25:08'),
(432536547, '2021-03-09 00:00:00', '4365475', 64758697, 'fsegrdhtfjy', 4675, 879, 'dhfjgkh', '2021-03-09 00:00:00', 'rẻtyuklj', '2021-03-10 00:00:00', '2021-03-11 10:12:29');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
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
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`itemNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`itemNo`, `itemName`, `otherName`, `colorId`, `decription`, `makeId`, `location`, `usefor`, `qty_available`, `qtyOnOrder`, `cost`, `price`, `wholeSalePrice`, `specialPrice`, `tax`, `image`, `created_date`, `updated_date`) VALUES
('234556', 'aesrdthfyjguk', 'ửetrytuytu', '456rtry', 'qdwfesgrdhtfjygkuhhg', 324354, 'reytykyulu', 'ưertyjukl', '346576', '2345', '534', '12345', '3647', '1324', '3245', 'etrytuyt', '2021-03-10 00:00:00', '2021-03-11 10:15:03'),
('45366', 'sdhfjg', 'sdghfjghkjl', 'sdfjgkhjl', 'sgdhfjkglh;j', 43645, '65787e', 'ẻhtjykj', '4565', '9700', '423545', '465768', '45676', '253678', '56', 'wertjykguiluo;h.,gmfgndfbsdva', '2021-03-10 00:00:00', '2021-03-11 10:23:23');

-- --------------------------------------------------------

--
-- Table structure for table `makes`
--

DROP TABLE IF EXISTS `makes`;
CREATE TABLE IF NOT EXISTS `makes` (
  `makeId` bigint(20) NOT NULL,
  `makeName` int(11) NOT NULL COMMENT 'Tên nhà sản xuất',
  `remark` int(11) DEFAULT NULL COMMENT 'Ghi chú',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`makeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `makes`
--

INSERT INTO `makes` (`makeId`, `makeName`, `remark`, `created_date`, `updated_date`) VALUES
(6513, 46513, 1111, '2021-03-16 21:58:48', '2021-03-16 21:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
CREATE TABLE IF NOT EXISTS `staffs` (
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
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`staffId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `supplierId` bigint(20) NOT NULL COMMENT 'Id',
  `supplierNumber` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã số nhà cung cấp',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0-cá nhân; 1-doanh nghiệp',
  `supplierName` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Tên của nhà cung cấp',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `county` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Ghi chú',
  `image` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Link ảnh',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`supplierId`),
  UNIQUE KEY `supplierNumber` (`supplierNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `userid` bigint(20) NOT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'login name',
  `fullname` varchar(80) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `role` int(11) NOT NULL COMMENT 'for permission',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastsigned_date` datetime DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_contacts`
--

DROP TABLE IF EXISTS `web_contacts`;
CREATE TABLE IF NOT EXISTS `web_contacts` (
  `id` bigint(20) NOT NULL,
  `custName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `custAddress` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `custPhone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `custMessage` varchar(300) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nội dung, lời nhắn',
  `inputSource` int(11) NOT NULL COMMENT '1 - từ Web, 2 - Mobile app',
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_product_registrations`
--

DROP TABLE IF EXISTS `web_product_registrations`;
CREATE TABLE IF NOT EXISTS `web_product_registrations` (
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
  `created_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `itempurchaseorderdetails`
--
ALTER TABLE `itempurchaseorderdetails`
  ADD CONSTRAINT `FK_ITEM` FOREIGN KEY (`itemNo`) REFERENCES `items` (`itemNo`),
  ADD CONSTRAINT `FK_PO` FOREIGN KEY (`poId`) REFERENCES `itempurchaseorders` (`poId`);

--
-- Constraints for table `itempurchaseorderreceiveds`
--
ALTER TABLE `itempurchaseorderreceiveds`
  ADD CONSTRAINT `itempurchaseorderreceiveds_ibfk_1` FOREIGN KEY (`poLineId`) REFERENCES `itempurchaseorderdetails` (`poLineId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
