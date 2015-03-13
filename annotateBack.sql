-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2015 at 04:27 AM
-- Server version: 5.5.36
-- PHP Version: 5.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `annotateback`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `annotations`
--

INSERT INTO `annotations` (`id`, `user_id`, `doc_id`, `paragraph_id`, `line_id`, `annotation`, `words_Covered`, `a_text`, `tags`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 10, 13, 'paragraph0', '', '', '', 'Lorem ipsum dolor sit amet, c', 'None', '2015-03-07 22:59:26', '2015-03-07 22:59:26', '0000-00-00 00:00:00'),
(108, 10, 19, 'paragraph5', 'line1,line2,line3,line4,', 'Test Ann', '0,1,2,3,:0,1,2,3,4,5,:0,1,2,3,4,:0,1,2,3,4,5,6,', 'All night your moth-breath\nFlickers among the flat pink roses.\nI wake to listen:\nA far sea moves in my ear.', 'Test', '2015-03-13 02:23:06', '2015-03-13 02:23:06', '0000-00-00 00:00:00'),
(109, 10, 19, 'paragraph4', 'line1,line2,line3,', 'A', '0,1,2,3,4,:0,1,2,3,4,5,6,7,8,9,10,11,:0,1,2,3,4,', 'I''m no more your mother\nThan the cloud that distills a mirror to reflect its own slow\nEffacement at the wind''s hand.', 'A', '2015-03-13 03:06:13', '2015-03-13 03:06:13', '0000-00-00 00:00:00'),
(110, 10, 19, 'paragraph3', 'line1,', 'A', '0,1,2,3,', 'In a drafty museum', 'A', '2015-03-13 03:06:59', '2015-03-13 03:06:59', '0000-00-00 00:00:00'),
(111, 10, 19, 'paragraph5', 'line1,', 'nested test', '3,', 'moth-breath', 'test', '2015-03-13 03:25:43', '2015-03-13 03:25:43', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `user_id`, `group_id`, `storage_name`, `filetype`, `created_at`, `deleted_at`, `updated_at`) VALUES
(13, 'test', 10, 1, '7TMQpIT4jlbi0o28L94XkZkots9q1sf5qyTvFrhd', 'txt', '2015-02-23 21:24:00', '0000-00-00 00:00:00', '2015-02-23 21:24:00'),
(15, 'test2', 10, 2, 'g7bcQDiH3c9bzeFaNUiihnrtbaupb5Du79xWCiJ4', 'txt', '2015-02-25 22:04:22', '0000-00-00 00:00:00', '2015-02-25 22:04:22'),
(16, 'test2', 10, 1, 'PckVA6NZkvzWClk1G6V0NlJPntTKqWFnzq8sTd4K', 'txt', '2015-02-25 22:15:23', '0000-00-00 00:00:00', '2015-02-25 22:15:23'),
(17, 'test3', 10, 2, 'OUdfXTz5XnYmGDae3ZFJ8RTmVVlaMY49TGTOVtjx', 'txt', '2015-02-26 17:05:05', '0000-00-00 00:00:00', '2015-02-26 17:05:05'),
(18, 'barcelona', 10, 1, 'Fw0V20RCLJpJRpbZJgAgW6u9JVQimRGbD3Ipgh33', 'txt', '2015-03-08 17:24:26', '0000-00-00 00:00:00', '2015-03-08 17:24:26'),
(19, 'Morning Song - Sylvia Plath', 10, 1, 'iKnodyl9YpcmL1wXDi2uiFu0j2nEs2q6fi8HLTia', 'txt', '2015-03-12 22:24:23', '0000-00-00 00:00:00', '2015-03-12 22:24:23');

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
(7, 1, 'adavidsonFYPROJECT@gmail.com', 'Anthony James', 'Davidson', '$2y$10$omnapbGwaFSFsY8xjV/KGOEa1cekCourar6d8ZbTTxJuOacrpk.5S', '', '', 1, 'A0neJYYDNbtDtKWGEbfyTtP3r727o8jGWg6GSYEJg0gfmWonTzINMQRHnd7t', '2014-12-11 20:19:28', '2015-03-12 18:45:22', '0000-00-00 00:00:00'),
(10, 2, 'anthony.davidson.2011@nuim.ie', 'A', 'Davidson', '$2y$10$h7PaMtFeOS83LdHTrnGrceJi2pSUeO8IKZJ0zO/DGL2p8yOobvueC', '', '', 1, '1T8rms9nNCCHpKL21yJkS9QvuP1kHUZ8Jvf0ZQLr41VaBC1lT1SUDCnG6g0A', '2014-12-12 14:28:58', '2015-03-12 22:22:22', '0000-00-00 00:00:00');

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
