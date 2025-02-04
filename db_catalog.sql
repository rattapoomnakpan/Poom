-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2025 at 12:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_catalog`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL COMMENT 'ลำดับที่',
  `orderID` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'เลขที่ใบสั่งซื้อ',
  `pro_id` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'รห้สสินค้า',
  `orderPrice` float NOT NULL COMMENT 'ราคาสินค้า',
  `orderQty` int(11) NOT NULL COMMENT 'จำนวนที่สั่งซื้อ',
  `Total` float NOT NULL COMMENT 'ราคารวม'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `orderID`, `pro_id`, `orderPrice`, `orderQty`, `Total`) VALUES
(1, 0000000001, 0000000001, 80000, 1, 80000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_about`
--

CREATE TABLE `tb_about` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` text NOT NULL,
  `address` varchar(300) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_about`
--

INSERT INTO `tb_about` (`id`, `name`, `description`, `address`, `email`, `phone`) VALUES
(1, 'poom shop', 'ร้านค้าออนไลน์จำหน่ายคอมพิวเตอร์และอุปกรณ์เสริมครบวงจร ทั้งโน้ตบุ๊ก, พีซี, จอภาพ, คีย์บอร์ด, เมาส์ และอุปกรณ์เกมมิ่ง พร้อมบริการจัดส่งทั่วประเทศ', '315/5 ต.เมือง อ.เมือง จ.นครศรีธรรมราช', 'poomblackd736@gmail.com', '0123456789     ');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `user` varchar(200) NOT NULL,
  `pass` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id`, `firstname`, `lastname`, `email`, `phone`, `image`, `user`, `pass`, `status`, `created_datetime`) VALUES
(45, 'admin', 'admin', 'admin@gmail.com', '021', '1734614493PICK THE PERFECT.png', 'admin', '123456', 0, '2024-12-07 08:18:29'),
(46, 'admin2', 'admin2', 'admin2@gmail.com', '123456789', '1735471298_INTEL (5).png', 'admin2', '000', 0, '2024-12-07 08:19:42'),
(49, 'admin10', 'admin10', 'admin10@gmail.com', '25896', '17336397665.jpg', 'admin10', '123456', 0, '2024-12-08 06:36:06'),
(51, 'admin999', 'admin999', 'admin999@gmail.com', '001', '173365769217.jpg', 'admin999', '000', 0, '2024-12-08 11:34:34'),
(52, 'CPU001', 'CPU001', 'CPU001@gmail.com', '11444', '173461526418327_0.jpg', 'CPU001', '123456', 0, '2024-12-13 07:43:53'),
(53, 'adminz', 'adminz', 'adminz@gmail.com', '1255', '173461538218334_0.jpg', 'adminz', '123456', 0, '2024-12-19 13:16:20'),
(54, 'admink', 'admink', 'admink@gmail.com', '258', '173461541218332_0.jpg', 'admink', '123456', 0, '2024-12-19 13:36:52'),
(55, 'boo', 'boo', 'boo@gmail.com', '02541', '17348537831689920902.jpg', 'adminboo', '123456', 0, '2024-12-22 07:49:31'),
(56, 'admin', 'adminB', 'adminB@gmail.com', '0', '1735471286products53235_800.jpg', 'adminB', '123456', 0, '2024-12-29 11:20:29');

-- --------------------------------------------------------

--
-- Table structure for table `tb_order`
--

CREATE TABLE `tb_order` (
  `orderID` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT 'เลขที่ใบสั่งซื้อ',
  `firstname` varchar(100) NOT NULL COMMENT 'ชื่อ-นามสกุล',
  `address` text NOT NULL COMMENT 'ที่อยู่การจัดส่ง',
  `telephone` varchar(10) NOT NULL COMMENT 'เบอร์โทรศัพท์',
  `total_price` float NOT NULL COMMENT 'ราคารวมสุทธิ',
  `order_status` varchar(1) NOT NULL COMMENT '0=ยกเลิก, \r\n1=ยังไม่ชำระเงิน ,\r\n2 = ชำระเงินแล้ว,\r\n3 = ยืนยันคำสั่งซื้อแล้ว,\r\n4 = ทำการจัดส่งสำเร็จ\r\n5 = เสร็จสินการส่งสินค้า',
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'วันที่สั่งซื้อ',
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `LINE` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_order`
--

INSERT INTO `tb_order` (`orderID`, `firstname`, `address`, `telephone`, `total_price`, `order_status`, `reg_date`, `lastname`, `email`, `image`, `LINE`) VALUES
(0000000001, 'Opoom002', '315/2 หมู่ 2 ตำบล.เสาธง	จ.นคร', '0326598', 80000, '5', '2025-02-03 05:29:29', '002', 'Opoom@gmail.com', '1738560580money.jpg', 'Opoom002');

-- --------------------------------------------------------

--
-- Table structure for table `tb_product`
--

