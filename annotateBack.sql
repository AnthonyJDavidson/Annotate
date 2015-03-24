-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2015 at 02:22 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `annotations`
--

INSERT INTO `annotations` (`id`, `user_id`, `doc_id`, `paragraph_id`, `line_id`, `annotation`, `words_Covered`, `a_text`, `tags`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 10, 19, 'paragraph0', 'line0,', 'Annotation Example', '0,1,2,3,4,5,6,7,8,', 'Love set you going like a fat gold watch.', 'Tag1', '2015-03-21 10:43:31', '2015-03-21 10:43:31', '0000-00-00 00:00:00'),
(2, 10, 19, 'paragraph0', 'line0,', 'Double Annotation Example', '6,7,8,', 'fat gold watch.', 'Tag2', '2015-03-21 10:44:08', '2015-03-21 10:44:08', '0000-00-00 00:00:00'),
(3, 7, 19, 'paragraph1', 'line1,', 'Mentor Annotation Example', '0,1,', 'The midwife', 'Tag3', '2015-03-21 10:44:48', '2015-03-21 10:44:48', '0000-00-00 00:00:00'),
(4, 7, 19, 'paragraph3', 'line2,', 'Multiple Tag Example', '0,1,2,', 'Shadows our safety.', 'Tag3, Tag4', '2015-03-21 10:45:58', '2015-03-23 18:33:39', '0000-00-00 00:00:00'),
(5, 7, 19, 'paragraph4', 'line2,', 'Mentor annotation for overlap', '0,1,2,3,4,5,6,7,8,9,10,11,', 'Than the cloud that distills a mirror to reflect its own slow', 'Tag4', '2015-03-21 10:46:33', '2015-03-23 18:33:40', '2015-03-23 18:33:40'),
(6, 11, 19, 'paragraph4', 'line2,', 'Reader Annotation for overlap', '6,7,8,9,10,11,', 'mirror to reflect its own slow', 'Tag4', '2015-03-21 10:47:09', '2015-03-21 10:47:09', '0000-00-00 00:00:00'),
(7, 11, 19, 'paragraph6', 'line1,', 'Reader Annotation Example', '0,1,2,3,4,5,6,7,8,9,', 'One cry, and I stumble from bed, cow-heavy and floral', 'Tag2, Tag1', '2015-03-21 10:47:42', '2015-03-21 10:47:42', '0000-00-00 00:00:00'),
(8, 10, 19, 'paragraph6', 'line1,', 'Multiple Reader overlap Example', '3,4,5,6,', 'I stumble from bed', 'Tag5', '2015-03-21 10:48:23', '2015-03-21 10:48:23', '0000-00-00 00:00:00'),
(9, 7, 19, 'paragraph4', 'line2,', 'Double Annotation example', '0,1,2,', 'Than the cloud', 'Tag3', '2015-03-21 10:53:16', '2015-03-21 10:53:16', '0000-00-00 00:00:00'),
(10, 7, 19, 'paragraph4', 'line2,', 'Triple Example', '0,', 'Than', 'Tag5', '2015-03-21 10:53:32', '2015-03-21 10:53:32', '0000-00-00 00:00:00'),
(11, 7, 19, 'paragraph6', 'line1,', 'Mentor Annotation Example', '8,9,', 'and floral', 'Tag2', '2015-03-21 11:02:13', '2015-03-21 11:02:13', '0000-00-00 00:00:00'),
(12, 10, 21, 'paragraph1', 'line5,', 'creating instances of the variables required in this main method', '4,5,6,7,8,9,10,11,', 'int c, first, last, middle, n, search, array[];', 'Variables', '2015-03-23 16:38:54', '2015-03-23 16:38:54', '0000-00-00 00:00:00'),
(13, 10, 21, 'paragraph2', 'line4,', 'Declaring the array as an array of integer variable types', '4,5,6,7,', 'array = new int[n];', 'Array', '2015-03-23 16:39:36', '2015-03-23 16:39:36', '0000-00-00 00:00:00'),
(14, 10, 21, 'paragraph8', 'line3,', 'Beginning of if statement', '6,', 'if ', 'If_statement', '2015-03-23 16:40:07', '2015-03-23 16:40:07', '0000-00-00 00:00:00'),
(15, 10, 21, 'paragraph8', 'line6,', 'intermediate if statement case ', '6,7,', 'else if ', 'If_statement', '2015-03-23 16:40:26', '2015-03-23 16:40:26', '0000-00-00 00:00:00'),
(16, 10, 21, 'paragraph8', 'line11,', 'final attribute of if statement, hit if above conditions not met', '6,', 'else', 'If_statement', '2015-03-23 16:41:03', '2015-03-23 16:41:03', '0000-00-00 00:00:00'),
(17, 7, 21, 'paragraph2', 'line1,', 'A scanner reads all input a user makes and must be declared using this syntax', '4,5,6,7,8,', 'Scanner in = new Scanner(System.in);', 'Scanner', '2015-03-23 16:42:05', '2015-03-23 16:42:05', '0000-00-00 00:00:00'),
(18, 7, 21, 'paragraph2', 'line3,', 'nextInt() is a function that reads the next interger that is read in bu the scanner', '4,5,6,', 'n = in.nextInt();', 'Scanner', '2015-03-23 16:42:48', '2015-03-23 16:42:48', '0000-00-00 00:00:00'),
(19, 7, 21, 'paragraph1', 'line1,', 'You must always name you class', '1,', 'BinarySearch', 'Fundemental', '2015-03-23 16:43:25', '2015-03-23 16:43:25', '0000-00-00 00:00:00'),
(21, 7, 21, 'paragraph8', 'line9,', 'stops the program at this point. Is generally not recommended', '8,', 'break;', 'Fundemental', '2015-03-23 16:45:11', '2015-03-23 16:45:11', '0000-00-00 00:00:00'),
(22, 7, 21, 'paragraph5', 'line1,line2,line3,', 'This is a "for" loop. Similar to a while loop but written using this syntax. c begins at 0 and increments by 1 until it is equal to n', '4,5,6,7,8,9,10,11,:0,1,2,3,4,5,6,7,8,:0,1,2,3,4,', 'for (c = 0; c < n; c++){\narray[c] = in.nextInt();\n}', 'Loop', '2015-03-23 16:46:05', '2015-03-23 16:46:05', '0000-00-00 00:00:00');

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
(1, 'Test Group 1', '2015-02-23 20:48:41', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Test Group 2', '2015-02-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `permission_level`, `email`, `firstnames`, `surname`, `password`, `password_temp`, `code`, `active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 2, 'adavidsonFYPROJECT@gmail.com', 'Test', 'Mentor', '$2y$10$omnapbGwaFSFsY8xjV/KGOEa1cekCourar6d8ZbTTxJuOacrpk.5S', '', '', 1, '9G8lKX27Hk1BGV5OWZC7R47E1I7AptN1yrfGJPMcbRplE6lCrYd5LQIGLYPj', '2014-12-11 20:19:28', '2015-03-21 10:46:41', '0000-00-00 00:00:00'),
(10, 1, 'anthony.davidson.2011@nuim.ie', 'Test', 'Reader1', '$2y$10$h7PaMtFeOS83LdHTrnGrceJi2pSUeO8IKZJ0zO/DGL2p8yOobvueC', '', '', 1, '2wj8r9dydhrWJyfSX7AFC3BViIHY3g0mjaP4AEbkRJYTijSWk0kDySvpiA1i', '2014-12-12 14:28:58', '2015-03-23 16:41:32', '0000-00-00 00:00:00'),
(11, 1, 'darkshineo@hotmail.com', 'Test', 'Reader2', '$2y$10$1ownWsE8qzDYNxjIkpTJO.UlBGHeAMBOiEWG46WYfg05Q/VyAE9Fa', '', '', 1, 'pFv0d10WRHA5lZUA0gPLG7v4B6El7zNmCzlL7xWlZAqzC7cq6Y1xEfJTA9mG', '2015-03-19 21:13:20', '2015-03-23 16:38:00', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `group_id`, `user_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 7, '2014-12-02 14:12:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 10, '2014-12-02 14:12:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, 10, '2015-02-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 1, 11, '2014-12-02 14:12:13', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, 7, '2015-02-25 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
