-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2015 at 10:45 PM
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
  `wordNums` varchar(60) NOT NULL,
  `annotation` mediumtext NOT NULL,
  `a_text` varchar(60) NOT NULL,
  `tags` varchar(60) NOT NULL DEFAULT 'None',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35 ;

--
-- Dumping data for table `annotations`
--

INSERT INTO `annotations` (`id`, `user_id`, `doc_id`, `paragraph_id`, `wordNums`, `annotation`, `a_text`, `tags`, `created_at`, `updated_at`, `deleted_at`) VALUES
(25, 10, 18, 'paragraph27', '', 'Spanish League', 'La Liga', 'football', '2015-03-09 20:32:30', '2015-03-09 20:32:30', '0000-00-00 00:00:00'),
(26, 10, 18, 'paragraph41', '', 'Good Coach', 'Luis Enrique', 'Coach', '2015-03-09 20:33:45', '2015-03-09 20:33:45', '0000-00-00 00:00:00'),
(27, 10, 18, 'paragraph28', '', 'La Liga', 'league', 'spanish', '2015-03-09 21:27:37', '2015-03-09 21:27:37', '0000-00-00 00:00:00'),
(28, 10, 18, 'paragraph4', '', 'Former Liverpool player', 'Suarez', 'liverpool', '2015-03-09 21:28:26', '2015-03-09 21:28:26', '0000-00-00 00:00:00'),
(29, 10, 18, 'paragraph29', '', 'present in large numbers or quantities; plentiful.', 'prolific', 'definition', '2015-03-09 21:29:30', '2015-03-09 21:29:30', '0000-00-00 00:00:00'),
(30, 10, 18, 'paragraph14', '', 'Messi''s main rival', 'Cristiano Ronaldo', 'rival', '2015-03-09 21:31:11', '2015-03-09 21:31:11', '0000-00-00 00:00:00'),
(31, 10, 18, 'paragraph11', '', 'info on top scores', 'Reigning in Spain - La Liga''s top scorers 2014-15', 'box', '2015-03-09 21:31:56', '2015-03-09 21:31:56', '0000-00-00 00:00:00'),
(32, 10, 18, 'paragraph43', '', 'last line check', 'I have ', 'lsat', '2015-03-09 21:33:52', '2015-03-09 21:33:52', '0000-00-00 00:00:00'),
(33, 10, 18, 'paragraph4', '', 'Pique', 'Gerard Pique', 'tag', '2015-03-09 22:44:59', '2015-03-09 22:44:59', '0000-00-00 00:00:00'),
(34, 7, 18, 'paragraph0', '', 'Top Spanish club', 'Barcelona', 'footbal', '2015-03-10 13:48:36', '2015-03-10 13:48:36', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `user_id`, `group_id`, `storage_name`, `filetype`, `created_at`, `deleted_at`, `updated_at`) VALUES
(13, 'test', 10, 1, '7TMQpIT4jlbi0o28L94XkZkots9q1sf5qyTvFrhd', 'txt', '2015-02-23 21:24:00', '0000-00-00 00:00:00', '2015-02-23 21:24:00'),
(15, 'test2', 10, 2, 'g7bcQDiH3c9bzeFaNUiihnrtbaupb5Du79xWCiJ4', 'txt', '2015-02-25 22:04:22', '0000-00-00 00:00:00', '2015-02-25 22:04:22'),
(16, 'test2', 10, 1, 'PckVA6NZkvzWClk1G6V0NlJPntTKqWFnzq8sTd4K', 'txt', '2015-02-25 22:15:23', '0000-00-00 00:00:00', '2015-02-25 22:15:23'),
(17, 'test3', 10, 2, 'OUdfXTz5XnYmGDae3ZFJ8RTmVVlaMY49TGTOVtjx', 'txt', '2015-02-26 17:05:05', '0000-00-00 00:00:00', '2015-02-26 17:05:05'),
(18, 'barcelona', 10, 1, 'Fw0V20RCLJpJRpbZJgAgW6u9JVQimRGbD3Ipgh33', 'txt', '2015-03-08 17:24:26', '0000-00-00 00:00:00', '2015-03-08 17:24:26');

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
(7, 1, 'adavidsonFYPROJECT@gmail.com', 'Anthony James', 'Davidson', '$2y$10$omnapbGwaFSFsY8xjV/KGOEa1cekCourar6d8ZbTTxJuOacrpk.5S', '', '', 1, 'Me5AW0sblVWOtLJOlVx8ZP53kv5zeNBZAKDT0qrZjOfuLxs4rIafoWomnnsM', '2014-12-11 20:19:28', '2015-02-25 22:10:05', '0000-00-00 00:00:00'),
(10, 2, 'anthony.davidson.2011@nuim.ie', 'A', 'Davidson', '$2y$10$h7PaMtFeOS83LdHTrnGrceJi2pSUeO8IKZJ0zO/DGL2p8yOobvueC', '', '', 1, '7OCM6lDVvLGyXvGHxcrAbZeno9YUweX1wJU2O13b3ukGcAHOC15AHgSb6GYQ', '2014-12-12 14:28:58', '2015-03-10 21:37:43', '0000-00-00 00:00:00');

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