CREATE TABLE `tb_product` (
  `id` int(11) NOT NULL,
  `type_product_id` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `detail` text NOT NULL,
  `price` float NOT NULL,
  `status` int(11) NOT NULL,
  `view` int(11) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_product`
--

INSERT INTO `tb_product` (`id`, `type_product_id`, `image`, `title`, `detail`, `price`, `status`, `view`, `created_datetime`) VALUES
(1, 2, '1737281167_MSI STEALTH 16 MERCEDES-AMG.jpg', 'MSI STEALTH 16 MERCEDES-AMG', 'Brands	MSI\r\nModel	STEALTH 16 MERCEDES-AMG-A1VGG-261TH\r\nProcessors	Intel Core Ultra 9 185H\r\nProcessor Speed	16 cores (6 P-cores + 8 E-cores + 2 Low Power E-cores), Max Turbo Frequency 5.1 GHz\r\nVideo Graphics	NVIDIA® GeForce RTX™ 4070 8GB GDDR6\r\nScreen Size	16\"\r\nDisplay	QHD+ (2560x1600) , 240Hz Refresh Rate, OLED, VESA DisplayHDR™ 600 Certified, 100% DCI-P3(Typical)\r\nMemory	32GB (16GB x2) DDR5 5600MHz\r\nStorage	2TB NVMe SSD PCIe Gen4\r\nOperating System	Windows 11 Home + Microsoft Office Home&Student 2021\r\nCamera	\r\nIR FHD type (30fps@1080p) with HDR\r\n3D Noise Reduction+ (3DNR+)\r\nOptical Drive	No\r\nConnection port	\r\n1 x USB 3.2 Gen 2 Type-A Port\r\n1 x USB 3.2 Gen 2 Type C port\r\n1 x Mic-in/Headphone-out Combo Jack\r\n1 x HDMI™ 2.1, up to 8K/60Hz\r\n1 x RJ45 LAN port\r\n1 x microSD card reader\r\n1 x DC-in\r\n1 x Thunderbolt 4 supports display / power delivery\r\nWi-Fi/ Bluetooth	Intel® Killer™ Wi-Fi 7 BE1750 + Bluetooth v5.4\r\nBattery	4-Cell Battery, 99.9Whr\r\nColor	SELENITE GRAY\r\nDimensions	355.8 x 259.7 x 19.95 mm\r\nWeight	1.99 kg\r\nWarranty	3 Years', 80000, 0, 104, '2025-01-19 10:06:07'),
(3, 11, '1737281449_PHILIPS EVNIA 49M2C890000 - 48.9.jpg', 'MONITOR (จอมอนิเตอร์)PHILIPS EVNIA 49M2C8900/00 - 48.9', 'MONITOR (จอมอนิเตอร์) PHILIPS EVNIA 49M2C8900/00 - 48.9 QD-OLED 2K CURVED 240Hz', 40000, 0, 58, '2025-01-19 10:10:49'),
(4, 2, '1737355998_MSI VECTOR 17 HX A14VHG-613TH.jpg', 'MSI VECTOR 17 HX A14VHG-613TH', 'Brands	MSI\r\nModel	VECTOR 17 HX A14VHG-613TH\r\nProcessors	Intel® Core™ i9-14900HX Processors (14th Gen)\r\nProcessor Speed	24 cores (8 P-cores + 16 E-cores), Max Turbo Frequency 5.8 GHz\r\nVideo Graphics	NVIDIA® GeForce RTX™ 4080 Laptop GPU 12GB GDDR6\r\nScreen Size	17\"\r\nDisplay	QHD+ (2560x1600) , 240Hz Refresh Rate, IPS-Level, 100% DCI-P3(Typical)\r\nMemory	32GB (16GB x2) DDR5 5600MHz\r\nStorage	1TB PCIe® 4.0 NVMe™ M.2 SSD\r\nOperating System	Windows 11 Home + Microsoft Office Home&Student 2021\r\nCamera	HD type (30fps@720p)\r\nOptical Drive	No\r\nConnection port	\r\n2 x USB 3.2 Gen 2 Type-C ports\r\n1 x USB 3.2 Gen 2 Type-A Port\r\n1 x USB 3.2 Gen 1 Type-A port\r\n1 x SD card reader\r\n1 x Mic-in/Headphone-out Combo Jack\r\n1 x HDMI™ 2.1, up to 8K/60Hz\r\n1 x DC-in\r\n1 x Thunderbolt 4 supports display\r\nWi-Fi/ Bluetooth	Intel® Killer™ Wi-Fi 7 BE1750 + Bluetooth v5.4\r\nBattery	4-Cell, 90Whr\r\nColor	Cosmos Gray\r\nDimensions	380 x 297.97 x 23.55-29.45 mm.\r\nWeight	3.0 kg\r\nWarranty	3 Years', 85000, 0, 208, '2025-01-20 06:53:18'),
(5, 2, '1737358675_MSI VECTOR 16 HX A14VHG-295TH.jpg', 'MSI VECTOR 16 HX A14VHG-295TH', 'Brands	MSI\r\nModel	VECTOR 16 HX A14VHG-295TH\r\nProcessors	Intel® Core™ i9-14900HX Processors (14th Gen)\r\nProcessor Speed	24 cores (8 P-cores + 16 E-cores), Max Turbo Frequency 5.8 GHz\r\nVideo Graphics	NVIDIA® GeForce RTX™ 4080 Laptop GPU 12GB GDDR6\r\nScreen Size	16\"\r\nDisplay	QHD+ (2560x1600) , 240Hz Refresh Rate, IPS-Level, 100% DCI-P3(Typical)\r\nMemory	32GB (16GB x2) DDR5 5600MHz\r\nStorage	1TB PCIe® 4.0 NVMe™ M.2 SSD\r\nOperating System	Windows 11 Home + Microsoft Office Home&Student 2021\r\nCamera	HD type (30fps@720p)\r\nOptical Drive	No\r\nConnection port	\r\n2 x USB 3.2 Gen 2 Type-C ports\r\n1 x USB 3.2 Gen 2 Type-A Port\r\n1 x USB 3.2 Gen 1 Type-A port\r\n1 x SD card reader\r\n1 x Mic-in/Headphone-out Combo Jack\r\n1 x HDMI™ 2.1, up to 8K/60Hz\r\n1 x RJ45 LAN port\r\n1 x DC-in\r\n1 x Thunderbolt 4 supports display\r\nWi-Fi/ Bluetooth	Intel® Killer™ Wi-Fi 7 BE1750 + Bluetooth v5.4\r\nBattery	4-Cell, 90Whr\r\nColor	Cosmos Gray\r\nDimensions	357 x 284.05 x 22.20~28.55 mm.\r\nWeight	2.71 kg\r\nWarranty	3 Years', 77000, 0, 16, '2025-01-20 07:37:55'),
(6, 2, '1737358926_MSI PRESTIGE 16 AI STUDIO B1VFG-227TH.jpg', 'MSI PRESTIGE 16 AI STUDIO B1VFG-227TH', 'Brands	MSI\r\nModel	PRESTIGE 16 AI STUDIO B1VFG-227TH\r\nProcessors	Intel Core Ultra 9 185H\r\nProcessor Speed	16 cores (6 P-cores + 8 E-cores + 2 Low Power E-cores), Max Turbo Frequency 5.1 GHz\r\nVideo Graphics	NVIDIA® GeForce RTX™ 4060 Laptop GPU 8GB GDDR6\r\nScreen Size	16\"\r\nDisplay	QHD+ (2560x1600) , OLED, VESA DisplayHDR™ 600 Certified, 100% DCI-P3(Typical)\r\nMemory	32GB LPDDR5 6400O\r\nStorage	1TB PCIe® 4.0 NVMe™ M.2 SSD\r\nOperating System	Windows 11 Home + Microsoft Office Home&Student 2021\r\nCamera	\r\nIR FHD type (30fps@1080p) with HDR\r\n3D Noise Reduction+ (3DNR+)\r\nOptical Drive	No\r\nConnection port	\r\n1 x USB 3.2 Gen 2 Type-A Port\r\n1 x USB 3.2 Gen 2 Type C port\r\n1 x SD card reader\r\n1 x Mic-in/Headphone-out Combo Jack\r\n1 x RJ45 LAN port\r\n1 x Thunderbolt 4 supports display\r\n1 x HDMI™ 2.1 (8K @ 60Hz / 4K @ 120Hz)\r\nWi-Fi/ Bluetooth	Intel® Killer™ Wi-Fi 7 BE1750 + Bluetooth v5.4\r\nBattery	4-Cell Battery, 99.9Whr\r\nColor	STELLAR GRAY\r\nDimensions	358.4 x 254.4 x 16.85-18.95 mm\r\nWeight	1.60 kg\r\nWarranty	2 Years', 60000, 0, 18, '2025-01-20 07:42:06'),
(7, 2, '1737359436_MSI KATANA A17 AI B8VG-861TH.jpg', ' MSI KATANA A17 AI B8VG-861TH', 'Brands	MSI\r\nModel	KATANA A17 AI B8VG-861TH\r\nProcessors	AMD Ryzen 9 8940H\r\nProcessor Speed	4.0GHz up to 5.3GHz, 8MB L2 Cache / 16MB L3 Cache\r\nVideo Graphics	NVIDIA® GeForce RTX™ 4070 8GB GDDR6\r\nScreen Size	17.3\"\r\nDisplay	FHD (1920 x 1080) IPS, 144Hz, 45% NTSC\r\nMemory	16GB DDR5\r\nStorage	1TB PCIe® 4.0 NVMe™ M.2 SSD\r\nOperating System	Windows 11 Home + Microsoft Office Home&Student 2021\r\nCamera	HD type (30fps@720p)\r\nOptical Drive	No\r\nConnection port	\r\n2 x USB 3.2 Gen 1 Type-A ports\r\n1 x Mic-in/Headphone-out Combo Jack\r\n1 x HDMI™ 2.1, up to 8K/60Hz\r\n1 x RJ45 LAN port\r\n1 x USB 3.2 Gen 1 Type-C port\r\n1 x USB 2.0 Type-A port\r\n1 x DC-in\r\nWi-Fi/ Bluetooth	Wi-Fi 6E (802.11ax)+Bluetooth 5.3\r\nBattery	3-Cell Battery, 53.5WHr\r\nColor	BLACK\r\nDimensions	398 x 273 x 25.2 mm.\r\nWeight	2.71 kg\r\nWarranty	2 Years', 52000, 0, 20, '2025-01-20 07:50:36'),
(8, 2, '1737359797_MSI CYBORG 14 A13VF-064TH.jpg', 'MSI CYBORG 14 A13VF-064TH', 'Brands	MSI\r\nModel	CYBORG 14 A13VF-064TH\r\nProcessors	Intel® Core™ i7-13620H Processors (13th Gen)\r\nProcessor Speed	2.4GHz up to 4.9GHz, 24MB Intel Smart Cache\r\nVideo Graphics	NVIDIA® GeForce RTX™ 4060 Laptop GPU 8GB GDDR6\r\nScreen Size	14\"\r\nDisplay	FHD+ (1920 x 1200), 144Hz, IPS-level panel\r\nMemory	16GB DDR5\r\nStorage	1TB PCIe® 4.0 NVMe™ M.2 SSD\r\nOperating System	Windows 11 Home + Microsoft Office Home&Student 2021\r\nCamera	HD type (30fps@720p)\r\nOptical Drive	No\r\nConnection port	\r\n1 x USB 3.2 Gen 2 Type C port\r\n2 x USB 3.2 Gen 1 Type-A ports\r\n1 x Mic-in/Headphone-out Combo Jack\r\n1 x RJ45 LAN port\r\n1 x DC-in\r\n1 x HDMI™ 2.1 ports\r\nWi-Fi/ Bluetooth	Wi-Fi 6E (802.11ax)+Bluetooth 5.3\r\nBattery	3-Cell Battery, 53.5WHr\r\nColor	Translucent Black\r\nDimensions	314.7 x 233.5 x 18.6 ~ 22.3 mm.\r\nWeight	1.60 kg\r\nWarranty	2 Years', 37000, 0, 10, '2025-01-20 07:56:37'),
(9, 2, '1737359935_HP 15-FC1001AU.jpg', 'HP 15-FC1001AU', 'Brands	HP\r\nModel	15-FC1001AU\r\nProcessors	AMD Ryzen™ 5 7535HS Processor\r\nProcessor Speed	3.3GHz up to 4.55GHz, 3MB L2 Cache / 16MB L3 Cache\r\nVideo Graphics	Integrated AMD Radeon Graphics\r\nScreen Size	15.6\"\r\nDisplay	FHD (1920x1080), IPS, 16:9, micro-edge, antiglare, 250 nits, 62.5% sRGB\r\nMemory	8GB DDR5 (4800MHz)\r\nStorage	512GB PCIe® NVMe™ M.2 SSD\r\nOperating System	Windows 11 Home + Microsoft Office Home&Student 2021\r\nCamera	HP True Vision 1080p FHD camerawith temporal noise reduction and integrated dual array digital microphones\r\nOptical Drive	No\r\nConnection port	\r\n1 x HDMI™ 1.4b\r\n1 x Power connector\r\n1 x USB 10Gbps Type-C\r\n2 x USB 5Gbps Type-A\r\n1 x Headphone/Microphone Combo\r\nWi-Fi/ Bluetooth	Wi-Fi 6 (802.11ax)+Bluetooth 5.3\r\nBattery	3-Cell Li-ion Battery, 41WHr\r\nColor	Natural Silver\r\nDimensions	359.8 x 236 x 18.6 mm.\r\nWeight	1.60 kg\r\nWarranty	2 Years', 15000, 0, 2, '2025-01-20 07:58:55'),
(10, 2, '1737360098_ACER NITRO V 15 ANV15-41-R1R0.jpg', 'ACER NITRO V 15 ANV15-41-R1R0', 'Brands	ACER\r\nModel	NITRO V 15 ANV15-41-R1R0\r\nProcessors	AMD Ryzen™ 5 7535HS Processor\r\nProcessor Speed	3.3 GHz Up to 4.55 GHz, 6C/12T,16 MB L3 Cache\r\nVideo Graphics	NVIDIA® GeForce RTX™ 2050 Laptop GPU 4GB GDDR6\r\nScreen Size	15.6\"\r\nDisplay	FHD (1920 x 1080) IPS 165Hz,sRGB 100%,high-brightness (300 nits)\r\nMemory	16GB DDR5\r\nStorage	512GB PCIe® NVMe™ M.2 SSD\r\nOperating System	Windows 11 Home\r\nCamera	Acer Webcam\r\nOptical Drive	No\r\nConnection port	\r\n3 x USB 3.2 Gen 1 ports\r\n1 x LAN port\r\n1 x Headphone / microphone combo jack (3.5mm)\r\n1 x USB 3.2 Type-C\r\n1 x DC-in\r\n1 x HDMI™ 2.1 ports\r\nWi-Fi/ Bluetooth	Wi-Fi 6 (802.11ax)+Bluetooth 5.1\r\nBattery	4-Cell Li-ion Battery, 57WHr\r\nColor	Obsidian Black\r\nDimensions	363 x 242 x 23 mm.\r\nWeight	2.10 kg\r\nWarranty	3 Years', 21000, 0, 22, '2025-01-20 08:01:38'),
(11, 3, '1737375113_CPU (ซีพียู) AMD AM5 RYZEN 9 9950X.jpg', 'CPU (ซีพียู) AMD AM5 RYZEN 9 9950X', 'Brand	AMD\r\nSeries	AMD Ryzen 9000 Series\r\nProcessor Number	Ryzen™ 9 9950X\r\nSocket Type	AM5\r\nCores/Threads	16 Core / 32 Threads\r\nBase Frequency	4.3 GHz\r\nMax Turbo Frequency	5.7 GHz\r\nL2 Cache	16 MB\r\nL3 Cache	64 MB\r\nGraphics Models	AMD Radeon™ Graphics\r\nCPU Cooler	N/A\r\nWarranty	3 Years', 24000, 0, 6, '2025-01-20 12:11:53'),
(12, 3, '1737375918_CPU (ซีพียู) INTEL 1851 CORE ULTRA 7 265K.jpg', 'CPU (ซีพียู) INTEL 1851 CORE ULTRA 7 265K', 'Brand	INTEL\r\nSeries	Intel® Core™ Ultra Processors (Series 2)\r\nProcessor Number	Core™ ultra 7-265K\r\nSocket Type	LGA 1851\r\nCores/Threads	20 Core / 20 Threads\r\nBase Frequency	3.9 GHz\r\nMax Turbo Frequency	5.5 GHz\r\nL2 Cache	36 MB\r\nL3 Cache	30 MB Intel Smart Cache\r\nCPU Cooler	No\r\nMaximum Turbo Power	125 Watt\r\nWarranty	3 Years', 14000, 0, 0, '2025-01-20 12:25:18'),
(13, 3, '1737376216_CPU (ซีพียู) INTEL 1700 CORE I7-14700K.jpg', 'CPU (ซีพียู) INTEL 1700 CORE I7-14700K', 'Brand	INTEL\r\nSeries	Intel® Core™ (14th gen)\r\nProcessor Number	Core™ i7-14700K\r\nSocket Type	LGA 1700\r\nCores/Threads	20 (8P+12E) Cores / 28 Threads\r\nBase Frequency	3.4 GHz\r\nMax Turbo Frequency	5.4 GHz\r\nL2 Cache	28 MB\r\nL3 Cache	33 MB\r\nGraphics Models	Intel® UHD Graphics 770\r\n64Bit Support	Yes\r\nCPU Cooler	Yes\r\nMaximum Turbo Power	253 Watt\r\nWarranty	3 Years', 13000, 0, 0, '2025-01-20 12:30:16'),
(14, 3, '1737376310_CPU (ซีพียู) AMD AM5 RYZEN 7 9700X.jpg', 'CPU (ซีพียู) AMD AM5 RYZEN 7 9700X', 'Brand	AMD\r\nSeries	AMD Ryzen 9000 Series\r\nProcessor Number	Ryzen™ 7 9700X\r\nSocket Type	AM5\r\nCores/Threads	8 Cores / 16 Threads\r\nBase Frequency	3.8 GHz\r\nMax Turbo Frequency	5.5 GHz\r\nL2 Cache	8 MB\r\nL3 Cache	32 MB\r\nGraphics Models	AMD Radeon™ Graphics\r\nCPU Cooler	No\r\nWarranty	3 Years', 12000, 0, 2, '2025-01-20 12:31:50'),
(15, 3, '1737376409_CPU (ซีพียู) AMD AM5 RYZEN 7 8700G.jpg', 'CPU (ซีพียู) AMD AM5 RYZEN 7 8700G', 'Brand	AMD\r\nSeries	AMD Ryzen 8000 Series\r\nProcessor Number	Ryzen™ 7 8700G\r\nSocket Type	AM5\r\nCores/Threads	8 Cores / 16 Threads\r\nBase Frequency	4.2 GHz\r\nMax Turbo Frequency	5.1 GHz\r\nL2 Cache	8 MB\r\nL3 Cache	16 MB\r\nGraphics Models	AMD Radeon™ 780M\r\n64Bit Support	N/A\r\nCPU Cooler	Yes\r\nMaximum Turbo Power	65 Watt\r\nWarranty	3 Years', 11000, 0, 4, '2025-01-20 12:33:29'),
(16, 3, '1737376485_CPU (ซีพียู) INTEL 1851 CORE ULTRA 5 225F.jpg', 'CPU (ซีพียู) INTEL 1851 CORE ULTRA 5 225F', 'Brand	INTEL\r\nSeries	Intel® Core™ Ultra Processors (Series 2)\r\nProcessor Number	Core™ ultra 5-255F\r\nSocket Type	LGA 1851\r\nCores/Threads	10 (6P+4E) Cores / 10 Threads\r\nBase Frequency	3.3 GHz\r\nMax Turbo Frequency	4.9 GHz\r\nL2 Cache	22 MB\r\nL3 Cache	20 MB Intel® Smart Cache\r\nGraphics Models	Intel® Ultra 5\r\nCPU Cooler	N/A\r\nMaximum Turbo Power	121 W\r\nWarranty	3 Years', 9000, 0, 0, '2025-01-20 12:34:45'),
(17, 3, '1737376609_CPU (ซีพียู) AMD AM4 RYZEN 5 5500GT.jpg', 'CPU (ซีพียู) AMD AM4 RYZEN 5 5500GT', 'Brand	AMD\r\nSeries	AMD Ryzen 5000 Series\r\nProcessor Number	Ryzen™ 5 5500GT\r\nSocket Type	AM4\r\nCores/Threads	6 Cores / 12 Threads\r\nBase Frequency	3.6 GHz\r\nMax Turbo Frequency	4.4 GHz\r\nL2 Cache	3 MB\r\nL3 Cache	16 MB\r\nGraphics Models	AMD Radeon™ Graphics\r\n64Bit Support	N/A\r\nCPU Cooler	Yes\r\nMaximum Turbo Power	65 Watt\r\nWarranty	3 Years', 4000, 0, 4, '2025-01-20 12:36:49'),
(18, 4, '1737376769_MAINBOARD (เมนบอร์ด)(1851) MSI MEG.jpg', 'MAINBOARD (เมนบอร์ด)(1851) MSI MEG', 'Brands	MSI\r\nCPU Support	Intel® Core™ Ultra Processors (Series 2)\r\nCPU Socket	LGA 1851\r\nChipset	Intel® Z890\r\nMemory Slots	4 x DIMM\r\nMemory Type	DDR5\r\nMax Memory	256GB\r\nOnboard Graphics	Requires a CPU With Integrated Graphics.\r\nOnboard Audio Chipset	Realtek ALC4082 Codec + ESS ES9280AQ Combo DAC/HPA\r\nAudio Channels	7.1-Channel USB High Performance Audio\r\nExpansion Slots	\r\n1 x PCIe 4.0 x16 Slot\r\n2 x PCIe 5.0 x16 Slots\r\nStorage	\r\n4 x SATA3 6Gb/s port(s)\r\n5 x M.2 Socket\r\nRear Panel I/O	\r\n1 x LAN port\r\n1 x Wi-Fi/Bluetooth\r\n1 x Clear CMOS button\r\n1 x Optical S/PDIF out\r\n1 x Flash BIOS button\r\n1 x Smart button\r\n1 x HDMI™ 2.1 ports\r\n2 x USB 10Gbps Type-C\r\n2 x Gold-plated audio jacks\r\n10 x USB 10Gbps Type-A\r\n2 x Thunderbolt 4 (USB Type-C)\r\nLAN Chipset	Marvell AQC113CS-B1-C 10Gbps LAN\r\nLAN Speed	100/1000/2500/5000/10000 Mbps\r\nDimensions	30.5 cm x 24.4 cm\r\nPower Pin	24+8+8+6 Pin\r\nForm Factor	ATX\r\nWarranty	3 Years', 26000, 0, 10, '2025-01-20 12:39:29'),
(19, 4, '1737377083_MAINBOARD (เมนบอร์ด)(1851) GIGABYTE.jpg', 'MAINBOARD (เมนบอร์ด)(1851) GIGABYTE', 'Brands	GIGABYTE\r\nCPU Support	Intel® Core™ Ultra Processors (Series 2)\r\nCPU Socket	LGA 1851\r\nChipset	Intel® Z890\r\nMemory Slots	4 x DIMM\r\nMemory Type	DDR5\r\nMax Memory	256GB\r\nOnboard Graphics	Requires a CPU With Integrated Graphics.\r\nOnboard Audio Chipset	Realtek ALC1220 Audio Codec\r\nAudio Channels	2/4/5.1-channel\r\nExpansion Slots	\r\n1 x PCIe 4.0 x16 Slot\r\n1 x PCIe 3.0 x16 Slot\r\n1 x PCIe 5.0 x16 Slot\r\nStorage	\r\n4 x SATA3 6Gb/s port(s)\r\n5 x M.2 Socket\r\nRear Panel I/O	\r\n2 x USB 2.0 ports\r\n2 x antenna connectors (2T2R)\r\n2 x Audio jacks\r\n1 x Clear CMOS button\r\n1 x Q-Flash Plus button\r\n1 x Optical S/PDIF out\r\n1 x RJ-45 port\r\n6 x USB 3.2 Gen 2 Type-A ports\r\n4 x USB 3.2 Gen 1 Type-A ports\r\n2 x Thunderbolt 4 (USB Type-C)\r\nLAN Chipset	Marvell AQtion AQC113C 10GbE\r\nLAN Speed	100/1000/2500/5000/10000 Mbps\r\nDimensions	30.5 cm x 24.4 cm\r\nPower Pin	24+8+8 Pin\r\nForm Factor	ATX\r\nWarranty	3 Years', 21000, 0, 4, '2025-01-20 12:44:43'),
(20, 4, '1737377255_MAINBOARD (เมนบอร์ด)(1851) ASUS ROG.jpg', 'MAINBOARD (เมนบอร์ด)(1851) ASUS ROG', 'Brands	ASUS\r\nCPU Support	Intel® Core™ Ultra Processors (Series 2)\r\nCPU Socket	LGA 1851\r\nChipset	Intel® Z890\r\nMemory Slots	4 x DIMM\r\nMemory Type	DDR5\r\nMax Memory	192GB\r\nOnboard Graphics	Requires a CPU With Integrated Graphics.\r\nOnboard Audio Chipset	ROG SupremeFX ALC4080\r\nAudio Channels	7.1 Surround Sound High Definition Audio\r\nExpansion Slots	\r\n1 x PCIe 4.0 x16 Slot\r\n1 x PCIe 5.0 x16 Slot\r\nStorage	\r\n4 x SATA3 6Gb/s port(s)\r\n7 x M.2 Socket\r\nRear Panel I/O	\r\n1 x DisplayPort\r\n1 x HDMI™ port\r\n1 x Clear CMOS button\r\n1 x Optical S/PDIF out\r\n1 x BIOS FlashBack button\r\n1 x Wi-Fi Module\r\n1 x Realtek 5Gb Ethernet port\r\n2 x USB 10Gbps Type-C\r\n3 x USB 5Gbps Type-A\r\n7 x USB 10Gbps Type-A\r\n2 x Gold-plated audio jacks\r\n2 x Thunderbolt 4 (USB Type-C)\r\nLAN Chipset	Realtek 5Gb Ethernet\r\nLAN Speed	100/1000/2500/5000 Mbps\r\nDimensions	30.5 cm x 24.4 cm\r\nPower Pin	24+8+8 Pin\r\nForm Factor	ATX\r\nWarranty	3 Years', 20000, 0, 4, '2025-01-20 12:47:35'),
(21, 4, '1737377409_MAINBOARD (เมนบอร์ด)(AM5) ASUS TUF.jpg', 'MAINBOARD (เมนบอร์ด)(AM5) ASUS TUF', 'Brands	ASUS\r\nCPU Support	\r\nAMD Ryzen 9000 Series\r\nAMD Ryzen 8000 Series\r\nAMD Ryzen 7000 Series\r\nCPU Socket	AM5\r\nChipset	AMD A620\r\nMemory Slots	4 x DIMM\r\nMemory Type	DDR5\r\nMax Memory	192GB\r\nOnboard Graphics	Requires a CPU With Integrated Graphics.\r\nOnboard Audio Chipset	Realtek Audio CODEC\r\nAudio Channels	7.1 Surround Sound High Definition Audio\r\nExpansion Slots	\r\n1 x PCIe 4.0 x16 Slot\r\n2 x PCIe 3.0 x16 Slots\r\nStorage	\r\n4 x SATA3 6Gb/s port(s)\r\n2 x M.2 Socket\r\nRear Panel I/O	\r\n2 x DisplayPorts\r\n1 x HDMI™ port\r\n4 x USB 2.0 ports\r\n3 x Audio jacks\r\n1 x BIOS FlashBack button\r\n1 x Wi-Fi Module\r\n1 x PS/2 Keyboard/Mouse combo port\r\n1 x Realtek 2.5Gb Ethernet port\r\n2 x USB 3.2 Gen 1 5Gbps Type-A\r\nLAN Chipset	Realtek 2.5Gb Ethernet\r\nLAN Speed	100/1000/2500 Mbps\r\nDimensions	24.4 cm x 24.4 cm\r\nPower Pin	24+8 Pin\r\nForm Factor	Micro-ATX\r\nWarranty	3 Years', 3500, 0, 2, '2025-01-20 12:50:09'),
(22, 4, '1737377540_MAINBOARD (เมนบอร์ด)(AM4) MSI A520M-A-PRO.jpg', 'MAINBOARD (เมนบอร์ด)(AM4) MSI A520M-A-PRO', 'Brands	MSI\r\nCPU Support	\r\nAMD Ryzen 3000 G-Series\r\nAMD Ryzen 3000 Series\r\nAMD Ryzen 4000 Series\r\nAMD Ryzen 5000 G-Series\r\nAMD Ryzen 5000 Series\r\nCPU Socket	AM4\r\nChipset	AMD A520\r\nMemory Slots	2 x DIMM\r\nMemory Type	DDR4\r\nMax Memory	64GB\r\nOnboard Graphics	Integrated Graphic on Processor\r\nOnboard Audio Chipset	Realtek ALC892/ALC897 Codec\r\nAudio Channels	7.1-Channel High Definition Audio\r\nExpansion Slots	\r\n1 x PCIe 3.0 x16 Slot\r\n1 x PCIe 3.0 x1 Slot\r\nStorage	\r\n4 x SATA3 6Gb/s port(s)\r\n1 x M.2 Socket\r\nRear Panel I/O	\r\n1 x PS/2 Keyboard/Mouse port\r\n1 x HDMI™ port\r\n4 x USB 3.2 Gen 1 ports\r\n2 x USB 2.0 ports\r\n1 x LAN port\r\n3 x Audio jacks\r\n1 x DVI-D port\r\nLAN Chipset	Realtek RTL8111H\r\nLAN Speed	10/100/1000 Mbps\r\nDimensions	23.6 cm x 20.0 cm\r\nPower Pin	24+4 Pin\r\nForm Factor	Micro-ATX\r\nWarranty	3 Years', 1600, 0, 2, '2025-01-20 12:52:20'),
(23, 4, '1737377699_MAINBOARD (เมนบอร์ด)(1700) GIGABYTE.jpg', 'MAINBOARD (เมนบอร์ด)(1700) GIGABYTE', 'Brands	GIGABYTE\r\nCPU Series.	\r\n12th Gen Intel® Core™\r\n13th Gen Intel® Core™\r\n14th Gen Intel® Core™\r\nCPU Socket	LGA 1700\r\nChipset	Intel® H610\r\nMemory Slots	2 x DIMM\r\nMemory Type	DDR4\r\nMax Memory	64 GB\r\nOnboard Graphics	Requires a CPU With Integrated Graphics.\r\nOnboard Audio Chipset	Realtek Audio CODEC\r\nAudio Channels	2/4/5.1/7.1-channel\r\nExpansion Slots	\r\n1 x PCIe 4.0 x16 Slot\r\n1 x PCIe 3.0 x1 Slot\r\nStorage	\r\n2 x SATA3 6Gb/s port(s)\r\n1 x M.2 Socket\r\nRear Panel I/O	\r\n2 x USB 3.2 Gen 1 ports\r\n4 x USB 2.0 ports\r\nLAN Chipset	Realtek 1Gb Ethernet\r\nLAN Speed	10/100/1000 Mbps\r\nDimensions	22.6 cm x 18.8 cm\r\nPower Pin	24+8 Pin\r\nForm Factor	Micro-ATX\r\nWarranty	3 Years', 2000, 0, 0, '2025-01-20 12:54:59'),
(24, 4, '1737377822_MAINBOARD (เมนบอร์ด) (1700) ASROCK.png', 'MAINBOARD (เมนบอร์ด) (1700) ASROCK', 'Brands	ASROCK\r\nCPU Support	\r\nIntel® Core™ (14th gen)\r\n13th Gen Intel® Core™\r\n12th Gen Intel® Core™\r\nCPU Socket	LGA 1700\r\nChipset	Intel® H610\r\nMemory Slots	2 x DIMM\r\nMemory Type	DDR4\r\nMax Memory	64GB\r\nOnboard Graphics	Integrated Graphics Processor (Depends on CPU)\r\nOnboard Audio Chipset	Realtek ALC897/887\r\nAudio Channels	7.1 CH HD Audio\r\nExpansion Slots	\r\n1 x PCIe 4.0 x16 Slot\r\n1 x PCIe 3.0 x1 Slot\r\nStorage	\r\n4 x SATA3 6Gb/s port(s)\r\n1 x M.2 Socket\r\nRear Panel I/O	\r\n1 x PS/2 Keyboard/Mouse port\r\n1 x HDMI™ port\r\n2 x USB 3.2 Gen 1 ports\r\n4 x USB 2.0 ports\r\n1 x LAN port\r\n1 x D-Sub port\r\n3 x Audio jacks\r\nLAN Chipset	Realtek RTL8111H\r\nLAN Speed	10/100/1000 Mbps\r\nDimensions	22.3 x 18.8 cm\r\nPower Pin	24+8 Pin\r\nForm Factor	Micro-ATX\r\nWarranty	3 Years', 2000, 0, 2, '2025-01-20 12:57:02'),
(25, 5, '1737378004_VGA(การ์ดจอ) MSI GEFORCE RTX 4080.png', 'VGA(การ์ดจอ) MSI GEFORCE RTX 4080', 'Brands	MSI\r\nGPU Series	NVIDIA GeForce RTX™ 40 Series\r\nGPU Model	GeForce RTX™ 4080 SUPER\r\nMemory Size	16GB GDDR6X\r\nBus Standard	PCI Express 4.0\r\nCUDA® Cores	10240\r\nMemory Interface	256-bit\r\nBoost Clock	2625 MHz\r\nInterface	PCI Express 4.0\r\nBase Clock	2295 MHz\r\nMemory Clock	23.0 Gbps\r\nMax Digital Resolution	7680 x 4320\r\nHDMI Port	1 x HDMI 2.1a\r\nDisplay Port	3x DisplayPort™ 1.4a\r\nCooler Fan	1 Fan\r\nPower Connector	1 x 16-pin\r\nPower Requirement	850 Watt\r\nDimension (W x H x D)	312 x 141 x 61 mm\r\nWarranty	3 Years', 42000, 0, 10, '2025-01-20 13:00:04'),
(26, 5, '1737378228_VGA(การ์ดจอ) ASUS TUF GAMING GEFORCE RTX 4070 TI.jpg', 'VGA(การ์ดจอ) ASUS TUF GAMING GEFORCE RTX 4070 TI', 'Brands	ASUS\r\nGPU Series	NVIDIA GeForce RTX™ 40 Series\r\nGPU Model	GeForce RTX™ 4070 Ti SUPER\r\nMemory Size	16GB GDDR6X\r\nBus Standards	PCI Express 4.0\r\nOpenGL	OpenGL® 4.6\r\nCUDA® Cores	8448\r\nMemory Interface	256-bit\r\nBoost Clock	2640 MHz\r\nBase Clock	1980 MHz\r\nMemory Clock	21.0 Gbps\r\nMax Digital Resolution	7680 x 4320\r\nHDMI Port	2 x HDMI 2.1a\r\nDisplay Port	3x DisplayPort™ 1.4a\r\nPower Connector	1 x 16-pin\r\nPower Requirement	750 Watt\r\nDimension (W x H x D)	325.9 x 140.2 x 62.8 mm.\r\nWarranty	3 Years', 36000, 0, 2, '2025-01-20 13:03:48'),
(27, 5, '1737378347_VGA(การ์ดจอ) ZOTAC GEFORCE RTX 4070 TI.jpg', 'VGA(การ์ดจอ) ZOTAC GEFORCE RTX 4070 TI', 'Brands	ZOTAC\r\nGPU Series	NVIDIA GeForce RTX™ 40 Series\r\nGPU Model	GeForce RTX™ 4070 Ti SUPER\r\nMemory Size	16GB GDDR6X\r\nBus Standards	PCI Express 4.0 x16\r\nOpenGL	OpenGL® 4.6\r\nCUDA® Cores	8448\r\nMemory Interface	256-bit\r\nBoost Clock	2610 MHz\r\nBase Clock	2310 MHz\r\nMemory Clock	21.0 Gbps\r\nMax Digital Resolution	7680 x 4320\r\nHDMI Port	1 x HDMI\r\nDisplay Port	3x DisplayPort™ 1.4a\r\nPower Connector	3x 8-pin-to-12VHPWR cable\r\nPower Requirement	700 Watt\r\nDimension (W x H x D)	336.5 x 136 x 74.8 mm\r\nWarranty	3 Years', 31000, 0, 2, '2025-01-20 13:05:47'),
(28, 5, '1737378455_VGA(การ์ดจอ) INNO3D GEFORCE RTX 4060.jpg', 'VGA(การ์ดจอ) INNO3D GEFORCE RTX 4060', 'Brands	INNO3D\r\nGPU Series	NVIDIA GeForce RTX™ 40 Series\r\nGPU Model	GeForce RTX™ 4060 Ti\r\nMemory Size	8GB GDDR6\r\nBus Standard	PCI Express 4.0 x16\r\nCUDA® Cores	4352\r\nMemory Interface	128-bit\r\nBoost Clock	2535 MHz\r\nBase Clock	2310 MHz\r\nMemory Clock	18.0 Gbps\r\nMax Digital Resolution	7680 x 4320\r\nHDMI Port	1 x HDMI 2.1a\r\nDisplay Port	3x DisplayPort™ 1.4a\r\nCooler Fan	2 Fans\r\nPower Connector	2 x 8-pin\r\nPower Requirement	550 Watt\r\nDimension (W x H x D)	250 x 118 x 42 mm\r\nWarranty	3 Years', 13500, 0, 4, '2025-01-20 13:07:35'),
(29, 5, '1737378601_VGA(การ์ดจอ) POWERCOLOR FIGHTER RADEON RX 6500 XT.jpg', 'VGA(การ์ดจอ) POWERCOLOR FIGHTER RADEON RX 6500 XT', 'Brands	POWER COLOR\r\nGPU Series	AMD Radeon™ RX 6000 Series\r\nGPU Model	Radeon™ RX 6500 XT\r\nMemory Size	4GB GDDR6\r\nBus Standard	PCI Express 4.0 x4\r\nCUDA® Cores	N/A\r\nMemory Interface	64-bit\r\nBoost Clock	2820 MHz\r\nBase Clock	2820 MHz\r\nMemory Clock	18.0 Gbps\r\nMax Digital Resolution	7680 x 4320\r\nHDMI Port	1 x HDMI 2.1\r\nDisplay Port	1x DisplayPort™ 1.4\r\nCooler Fan	2 Fans\r\nPower Connector	1 x 6-pin\r\nPower Requirement	500 Watt\r\nDimension (W x H x D)	191 x 126 x 40 mm\r\nWarranty	3 Years', 4500, 0, 2, '2025-01-20 13:10:01'),
(30, 5, '1737378710_VGA(การ์ดจอ) PALIT GEFORCE RTX 3050.jpg', 'VGA(การ์ดจอ) PALIT GEFORCE RTX 3050', 'Brands	PALIT\r\nGPU Series	NVIDIA GeForce RTX™ 30 Series\r\nGPU Model	GeForce RTX™ 3050\r\nMemory Size	6GB GDDR6\r\nBus Standard	PCI Express 4.0\r\nCUDA® Cores	2304\r\nMemory Interface	96-bit\r\nBoost Clock	1470 MHz\r\nBase Clock	1042 MHz\r\nMemory Clock	14.0 Gbps\r\nHDMI Port	1 x HDMI 2.1\r\nDisplay Port	1x DisplayPort™ 1.4\r\nCooler Fan	1 Fan\r\nPower Connector	N/A\r\nPower Requirement	300 Watt\r\nDimension (W x H x D)	162 x 117 x 40 mm\r\nWarranty	3 Years', 5700, 0, 2, '2025-01-20 13:11:50'),
(31, 5, '1737378834_VGA(การ์ดจอ) PNY GEFORCE RTX 4060.png', 'VGA(การ์ดจอ) PNY GEFORCE RTX 4060', 'Brands	PNY\r\nGPU Series	NVIDIA GeForce RTX™ 40 Series\r\nGPU Model	GeForce RTX™ 4060\r\nMemory Size	8GB GDDR6\r\nBus Standard	PCI Express 4.0\r\nCUDA® Cores	3072\r\nMemory Interface	128-bit\r\nBoost Clock	2460 MHz\r\nBase Clock	1830 MHz\r\nMemory Clock	17.0 Gbps\r\nMax Digital Resolution	7680 x 4320\r\nHDMI Port	1 x HDMI 2.1\r\nDisplay Port	3x DisplayPort™ 1.4a\r\nCooler Fan	2 Fans\r\nPower Connector	1 x 8-pin\r\nPower Requirement	550 Watt\r\nDimension (W x H x D)	210 x 115 x 25.4 mm\r\nWarranty	3 Years', 9600, 0, 4, '2025-01-20 13:13:54'),
(32, 6, '1737444670_CORSAIR DOMINATOR TITANIUM RGB 32GB.png', 'RAM (แรม) CORSAIR DOMINATOR TITANIUM RGB 32GB (16x2) DDR5', 'Brand	CORSAIR\r\nMemory Series	DOMINATOR TITANIUM RGB\r\nMemory Capacity	32GB (16GBx2)\r\nMemory Type	DDR5\r\nCas Latency	CL32\r\nTested Latency	40-40-40-77\r\nSPD Voltage	1.1 V\r\nMemory Color	BLACK\r\nWarranty	Lifetime', 7000, 0, 4, '2025-01-21 07:31:10'),
(34, 6, '1737445291_RAM (แรม) GeIL EVO V RGB 32GB (16x2) DDR5.jpg', 'RAM (แรม) GeIL EVO V RGB 32GB (16x2) DDR5', 'Brand	GEIL\r\nMemory Series	EVO V RGB\r\nMemory Capacity	32GB (16GBx2)\r\nSpeed	6400MHz\r\nMemory Type	DDR5\r\nCas Latency	CL38\r\nTested Latency	38-44-44-84\r\nSPD Voltage	1.35 V\r\nMemory Color	GRAY\r\nWarranty	Lifetime', 5700, 0, 2, '2025-01-21 07:41:31'),
(35, 6, '1737445437_RAM (แรม) PREDATOR HERMES RGB 32GB (16x2) DDR5.jpg', 'RAM (แรม) PREDATOR HERMES RGB 32GB (16x2) DDR5', 'Brand	PREDATOR\r\nMemory Series	HERMES RGB\r\nMemory Capacity	32GB (16GBx2)\r\nSpeed	6400MHz\r\nMemory Type	DDR5\r\nCas Latency	CL32\r\nTested Latency	32-39-39-102\r\nSPD Voltage	1.4 V\r\nMemory Color	WHITE\r\nWarranty	Lifetime', 4899, 0, 2, '2025-01-21 07:43:57'),
(36, 6, '1737445558_RAM (แรม) PREDATOR VESTA II RGB 32GB (16x2) DDR5.jpg', 'RAM (แรม) PREDATOR VESTA II RGB 32GB (16x2) DDR5 ', 'Brand	PREDATOR\r\nMemory Series	VESTA II RGB\r\nMemory Capacity	32GB (16GBx2)\r\nSpeed	6000MHz\r\nMemory Type	DDR5\r\nCas Latency	CL32\r\nTested Latency	32-38-38-76\r\nSPD Voltage	1.35 V\r\nMemory Color	SILVER\r\nWarranty	Lifetime', 3990, 0, 2, '2025-01-21 07:45:58'),
(37, 6, '1737445785_RAM (แรม) GeIL ORION PHANTOM GAMING 16GB (8x2) DDR4.jpg', 'RAM (แรม) GeIL ORION PHANTOM GAMING 16GB (8x2) DDR4', 'Brand	GEIL\r\nMemory Series	ORION\r\nMemory Capacity	16GB (2x 8GB)\r\nSpeed	3200MHz\r\nMemory Type	DDR4\r\nCas Latency	CL16', 1100, 0, 2, '2025-01-21 07:49:45'),
(38, 6, '1737446022_RAM (แรม) LEXAR THOR OC 16GB (8x2) DDR5.jpg', 'RAM (แรม) LEXAR THOR OC 16GB (8x2) DDR5', 'Brand	LEXAR\r\nMemory Series	THOR\r\nMemory Capacity	16GB (8GBx2)\r\nSpeed	6000MHz\r\nMemory Type	DDR5\r\nCas Latency	CL38\r\nTested Latency	38-48-48-96\r\nSPD Voltage	1.35 V\r\nMemory Color	BLACK\r\nWarranty	Lifetime', 2200, 0, 0, '2025-01-21 07:53:42'),
(39, 6, '1737446145_RAM (แรม) LEXAR ARES RGB KIT 32GB (16x2) DDR5.jpg', 'RAM (แรม) LEXAR ARES RGB KIT 32GB (16x2) DDR5 ', 'Brand	LEXAR\r\nMemory Series	ARES RGB\r\nMemory Capacity	32GB (16GBx2)\r\nSpeed	6400MHz\r\nMemory Type	DDR5\r\nCas Latency	CL32\r\nTested Latency	32-38-38-76\r\nSPD Voltage	1.20 V\r\nMemory Color	BLACK\r\nWarranty	Lifetime', 4100, 0, 2, '2025-01-21 07:55:45'),
(40, 7, '1737446444_M.2 (เอสเอสดี) WD BLACK SN770 2TB PCIeNVMe GEN4.png', 'M.2 (เอสเอสดี) WD BLACK SN770 2TB PCIe/NVMe GEN4', 'Brand	WD\r\nForm Factor	M.2 2280\r\nCapacity	2TB\r\nInterface	PCI Express 4.0\r\nRead Speed	5,150 MB/s\r\nWrite Speed	4,850 MB/s\r\nWarranty	5 Years', 5200, 0, 0, '2025-01-21 08:00:44'),
(41, 7, '1737446575_M.2 (เอสเอสดี) KINGSTON NV3 2TB PCIe 4NVMe.jpg', 'M.2 (เอสเอสดี) KINGSTON NV3 2TB PCIe 4/NVMe M.2 2280', 'Brand	KINGSTON\r\nForm Factor	M.2 2280\r\nCapacity	2TB\r\nInterface	PCI Express 4.0\r\nRead Speed	6,000 MB/s\r\nWrite Speed	5,000 MB/s\r\nWarranty	3 Years', 4600, 0, 2, '2025-01-21 08:02:55'),
(42, 7, '1737446706_M.2 (เอสเอสดี) MSI SPATIUM M480 PRO 1TB PCIeNVMe GEN4.jpg', 'M.2 (เอสเอสดี) MSI SPATIUM M480 PRO 1TB PCIeNVMe GEN4', 'Form Factor	M.2 2280\r\nCapacity	1TB\r\nInterface	PCI Express 4.0\r\nRead Speed	7,400 MB/s\r\nWrite Speed	6,000 MB/s\r\nWarranty	5 Years', 27900, 0, 2, '2025-01-21 08:05:06'),
(43, 7, '1737446866_SSD (เอสเอสดี) HIKSEMI CITY E100 512GB.jpg', 'SSD (เอสเอสดี) HIKSEMI CITY E100 512GB', 'Brand	HIKSEMI\r\nForm Factor	2.5-Inch\r\nCapacity	512GB\r\nInterface	SATA\r\nRead Speed	550 MB/s\r\nWrite Speed	520 MB/s\r\nWarranty	3 Years', 990, 0, 0, '2025-01-21 08:07:46'),
(44, 7, '1737447021_SSD (เอสเอสดี) APACER AS350X 1TB.jpg', 'SSD (เอสเอสดี) APACER AS350X 1TB', 'Brand	APACER\r\nForm Factor	2.5-Inch\r\nCapacity	1TB\r\nInterface	SATA\r\nRead Speed	560 MB/s\r\nWrite Speed	540 MB/s\r\nWarranty	3 Years', 2100, 0, 2, '2025-01-21 08:10:21'),
(45, 7, '1737447141_M.2 (เอสเอสดี) LEXAR x iHAVECPU NM620 256GB PCIeNVMe GEN3x4.png', 'M.2 (เอสเอสดี) LEXAR x iHAVECPU NM620 256GB PCIeNVMe GEN3x4', 'Form Factor	M.2 2280\r\nCapacity	256GB\r\nInterface	PCI Express 3.0\r\nRead Speed	3,500 MB/s\r\nWrite Speed	1,300 MB/s\r\nWarranty	5 Years', 770, 0, 2, '2025-01-21 08:12:21'),
(46, 7, '1737447313_M.2 (เอสเอสดี) WD BLUE SN580 250GB PCIeNVMe.jpg', 'M.2 (เอสเอสดี) WD BLUE SN580 250GB PCIeNVMe', 'Brand	WD\r\nForm Factor	M.2 2280\r\nCapacity	250GB\r\nInterface	PCI Express 4.0\r\nRead Speed	4,000 MB/s\r\nWrite Speed	2,000 MB/s\r\nWarranty	5 Years', 880, 0, 2, '2025-01-21 08:15:13'),
(47, 8, '1737448123_PSU (อุปกรณ์จ่ายไฟ) CORSAIR HX1500I - 1500W.jpg', 'PSU (อุปกรณ์จ่ายไฟ) CORSAIR HX1500I - 1500W', 'Brand	CORSAIR\r\nEnergy Efficient	80 PLUS PLATINUM\r\nModular	Fully Modular\r\nContinuous Power W	1500 Watt\r\nPSU Form Factor	ATX\r\nInput Current	10 A\r\nInput Frequency	47-63Hz\r\nMB Connector	1 x 24-pin\r\nCPU Connector	2 x 4+4-pin\r\nPCIe Connector	1 x 12+4-pin\r\nSATA Connector	8\r\nFan Size	140 mm\r\nDimensions W x D x H	200 x 150 x 86 mm\r\nWeight	4.6 Kg.\r\nWarranty	10 Years', 14990, 0, 2, '2025-01-21 08:28:43'),
(48, 8, '1737514936_PSU (อุปกรณ์จ่ายไฟ) ASUS ROG LOKI 1200T SFX-L - 1200W.jpg', 'PSU (อุปกรณ์จ่ายไฟ) ASUS ROG LOKI 1200T SFX-L - 1200W', 'Brand	ASUS\r\nEnergy Efficient	80 PLUS TITANIUM\r\nModular	Fully Modular\r\nContinuous Power W	1200 Watt\r\nForm Factor	SFX-L\r\nInput Voltage	100-240 V\r\nInput Current	20 - 8 A\r\nMB Connector	1 x 24/20-pin\r\nCPU Connector	2 x 4+4-pin\r\nPCIe Connector	\r\n4 x 8-pin\r\n2 x 16-pin\r\nSATA Connector	6\r\nFan Size	120 mm\r\nDimensions	125 × 125 × 63.5 mm\r\nWeight	2.18 Kg.\r\nProtections	OVP/OPP/SCP/UVP/OCP/OTP\r\nWarranty	10 Years', 13000, 0, 2, '2025-01-22 03:02:16'),
(49, 8, '1737515134_PSU (อุปกรณ์จ่ายไฟ) CORSAIR RM850E - 850W.png', 'PSU (อุปกรณ์จ่ายไฟ) CORSAIR RM850E - 850W', 'Brand	CORSAIR\r\nEnergy Efficient	80 PLUS GOLD\r\nModular	Fully Modular\r\nContinuous Power W	850 Watt\r\nPSU Form Factor	ATX\r\nInput Current	10 A\r\nInput Frequency	47-63Hz\r\nMB Connector	1 x 24-pin\r\nCPU Connector	2 x 4+4-pin\r\nPCIe Connector	3 x 6+2-pin\r\nSATA Connector	7\r\nFan Size	120 mm\r\nDimensions W x D x H	140 x 150 x 86 mm\r\nWarranty	7 Years\r\nPower Range	850W', 3899, 0, 2, '2025-01-22 03:05:34'),
(50, 8, '1737515288_(อุปกรณ์จ่ายไฟ) AZZA PSAZ 550W 1.png', '(อุปกรณ์จ่ายไฟ) AZZA PSAZ 550W', 'Brand	AZZA\r\nEnergy Efficient	80 PLUS BRONZE\r\nContinuous Power W	550 Watt\r\nPSU Form Factor	ATX\r\nInput Frequency	47-63Hz\r\nMB Connector	1 x 20+4-pin\r\nCPU Connector	1 x 4+4-Pin\r\nPCIe Connector	2 x 6+2-pin\r\nSATA Connector	5\r\nWarranty	3 Years', 1200, 0, 4, '2025-01-22 03:08:08'),
(51, 8, '1737515445_PSU (อุปกรณ์จ่ายไฟ) AEROCOOL UNITED POWER 600W.jpg', 'PSU (อุปกรณ์จ่ายไฟ) AEROCOOL UNITED POWER 600W', 'Brand	AEROCOOL\r\nEnergy Efficient	80 PLUS WHITE\r\nModular	Non Modular\r\nContinuous Power W	600 Watt\r\nPSU Form Factor	ATX\r\nInput Current	4.5 A\r\nInput Frequency	47-63Hz\r\nMB Connector	1 x 20+4-pin\r\nCPU Connector	2 x 4+4-pin\r\nPCIe Connector	2 x 6+2-pin\r\nSATA Connector	4\r\nFan Size	120 mm\r\nDimensions W x D x H	150 x 140 x 86 mm\r\nWeight	1.28 KG\r\nWarranty	3 Years', 1300, 0, 4, '2025-01-22 03:10:45'),
(52, 8, '1737515646_PSU (อุปกรณ์จ่ายไฟ) CORSAIR CX650 650W.jpg', 'PSU (อุปกรณ์จ่ายไฟ) CORSAIR CX650 650W', 'Brand	CORSAIR\r\nEnergy Efficient	80 PLUS BRONZE\r\nModular	Non Modular\r\nContinuous Power W	650 Watt\r\nForm Factor	ATX\r\nInput Voltage	100-240 V\r\nInput Current	10A-5A\r\nInput Frequency	47-63Hz\r\nMB Connector	1 x 24-pin\r\nCPU Connector	1 x 4+4-Pin\r\nPCIe Connector	1 x 6+2-pin\r\nSATA Connector	3\r\nFan Size	120 mm\r\nDimensions	150 x 125 x 86 mm.\r\nWeight	2.37Kg\r\nWarranty	5 Years', 1600, 0, 2, '2025-01-22 03:14:06'),
(53, 8, '1737515886_PSU (อุปกรณ์จ่ายไฟ) GIGABYTE UD1000GM 1000W.jpg', 'PSU (อุปกรณ์จ่ายไฟ) GIGABYTE UD1000GM 1000W', 'Brand	GIGABYTE\r\nEnergy Efficient	80 PLUS GOLD\r\nModular	Fully Modular\r\nContinuous Power W	1000 Watt\r\nPSU Form Factor	ATX\r\nInput Current	15 A\r\nInput Frequency	50-60Hz\r\nMB Connector	1 x 20+4-pin\r\nCPU Connector	2 x 4+4-pin\r\nPCIe Connector	6 x 6+2-pin\r\nSATA Connector	8\r\nFan Size	120 mm\r\nDimensions W x D x H	150 x 140 x 86 mm\r\nWeight	1.63 Kg\r\nWarranty	10 Years\r\nPower Range	1000W', 5800, 0, 2, '2025-01-22 03:18:06'),
(54, 9, '1737516285_ASUS ROG HYPERION GR701 (WHITE)(E-ATX).jpg', 'ASUS ROG HYPERION GR701 (WHITE)(E-ATX)', 'Model	ROG HYPERION GR701\r\nForm Factor	Full-Tower\r\nMainboard Support	E-ATX\r\nVGA Support	460mm\r\nColor	WHITE\r\nCPU Cooler Support	190mm\r\nPower Supply Support	ATX PSU\r\nFront I/O	USB 3.2 Type-A (x4) , USB 3.2 Type-C(x1) , Speaker/Mic-in Combo (x1) , Power , Reset , LED Control\r\nExpansion Slots	9 Slots , 3 additional vertical\r\nDrive Bays Support	\r\nFan Installment	140mm x4 PWM Fans\r\nFan Support (Front)	120mm x 3 or 140mm x 3\r\nFan Support (Top)	120mm x 3 or 140mm x 3\r\nFan Support (Side)	120mm x 3\r\nFan Support (Rear)	120mm x 1 or 140mm x 1\r\nFan Support (Bottom)	NONE\r\nMAX Radiator Support	420mm\r\nRadiator Support (Front)	240,280,360,420mm\r\nRadiator Support (Top)	240,280,360,420mm\r\nRadiator Support (Side)	120,240,360mm\r\nRadiator Support (Rear)	120,140mm\r\nRadiator Support (Bottom)	NONE\r\nDimensions W x D x H	659 x 268 x 639 mm\r\nAccessories	NONE\r\nWeight	20.8 Kgs\r\nWarranty	2 Years', 16000, 0, 4, '2025-01-22 03:24:45'),
(55, 9, '1737516453_CASE (เคส) HYTE Y70 TOUCH INFINITE (BLACKBLACK)(E-ATX)(3Y).jpg', 'CASE (เคส) HYTE Y70 TOUCH INFINITE ', 'Brand	HYTE\r\nModel	Y70 TOUCH\r\nForm Factor	Mid-Tower\r\nMainboard Support	\r\nE-ATX\r\nATX\r\nITX\r\nMicro-ATX\r\nVGA Support	422mm\r\nColor	BLACK\r\nCPU Cooler Support	180mm\r\nPower Supply Support	ATX PSU\r\nFront I/O	USB 3.2 Type-A (x2) , USB 3.2 Type-C (x1) , Speaker/Mic-in Combo (x1) , Power , Reset\r\nExpansion Slots	7 Slots + 4 Vertical\r\nDrive Bays Support	3.5\" x 2 , 2.5\" x 4\r\nFan Installment	NONE\r\nFan Support (Front)	NONE\r\nFan Support (Top)	120mm x 3 or 140mm x 2\r\nFan Support (Side)	120mm x 3 or 140mm x 2\r\nFan Support (Rear)	120mm x 1 or 140mm x 1\r\nFan Support (Bottom)	120mm x 3 or 140mm x 2\r\nMAX Radiator Support	360mm\r\nRadiator Support (Front)	NONE\r\nRadiator Support (Top)	240,280,360mm\r\nRadiator Support (Side)	240,280,360mm\r\nRadiator Support (Rear)	120,140mm\r\nRadiator Support (Bottom)	NONE\r\nAccessories	NONE\r\nDimensions W x D x H	470 x 320 x 470 mm\r\nWeight	N/A\r\nWarranty	3 Years', 15000, 0, 0, '2025-01-22 03:27:33'),
(56, 9, '1737516600_CASE (เคส) HYTE Y70 TOUCH INFINITE.jpg', 'CASE (เคส) HYTE Y70 TOUCH INFINITE', 'Brand	HYTE\r\nModel	Y70 TOUCH\r\nForm Factor	Mid-Tower\r\nMainboard Support	\r\nE-ATX\r\nATX\r\nITX\r\nMicro-ATX\r\nVGA Support	422mm\r\nColor	WHITE/BLACK\r\nCPU Cooler Support	180mm\r\nPower Supply Support	ATX PSU\r\nFront I/O	USB 3.2 Type-A (x2) , USB 3.2 Type-C (x1) , Speaker/Mic-in Combo (x1) , Power , Reset\r\nExpansion Slots	7 Slots + 4 Vertical\r\nDrive Bays Support	3.5\" x 2 , 2.5\" x 4\r\nFan Installment	NONE\r\nFan Support (Front)	NONE\r\nFan Support (Top)	120mm x 3 or 140mm x 2\r\nFan Support (Side)	120mm x 3 or 140mm x 2\r\nFan Support (Rear)	120mm x 1 or 140mm x 1\r\nFan Support (Bottom)	120mm x 3 or 140mm x 2\r\nMAX Radiator Support	360mm\r\nRadiator Support (Front)	NONE\r\nRadiator Support (Top)	240,280,360mm\r\nRadiator Support (Side)	240,280,360mm\r\nRadiator Support (Rear)	120,140mm\r\nRadiator Support (Bottom)	NONE\r\nAccessories	NONE\r\nDimensions W x D x H	470 x 320 x 470 mm\r\nWeight	N/A\r\nWarranty	3 Years', 15999, 0, 0, '2025-01-22 03:30:00'),
(57, 9, '1737516739_CASE (เคส) SAMA GZS BLACK (ATX).jpg', 'CASE (เคส) SAMA GZS BLACK (ATX)', 'Model	SAMA GZS\r\nForm Factor	Mid-Tower\r\nMainboard Support	\r\nATX\r\nITX\r\nMicro-ATX\r\nVGA Support	330mm\r\nColor	BLACK\r\nCPU Cooler Support	177mm\r\nPower Supply Support	ATX PSU\r\nFront I/O	USB 3.0 Type-A(x1) , USB 2.0 Type-A(x2) , Speaker (x1) , Mic-in (x1) , Power , Reset , LED Control\r\nExpansion Slots	7 Slots\r\nDrive Bays Support	3.5\" x2 , 2.5\" x2\r\nFan Installment	120mm x4 RGB Fans\r\nFan Support (Front)	120mm x 3\r\nFan Support (Top)	120mm x 2 or 140mm x 2\r\nFan Support (Side)	NONE\r\nFan Support (Rear)	120mm x 1\r\nFan Support (Bottom)	NONE\r\nMAX Radiator Support	360mm\r\nRadiator Support (Front)	240,280,360mm\r\nRadiator Support (Top)	240mm\r\nRadiator Support (Side)	NONE\r\nRadiator Support (Rear)	120mm\r\nRadiator Support (Bottom)	NONE\r\nAccessories	NONE\r\nDimensions W x D x H	383 x 215 x 465 mm\r\nWeight	5.7 Kgs\r\nWarranty	1 Year', 1200, 0, 2, '2025-01-22 03:32:19'),
(58, 9, '1737563297_CASE (เคส) iHAVECPU INFINITY MINI.jpg', 'CASE (เคส) iHAVECPU INFINITY MINI', 'Model	INFINITY MINI\r\nForm Factor	Mid-Tower\r\nMainboard Support	\r\nITX\r\nMicro-ATX\r\nVGA Support	330mm\r\nColor	BLACK\r\nCPU Cooler Support	155mm\r\nPower Supply Support	ATX PSU\r\nFront I/O	USB 3.0 Type-A(x1) , USB 2.0 Type-A(x2) , Speaker (x1) , Mic-in (x1) , Power , Reset , LED Control\r\nExpansion Slots	4 Slots\r\nDrive Bays Support	3.5\r\nFan Installment	120mm x3 RGB Fans\r\nFan Support (Front)	NONE\r\nFan Support (Top)	120mm x 2 or 140mm x 2\r\nFan Support (Side)	120mm x 2 or 140mm x 2\r\nFan Support (Rear)	120mm x 1\r\nFan Support (Bottom)	120mm x 2 or 140mm x 2\r\nMAX Radiator Support	280mm\r\nRadiator Support (Front)	NONE\r\nRadiator Support (Top)	240,280mm\r\nRadiator Support (Side)	240,280mm\r\nRadiator Support (Rear)	120mm\r\nRadiator Support (Bottom)	120mm x 2 or 140mm x 2\r\nDimensions W x D x H	336 x 270 x 350 mm\r\nAccessories	NONE\r\nWeight	N/A\r\nWarranty	1 Year', 1230, 0, 2, '2025-01-22 16:28:17'),
(59, 9, '1737564625_CASE (เคส) iHAVECPU IHC 401TG (WHITE)(ATX).jpg', 'CASE (เคส) iHAVECPU IHC 401TG (WHITE)(ATX)', 'Model	401TG\r\nForm Factor	Mid-Tower\r\nMainboard Support	\r\nATX\r\nMicro-ATX\r\nVGA Support	330mm\r\nColor	WHITE\r\nCPU Cooler Support	175mm\r\nPower Supply Support	ATX PSU\r\nFront I/O	\"Power Button*1 Reset Button*1 Microphone*1 HD Audio*1 USB 3.0*1 USB 1.1*2\"\r\nExpansion Slots	7 Slots\r\nDrive Bays Support	3.5\" x 1,2.5\" x 2\r\nFan Installment	3PCS ARGB\r\nFan Support (Front)	120mm x 3 or 140mm x 2\r\nFan Support (Top)	120mm x 2 or 140mm x 2\r\nFan Support (Side)	NONE\r\nFan Support (Rear)	120mm x 1\r\nFan Support (Bottom)	NONE\r\nMAX Radiator Support	NONE\r\nRadiator Support (Front)	up to 360mm / VGA limited 260mm\r\nRadiator Support (Top)	240mm\r\nRadiator Support (Side)	NONE\r\nRadiator Support (Rear)	120mm\r\nRadiator Support (Bottom)	NONE\r\nAccessories	NONE\r\nDimensions W x D x H	335 x 216 x 445 mm\r\nWeight	N/A\r\nWarranty	1 Year', 1400, 0, 0, '2025-01-22 16:50:25'),
(60, 9, '1737564735_CASE (เคส) GIGABYTE C102 GLASS ICE.jpg', 'CASE (เคส) GIGABYTE C102 GLASS ICE', 'Brand	GIGABYTE\r\nModel	C102\r\nForm Factor	Mid-Tower\r\nMainboard Support	Mini-ITX Micro-ATX\r\nVGA Support	410mm\r\nColor	WHITE\r\nCPU Cooler Support	165mm\r\nPower Supply Support	ATX PSU\r\nFront I/O	USB 3.0 x2 Reset Button Audio In & Out (supports HD Audio)\r\nExpansion Slots	5 Slots\r\nDrive Bays Support	3.5\" x1, 2.5\"x2\r\nFan Installment	120mm x2 Fans\r\nFan Support (Front)	120mm x 3 140mm x2\r\nFan Support (Top)	120mm x 3 140mm x2\r\nFan Support (Side)	120mm x 2\r\nFan Support (Rear)	120mm x 1\r\nFan Support (Bottom)	NONE\r\nMAX Radiator Support	360mm\r\nRadiator Support (Front)	360mm\r\nRadiator Support (Top)	360mm\r\nRadiator Support (Side)	240mm\r\nRadiator Support (Rear)	120mm\r\nRadiator Support (Bottom)	NONE\r\nAccessories	NONE\r\nDimensions W x D x H	450 x 210 x 450 mm\r\nWeight	5.79 Kg\r\nWarranty	1 Year', 1200, 0, 0, '2025-01-22 16:52:15'),
(61, 10, '1737596473_LIQUID COOLER (ชุดน้ำปิด) ASUS ROG RYUJIN III 360 ARGB EXTREME.jpg', 'LIQUID COOLER (ชุดน้ำปิด) ASUS ROG RYUJIN III 360 ARGB EXTREME', 'Brands	ASUS\r\nCooler Model	ROG RYUJIN III 360 ARGB\r\nExterior Color	BLACK\r\nCPU Socket	\r\nAM4\r\nAM5\r\nLGA 1200\r\nLGA 1700\r\nLGA 1851\r\nLGA 115x\r\nRadiator Dimensions	399.5 x 120 x 30 mm\r\nRadiator Material	Aluminum\r\nBlock Material	Copper\r\nRadiator Size	360 mm\r\nFan Dimensions	120 x 120 x 25 mm\r\nFan Quantity	3 PCS\r\nFan LED Type	ARGB\r\nFan Speed	0 - 2800 RPM +/- 10%\r\nFan Airflow	89.73 CFM\r\nFan Noise	36dB(A)\r\nFan Connector	PWM/DC\r\nCooler Type	CPU Liquid Cooler\r\nWarranty	6 Years', 14900, 0, 2, '2025-01-23 01:41:13'),
(62, 10, '1737596693_LIQUID COOLER (ชุดน้ำปิด) TRYX PANORAMA AIO 360 ARGB.jpg', 'LIQUID COOLER (ชุดน้ำปิด) TRYX PANORAMA AIO 360 ARGB ', 'Brands	‎TRYX\r\nCooler Model	PANORAMA ARGB 360\r\nExterior Color	BLACK\r\nCPU Socket	\r\nAM4\r\nAM5\r\nLGA 1200\r\nLGA 1700\r\nLGA 1851\r\nLGA 115x\r\nRadiator Dimensions	339.5 x 120 x 30 mm\r\nRadiator Material	Aluminum\r\nBlock Material	Copper\r\nRadiator Size	360 mm\r\nPump Speed	800-2600±400 RPM\r\nFan Dimensions	120 x 120 x 25 mm\r\nFan Quantity	3 PCS\r\nFan LED Type	ARGB\r\nFan Speed	500~1850 RPM±10%\r\nFan Airflow	66.09 CFM\r\nFan Noise	27.86 dBA\r\nFan Connector	4-Pin (PWM)\r\nWeight	1.79 kg.\r\nCooler Type	CPU Liquid Cooler\r\nWarranty	6 Years', 13900, 0, 0, '2025-01-23 01:44:53'),
(63, 10, '1737597025_FAN (พัดลม) COOLER MASTER MASTERFAN MF120 HALO2 3IN1.jpg', 'FAN (พัดลม) COOLER MASTER MASTERFAN MF120 HALO2 3IN1 ', 'Dimension W x D x H	120 x 120 x 25 mm\r\nFan Size	3 x Fans (120mm)\r\nFan Speed	0~2050 RPM±5%\r\nFan Life Expectancy	160,000 Hours\r\nFan Airflow	51.88 CFM\r\nFan Noise	27dB(A)\r\nFan LED Color	ARGB\r\nFan Connector	4-Pin (PWM)\r\nFan Model	MF120 HALO2\r\nFan Type	PWM Fan\r\nWarranty	2 Years', 2000, 0, 2, '2025-01-23 01:50:25'),
(64, 10, '1737597162_LIQUID COOLER (ชุดน้ำปิด) ID-COOLING SL240 WHITE.jpg', 'LIQUID COOLER (ชุดน้ำปิด) ID-COOLING SL240 WHITE', 'Cooler Brand	ID-COOLING\r\nCooler Model	SL240\r\nCPU Socket	\r\nIntel® LGA-1700\r\nIntel® LGA-1200\r\nIntel® LGA-2066\r\nIntel® LGA-2011\r\nIntel® LGA-1151\r\nIntel® LGA-1150\r\nIntel® LGA-1155\r\nIntel® LGA-1156\r\nAMD AM4\r\nAMD AM5\r\nRadiator Dimensions	276 x 120 x 27 cm\r\nPump Dimensions	N/A\r\nPump Speed	2500 RPM±10%\r\nFan Dimensions	120 x 120 x 25 mm\r\nTube Dimension	400 mm\r\nFan LED Type	RGB\r\nFan Speed	500~2000 RPM±10%\r\nFan Airflow	78 CFM\r\nFan Quantity	2 x Fans (120mm)\r\nFan Noise	29.9dB(A)\r\nFan Connector	4-Pin (PWM)\r\nCooler Option	N/A\r\nCooler Type	Liquid Cooler\r\nWarranty	5 Years', 4990, 0, 2, '2025-01-23 01:52:43'),
(65, 10, '1737597440_SILICONE (ซิลิโคน) ARCTIC THERMAL MX-6 2G.jpg', 'SILICONE (ซิลิโคน) ARCTIC THERMAL MX-6 2G', 'Band	ARCTIC\r\nThermal Conductivity	7.5 kV/mm\r\nVolume Resistivity	1.8 X 1012 Ω-cm\r\nCooler Type	N/A\r\nVolume	N/A\r\nThermal Impedance	N/A\r\nSpecific Gravity	2.6\r\nColor	Gray\r\nWarranty	N/A', 290, 0, 2, '2025-01-23 01:57:20'),
(66, 10, '1737597678_SILICONE (ซิลิโคน) ARCTIC THERMAL PAD TP-2 50501MM.jpg', 'SILICONE (ซิลิโคน) ARCTIC THERMAL PAD TP-2 50501MM', 'SILICONE (ซิลิโคน) ARCTIC THERMAL PAD TP-2 50*50*1MM', 300, 0, 0, '2025-01-23 02:01:18'),
(67, 11, '1737597941_MONITOR (จอมอนิเตอร์) BENQ ZOWIE XL2566X+ 24.1 TN FHD.jpg', 'MONITOR (จอมอนิเตอร์) BENQ ZOWIE XL2566X+ 24.1 TN FHD', 'Brands	BENQ\r\nDisplay Size (in.)	24.1\"\r\nPanel Size (in.)	24.1\"\r\nResolution	1920 x 1080\r\nResolution Type	FHD\r\nBrightness	320 cd/m²\r\nContrast ratio	1000 : 1\r\nAspect Ratio	16 : 9\r\nRefresh Rate	400Hz\r\nScreen Curvature	Flat screen\r\nPixel Pitch (H x V)	0.28 x 0.28 mm\r\nColor Accuracy	△E< 2\r\nHDR Support	Yes\r\nAdaptive Sync	Adaptive-Sync\r\nFlicker free	Yes\r\nLow Blue Light	Yes\r\nConnectivity	\r\n3 x HDMI 2.1\r\n1 x DisplayPort 1.4\r\n1 x 3.5mm Audio Out\r\nPower Consumption	65 Watt\r\nDimension (W x H x D)	517 - 362 x 576 x 209 mm\r\nWeight (Esti.)	5.8 kg\r\nColor	BLACK\r\nWarranty	3 Years', 22900, 0, 4, '2025-01-23 02:05:41'),
(68, 11, '1737598092_MONITOR (จอมอนิเตอร์) DAHUA LM27-B200S - 27 VA FHD 100Hz.jpg', 'MONITOR (จอมอนิเตอร์) DAHUA LM27-B200S - 27 VA FHD 100Hz', 'Brands	DAHUA\r\nDisplay Size (in.)	27\"\r\nPanel Size (in.)	27\" VA\r\nResolution	1920 x 1080\r\nResolution Type	FHD\r\nDisplay color	16.7 Million 8 bits\r\nBrightness	250 cd/m² (Typ.)\r\nContrast ratio	3000 : 1\r\nResponse Time	5ms (GtG)\r\nAspect Ratio	16 : 9\r\nRefresh Rate	100Hz\r\nScreen Curvature	Flat screen\r\nViewing Angle (CR≧10)	178° (H) / 178° (V)\r\nColor Gamut	NTSC : 72%\r\nDisplay Surface	Anti-Glare\r\nFlicker free	Yes\r\nLow Blue Light	Yes\r\nConnectivity	\r\n1 x HDMI 1.4\r\n1 x VGA\r\nOptimum Resolution	HDMI : 1920 x 1080 (Up to 100Hz)\r\nBuilt-in Speaker	2 x 1 Watt Speakers\r\nPower Consumption	\r\nInput Voltage : 100-240 V 50/60Hz 12V\r\nPower Type : External Adaptor\r\nPower Standby Mode : Less than 0.5 Watt\r\nConsumption (max) : 36 Watt\r\nMechanical	\r\nVESA Mount : 75x75mm\r\nTilt : Yes\r\nDimension (W x H x D)	614.1 x 363 x 45.1 mm.\r\nWeight (Esti.)	\r\nNet Weight : 3.8 kg\r\nGross Weight : 5.24 kg\r\nColor	BLACK\r\nWarranty	3 Years', 3290, 0, 2, '2025-01-23 02:08:12'),
(69, 11, '1737600371_MONITOR (จอมอนิเตอร์) LG ULTRAGEAR 32GS85Q-B - 31.5 NANO IPS 2K 180Hz.jpg', 'MONITOR (จอมอนิเตอร์) LG ULTRAGEAR 32GS85Q-B - 31.5 NANO IPS 2K 180Hz', 'Brands	LG\r\nDisplay Size (in.)	31.5\"\r\nPanel Size (in.)	31.5\"\r\nResolution	2560 x 1440\r\nResolution Type	2K\r\nDisplay color	1.07 Billion\r\nBrightness	350 cd/m²\r\nContrast ratio	1000 : 1\r\nResponse Time	1ms (GtG at Faster)\r\nAspect Ratio	16 : 9\r\nRefresh Rate	180Hz\r\nScreen Curvature	Flat screen\r\nPixel Pitch (H x V)	0.2724 x 0.2724 mm\r\nViewing Angle (CR≧10)	178º(R/L), 178º(U/D)\r\nColor Gamut	DCI-P3 : 98% (CIE1976) , 90% (CIE1976)\r\nHDR Support	HDR10\r\nAdaptive Sync	\r\nNVIDIA® G-SYNC® Compatible\r\nAMD FreeSync™\r\nFlicker free	Yes\r\nLow Blue Light	Yes\r\nConnectivity	\r\n2 x HDMI\r\n1 x DisplayPort\r\n1 x Audio line-out\r\nPower Consumption	29 Watt\r\nMechanical	\r\nDisplay Position Adjustments : Tilt / Height / Pivot\r\nWall Mountable : 100x100mm\r\nDimension (W x H x D)	713.9 x 611 x 253.7 mm\r\nWeight (Esti.)	5.6 kg\r\nColor	BLACK\r\nAccessory in box	\r\nMonitor\r\nStand\r\n1 x HDMI Cable\r\n1 x AC/DC Adapter\r\n1 x USB A/B Cable\r\n1 x DisplayPort Cable\r\nSetup Guide / User manual\r\nWarranty	3 Years', 12000, 0, 2, '2025-01-23 02:46:11'),
(70, 11, '1737600703_MONITOR (จอมอนิเตอร์) LG 34WQ75C-B - 34 IPS 2K CURVED 60Hz.jpg', 'MONITOR (จอมอนิเตอร์) LG 34WQ75C-B - 34 IPS 2K CURVED 60Hz', '\r\nRefresh Rate	60Hz\r\nScreen Curvature	Curved screen 3800R\r\nPixel Pitch (H x V)	0.2325 x 0.2325 mm\r\nViewing Angle (CR≧10)	178° (H) / 178° (V)\r\nColor Gamut	sRGB : 99% (CIE1931) (Typ) , 90% (CIE1931) (Min)\r\nHDR Support	HDR10\r\nDisplay Surface	Anti-Glare\r\nFlicker free	Yes\r\nLow Blue Light	Yes\r\nConnectivity	\r\n2 x HDMI 2.0\r\n1 x DisplayPort 1.4\r\n1 x USB-C DP ALT.\r\nBuilt-in Speaker	2 x 7 Watt Speakers\r\nPower Consumption	\r\nPower Input : 100-240 V 50/60Hz\r\nConsumption (DC Off) : Less than 0.3 Watt\r\nConsumption (Sleep Mode) : Less than 0.5 Watt\r\nConsumption (typical) : 60 Watt\r\nConsumption (max) : 150 Watt\r\nMechanical	\r\nWall Mountable : 100x100mm\r\nHeight 0~100mm\r\nTilt -5° ~ +20°\r\nDimension (W x H x D)	816.7 x 569.7 x 260 mm\r\nWeight (Esti.)	\r\nNet Weight without stand : 6.72 kg\r\nNet Weight with stand : 8.6 kg\r\nNet Weight with Packaging : 11 kg\r\nColor	BLACK\r\nAccessory in box	\r\nMonitor\r\nStand\r\n1 x HDMI Cable\r\n1 x USB A/B Cable\r\n1 x DisplayPort Cable\r\nWarranty	3 Years', 12000, 0, 0, '2025-01-23 02:51:43'),
(71, 11, '1737601054_MONITOR (จอมอนิเตอร์) LG 24MR400-B - 23.8 IPS 100Hz.jpg', 'MONITOR (จอมอนิเตอร์) LG 24MR400-B - 23.8 IPS 100Hz', 'Brands	LG\r\nDisplay Size (in.)	24\"\r\nPanel Size (in.)	23.8\" IPS\r\nResolution	1920 x 1080\r\nResolution Type	FHD\r\nDisplay color	16.7 Million\r\nBrightness	\r\n200 cd/m² (Min)\r\n250 cd/m² (Typ.)\r\nContrast ratio	\r\n1000 : 1 (Min.)\r\n1300: 1 (Typ.)\r\nResponse Time	5ms (GtG at Faster)\r\nAspect Ratio	16 : 9\r\nRefresh Rate	100Hz\r\nScreen Curvature	Flat screen\r\nPixel Pitch (H x V)	0.2745 x 0.2745 mm\r\nViewing Angle (CR≧10)	178° (H) / 178° (V)\r\nColor Gamut	sRGB : 99% (CIE1931) (Typ) , 95% (CIE1931) (Min)\r\nAdaptive Sync	AMD FreeSync™\r\nDisplay Surface	Anti-Glare\r\nFlicker free	Yes\r\nLow Blue Light	Yes\r\nConnectivity	\r\n1 x HDMI 1.4\r\n1 x VGA\r\nBuilt-in Speaker	No\r\nPower Consumption	\r\nPower Input : 100-240 V 50/60Hz\r\nPower Type : External Power Adaptor\r\nConsumption (DC Off) : Less than 0.3 Watt\r\nConsumption (Sleep Mode) : Less than 0.5 Watt\r\nConsumption (typical) : 17 Watt\r\nMechanical	\r\nWall Mountable : 100x100mm\r\nTilt -5° ~ +20°\r\nDimension (W x H x D)	540 x 414 x 200 mm.\r\nWeight (Esti.)	\r\nNet Weight without stand : 2.3 kg\r\nNet Weight with stand : 2.77 kg\r\nNet Weight with Packaging : 4.06 kg\r\nColor	BLACK\r\nWarranty	3 Years', 2800, 0, 0, '2025-01-23 02:57:34');
INSERT INTO `tb_product` (`id`, `type_product_id`, `image`, `title`, `detail`, `price`, `status`, `view`, `created_datetime`) VALUES
(72, 11, '1737601204_MONITOR (จอมอนิเตอร์) AOC 24G11E67 - 23.8 IPS FHD 180Hz (3Y).jpg', 'MONITOR (จอมอนิเตอร์) AOC 24G11E67 - 23.8 IPS FHD 180Hz (3Y)', 'Brands	AOC\r\nDisplay Size (in.)	24\"\r\nPanel Size (in.)	23.8\" IPS\r\nResolution	1920 x 1080\r\nResolution Type	FHD (Full HD)\r\nDisplay color	16.7 Million\r\nDisplay Viewing Area (H x V)	527.04 x 296.46 mm\r\nBrightness	300 cd/m²\r\nContrast ratio	\r\n1000 : 1 (Typical)\r\n80 Million : 1 (DCR)\r\nResponse Time	\r\n1ms (GtG)\r\n0.5ms (MPRT)\r\nAspect Ratio	16 : 9\r\nRefresh Rate	180Hz\r\nScreen Curvature	Flat screen\r\nPixel Pitch (H x V)	0.2745 x 0.2745 mm\r\nViewing Angle (CR≧10)	178° (H) / 178° (V)\r\nColor Gamut	\r\nNTSC : 112% (CIE1976)\r\nsRGB : 133% (CIE1931)\r\nDCI-P3 : 102% (CIE1976)\r\nColor Accuracy	△E< 2\r\nHDR Support	HDR10\r\nAdaptive Sync	Adaptive-Sync\r\nDisplay Surface	Anti-Glare\r\nFlicker free	Yes\r\nLow Blue Light	Yes\r\nConnectivity	\r\n1 x Earphone Jack\r\n1 x HDMI 2.0\r\n1 x DisplayPort 1.4\r\nOptimum Resolution	\r\nDisplayPort : 1920 x 1080 (Up to 180Hz)\r\nHDMI : 1920 x 1080 (Up to 180Hz)\r\nBuilt-in Speaker	No\r\nPower Consumption	\r\nInput Voltage : 100-240 V\r\nPower Supply : External 12VDC 2.0A\r\nConsumption (typical) : 22 Watt\r\nMechanical	\r\nVESA Wall Mounting : 100x100mm\r\nTilt : -5° ~ +23°\r\nDimension (W x H x D)	320.8 x 539.7 x 51.1 mm\r\nWeight (Esti.)	\r\nNet Weight without stand : 2.71 kg\r\nNet Weight with stand : 3.26 kg\r\nNet Weight : 4.38 kg\r\nColor	BLACK & RED\r\nAccessory in box	\r\nMonitor\r\nStand\r\n1 x HDMI Cable\r\n1 x DisplayPort Cable\r\nSetup Guide / User manual\r\nAC Power Cable\r\nWarranty	3 Years', 3600, 0, 4, '2025-01-23 03:00:04'),
(74, 12, '1737601699_KEYBOARD (คีย์บอร์ด) ASUS ROG AZOTH (WHITE) (RED SWITCH) (TH) (2Y).jpg', 'KEYBOARD (คีย์บอร์ด) ASUS ROG AZOTH (WHITE) (RED SWITCH) (TH) (2Y)', 'Brand	ASUS\r\nSwitch Name	RED SWITCH\r\nConnectivity	WIRELESS / BLUETOOTH / WIRED\r\nLighting	RGB\r\nLocalization	EN/TH\r\nMaterial	Aluminum\r\nWireless Frequency	2.4Ghz\r\nDimensions	326 x 136 x 40 mm\r\nWeight	1.2 kg\r\nColor	WHITE\r\nUSB Port	USB Type C\r\nType	MECHANICAL KEYBOARD\r\nWIRED/WIRELESS	WIRELESS\r\nWarranty	2 Years', 6690, 0, 2, '2025-01-23 03:04:14'),
(76, 12, '1737602392_KEYBOARD (คีย์บอร์ด) CORSAIR K65 PLUS WIRELESS (CORSAIR MLX FUSION TACTILE SWITCH).jpg', 'KEYBOARD (คีย์บอร์ด) CORSAIR K65 PLUS WIRELESS (CORSAIR MLX FUSION TACTILE SWITCH)', 'Brand	CORSAIR\r\nSwitch Name	CORSAIR MLX FUSION TACTILE SWITCH\r\nConnectivity	WIRELESS / BLUETOOTH / WIRED\r\nLighting	RGB\r\nLocalization	EN\r\nMaterial	PBT Material\r\nWireless Frequency	2.4Ghz\r\nBattery Type and Quantity	4200mAh Battery\r\nDimensions	320 x 136 x 35 mm.\r\nWeight	0.91 kg\r\nColor	BLACK\r\nUSB Port	USB Type C\r\nType	MECHANICAL KEYBOARD\r\nWIRED/WIRELESS	WIRELESS\r\nWarranty	2 Years', 5900, 0, 2, '2025-01-23 03:19:52'),
(77, 12, '1737602547_KEYBOARD (คีย์บอร์ด) ROCCAT VULCAN TKL AIMO TH (RED SWITCH) (ROC-12-286).jpg', 'KEYBOARD (คีย์บอร์ด) ROCCAT VULCAN TKL AIMO TH (RED SWITCH) (ROC-12-286)', 'Brand	ROCCAT\r\nSwitch Name	RED SWITCH\r\nConnectivity	USB 2.0\r\nLighting	LED\r\nLocalization	EN/TH\r\nDimension	360 x 133.3 x 34 mm\r\nWeight.	0.66 kg.\r\nType	MECHANICAL KEYBOARD\r\nWIRED/WIRELESS	WIRED\r\nWarranty	2 Years', 4800, 0, 2, '2025-01-23 03:22:27'),
(78, 12, '1737603374_KEYBOARD (คีย์บอร์ด) AULA F98 PRO (BLACK) 3IN1 WIRELESS [ICE CRYSTAL SWITCH] (ENTH).jpg', 'KEYBOARD (คีย์บอร์ด) AULA F98 PRO (BLACK) 3IN1 WIRELESS [ICE CRYSTAL SWITCH] (ENTH) ', 'Brand	AULA\r\nSwitch Name	ICE CRYSTAL SWITCH\r\nConnectivity	WIRELESS / BLUETOOTH / WIRED\r\nLighting	RGB backlight\r\nLocalization	EN/TH\r\nMaterial	transparent PC Material\r\nWireless Frequency	2.4Ghz\r\nBattery Type and Quantity	4000mAh Battery\r\nDimensions	385 x 138.2 x 40 mm\r\nWeight	1.06 kg\r\nColor	BLACK\r\nUSB Port	USB Type C\r\nType	MECHANICAL KEYBOARD\r\nWIRED/WIRELESS	WIRELESS\r\nWarranty	2 Years', 2900, 0, 0, '2025-01-23 03:36:14'),
(79, 12, '1737603613_KEYBOARD (คีย์บอร์ด) ROCCAT MAGMA MEMBRANE TH (ROC-12-590).jpg', 'KEYBOARD (คีย์บอร์ด) ROCCAT MAGMA MEMBRANE TH (ROC-12-590)', 'Brand	ROCCAT\r\nConnectivity	USB 2.0\r\nLighting	LED\r\nLocalization	EN/TH\r\nK/B Warranty	2 Years\r\nWeight.	0.88 kg.\r\nUSB Port	USB 2.0\r\nType	MEMBRANE\r\nWIRED/WIRELESS	WIRED\r\nWarranty	2 Years', 2200, 0, 0, '2025-01-23 03:40:13'),
(80, 12, '1737603821_KEYBOARD (คีย์บอร์ด) MOFII SWEET K WIRED RETRO KEYBOARD (DARKBLUE) (ENTH).jpg', 'KEYBOARD (คีย์บอร์ด) MOFII SWEET K WIRED RETRO KEYBOARD (DARKBLUE) (EN/TH) ', 'Brand	MOFII\r\nConnectivity	WIRED\r\nLocalization	EN/TH\r\nMaterial	ABS\r\nDimensions	445 x 136 x 35 mm.\r\nWeight	0.65 kg\r\nColor	DARK BLUE\r\nType	RUBBER DOME\r\nWIRED/WIRELESS	WIRED\r\nWarranty	1 Year', 310, 0, 2, '2025-01-23 03:42:35'),
(81, 12, '1737603941_KEYBOARD (คีย์บอร์ด) FANTECH K514 (ENTH).jpg', 'KEYBOARD (คีย์บอร์ด) FANTECH K514 (ENTH)', 'Brand	FANTECH\r\nConnectivity	USB\r\nLighting	RGB\r\nLocalization	EN/TH\r\nDimension	455 x 150 x 30 mm.\r\nWeight.	0.5 kg.\r\nType	MEMBRANE\r\nWIRED/WIRELESS	WIRED\r\nWarranty	2 Years', 250, 0, 0, '2025-01-23 03:45:41'),
(82, 12, '1737604018_KEYBOARD (คีย์บอร์ด) NEOLUTION E-SPORT CANDY (ORANGE-GREEN-BLUE) (ENTH).jpg', 'KEYBOARD (คีย์บอร์ด) NEOLUTION E-SPORT CANDY (ORANGE-GREEN-BLUE) (ENTH)', 'Brand	NEOLUTION\r\nConnectivity	USB Type A\r\nLighting	LED\r\nLocalization	EN/TH\r\nDimension	314 x 102 x 37 mm.\r\nType	MEMBRANE\r\nWIRED/WIRELESS	WIRED\r\nWarranty	2 Years', 300, 0, 2, '2025-01-23 03:46:58'),
(83, 13, '1737604233_MOUSE (เมาส์) PULSAR XLITE V4 QUICCS EDITION MEDIUM.jpg', 'MOUSE (เมาส์) PULSAR XLITE V4 QUICCS EDITION MEDIUM', 'Brand	PULSAR\r\nTilt scroll function	N/A\r\nClick life span	N/A\r\nScroll Whell	YES\r\nNumber of buttons	5 buttons\r\nBattery Life	None\r\nBattery Type	None\r\nInterface	2.4GHz Wireless USB\r\nSensor Resolution	32,000 DPI\r\nSensor technology	Optical sensor\r\nWireless technology	Wireless 2.4G\r\nDimensions	122 x 66 x 43 mm\r\nColor	RED/WHITE\r\nWarranty	2 Years', 6990, 0, 6, '2025-01-23 03:50:33'),
(84, 13, '1737609665_MOUSE (เมาส์) STEELSERIES AEROX 9 WIRELESS MOUSE WORLD OF WARCRAFT (BLACKGOLD).jpg', 'MOUSE (เมาส์) STEELSERIES AEROX 9 WIRELESS MOUSE WORLD OF WARCRAFT (BLACKGOLD)', 'Brand	STEELSERIES\r\nTilt scroll function	N/A\r\nClick life span	16.8 MILLION\r\nScroll Whell	YES\r\nNumber of buttons	18 buttons\r\nBattery Life	\r\nUp to 80 hours\r\nUp to 180 hours Bluetooth\r\nBattery Type	N/A\r\nInterface	2.4Ghz Bluetooth 5.0\r\nSensor Resolution	100–18,000 in 100 CPI Increments\r\nSensor technology	SteelSeries TrueMove Air\r\nWireless technology	2.4GHz Wireless Techology\r\nDimensions	128.8 x 62.8 x 26.7 mm\r\nColor	BLACK\r\nWarranty	2 Years', 6200, 0, 0, '2025-01-23 05:21:05'),
(85, 13, '1737609806_MOUSE (เมาส์) GLORIOUS MODEL D 2 PRO 4K8KHz EDITION WIRELESS (BLACK).jpg', 'MOUSE (เมาส์) GLORIOUS MODEL D 2 PRO 4K8KHz EDITION WIRELESS (BLACK)', 'Dimensions W x D x H	N/A\r\nClick life span	N/A\r\nScroll Whell	YES\r\nNumber of buttons	5 buttons\r\nInterface	WIRELESS\r\nSensor Resolution	26,000 DPI\r\nSensor technology	BAMF 2.0 26K\r\nWireless technology	Wireless 2.4G\r\nColor	BLACK\r\nWarranty	2 Years', 5400, 0, 0, '2025-01-23 05:23:26'),
(86, 13, '1737609915_MOUSE (เมาส์) ONIKUMA OKAMI DUAL MODE GAMING MOUSE  BLACK.jpg', 'MOUSE (เมาส์) ONIKUMA OKAMI DUAL MODE GAMING MOUSE  BLACK', 'Brand	ONIKUMA\r\nTilt scroll function	N/A\r\nClick life span	20 MILLION\r\nScroll Whell	YES\r\nNumber of buttons	7 buttons\r\nBattery Life	None\r\nBattery Type	400mAh\r\nInterface	\r\nUSB\r\n2.4GHz Wireless\r\nSensor Resolution	4800\r\nWireless technology	WIRELESS\r\nColor	BLACK\r\nOption	N/A\r\nWarranty	2 Years', 450, 0, 2, '2025-01-23 05:25:15'),
(87, 13, '1737610039_MOUSE (เมาส์) MOFII COCO 2.4G WIRELESS WITH SILENT MOUSE (OFFWHITE).jpg', 'MOUSE (เมาส์) MOFII COCO 2.4G WIRELESS WITH SILENT MOUSE (OFFWHITE) ', 'Brand	MOFII\r\nTilt scroll function	N/A\r\nScroll Whell	YES\r\nNumber of buttons	3 buttons\r\nBattery Type	1 x AA\r\nInterface	2.4GHz Wireless\r\nSensor Resolution	1000 DPI\r\nSensor technology	Optical sensor\r\nWireless technology	Wireless 2.4G\r\nDimensions	104.7 x 66.5 x 38 mm\r\nColor	OFFWHITE\r\nWarranty	1 Year', 240, 0, 2, '2025-01-23 05:27:19'),
(88, 13, '1737610153_MOUSE (เมาส์) MOFII RABBIT 2.4G WIRELESS MOUSE (PINK).jpg', 'MOUSE (เมาส์) MOFII RABBIT 2.4G WIRELESS MOUSE (PINK)', 'Brand	MOFII\r\nTilt scroll function	N/A\r\nScroll Whell	YES\r\nNumber of buttons	3 buttons\r\nBattery Life	3-6 Months\r\nBattery Type	2 x AAA\r\nInterface	USB 2.0\r\nSensor Resolution	1000 DPI\r\nSensor technology	Mosart H383\r\nWireless technology	Wireless 2.4G\r\nDimensions	62 x 94 x 36 mm\r\nColor	PINK\r\nWarranty	1 Year', 270, 0, 2, '2025-01-23 05:29:13'),
(89, 13, '1737610271_MOUSE (เมาส์) FANTECH WG9 KANATA WIRELESS (BLACK).jpg', 'MOUSE (เมาส์) FANTECH WG9 KANATA WIRELESS (BLACK)', 'Brand	FANTECH\r\nTilt scroll function	N/A\r\nClick life span	5 MILLION\r\nScroll Whell	YES\r\nNumber of buttons	5 buttons\r\nBattery Life	Up to 85 Hours\r\nBattery Type	600mAh\r\nInterface	2.4GHz Wireless\r\nSensor Resolution	800-2,000 DPI\r\nSensor technology	Optical sensor\r\nWireless technology	Wireless 2.4G\r\nDimensions	123 x 67 x 44 mm\r\nColor	BLACK\r\nWarranty	1 Year', 450, 0, 0, '2025-01-23 05:31:11'),
(90, 1, '1737889492_JANULTRA-001 INTEL ULTRA 5 225F 3.3GHz 10C10T  B860M  RTX 4060 8GB  32GB DDR5 5600MHz  M.2 500GB  650W.png', 'JANULTRA-001 INTEL ULTRA 5 225F 3.3GHz 10C/10T / B860M / RTX 4060 8GB / 32GB DDR5 5600MHz / M.2 500GB / 650W', 'CPU	Intel® CORE ULTRA 5 225F 3.3GHz 10C/10T\r\nMainboard	GIGABYTE B860M DS3H (REV.1.0)\r\nGraphic card	INNO3D GEFORCE RTX 4060 TWIN X2 OC WHITE - 8GB GDDR6\r\nMemory	KINGSTON FURY BEAST 32GB (16x2) DDR5 5600MHz BLACK\r\nStorage	M.2 KINGSTON NV3 500GB Read (6,000 MB/s)\r\nPower Supply	GIGABYTE GP-P650SS 650W (80+ SILVER)\r\nCase	iHAVECPU IHC R03 (BLACK)(mATX) | (เลือกเคสติดต่อ ADMIN)\r\nCooling System	iHAVECPU UP1 SERIES BLACK ARGB\r\nWarranty	3 Years (ยกเว้น CASE ประกัน 1 ปี)', 32000, 0, 4, '2025-01-26 11:04:52'),
(91, 1, '1737889757_JANULTRA-002 INTEL ULTRA 5 225F 3.3GHz 10C10T  B860M  RTX 4060 8GB  32GB DDR5 5600MHz  M.2 500GB  650W.png', 'JANULTRA-002 INTEL ULTRA 5 225F 3.3GHz 10C10T  B860M  RTX 4060 8GB  32GB DDR5 5600MHz  M.2 500GB  650W', 'CPU	Intel® CORE ULTRA 5 225F 3.3GHz 10C/10T\r\nMainboard	ASUS PRIME B860M-K-CSM\r\nGraphic card	INNO3D GEFORCE RTX 4060 TWIN X2 OC WHITE - 8GB GDDR6\r\nMemory	KINGSTON FURY BEAST 32GB (16x2) DDR5 5600MHz BLACK\r\nStorage	M.2 KINGSTON NV3 500GB Read (6,000 MB/s)\r\nPower Supply	GIGABYTE GP-P650SS 650W (80+ SILVER)\r\nCase	iHAVECPU IHC R03 (WHITE)(mATX) | (เลือกเคสติดต่อ ADMIN)\r\nCooling System	iHAVECPU UP1 SERIES BLACK ARGB\r\nWarranty	3 Years (ยกเว้น CASE ประกัน 1 ปี)', 34000, 0, 6, '2025-01-26 11:09:17'),
(92, 1, '1737889869_JANULTRA-003 INTEL ULTRA 5 225F 3.3GHz 10C10T  B860M  RTX 4060 8GB  32GB DDR5 5600MHz  M.2 500GB  650W.png', 'JANULTRA-003 INTEL ULTRA 5 225F 3.3GHz 10C/10T / B860M / RTX 4060 8GB / 32GB DDR5 5600MHz / M.2 500GB / 650W', 'CPU	Intel® CORE ULTRA 5 225F 3.3GHz 10C/10T\r\nMainboard	ASUS PRIME B860M-A WIFI-CSM\r\nGraphic card	INNO3D GEFORCE RTX 4060 TWIN X2 OC WHITE - 8GB GDDR6\r\nMemory	KINGSTON FURY BEAST 32GB (16x2) DDR5 5600MHz BLACK\r\nStorage	M.2 KINGSTON NV3 500GB Read (6,000 MB/s)\r\nPower Supply	GIGABYTE GP-P650SS 650W (80+ SILVER)\r\nCase	iHAVECPU G390 (BLACK)(mATX) | (เลือกเคสติดต่อ ADMIN)\r\nCooling System	iHAVECPU UP1 SERIES BLACK ARGB\r\nWarranty	3 Years (ยกเว้น CASE ประกัน 1 ปี)', 35000, 0, 0, '2025-01-26 11:11:09'),
(93, 1, '1737890068_JANULTRA-004 INTEL ULTRA 5 225F 3.3GHz 10C10T  B860M  RTX 4060 8GB  32GB DDR5 6400Mhz  M.2 500GB  650W.png', 'JANULTRA-004 INTEL ULTRA 5 225F 3.3GHz 10C/10T / B860M / RTX 4060 8GB / 32GB DDR5 6400Mhz / M.2 500GB / 650W', 'CPU	Intel® CORE ULTRA 5 225F 3.3GHz 10C/10T\r\nMainboard	ASUS TUF GAMING B860M-PLUS\r\nGraphic card	INNO3D GEFORCE RTX 4060 TWIN X2 OC WHITE - 8GB GDDR6\r\nMemory	PREDATOR HERMES RGB 32GB (16x2) DDR5 6400Mhz BLACK\r\nStorage	M.2 KINGSTON NV3 500GB Read (6,000 MB/s)\r\nPower Supply	GIGABYTE GP-P650SS 650W (80+ SILVER)\r\nCase	iHAVECPU G390 (WHITE)(mATX) | (เลือกเคสติดต่อ ADMIN)\r\nCooling System	CORSAIR iCUE H100X RGB ELITE (BLACK)\r\nWarranty	3 Years (ยกเว้น CASE ประกัน 1 ปี)', 40000, 0, 2, '2025-01-26 11:14:28'),
(94, 1, '1737890325_JANULTRA-005 INTEL ULTRA 5 225F 3.3GHz 10C10T  B860M  RTX 4060 8GB  32GB DDR5 6400Mhz  M.2 500GB  650W.png', 'JANULTRA-005 INTEL ULTRA 5 225F 3.3GHz 10C10T  B860M  RTX 4060 8GB  32GB DDR5 6400Mhz  M.2 500GB  650W', 'CPU	Intel® CORE ULTRA 5 225F 3.3GHz 10C/10T\r\nMainboard	ASUS TUF GAMING B860M-PLUS WIFI\r\nGraphic card	INNO3D GEFORCE RTX 4060 TWIN X2 OC WHITE - 8GB GDDR6\r\nMemory	PREDATOR HERMES RGB 32GB (16x2) DDR5 6400Mhz BLACK\r\nStorage	M.2 KINGSTON NV3 500GB Read (6,000 MB/s)\r\nPower Supply	GIGABYTE GP-P650SS 650W (80+ SILVER)\r\nCase	iHAVECPU IHC 301TG (BLACK)(ATX) | (เลือกเคสติดต่อ ADMIN)\r\nCooling System	CORSAIR iCUE H100X RGB ELITE (BLACK)\r\nWarranty	3 Years (ยกเว้น CASE ประกัน 1 ปี)', 41000, 0, 2, '2025-01-26 11:18:45'),
(95, 1, '1737890458_JANULTRA-006 INTEL ULTRA 5 235 3.4GHz 14C14T  B860M  RTX 4060 8GB  32GB DDR5 5600MHz  M.2 500GB  650W.png', 'JANULTRA-006 INTEL ULTRA 5 235 3.4GHz 14C14T  B860M  RTX 4060 8GB  32GB DDR5 5600MHz  M.2 500GB  650W', 'CPU	Intel® CORE ULTRA 5 235 3.4GHz 14C/14T\r\nMainboard	GIGABYTE B860M DS3H (REV.1.0)\r\nGraphic card	INNO3D GEFORCE RTX 4060 TWIN X2 OC WHITE - 8GB GDDR6\r\nMemory	KINGSTON FURY BEAST 32GB (16x2) DDR5 5600MHz BLACK\r\nStorage	M.2 KINGSTON NV3 500GB Read (6,000 MB/s)\r\nPower Supply	GIGABYTE GP-P650SS 650W (80+ SILVER)\r\nCase	iHAVECPU IHC 301TG (WHITE)(ATX) | (เลือกเคสติดต่อ ADMIN)\r\nCooling System	iHAVECPU UP2 SERIES BLACK ARGB\r\nWarranty	3 Years (ยกเว้น CASE ประกัน 1 ปี)', 34000, 0, 0, '2025-01-26 11:20:58');

-- --------------------------------------------------------

--
-- Table structure for table `tb_product_gallery`
--

CREATE TABLE `tb_product_gallery` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `image` text NOT NULL,
  `created_datatime` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_product_gallery`
--

INSERT INTO `tb_product_gallery` (`id`, `id_product`, `image`, `created_datatime`) VALUES
(1, 1, '1737291632_MSI STEALTH 16 MERCEDES-AMG1.jpg', '2025-01-19 20:00:32'),
(2, 1, '1737291637_MSI STEALTH 16 MERCEDES-AMG2.jpg', '2025-01-19 20:00:37'),
(3, 1, '1737291642_MSI STEALTH 16 MERCEDES-AMG3.jpg', '2025-01-19 20:00:42'),
(4, 1, '1737291646_MSI STEALTH 16 MERCEDES-AMG4.jpg', '2025-01-19 20:00:46'),
(5, 3, '1737291672_PHILIPS EVNIA 49M2C890000 - 48.9 1.jpg', '2025-01-19 20:01:12'),
(6, 3, '1737291677_PHILIPS EVNIA 49M2C890000 - 48.9 2.jpg', '2025-01-19 20:01:17'),
(7, 3, '1737291682_PHILIPS EVNIA 49M2C890000 - 48.9 3.jpg', '2025-01-19 20:01:22'),
(8, 3, '1737291686_PHILIPS EVNIA 49M2C890000 - 48.9 4.jpg', '2025-01-19 20:01:26'),
(9, 4, '1737356896_MSI VECTOR 17 HX A14VHG-613TH 1.jpg', '2025-01-20 14:08:16'),
(10, 4, '1737356901_MSI VECTOR 17 HX A14VHG-613TH 2.jpg', '2025-01-20 14:08:21'),
(11, 4, '1737356906_MSI VECTOR 17 HX A14VHG-613TH 3.jpg', '2025-01-20 14:08:26'),
(12, 4, '1737356911_MSI VECTOR 17 HX A14VHG-613TH 4.jpg', '2025-01-20 14:08:31'),
(13, 5, '1737358712_MSI VECTOR 16 HX A14VHG-295TH 1.jpg', '2025-01-20 14:38:32'),
(14, 5, '1737358717_MSI VECTOR 16 HX A14VHG-295TH 2.jpg', '2025-01-20 14:38:37'),
(15, 5, '1737358721_MSI VECTOR 16 HX A14VHG-295TH 3.jpg', '2025-01-20 14:38:41'),
(16, 5, '1737358726_MSI VECTOR 16 HX A14VHG-295TH 4.jpg', '2025-01-20 14:38:46'),
(17, 6, '1737358934_MSI PRESTIGE 16 AI STUDIO B1VFG-227TH 1.jpg', '2025-01-20 14:42:14'),
(18, 6, '1737358939_MSI PRESTIGE 16 AI STUDIO B1VFG-227TH 2.jpg', '2025-01-20 14:42:19'),
(19, 6, '1737358943_MSI PRESTIGE 16 AI STUDIO B1VFG-227TH 3.jpg', '2025-01-20 14:42:23'),
(20, 6, '1737358948_MSI PRESTIGE 16 AI STUDIO B1VFG-227TH 4.jpg', '2025-01-20 14:42:28'),
(21, 7, '1737359450_MSI KATANA A17 AI B8VG-861TH 1.jpg', '2025-01-20 14:50:50'),
(22, 7, '1737359454_MSI KATANA A17 AI B8VG-861TH 2.jpg', '2025-01-20 14:50:54'),
(23, 7, '1737359459_MSI KATANA A17 AI B8VG-861TH 3.jpg', '2025-01-20 14:50:59'),
(24, 7, '1737359463_MSI KATANA A17 AI B8VG-861TH 4.jpg', '2025-01-20 14:51:03'),
(25, 8, '1737359812_MSI CYBORG 14 A13VF-064TH 1.jpg', '2025-01-20 14:56:52'),
(26, 8, '1737359816_MSI CYBORG 14 A13VF-064TH 2.jpg', '2025-01-20 14:56:56'),
(27, 8, '1737359822_MSI CYBORG 14 A13VF-064TH 3.jpg', '2025-01-20 14:57:02'),
(28, 8, '1737359827_MSI CYBORG 14 A13VF-064TH 4.jpg', '2025-01-20 14:57:07'),
(29, 9, '1737359942_HP 15-FC1001AU 1.jpg', '2025-01-20 14:59:02'),
(30, 9, '1737359947_HP 15-FC1001AU 2.jpg', '2025-01-20 14:59:07'),
(31, 9, '1737359951_HP 15-FC1001AU 3.jpg', '2025-01-20 14:59:11'),
(32, 10, '1737360107_ACER NITRO V 15 ANV15-41-R1R0 1.jpg', '2025-01-20 15:01:47'),
(33, 10, '1737360113_ACER NITRO V 15 ANV15-41-R1R0 2.jpg', '2025-01-20 15:01:53'),
(34, 10, '1737360117_ACER NITRO V 15 ANV15-41-R1R0 3.jpg', '2025-01-20 15:01:57'),
(35, 10, '1737360120_ACER NITRO V 15 ANV15-41-R1R0 4.jpg', '2025-01-20 15:02:00'),
(36, 11, '1737375122_CPU (ซีพียู) AMD AM5 RYZEN 9 9950X 1.jpg', '2025-01-20 19:12:02'),
(37, 11, '1737375126_CPU (ซีพียู) AMD AM5 RYZEN 9 9950X 2.jpg', '2025-01-20 19:12:06'),
(38, 16, '1737376502_CPU (ซีพียู) INTEL 1851 CORE ULTRA 5 225F 1.jpg', '2025-01-20 19:35:02'),
(39, 18, '1737376782_MAINBOARD (เมนบอร์ด)(1851) MSI MEG 1.jpg', '2025-01-20 19:39:42'),
(40, 18, '1737376785_MAINBOARD (เมนบอร์ด)(1851) MSI MEG 2.jpg', '2025-01-20 19:39:45'),
(41, 18, '1737376790_MAINBOARD (เมนบอร์ด)(1851) MSI MEG 3.jpg', '2025-01-20 19:39:50'),
(42, 18, '1737376793_MAINBOARD (เมนบอร์ด)(1851) MSI MEG 4.jpg', '2025-01-20 19:39:53'),
(43, 19, '1737377102_MAINBOARD (เมนบอร์ด)(1851) GIGABYTE 1.jpg', '2025-01-20 19:45:02'),
(44, 19, '1737377106_MAINBOARD (เมนบอร์ด)(1851) GIGABYTE 2.jpg', '2025-01-20 19:45:06'),
(45, 19, '1737377111_MAINBOARD (เมนบอร์ด)(1851) GIGABYTE 3.jpg', '2025-01-20 19:45:11'),
(46, 19, '1737377114_MAINBOARD (เมนบอร์ด)(1851) GIGABYTE 4.jpg', '2025-01-20 19:45:14'),
(47, 20, '1737377275_MAINBOARD (เมนบอร์ด)(1851) ASUS ROG 1.jpg', '2025-01-20 19:47:55'),
(48, 20, '1737377280_MAINBOARD (เมนบอร์ด)(1851) ASUS ROG 2.jpg', '2025-01-20 19:48:00'),
(49, 20, '1737377283_MAINBOARD (เมนบอร์ด)(1851) ASUS ROG 3.jpg', '2025-01-20 19:48:03'),
(50, 20, '1737377287_MAINBOARD (เมนบอร์ด)(1851) ASUS ROG 4.jpg', '2025-01-20 19:48:07'),
(51, 21, '1737377419_MAINBOARD (เมนบอร์ด)(AM5) ASUS TUF 1.jpg', '2025-01-20 19:50:19'),
(52, 21, '1737377424_MAINBOARD (เมนบอร์ด)(AM5) ASUS TUF 2.jpg', '2025-01-20 19:50:24'),
(53, 21, '1737377429_MAINBOARD (เมนบอร์ด)(AM5) ASUS TUF 3.jpg', '2025-01-20 19:50:29'),
(54, 21, '1737377432_MAINBOARD (เมนบอร์ด)(AM5) ASUS TUF 4.jpg', '2025-01-20 19:50:32'),
(55, 22, '1737377556_MAINBOARD (เมนบอร์ด)(AM4) MSI A520M-A-PRO 1.jpg', '2025-01-20 19:52:36'),
(56, 22, '1737377560_MAINBOARD (เมนบอร์ด)(AM4) MSI A520M-A-PRO 2.jpg', '2025-01-20 19:52:40'),
(57, 22, '1737377564_MAINBOARD (เมนบอร์ด)(AM4) MSI A520M-A-PRO 3.jpg', '2025-01-20 19:52:44'),
(58, 22, '1737377568_MAINBOARD (เมนบอร์ด)(AM4) MSI A520M-A-PRO 4.jpg', '2025-01-20 19:52:48'),
(59, 23, '1737377705_MAINBOARD (เมนบอร์ด)(1700) GIGABYTE 1.jpg', '2025-01-20 19:55:05'),
(60, 23, '1737377709_MAINBOARD (เมนบอร์ด)(1700) GIGABYTE 2.jpg', '2025-01-20 19:55:09'),
(61, 23, '1737377712_MAINBOARD (เมนบอร์ด)(1700) GIGABYTE 3.jpg', '2025-01-20 19:55:12'),
(62, 23, '1737377716_MAINBOARD (เมนบอร์ด)(1700) GIGABYTE 4.jpg', '2025-01-20 19:55:16'),
(63, 24, '1737377842_MAINBOARD (เมนบอร์ด) (1700) ASROCK 1.png', '2025-01-20 19:57:22'),
(64, 24, '1737377847_MAINBOARD (เมนบอร์ด) (1700) ASROCK 2.png', '2025-01-20 19:57:27'),
(65, 24, '1737377851_MAINBOARD (เมนบอร์ด) (1700) ASROCK 3.png', '2025-01-20 19:57:31'),
(66, 24, '1737377854_MAINBOARD (เมนบอร์ด) (1700) ASROCK 4.png', '2025-01-20 19:57:34'),
(67, 25, '1737378015_VGA(การ์ดจอ) MSI GEFORCE RTX 4080 1.png', '2025-01-20 20:00:15'),
(68, 25, '1737378020_VGA(การ์ดจอ) MSI GEFORCE RTX 4080 2.png', '2025-01-20 20:00:20'),
(69, 26, '1737378237_VGA(การ์ดจอ) ASUS TUF GAMING GEFORCE RTX 4070 TI 1.jpg', '2025-01-20 20:03:57'),
(70, 26, '1737378241_VGA(การ์ดจอ) ASUS TUF GAMING GEFORCE RTX 4070 TI 2.jpg', '2025-01-20 20:04:01'),
(71, 26, '1737378245_VGA(การ์ดจอ) ASUS TUF GAMING GEFORCE RTX 4070 TI 3.jpg', '2025-01-20 20:04:05'),
(72, 26, '1737378249_VGA(การ์ดจอ) ASUS TUF GAMING GEFORCE RTX 4070 TI 4.jpg', '2025-01-20 20:04:09'),
(73, 27, '1737378353_VGA(การ์ดจอ) ZOTAC GEFORCE RTX 4070 TI 1.jpg', '2025-01-20 20:05:53'),
(74, 27, '1737378357_VGA(การ์ดจอ) ZOTAC GEFORCE RTX 4070 TI 2.jpg', '2025-01-20 20:05:57'),
(75, 27, '1737378360_VGA(การ์ดจอ) ZOTAC GEFORCE RTX 4070 TI 3.jpg', '2025-01-20 20:06:00'),
(76, 28, '1737378463_VGA(การ์ดจอ) INNO3D GEFORCE RTX 4060 1.jpg', '2025-01-20 20:07:43'),
(77, 28, '1737378469_VGA(การ์ดจอ) INNO3D GEFORCE RTX 4060 2.jpg', '2025-01-20 20:07:49'),
(78, 29, '1737378610_VGA(การ์ดจอ) POWERCOLOR FIGHTER RADEON RX 6500 XT 1.jpg', '2025-01-20 20:10:10'),
(79, 29, '1737378619_VGA(การ์ดจอ) POWERCOLOR FIGHTER RADEON RX 6500 XT 2.jpg', '2025-01-20 20:10:19'),
(80, 29, '1737378624_VGA(การ์ดจอ) POWERCOLOR FIGHTER RADEON RX 6500 XT 3.jpg', '2025-01-20 20:10:24'),
(81, 29, '1737378628_VGA(การ์ดจอ) POWERCOLOR FIGHTER RADEON RX 6500 XT 4.jpg', '2025-01-20 20:10:28'),
(82, 30, '1737378719_VGA(การ์ดจอ) PALIT GEFORCE RTX 3050 1.jpg', '2025-01-20 20:11:59'),
(83, 30, '1737378725_VGA(การ์ดจอ) PALIT GEFORCE RTX 3050 2.jpg', '2025-01-20 20:12:05'),
(84, 30, '1737378729_VGA(การ์ดจอ) PALIT GEFORCE RTX 3050 3.jpg', '2025-01-20 20:12:09'),
(85, 30, '1737378733_VGA(การ์ดจอ) PALIT GEFORCE RTX 3050 4.jpg', '2025-01-20 20:12:13'),
(86, 31, '1737378844_VGA(การ์ดจอ) PNY GEFORCE RTX 4060 1.png', '2025-01-20 20:14:04'),
(87, 31, '1737378848_VGA(การ์ดจอ) PNY GEFORCE RTX 4060 2.png', '2025-01-20 20:14:08'),
(88, 31, '1737378853_VGA(การ์ดจอ) PNY GEFORCE RTX 4060 3.png', '2025-01-20 20:14:13'),
(89, 31, '1737378857_VGA(การ์ดจอ) PNY GEFORCE RTX 4060 4.png', '2025-01-20 20:14:17'),
(90, 32, '1737444678_CORSAIR DOMINATOR TITANIUM RGB 32GB 1.png', '2025-01-21 14:31:18'),
(91, 32, '1737444682_CORSAIR DOMINATOR TITANIUM RGB 32GB 2.png', '2025-01-21 14:31:22'),
(92, 32, '1737444686_CORSAIR DOMINATOR TITANIUM RGB 32GB 3.png', '2025-01-21 14:31:26'),
(93, 32, '1737444690_CORSAIR DOMINATOR TITANIUM RGB 32GB 4.png', '2025-01-21 14:31:30'),
(94, 34, '1737445334_RAM (แรม) GeIL EVO V RGB 32GB (16x2) DDR5 1.jpg', '2025-01-21 14:42:14'),
(95, 34, '1737445338_RAM (แรม) GeIL EVO V RGB 32GB (16x2) DDR5 2.jpg', '2025-01-21 14:42:18'),
(96, 34, '1737445343_RAM (แรม) GeIL EVO V RGB 32GB (16x2) DDR5 3.jpg', '2025-01-21 14:42:23'),
(97, 35, '1737445449_RAM (แรม) PREDATOR HERMES RGB 32GB (16x2) DDR5 1.jpg', '2025-01-21 14:44:09'),
(98, 36, '1737445570_RAM (แรม) PREDATOR VESTA II RGB 32GB (16x2) DDR5 1.jpg', '2025-01-21 14:46:10'),
(99, 37, '1737445795_RAM (แรม) GeIL ORION PHANTOM GAMING 16GB (8x2) DDR4 1.jpg', '2025-01-21 14:49:55'),
(100, 37, '1737445800_RAM (แรม) GeIL ORION PHANTOM GAMING 16GB (8x2) DDR4 2.jpg', '2025-01-21 14:50:00'),
(101, 37, '1737445804_RAM (แรม) GeIL ORION PHANTOM GAMING 16GB (8x2) DDR4 3.jpg', '2025-01-21 14:50:04'),
(102, 38, '1737446031_RAM (แรม) LEXAR THOR OC 16GB (8x2) DDR5 1.jpg', '2025-01-21 14:53:51'),
(103, 38, '1737446035_RAM (แรม) LEXAR THOR OC 16GB (8x2) DDR5 2.jpg', '2025-01-21 14:53:55'),
(104, 38, '1737446042_RAM (แรม) LEXAR THOR OC 16GB (8x2) DDR5 3.jpg', '2025-01-21 14:54:02'),
(105, 39, '1737446165_RAM (แรม) LEXAR ARES RGB KIT 32GB (16x2) DDR5 1.jpg', '2025-01-21 14:56:05'),
(106, 39, '1737446169_RAM (แรม) LEXAR ARES RGB KIT 32GB (16x2) DDR5 2.jpg', '2025-01-21 14:56:09'),
(107, 40, '1737446453_M.2 (เอสเอสดี) WD BLACK SN770 2TB PCIeNVMe GEN4 1.png', '2025-01-21 15:00:53'),
(108, 40, '1737446456_M.2 (เอสเอสดี) WD BLACK SN770 2TB PCIeNVMe GEN4 2.png', '2025-01-21 15:00:56'),
(109, 41, '1737446585_M.2 (เอสเอสดี) KINGSTON NV3 2TB PCIe 4NVMe 1..jpg', '2025-01-21 15:03:05'),
(110, 41, '1737446589_M.2 (เอสเอสดี) KINGSTON NV3 2TB PCIe 4NVMe 2.jpg', '2025-01-21 15:03:09'),
(111, 42, '1737446750_M.2 (เอสเอสดี) MSI SPATIUM M480 PRO 1TB PCIeNVMe GEN4 1.jpg', '2025-01-21 15:05:50'),
(112, 42, '1737446755_M.2 (เอสเอสดี) MSI SPATIUM M480 PRO 1TB PCIeNVMe GEN4 2.jpg', '2025-01-21 15:05:55'),
(113, 42, '1737446761_M.2 (เอสเอสดี) MSI SPATIUM M480 PRO 1TB PCIeNVMe GEN4 3.jpg', '2025-01-21 15:06:01'),
(114, 42, '1737446765_M.2 (เอสเอสดี) MSI SPATIUM M480 PRO 1TB PCIeNVMe GEN4 4.jpg', '2025-01-21 15:06:05'),
(115, 43, '1737446874_SSD (เอสเอสดี) HIKSEMI CITY E100 512GB 1..jpg', '2025-01-21 15:07:54'),
(116, 43, '1737446879_SSD (เอสเอสดี) HIKSEMI CITY E100 512GB 2.jpg', '2025-01-21 15:07:59'),
(117, 43, '1737446883_SSD (เอสเอสดี) HIKSEMI CITY E100 512GB 3.jpg', '2025-01-21 15:08:03'),
(118, 44, '1737447028_SSD (เอสเอสดี) APACER AS350X 1TB 1.jpg', '2025-01-21 15:10:28'),
(119, 44, '1737447032_SSD (เอสเอสดี) APACER AS350X 1TB 2.jpg', '2025-01-21 15:10:32'),
(120, 47, '1737448132_PSU (อุปกรณ์จ่ายไฟ) CORSAIR HX1500I - 1500W 1.jpg', '2025-01-21 15:28:52'),
(121, 47, '1737448136_PSU (อุปกรณ์จ่ายไฟ) CORSAIR HX1500I - 1500W 2.jpg', '2025-01-21 15:28:56'),
(122, 47, '1737448141_PSU (อุปกรณ์จ่ายไฟ) CORSAIR HX1500I - 1500W 3.jpg', '2025-01-21 15:29:01'),
(123, 47, '1737448145_PSU (อุปกรณ์จ่ายไฟ) CORSAIR HX1500I - 1500W 4.jpg', '2025-01-21 15:29:05'),
(124, 48, '1737514949_PSU (อุปกรณ์จ่ายไฟ) ASUS ROG LOKI 1200T SFX-L - 1200W 1.jpg', '2025-01-22 10:02:29'),
(125, 48, '1737514953_PSU (อุปกรณ์จ่ายไฟ) ASUS ROG LOKI 1200T SFX-L - 1200W 2.jpg', '2025-01-22 10:02:33'),
(126, 48, '1737514958_PSU (อุปกรณ์จ่ายไฟ) ASUS ROG LOKI 1200T SFX-L - 1200W 3.jpg', '2025-01-22 10:02:38'),
(127, 48, '1737514968_PSU (อุปกรณ์จ่ายไฟ) ASUS ROG LOKI 1200T SFX-L - 1200W 4.jpg', '2025-01-22 10:02:48'),
(128, 48, '1737514973_PSU (อุปกรณ์จ่ายไฟ) ASUS ROG LOKI 1200T SFX-L - 1200W 5.jpg', '2025-01-22 10:02:53'),
(129, 49, '1737515142_PSU (อุปกรณ์จ่ายไฟ) CORSAIR RM850E - 850W 1.png', '2025-01-22 10:05:42'),
(130, 49, '1737515146_PSU (อุปกรณ์จ่ายไฟ) CORSAIR RM850E - 850W 2.png', '2025-01-22 10:05:46'),
(131, 49, '1737515152_PSU (อุปกรณ์จ่ายไฟ) CORSAIR RM850E - 850W 3.png', '2025-01-22 10:05:52'),
(132, 49, '1737515158_PSU (อุปกรณ์จ่ายไฟ) CORSAIR RM850E - 850W 4.png', '2025-01-22 10:05:58'),
(133, 49, '1737515162_PSU (อุปกรณ์จ่ายไฟ) CORSAIR RM850E - 850W 5.png', '2025-01-22 10:06:02'),
(135, 50, '1737515305_(อุปกรณ์จ่ายไฟ) AZZA PSAZ 550W 3.png', '2025-01-22 10:08:25'),
(136, 50, '1737515309_(อุปกรณ์จ่ายไฟ) AZZA PSAZ 550W 4.png', '2025-01-22 10:08:29'),
(138, 51, '1737515472_PSU (อุปกรณ์จ่ายไฟ) AEROCOOL UNITED POWER 600W 1.jpg', '2025-01-22 10:11:12'),
(139, 51, '1737515477_PSU (อุปกรณ์จ่ายไฟ) AEROCOOL UNITED POWER 600W 2.jpg', '2025-01-22 10:11:17'),
(140, 51, '1737515481_PSU (อุปกรณ์จ่ายไฟ) AEROCOOL UNITED POWER 600W 3.jpg', '2025-01-22 10:11:21'),
(141, 52, '1737515654_PSU (อุปกรณ์จ่ายไฟ) CORSAIR CX650 650W 1.jpg', '2025-01-22 10:14:14'),
(142, 52, '1737515659_PSU (อุปกรณ์จ่ายไฟ) CORSAIR CX650 650W 2.jpg', '2025-01-22 10:14:19'),
(143, 52, '1737515665_PSU (อุปกรณ์จ่ายไฟ) CORSAIR CX650 650W 3.jpg', '2025-01-22 10:14:25'),
(144, 52, '1737515669_PSU (อุปกรณ์จ่ายไฟ) CORSAIR CX650 650W 4.jpg', '2025-01-22 10:14:29'),
(145, 53, '1737515897_PSU (อุปกรณ์จ่ายไฟ) GIGABYTE UD1000GM 1000W 1.jpg', '2025-01-22 10:18:17'),
(146, 53, '1737515901_PSU (อุปกรณ์จ่ายไฟ) GIGABYTE UD1000GM 1000W 2.jpg', '2025-01-22 10:18:21'),
(147, 53, '1737515906_PSU (อุปกรณ์จ่ายไฟ) GIGABYTE UD1000GM 1000W 3.jpg', '2025-01-22 10:18:26'),
(148, 53, '1737515910_PSU (อุปกรณ์จ่ายไฟ) GIGABYTE UD1000GM 1000W 4.jpg', '2025-01-22 10:18:30'),
(149, 54, '1737516293_ASUS ROG HYPERION GR701 (WHITE)(E-ATX) 1.jpg', '2025-01-22 10:24:53'),
(150, 54, '1737516297_ASUS ROG HYPERION GR701 (WHITE)(E-ATX) 2.jpg', '2025-01-22 10:24:57'),
(151, 54, '1737516302_ASUS ROG HYPERION GR701 (WHITE)(E-ATX) 3.jpg', '2025-01-22 10:25:02'),
(152, 54, '1737516307_ASUS ROG HYPERION GR701 (WHITE)(E-ATX) 4.jpg', '2025-01-22 10:25:07'),
(153, 55, '1737516464_CASE (เคส) HYTE Y70 TOUCH INFINITE (BLACKBLACK)(E-ATX)(3Y) 1.jpg', '2025-01-22 10:27:44'),
(154, 55, '1737516468_CASE (เคส) HYTE Y70 TOUCH INFINITE (BLACKBLACK)(E-ATX)(3Y) 2.jpg', '2025-01-22 10:27:48'),
(155, 55, '1737516473_CASE (เคส) HYTE Y70 TOUCH INFINITE (BLACKBLACK)(E-ATX)(3Y) 3.jpg', '2025-01-22 10:27:53'),
(156, 55, '1737516476_CASE (เคส) HYTE Y70 TOUCH INFINITE (BLACKBLACK)(E-ATX)(3Y) 4.jpg', '2025-01-22 10:27:56'),
(157, 56, '1737516607_CASE (เคส) HYTE Y70 TOUCH INFINITE 1.jpg', '2025-01-22 10:30:07'),
(158, 56, '1737516611_CASE (เคส) HYTE Y70 TOUCH INFINITE 2.jpg', '2025-01-22 10:30:11'),
(159, 56, '1737516617_CASE (เคส) HYTE Y70 TOUCH INFINITE 3.jpg', '2025-01-22 10:30:17'),
(160, 57, '1737516748_CASE (เคส) SAMA GZS BLACK (ATX) 1.jpg', '2025-01-22 10:32:28'),
(161, 57, '1737516752_CASE (เคส) SAMA GZS BLACK (ATX) 2.jpg', '2025-01-22 10:32:32'),
(162, 57, '1737516757_CASE (เคส) SAMA GZS BLACK (ATX) 3.jpg', '2025-01-22 10:32:37'),
(163, 57, '1737516761_CASE (เคส) SAMA GZS BLACK (ATX) 4.jpg', '2025-01-22 10:32:41'),
(164, 58, '1737563317_CASE (เคส) iHAVECPU INFINITY MINI 1.jpg', '2025-01-22 23:28:37'),
(165, 58, '1737563321_CASE (เคส) iHAVECPU INFINITY MINI 2.jpg', '2025-01-22 23:28:41'),
(166, 59, '1737564634_CASE (เคส) iHAVECPU IHC 401TG (WHITE)(ATX) 1.jpg', '2025-01-22 23:50:34'),
(167, 59, '1737564638_CASE (เคส) iHAVECPU IHC 401TG (WHITE)(ATX) 2.jpg', '2025-01-22 23:50:38'),
(168, 60, '1737564741_CASE (เคส) GIGABYTE C102 GLASS ICE 1.jpg', '2025-01-22 23:52:21'),
(169, 60, '1737564745_CASE (เคส) GIGABYTE C102 GLASS ICE 2.jpg', '2025-01-22 23:52:25'),
(170, 60, '1737564749_CASE (เคส) GIGABYTE C102 GLASS ICE 3.jpg', '2025-01-22 23:52:29'),
(171, 60, '1737564754_CASE (เคส) GIGABYTE C102 GLASS ICE 4.jpg', '2025-01-22 23:52:34'),
(172, 61, '1737596484_LIQUID COOLER (ชุดน้ำปิด) ASUS ROG RYUJIN III 360 ARGB EXTREME 1.jpg', '2025-01-23 08:41:24'),
(173, 61, '1737596488_LIQUID COOLER (ชุดน้ำปิด) ASUS ROG RYUJIN III 360 ARGB EXTREME 2.jpg', '2025-01-23 08:41:28'),
(174, 61, '1737596492_LIQUID COOLER (ชุดน้ำปิด) ASUS ROG RYUJIN III 360 ARGB EXTREME 3.jpg', '2025-01-23 08:41:32'),
(175, 61, '1737596496_LIQUID COOLER (ชุดน้ำปิด) ASUS ROG RYUJIN III 360 ARGB EXTREME 4.jpg', '2025-01-23 08:41:36'),
(176, 62, '1737596701_LIQUID COOLER (ชุดน้ำปิด) TRYX PANORAMA AIO 360 ARGB 1.jpg', '2025-01-23 08:45:01'),
(177, 62, '1737596705_LIQUID COOLER (ชุดน้ำปิด) TRYX PANORAMA AIO 360 ARGB 2.jpg', '2025-01-23 08:45:05'),
(178, 62, '1737596710_LIQUID COOLER (ชุดน้ำปิด) TRYX PANORAMA AIO 360 ARGB 3.jpg', '2025-01-23 08:45:10'),
(179, 63, '1737597035_FAN (พัดลม) COOLER MASTER MASTERFAN MF120 HALO2 3IN1 1.jpg', '2025-01-23 08:50:35'),
(180, 63, '1737597040_FAN (พัดลม) COOLER MASTER MASTERFAN MF120 HALO2 3IN1 2.jpg', '2025-01-23 08:50:40'),
(181, 63, '1737597044_FAN (พัดลม) COOLER MASTER MASTERFAN MF120 HALO2 3IN1 3.jpg', '2025-01-23 08:50:44'),
(182, 63, '1737597049_FAN (พัดลม) COOLER MASTER MASTERFAN MF120 HALO2 3IN1 4.jpg', '2025-01-23 08:50:49'),
(183, 64, '1737597169_LIQUID COOLER (ชุดน้ำปิด) ID-COOLING SL240 WHITE 1.jpg', '2025-01-23 08:52:49'),
(184, 64, '1737597173_LIQUID COOLER (ชุดน้ำปิด) ID-COOLING SL240 WHITE 2.jpg', '2025-01-23 08:52:53'),
(185, 64, '1737597178_LIQUID COOLER (ชุดน้ำปิด) ID-COOLING SL240 WHITE 3.jpg', '2025-01-23 08:52:58'),
(186, 64, '1737597182_LIQUID COOLER (ชุดน้ำปิด) ID-COOLING SL240 WHITE 4.jpg', '2025-01-23 08:53:02'),
(187, 65, '1737597447_SILICONE (ซิลิโคน) ARCTIC THERMAL MX-6 2G 1.jpg', '2025-01-23 08:57:27'),
(188, 65, '1737597453_SILICONE (ซิลิโคน) ARCTIC THERMAL MX-6 2G 2.jpg', '2025-01-23 08:57:33'),
(189, 67, '1737597950_MONITOR (จอมอนิเตอร์) BENQ ZOWIE XL2566X+ 24.1 TN FHD 1.jpg', '2025-01-23 09:05:50'),
(190, 67, '1737597955_MONITOR (จอมอนิเตอร์) BENQ ZOWIE XL2566X+ 24.1 TN FHD 2.jpg', '2025-01-23 09:05:55'),
(191, 67, '1737597960_MONITOR (จอมอนิเตอร์) BENQ ZOWIE XL2566X+ 24.1 TN FHD 3.jpg', '2025-01-23 09:06:00'),
(192, 67, '1737597964_MONITOR (จอมอนิเตอร์) BENQ ZOWIE XL2566X+ 24.1 TN FHD 4.jpg', '2025-01-23 09:06:04'),
(193, 68, '1737598108_MONITOR (จอมอนิเตอร์) DAHUA LM27-B200S - 27 VA FHD 100Hz 1.jpg', '2025-01-23 09:08:28'),
(194, 68, '1737598112_MONITOR (จอมอนิเตอร์) DAHUA LM27-B200S - 27 VA FHD 100Hz 2.jpg', '2025-01-23 09:08:32'),
(195, 68, '1737598116_MONITOR (จอมอนิเตอร์) DAHUA LM27-B200S - 27 VA FHD 100Hz 3.jpg', '2025-01-23 09:08:36'),
(196, 68, '1737598122_MONITOR (จอมอนิเตอร์) DAHUA LM27-B200S - 27 VA FHD 100Hz 4.jpg', '2025-01-23 09:08:42'),
(197, 69, '1737600551_MONITOR (จอมอนิเตอร์) LG ULTRAGEAR 32GS85Q-B - 31.5 NANO IPS 2K 180Hz 1.jpg', '2025-01-23 09:49:11'),
(198, 69, '1737600556_MONITOR (จอมอนิเตอร์) LG ULTRAGEAR 32GS85Q-B - 31.5 NANO IPS 2K 180Hz 2.jpg', '2025-01-23 09:49:16'),
(199, 69, '1737600560_MONITOR (จอมอนิเตอร์) LG ULTRAGEAR 32GS85Q-B - 31.5 NANO IPS 2K 180Hz 3.jpg', '2025-01-23 09:49:20'),
(200, 69, '1737600564_MONITOR (จอมอนิเตอร์) LG ULTRAGEAR 32GS85Q-B - 31.5 NANO IPS 2K 180Hz 4.jpg', '2025-01-23 09:49:24'),
(201, 70, '1737600711_MONITOR (จอมอนิเตอร์) LG 34WQ75C-B - 34 IPS 2K CURVED 60Hz 1..jpg', '2025-01-23 09:51:51'),
(202, 70, '1737600715_MONITOR (จอมอนิเตอร์) LG 34WQ75C-B - 34 IPS 2K CURVED 60Hz 2.jpg', '2025-01-23 09:51:55'),
(203, 70, '1737600720_MONITOR (จอมอนิเตอร์) LG 34WQ75C-B - 34 IPS 2K CURVED 60Hz 3.jpg', '2025-01-23 09:52:00'),
(204, 70, '1737600724_MONITOR (จอมอนิเตอร์) LG 34WQ75C-B - 34 IPS 2K CURVED 60Hz 4.jpg', '2025-01-23 09:52:04'),
(205, 71, '1737601066_MONITOR (จอมอนิเตอร์) LG 24MR400-B - 23.8 IPS 100Hz 1.jpg', '2025-01-23 09:57:46'),
(206, 71, '1737601070_MONITOR (จอมอนิเตอร์) LG 24MR400-B - 23.8 IPS 100Hz 2.jpg', '2025-01-23 09:57:50'),
(207, 71, '1737601074_MONITOR (จอมอนิเตอร์) LG 24MR400-B - 23.8 IPS 100Hz 3.jpg', '2025-01-23 09:57:54'),
(208, 71, '1737601078_MONITOR (จอมอนิเตอร์) LG 24MR400-B - 23.8 IPS 100Hz 4.jpg', '2025-01-23 09:57:58'),
(210, 72, '1737601220_MONITOR (จอมอนิเตอร์) AOC 24G11E67 - 23.8 IPS FHD 180Hz (3Y) 2.jpg', '2025-01-23 10:00:20'),
(211, 72, '1737601225_MONITOR (จอมอนิเตอร์) AOC 24G11E67 - 23.8 IPS FHD 180Hz (3Y) 3.jpg', '2025-01-23 10:00:25'),
(213, 74, '1737601713_KEYBOARD (คีย์บอร์ด) ASUS ROG AZOTH (WHITE) (RED SWITCH) (TH) (2Y) 1.jpg', '2025-01-23 10:08:33'),
(214, 74, '1737601718_KEYBOARD (คีย์บอร์ด) ASUS ROG AZOTH (WHITE) (RED SWITCH) (TH) (2Y) 2.jpg', '2025-01-23 10:08:38'),
(215, 74, '1737601722_KEYBOARD (คีย์บอร์ด) ASUS ROG AZOTH (WHITE) (RED SWITCH) (TH) (2Y) 3.jpg', '2025-01-23 10:08:42'),
(216, 74, '1737601726_KEYBOARD (คีย์บอร์ด) ASUS ROG AZOTH (WHITE) (RED SWITCH) (TH) (2Y) 4.jpg', '2025-01-23 10:08:46'),
(217, 76, '1737602415_KEYBOARD (คีย์บอร์ด) CORSAIR K65 PLUS WIRELESS (CORSAIR MLX FUSION TACTILE SWITCH) 1.jpg', '2025-01-23 10:20:15'),
(218, 76, '1737602420_KEYBOARD (คีย์บอร์ด) CORSAIR K65 PLUS WIRELESS (CORSAIR MLX FUSION TACTILE SWITCH) 2.jpg', '2025-01-23 10:20:20'),
(219, 76, '1737602424_KEYBOARD (คีย์บอร์ด) CORSAIR K65 PLUS WIRELESS (CORSAIR MLX FUSION TACTILE SWITCH) 3.jpg', '2025-01-23 10:20:24'),
(220, 76, '1737602428_KEYBOARD (คีย์บอร์ด) CORSAIR K65 PLUS WIRELESS (CORSAIR MLX FUSION TACTILE SWITCH) 4.jpg', '2025-01-23 10:20:28'),
(221, 77, '1737602561_KEYBOARD (คีย์บอร์ด) ROCCAT VULCAN TKL AIMO TH (RED SWITCH) (ROC-12-286) 1.jpg', '2025-01-23 10:22:41'),
(222, 77, '1737602565_KEYBOARD (คีย์บอร์ด) ROCCAT VULCAN TKL AIMO TH (RED SWITCH) (ROC-12-286) 2.jpg', '2025-01-23 10:22:45'),
(223, 78, '1737603383_KEYBOARD (คีย์บอร์ด) AULA F98 PRO (BLACK) 3IN1 WIRELESS [ICE CRYSTAL SWITCH] (ENTH) 1.jpg', '2025-01-23 10:36:23'),
(224, 78, '1737603387_KEYBOARD (คีย์บอร์ด) AULA F98 PRO (BLACK) 3IN1 WIRELESS [ICE CRYSTAL SWITCH] (ENTH) 2.jpg', '2025-01-23 10:36:27'),
(225, 78, '1737603391_KEYBOARD (คีย์บอร์ด) AULA F98 PRO (BLACK) 3IN1 WIRELESS [ICE CRYSTAL SWITCH] (ENTH) 4.jpg', '2025-01-23 10:36:31'),
(226, 79, '1737603623_KEYBOARD (คีย์บอร์ด) ROCCAT MAGMA MEMBRANE TH (ROC-12-590) 1.jpg', '2025-01-23 10:40:23'),
(227, 79, '1737603627_KEYBOARD (คีย์บอร์ด) ROCCAT MAGMA MEMBRANE TH (ROC-12-590) 2.jpg', '2025-01-23 10:40:27'),
(228, 79, '1737603632_KEYBOARD (คีย์บอร์ด) ROCCAT MAGMA MEMBRANE TH (ROC-12-590) 3.jpg', '2025-01-23 10:40:32'),
(229, 79, '1737603635_KEYBOARD (คีย์บอร์ด) ROCCAT MAGMA MEMBRANE TH (ROC-12-590) 4.jpg', '2025-01-23 10:40:35'),
(230, 80, '1737603828_KEYBOARD (คีย์บอร์ด) MOFII SWEET K WIRED RETRO KEYBOARD (DARKBLUE) (ENTH) 1.jpg', '2025-01-23 10:43:48'),
(231, 81, '1737603948_KEYBOARD (คีย์บอร์ด) FANTECH K514 (ENTH) 1.jpg', '2025-01-23 10:45:48'),
(232, 81, '1737603952_KEYBOARD (คีย์บอร์ด) FANTECH K514 (ENTH) 2.jpg', '2025-01-23 10:45:52'),
(233, 81, '1737603955_KEYBOARD (คีย์บอร์ด) FANTECH K514 (ENTH) 3.jpg', '2025-01-23 10:45:55'),
(234, 82, '1737604026_KEYBOARD (คีย์บอร์ด) NEOLUTION E-SPORT CANDY (ORANGE-GREEN-BLUE) (ENTH) 1.jpg', '2025-01-23 10:47:06'),
(235, 83, '1737604240_MOUSE (เมาส์) PULSAR XLITE V4 QUICCS EDITION MEDIUM 1.jpg', '2025-01-23 10:50:40'),
(236, 83, '1737604244_MOUSE (เมาส์) PULSAR XLITE V4 QUICCS EDITION MEDIUM 2.jpg', '2025-01-23 10:50:44'),
(237, 83, '1737604248_MOUSE (เมาส์) PULSAR XLITE V4 QUICCS EDITION MEDIUM 3.jpg', '2025-01-23 10:50:48'),
(238, 83, '1737604252_MOUSE (เมาส์) PULSAR XLITE V4 QUICCS EDITION MEDIUM 4.jpg', '2025-01-23 10:50:52'),
(239, 84, '1737609674_MOUSE (เมาส์) STEELSERIES AEROX 9 WIRELESS MOUSE WORLD OF WARCRAFT (BLACKGOLD) 1.jpg', '2025-01-23 12:21:14'),
(240, 85, '1737609815_MOUSE (เมาส์) GLORIOUS MODEL D 2 PRO 4K8KHz EDITION WIRELESS (BLACK) 1.jpg', '2025-01-23 12:23:35'),
(241, 85, '1737609821_MOUSE (เมาส์) GLORIOUS MODEL D 2 PRO 4K8KHz EDITION WIRELESS (BLACK) 2.jpg', '2025-01-23 12:23:41'),
(242, 85, '1737609825_MOUSE (เมาส์) GLORIOUS MODEL D 2 PRO 4K8KHz EDITION WIRELESS (BLACK) 3.jpg', '2025-01-23 12:23:45'),
(243, 86, '1737609928_MOUSE (เมาส์) ONIKUMA OKAMI DUAL MODE GAMING MOUSE  BLACK 1.jpg', '2025-01-23 12:25:28'),
(244, 86, '1737609933_MOUSE (เมาส์) ONIKUMA OKAMI DUAL MODE GAMING MOUSE  BLACK 2.jpg', '2025-01-23 12:25:33'),
(245, 86, '1737609937_MOUSE (เมาส์) ONIKUMA OKAMI DUAL MODE GAMING MOUSE  BLACK 4.jpg', '2025-01-23 12:25:37'),
(246, 87, '1737610050_MOUSE (เมาส์) MOFII COCO 2.4G WIRELESS WITH SILENT MOUSE (OFFWHITE) 1.jpg', '2025-01-23 12:27:30'),
(247, 87, '1737610055_MOUSE (เมาส์) MOFII COCO 2.4G WIRELESS WITH SILENT MOUSE (OFFWHITE) 2.jpg', '2025-01-23 12:27:35'),
(248, 88, '1737610182_MOUSE (เมาส์) MOFII RABBIT 2.4G WIRELESS MOUSE (PINK) 1.jpg', '2025-01-23 12:29:42'),
(249, 88, '1737610186_MOUSE (เมาส์) MOFII RABBIT 2.4G WIRELESS MOUSE (PINK) 2.jpg', '2025-01-23 12:29:46'),
(250, 88, '1737610191_MOUSE (เมาส์) MOFII RABBIT 2.4G WIRELESS MOUSE (PINK) 3.jpg', '2025-01-23 12:29:51'),
(251, 89, '1737610280_MOUSE (เมาส์) FANTECH WG9 KANATA WIRELESS (BLACK) 1.jpg', '2025-01-23 12:31:20'),
(252, 89, '1737610285_MOUSE (เมาส์) FANTECH WG9 KANATA WIRELESS (BLACK) 2.jpg', '2025-01-23 12:31:25');

-- --------------------------------------------------------

--
-- Table structure for table `tb_type_product`
--

CREATE TABLE `tb_type_product` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `created_datetime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_type_product`
--

INSERT INTO `tb_type_product` (`id`, `title`, `created_datetime`) VALUES
(1, 'คอมพิวเตอร์', '2024-12-15 09:42:06'),
(2, 'โน๊คบุ๊ค', '2024-12-15 09:42:16'),
(3, 'ซีพียู', '2024-12-15 09:42:23'),
(4, 'เมนบอร์ด', '2025-01-13 09:03:08'),
(5, 'การ์ดจอ', '2025-01-19 09:54:26'),
(6, 'แรม', '2025-01-19 09:54:43'),
(7, 'ฮาร์ดดิสก์ และ เอสเอสดี', '2025-01-19 09:55:19'),
(8, 'พาวเวอร์ซัพพลาย', '2025-01-19 09:55:33'),
(9, 'เคส', '2025-01-19 09:56:04'),
(10, 'ชุดระบายความร้อน', '2025-01-19 09:56:16'),
(11, 'จอมอนิเตอร์', '2025-01-19 09:56:29'),
(12, 'คีย์บอร์ด', '2025-01-19 09:56:43'),
(13, 'เมาส์', '2025-01-19 09:56:57');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `birthday` date NOT NULL,
  `age` int(11) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `user` varchar(500) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `status` int(11) NOT NULL,
  `created_datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL,
  `LINE` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `firstname`, `lastname`, `gender`, `birthday`, `age`, `address`, `email`, `phone`, `user`, `pass`, `status`, `created_datetime`, `image`, `LINE`) VALUES
(1, 'userpoom', 'poom', 'ชาย', '0000-00-00', 25, '315/2 หมู่ 2 ตำบล.เสาธง	จ.นคร', 'userpoom@gmail.com', '03698522744', 'userpoom', '123456', 0, '2025-01-20 20:15:21', NULL, 'userpoom'),
(2, 'poomshop', 'shop000', 'หญิง', '0000-00-00', 222, 'หมู่ 002 555', 'poomshop@gmail.com', '0', 'poomshop', '123456', 0, '2025-01-23 12:37:27', NULL, 'poom'),
(3, 'userE', 'EEE', 'ชาย', '0000-00-00', 20, 'หมู่ 002', 'userE@gmail.com', '2536', 'userE', '123456', 0, '2025-01-26 18:40:33', NULL, 'userE'),
(4, 'userV', 'VVV', 'ชาย', '0000-00-00', 25, '315/2 หมู่ 2 ตำบล.เสาธง	จ.นคร', 'userV@gmail.com', '1234567890', 'userV', '123456', 0, '2025-01-26 18:53:54', NULL, 'userV'),
(5, 'User111', '111', 'ชาย', '0000-00-00', 111, '315/2 หมู่ 2 ตำบล.เสาธง	จ.นคร', 'User111@gmail.com', '1234567890', 'User111', '123456', 0, '2025-01-28 14:12:37', NULL, 'User111'),
(6, 'Opoom', '002', 'ชาย', '0000-00-00', 23, '555 หมู่ 2 ตำบล.เสาธง	จ.อยุธยา', 'Opoom@gmail.com', '0326598', 'Opoom', '123456', 0, '2025-01-31 14:18:59', NULL, 'Opoom002'),
(7, 'Opoom002', '002', 'ชาย', '0000-00-00', 23, '315/2 หมู่ 2 ตำบล.เสาธง	จ.นคร', 'Opoom@gmail.com', '0326598', 'Opoom002', '123456', 0, '2025-01-31 14:34:59', NULL, 'Opoom002');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_about`
--
ALTER TABLE `tb_about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_order`
--
ALTER TABLE `tb_order`
  ADD PRIMARY KEY (`orderID`);

--
-- Indexes for table `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_product_gallery`
--
ALTER TABLE `tb_product_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_type_product`
--
ALTER TABLE `tb_type_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ลำดับที่', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_about`
--
ALTER TABLE `tb_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `tb_order`
--
ALTER TABLE `tb_order`
  MODIFY `orderID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT COMMENT 'เลขที่ใบสั่งซื้อ', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `tb_product_gallery`
--
ALTER TABLE `tb_product_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `tb_type_product`
--
ALTER TABLE `tb_type_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
