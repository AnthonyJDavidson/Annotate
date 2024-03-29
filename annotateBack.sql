-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 19, 2015 at 04:06 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `annotateBack`
--

-- --------------------------------------------------------

--
-- Table structure for table `annotations`
--

CREATE TABLE IF NOT EXISTS `annotations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `doc_id` int(11) NOT NULL,
  `paragraph_id` varchar(60) NOT NULL,
  `line_id` varchar(60) NOT NULL,
  `annotation` mediumtext NOT NULL,
  `words_Covered` mediumtext NOT NULL,
  `a_text` mediumtext NOT NULL,
  `tags` varchar(60) NOT NULL DEFAULT 'None',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=136 ;

--
-- Dumping data for table `annotations`
--

INSERT INTO `annotations` (`id`, `user_id`, `doc_id`, `paragraph_id`, `line_id`, `annotation`, `words_Covered`, `a_text`, `tags`, `created_at`, `updated_at`, `deleted_at`) VALUES
(108, 10, 19, 'paragraph5', 'line1,line2,line3,line4,', 'Really?', '0,1,2,3,:0,1,2,3,4,5,:0,1,2,3,4,:0,1,2,3,4,5,6,', 'All night your moth-breath\nFlickers among the flat pink roses.\nI wake to listen:\nA far sea moves in my ear.', 'Test ', '2015-03-13 02:23:06', '2015-03-18 16:59:47', '2015-03-18 16:59:47'),
(109, 10, 19, 'paragraph4', 'line1,line2,line3,', 'Changed Annotation', '0,1,2,3,4,:0,1,2,3,4,5,6,7,8,9,10,11,:0,1,2,3,4,', 'I''m no more your mother\nThan the cloud that distills a mirror to reflect its own slow\nEffacement at the wind''s hand.', 'changedTag 1', '2015-03-13 03:06:13', '2015-03-13 13:27:37', '2015-03-13 13:27:37'),
(111, 10, 19, 'paragraph5', 'line1,', 'nested test', '3,', 'moth-breath', 'test', '2015-03-13 03:25:43', '2015-03-13 13:47:22', '2015-03-13 13:47:22'),
(112, 10, 19, 'paragraph6', 'line1,line2,', 'AAA', '3,4,5,6,7,8,9,:0,1,2,', 'I stumble from bed, cow-heavy and floral\nIn my Victorian', 'Test', '2015-03-13 03:31:23', '2015-03-19 13:51:51', '2015-03-19 13:51:51'),
(113, 10, 19, 'paragraph6', 'line1,', 'silly description', '7,8,9,', 'cow-heavy and floral', 'description', '2015-03-13 12:03:53', '2015-03-19 13:51:50', '2015-03-19 13:51:50'),
(114, 10, 19, 'paragraph6', 'line1,', 'what does this mean...', '7,', 'cow-heavy', 'description', '2015-03-13 12:04:08', '2015-03-19 13:51:49', '2015-03-19 13:51:49'),
(115, 10, 19, 'paragraph6', 'line1,', 'more', '7,', 'cow-heavy', 'Test', '2015-03-13 12:09:51', '2015-03-19 13:51:52', '2015-03-19 13:51:52'),
(116, 10, 19, 'paragraph6', 'line1,', 'more', '7,', 'cow-heavy', 'test', '2015-03-13 12:10:03', '2015-03-18 19:04:16', '2015-03-18 19:04:16'),
(117, 10, 19, 'paragraph1', 'line1,line2,', 'Annotation', '0,1,2,3,4,5,6,7,8,:0,1,2,3,4,5,', 'The midwife slapped your footsoles, and your bald cry\nTook its place among the elements', 'Annnnn', '2015-03-13 12:13:30', '2015-03-18 16:59:43', '2015-03-18 16:59:43'),
(118, 10, 19, 'paragraph1', 'line2,', 'description?', '0,1,2,3,4,5,', 'Took its place among the elements.', 'description', '2015-03-13 12:13:48', '2015-03-19 13:51:53', '2015-03-19 13:51:53'),
(119, 10, 19, 'paragraph1', 'line2,', 'testing', '2,3,4,5,', 'place among the elements.', 'test', '2015-03-13 12:14:25', '2015-03-19 13:51:55', '2015-03-19 13:51:55'),
(120, 10, 19, 'paragraph1', 'line2,', 'more testing', '4,5,', 'the elements.', 'test ', '2015-03-13 12:14:39', '2015-03-19 13:51:56', '2015-03-19 13:51:56'),
(121, 10, 19, 'paragraph3', 'line1,', 'description', '2,3,', 'drafty museum', 'description', '2015-03-13 12:19:10', '2015-03-13 13:47:40', '2015-03-13 13:47:40'),
(122, 10, 19, 'paragraph3', 'line1,', 'oldness', '3,', 'museum', 'description', '2015-03-13 12:19:21', '2015-03-19 13:51:58', '2015-03-19 13:51:58'),
(123, 10, 19, 'paragraph8', 'line1,', 'what', '0,1,2,', 'Whitens and swallows', 'description', '2015-03-13 13:13:01', '2015-03-19 13:51:59', '2015-03-19 13:51:59'),
(124, 10, 19, 'paragraph3', 'line1,', 'Description', '2,3,', 'drafty museum,', 'description', '2015-03-13 13:48:37', '2015-03-13 13:50:39', '2015-03-13 13:50:39'),
(125, 10, 19, 'paragraph3', 'line1,', 'descrip', '2,3,', 'drafty museum,', 'description', '2015-03-13 13:50:57', '2015-03-13 13:51:04', '2015-03-13 13:51:04'),
(126, 10, 19, 'paragraph2', 'line1,', 'new', '0,1,2,', 'Our voices echo', 'new', '2015-03-13 14:03:24', '2015-03-19 13:52:00', '2015-03-19 13:52:00'),
(127, 10, 19, 'paragraph2', 'line1,', 'new nested', '1,2,', 'voices echo,', 'new', '2015-03-13 14:03:37', '2015-03-13 14:10:29', '0000-00-00 00:00:00'),
(128, 7, 19, 'paragraph3', 'line3,', 'great poetry writing', '4,5,6,', 'blankly as walls', 'description', '2015-03-13 14:23:44', '2015-03-13 14:23:44', '0000-00-00 00:00:00'),
(129, 7, 19, 'paragraph3', 'line1,', 'Blah Blah', '0,1,2,3,', 'n a drafty museum', 'description', '2015-03-16 14:19:40', '2015-03-16 14:19:40', '0000-00-00 00:00:00'),
(130, 7, 19, 'paragraph1', 'line1,', 'crap', '0,1,2,3,4,', 'The midwife slapped your footsoles', 'description', '2015-03-16 14:20:01', '2015-03-16 14:20:01', '0000-00-00 00:00:00'),
(131, 10, 19, 'paragraph4', 'line1,', 'excellent poetry writing here', '0,1,2,3,4,', 'I''m no more your mother', 'spiffing', '2015-03-18 17:25:53', '2015-03-18 17:25:53', '0000-00-00 00:00:00'),
(132, 10, 19, 'paragraph4', 'line3,', 'More Great Writing', '0,1,2,3,4,', 'Effacement at the wind''s hand.', 'spiffing', '2015-03-18 17:26:13', '2015-03-18 17:26:13', '0000-00-00 00:00:00'),
(133, 10, 19, 'paragraph3', 'line1,', 'double spiffing check', '0,1,2,3,4,5,', 'In a drafty museum, your nakedness', 'spiffing', '2015-03-18 19:02:50', '2015-03-18 19:02:50', '0000-00-00 00:00:00'),
(134, 10, 19, 'paragraph3', 'line1,', 'new annotation', '3,', 'museum', 'description', '2015-03-19 13:53:21', '2015-03-19 13:53:21', '0000-00-00 00:00:00'),
(135, 10, 19, 'paragraph3', 'line1,', 'more, word', '3,', 'museum', 'new', '2015-03-19 13:59:52', '2015-03-19 13:59:52', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `storage_name` varchar(64) NOT NULL,
  `filetype` varchar(128) NOT NULL,
  `created_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `storage_name` (`storage_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `user_id`, `group_id`, `storage_name`, `filetype`, `created_at`, `deleted_at`, `updated_at`) VALUES
(17, 'Test', 10, 2, 'OUdfXTz5XnYmGDae3ZFJ8RTmVVlaMY49TGTOVtjx', 'txt', '2015-02-26 17:05:05', '0000-00-00 00:00:00', '2015-02-26 17:05:05'),
(18, 'Barcelona Test', 10, 1, 'Fw0V20RCLJpJRpbZJgAgW6u9JVQimRGbD3Ipgh33', 'txt', '2015-03-08 17:24:26', '0000-00-00 00:00:00', '2015-03-08 17:24:26'),
(19, 'Morning Song - Sylvia Plath', 10, 1, 'iKnodyl9YpcmL1wXDi2uiFu0j2nEs2q6fi8HLTia', 'txt', '2015-03-12 22:24:23', '0000-00-00 00:00:00', '2015-03-12 22:24:23'),
(21, 'Basic Java Program', 10, 2, 'lk4gyXvoIu9qLbSr19lO0E3K9Jawsq9uVDDPrWPX', 'txt', '2015-03-19 14:12:59', '0000-00-00 00:00:00', '2015-03-19 14:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Test group', '2015-02-23 20:48:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Second Group', '2015-02-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `permission_level` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `firstnames` varchar(60) NOT NULL,
  `surname` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `password_temp` varchar(60) NOT NULL,
  `code` varchar(60) NOT NULL,
  `active` int(11) NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `permission_level`, `email`, `firstnames`, `surname`, `password`, `password_temp`, `code`, `active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 1, 'adavidsonFYPROJECT@gmail.com', 'Anthony James', 'Davidson', '$2y$10$omnapbGwaFSFsY8xjV/KGOEa1cekCourar6d8ZbTTxJuOacrpk.5S', '', '', 1, 'nGaysip63mXVXHg66GLLyaISU5Tw39Wifi3NFIWInWR9LYmwcswPLJd9oGdq', '2014-12-11 20:19:28', '2015-03-18 18:34:17', '0000-00-00 00:00:00'),
(10, 2, 'anthony.davidson.2011@nuim.ie', 'A', 'Davidson', '$2y$10$h7PaMtFeOS83LdHTrnGrceJi2pSUeO8IKZJ0zO/DGL2p8yOobvueC', '', '', 1, 'JNykTxNBI3zRr77F82Mw0P0sOMxBeDF3bKb0DQM3LFWkcy207hXg7eQeEaLi', '2014-12-12 14:28:58', '2015-03-19 13:05:29', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE IF NOT EXISTS `user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `group_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 7, '2014-12-02 14:12:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 10, '2014-12-02 14:12:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 2, 7, '2015-02-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, 10, '2015-02-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_perms`
--

CREATE TABLE IF NOT EXISTS `user_perms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `perm_level` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user_perms`
--

INSERT INTO `user_perms` (`id`, `user_id`, `group_id`, `perm_level`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 7, 1, 1, '2015-02-24 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 10, 1, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
