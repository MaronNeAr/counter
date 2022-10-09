-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2022-10-08 21:21:47
-- 服务器版本： 5.6.50-log
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `counter`
--

-- --------------------------------------------------------

--
-- 表的结构 `commodity`
--

CREATE TABLE IF NOT EXISTS `commodity` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  `discount` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `img_src` varchar(45) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `commodity`
--

INSERT INTO `commodity` (`id`, `name`, `detail`, `discount`, `price`, `count`, `img_src`, `cid`) VALUES
(1, '新园盖浇饭', 'NULL', '-2', 10, 10, 'xy5.jpg', 1),
(2, '新园卤肉饭', 'NULL', '0', 13, 100, 'xy1.jpg', 1),
(3, '新园小碗菜(荤)', 'NULL', '-1', 10, 100, 'xwc1.jpg', 1),
(4, '新园小碗菜(素)', 'NULL', '1', 6, 100, 'xwc2.jpg', 1),
(5, '新园拉面', 'NULL', '0', 14, 100, 'xylm.jpg', 1),
(6, '新园牛排', 'NULL', '80', 30, 100, 'xy3.jpg', 1),
(7, '新园炸鸡柳', 'NULL', '0', 17, 100, 'xy2.jpg', 1),
(8, '新园快餐(荤)', 'NULL', '0', 6, 100, 'xy4.jpg', 1),
(9, '新园快餐(素)', 'NULL', '0', 3, 100, 'xy6.jpg', 1),
(10, '新园水果捞', 'NULL', '0', 12, 100, 'xysgl.jpg', 1),
(11, '清真快餐(素)', 'NULL', '0', 3, 10, 'qz1.jpg', 1),
(12, '清真快餐(荤)', 'NULL', '0', 6, 100, 'qz2.jpg', 1),
(13, '清真拉面', 'NULL', '-2', 12, 100, 'qzlm.jpg', 1),
(14, '清真拌面', 'NULL', '-2', 12, 100, 'qxcybm.jpg', 1),
(15, '清真盖浇饭', 'NULL', '80', 15, 100, 'qzgjf.jpg', 1),
(16, '清真刀削面', 'NULL', '90', 14, 100, 'qzdxm.jpg', 1),
(17, '清真烤串', 'NULL', '-3', 5, 100, 'qzkc.jpg', 1),
(18, '清真水饺', 'NULL', '0', 10, 100, 'qzsj.jpg', 1),
(19, '清真肉夹馍', 'NULL', '0', 6, 100, 'qzrjm.jpg', 1),
(20, '绿叶玉米', 'NULL', '-2', 6, 100, 'lyym.jpg', 1),
(21, '绿叶烤肠', 'NULL', '-1', 4, 100, 'lykc.jpg', 1),
(22, '绿叶辛拉面', 'NULL', '85', 12, 100, 'lylm.jpg', 1),
(23, '绿叶黄焖鸡', 'NULL', '90', 14, 100, 'lyhmj.jpg', 1),
(24, '绿叶水果拼盘', 'NULL', '90', 18, 100, 'lysgpp.jpg', 1),
(25, '绿叶华夫饼', 'NULL', '-2', 8, 100, 'lyhfb.jpg', 1),
(26, '绿叶快餐(荤)', 'NULL', '0', 6, 100, 'xy1.jpg', 1),
(27, '绿叶快餐(素)', 'NULL', '0', 3, 100, 'xy2.jpg', 1),
(28, '绿叶烧鸭饭', 'NULL', '0', 14, 100, 'lykyf.jpg', 1),
(29, '绿叶砂锅', 'NULL', '90', 12, 100, 'lysg.jpg', 1),
(30, '绿叶水果捞', 'NULL', '0', 12, 100, 'lysgl.jpg', 1),
(31, '新食堂铁板饭', 'NULL', '0', 15, 100, 'xsttbf.jpg', 1),
(32, '新食堂拉面', 'NULL', '-2', 10, 100, 'xstlm.jpg', 1),
(33, '新食堂小馄饨', 'NULL', '0', 4, 100, 'xsthd.jpg', 1),
(34, '新食堂抄手', 'NULL', '0', 8, 100, 'xstcs.jpg', 1),
(35, '新食堂米粉', 'NULL', '0', 14, 100, 'xstmf.jpg', 1),
(36, '新食堂麻辣烫', 'NULL', '90', 18.9, 100, 'xstmlt.jpg', 1),
(37, '新食堂三明治', 'NULL', '0', 9, 100, 'xstsmz.jpg', 1),
(38, '新食堂水果捞', 'NULL', '0', 12, 100, 'xstsgl.jpg', 1),
(39, '新食堂快餐(荤)', 'NULL', '0', 5, 100, 'qz1.jpg', 1),
(40, '新食堂快餐(素)', 'NULL', '0', 3, 100, 'qz2.jpg', 1),
(41, '新食堂小碗菜(荤)', 'NULL', '-2', 10, 100, 'xwc1.jpg', 1),
(42, '新食堂小碗菜(素)', 'NULL', '-1', 6, 100, 'xwc2.jpg', 1),
(43, '新食堂铁板烧', 'NULL', '0', 16, 100, 'xsttbs.jpg', 1),
(44, '康师傅鲜虾鱼板面', 'NULL', '-1', 4.8, 100, 'xxybm.jpg', 2),
(45, '冰红茶', 'NULL', '0', 3.5, 100, 'bhc.jpg', 2),
(46, '肥宅快乐水', 'NULL', '90', 3.8, 100, 'cocacola.jpg', 2),
(47, '卷纸', 'NULL', '0', 5, 100, 'cz.jpg', 2),
(48, '乐事薯片', 'NULL', '0', 7, 100, 'crisp.jpg', 2),
(49, '喜之郎果冻', 'NULL', '0', 4.5, 100, 'jelly.jpg', 2),
(50, '德芙巧克力', 'NULL', '80', 9, 100, 'chocolate.jpg', 2),
(51, '三明治', 'NULL', '80', 7.8, 100, 'sandwhich.jpg', 2),
(52, '盒饭', 'NULL', '75', 14.8, 100, 'hefan.jpg', 2),
(53, '寿司', 'NULL', '90', 10.8, 100, 'sushi.jpg', 2),
(54, '酸奶', 'NULL', '-2', 9.8, 100, 'yogurt.jpg', 2),
(55, '牛奶', 'NULL', '-1', 4, 100, 'milk.jpg', 2),
(56, '罐装咖啡', 'NULL', '-2', 7, 100, 'coffee_1.jpg', 2),
(57, '瓶装咖啡', 'NULL', '-2', 6, 100, 'coffee_2.jpg', 2),
(58, '元气森林', 'NULL', '0', 6, 100, 'yqsl.jpg', 2),
(59, '绿茶', 'NULL', '0', 5, 100, 'greentea.jpg', 2),
(60, '乌龙茶', 'NULL', '0', 5, 100, 'uloog.jpg', 2),
(61, '红茶', 'NULL', '0', 5, 100, 'blacktea.jpg', 2),
(62, '茉莉花茶', 'NULL', '0', 5, 100, 'jasmine.jpg', 2),
(63, '青柑普洱', 'NULL', '0', 5, 100, 'puer.jpg', 2),
(64, '茉莉蜜茶', 'NULL', '0', 4, 100, 'jasmine_2.jpg', 2),
(65, '芬达', 'NULL', '0', 4, 100, 'fenda.jpg', 2),
(66, '雪碧', 'NULL', '0', 4, 100, 'xuebi.jpg', 2),
(67, '美年达', 'NULL', '0', 4, 100, 'meinianda.jpg', 2),
(68, '瓶装水', 'NULL', '0', 2, 100, 'watersmall.jpg', 2),
(69, '桶装水', 'NULL', '-1', 10, 100, 'waterbig.jpg', 2),
(70, '面包', 'NULL', '0', 5.5, 100, 'bread.jpg', 2),
(71, '自热米饭', 'NULL', '90', 13.8, 100, 'rice.jpg', 2),
(72, '味全杨梅汁', 'NULL', '-3', 6.9, 100, 'juice_1.jpg', 2),
(73, '味全草莓汁', 'NULL', '-3', 6.9, 100, 'juice_2.jpg', 2),
(74, '味全葡萄汁', 'NULL', '-3', 6.9, 100, 'juice_3.jpg', 2),
(75, '味全橙汁', 'NULL', '-3', 6.9, 100, 'juice_4.jpg', 2),
(76, '味全椰汁', 'NULL', '-3', 6.9, 100, 'juice_5.jpg', 2),
(77, '味全苹果汁', 'NULL', '-3', 6.9, 100, 'juice_6.jpg', 2),
(78, '好丽友巧克力派', 'NULL', '-2', 12.8, 100, 'pie.jpg', 2),
(79, '经管机', 'NULL', '90', 78.6, 100, 'jgj.jpg', 3),
(80, '企业管理战略教程', 'NULL', '0', 50, 100, 'qygl.jpg', 3),
(81, 'ERP综合实验', 'NULL', '0', 56, 100, 'ERP.jpg', 3),
(82, '运营管理', 'NULL', '0', 35, 100, 'yygl.jpg', 3),
(83, '产业组织导论', 'NULL', '80', 35, 100, 'cyzz.jpg', 3),
(84, '计算机组成与系统结构', 'NULL', '90', 54, 100, 'jsjzc.jpg', 3),
(85, '数据库系统概论', 'NULL', '-4', 36, 100, 'sjk.jpg', 3),
(86, '管理会计', 'NULL', '90', 47, 100, 'glkj.jpg', 3),
(87, '财务报表分析', 'NULL', '80', 27, 100, 'cwbbfx.jpg', 3),
(88, '国际金融', 'NULL', '95', 58, 100, 'gjjr.jpg', 3),
(89, '货币金融学', 'NULL', '0', 39, 100, 'hbjrx.jpg', 3),
(90, '博迪投资学', 'NULL', '0', 56, 100, 'bdtzx.jpg', 3),
(91, '公司理财', 'NULL', '-5', 89, 100, 'gslc.jpg', 3),
(92, '计算机组成原理', 'NULL', '0', 59, 100, 'jsjzcyl.jpg', 3),
(93, 'Python语言程序设计', 'NULL', '90', 78, 100, 'python.jpg', 3),
(94, '概率论与数理统计', 'NULL', '80', 92, 100, 'gll.jpg', 3),
(95, '马克思基本主义原理', 'NULL', '-3', 38, 100, 'mks.jpg', 3),
(96, '离散数学及其应用', 'NULL', '80', 58, 100, 'lssx.jpg', 3),
(97, '中国近代史纲要', 'NULL', '90', 39, 100, 'jg.jpg', 3),
(98, '思想道德与法治', 'NULL', '95', 39, 100, 'sxdd.jpg', 3),
(99, '毛泽东思想和中国特色主义理论体系概论', 'NULL', '0', 47, 100, 'mg.jpg', 3),
(100, '管理学', 'NULL', '70', 63, 100, 'glx.jpg', 3),
(101, '运筹学', 'NULL', '0', 71, 100, 'ycx.jpg', 3),
(102, '市场营销学', 'NULL', '0', 39, 100, 'scyxx.jpg', 3),
(103, 'CRAZY 4', 'NULL', '-10', 40, 100, 'crazy4.jpg', 4),
(104, '金拱门', 'NULL', '0', 12.9, 100, 'mdl.jpg', 4),
(105, '上海欢乐谷', 'NULL', '240', 80, 1, 'hlg.jpg', 4),
(106, '耶里夏丽', ' NULL', '0', 90, 1, 'ylxl.jpg', 4),
(107, '海底捞', ' NULL', '69', 100, 1, 'hdl.jpg', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commodity`
--
ALTER TABLE `commodity`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commodity`
--
ALTER TABLE `commodity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=109;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
