-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2015 at 11:59 AM
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=174 ;

--
-- Dumping data for table `annotations`
--

INSERT INTO `annotations` (`id`, `user_id`, `doc_id`, `paragraph_id`, `line_id`, `annotation`, `words_Covered`, `a_text`, `tags`, `created_at`, `updated_at`, `deleted_at`) VALUES
(127, 10, 19, 'paragraph2', 'line1,', 'new nested', '1,2,', 'voices echo,', 'new', '2015-03-13 14:03:37', '2015-03-13 14:10:29', '0000-00-00 00:00:00'),
(128, 7, 19, 'paragraph3', 'line3,', 'great poetry writing', '4,5,6,', 'blankly as walls', 'spiffing', '2015-03-13 14:23:44', '2015-03-19 22:44:55', '0000-00-00 00:00:00'),
(129, 7, 19, 'paragraph3', 'line1,', 'Blah Blah', '0,1,2,3,', 'n a drafty museum', 'description', '2015-03-16 14:19:40', '2015-03-19 22:30:27', '0000-00-00 00:00:00'),
(130, 7, 19, 'paragraph1', 'line1,', 'crap', '0,1,2,3,4,', 'The midwife slapped your footsoles', 'description', '2015-03-16 14:20:01', '2015-03-16 14:20:01', '0000-00-00 00:00:00'),
(131, 10, 19, 'paragraph4', 'line1,', 'excellent poetry writing here', '0,1,2,3,4,', 'I''m no more your mother', 'spiffing', '2015-03-18 17:25:53', '2015-03-18 17:25:53', '0000-00-00 00:00:00'),
(132, 10, 19, 'paragraph4', 'line3,', 'More Great Writing', '0,1,2,3,4,', 'Effacement at the wind''s hand.', 'spiffing', '2015-03-18 17:26:13', '2015-03-18 17:26:13', '0000-00-00 00:00:00'),
(133, 10, 19, 'paragraph3', 'line1,', 'double spiffing check', '0,1,2,3,4,5,', 'In a drafty museum, your nakedness', 'spiffing', '2015-03-18 19:02:50', '2015-03-18 19:02:50', '0000-00-00 00:00:00'),
(134, 10, 19, 'paragraph3', 'line1,', 'new annotation', '3,', 'museum', 'description', '2015-03-19 13:53:21', '2015-03-19 13:53:21', '0000-00-00 00:00:00'),
(135, 10, 19, 'paragraph3', 'line1,', 'more, word', '3,', 'museum', 'new', '2015-03-19 13:59:52', '2015-03-19 13:59:52', '0000-00-00 00:00:00'),
(136, 10, 19, 'paragraph4', 'line2,', 'multiple tag check', '0,1,2,', 'Than the cloud', 'Tag1, Tag2', '2015-03-19 15:23:33', '2015-03-19 15:23:33', '0000-00-00 00:00:00'),
(137, 10, 19, 'paragraph4', 'line3,', 'asdasdasd', '3,4,', 'wind''s hand.', 'Tag1', '2015-03-19 16:03:13', '2015-03-19 16:03:13', '0000-00-00 00:00:00'),
(138, 10, 19, 'paragraph5', 'line1,', 'AAAA', '0,1,2,3,', 'All night your moth-breath', 'spiffing', '2015-03-19 16:18:10', '2015-03-19 16:18:10', '0000-00-00 00:00:00'),
(139, 10, 19, 'paragraph5', 'line2,', 'AAAAA', '0,1,2,3,4,', 'Flickers among the flat pink', 'description', '2015-03-19 16:18:19', '2015-03-19 16:18:19', '0000-00-00 00:00:00'),
(140, 10, 19, 'paragraph2', 'line1,', 'sdasdasdasdasd', '4,5,', 'your arrival.', 'description', '2015-03-19 16:18:31', '2015-03-19 16:18:31', '0000-00-00 00:00:00'),
(141, 10, 19, 'paragraph6', 'line1,', 'new', '0,1,', 'One cry', 'spiffing', '2015-03-19 17:27:02', '2015-03-19 17:27:02', '0000-00-00 00:00:00'),
(142, 10, 19, 'paragraph6', 'line1,', 'new ', '1,2,3,4,', 'cry, and I stumble', 'spiffing', '2015-03-19 17:27:34', '2015-03-19 17:27:34', '0000-00-00 00:00:00'),
(143, 10, 19, 'paragraph6', 'line1,', 'asdasd', '7,', 'cow-heavy', 'description', '2015-03-19 17:28:10', '2015-03-19 17:28:10', '0000-00-00 00:00:00'),
(144, 10, 19, 'paragraph3', 'line3,', 'ddd', '3,4,', 'round blankly', 'new', '2015-03-19 17:28:39', '2015-03-19 17:28:39', '0000-00-00 00:00:00'),
(145, 10, 19, 'paragraph2', 'line2,', 'wewewe', '1,2,', 'ew statue.', 'description', '2015-03-19 17:29:31', '2015-03-19 17:29:31', '0000-00-00 00:00:00'),
(146, 10, 19, 'paragraph0', 'line0,', 'title ', '0,1,2,3,', 'Love set you going', 'description', '2015-03-19 17:31:41', '2015-03-19 17:31:41', '0000-00-00 00:00:00'),
(147, 10, 19, 'paragraph1', 'line1,', 'dddddddddd', '6,7,8,', 'your bald cry', 'description', '2015-03-19 17:33:05', '2015-03-19 17:33:05', '0000-00-00 00:00:00'),
(148, 10, 19, 'paragraph1', 'line1,', 'dddd', '4,5,6,7,', 'footsoles, and your bald', 'spiffing', '2015-03-19 17:34:16', '2015-03-19 17:34:16', '0000-00-00 00:00:00'),
(149, 10, 19, 'paragraph3', 'line3,', 'A', '1,2,3,4,5,6,', 'We stand round blankly as walls.', 'spiffing', '2015-03-19 17:37:56', '2015-03-19 17:37:56', '0000-00-00 00:00:00'),
(150, 7, 19, 'paragraph5', 'line2,line3,', 'ssssss', '4,5,:0,1,2,', 'pink roses.\nI wake', 'Tag1', '2015-03-19 17:38:37', '2015-03-19 18:01:22', '2015-03-19 18:01:22'),
(151, 7, 19, 'paragraph2', 'line1,', 'asdasdasdasd', '1,2,', 'voices echo,', 'description', '2015-03-19 17:46:25', '2015-03-19 18:00:41', '2015-03-19 18:00:41'),
(153, 7, 19, 'paragraph6', 'line1,', 'asdasdasd', '0,1,2,3,4,5,6,', 'One cry, and I stumble from bed', 'spiffing', '2015-03-19 17:50:37', '2015-03-19 18:00:17', '2015-03-19 18:00:17'),
(154, 7, 19, 'paragraph4', 'line1,', 'asdasdasd', '0,1,2,3,4,', 'I''m no more your mother', 'description', '2015-03-19 19:16:00', '2015-03-19 19:16:00', '0000-00-00 00:00:00'),
(155, 7, 19, 'paragraph4', 'line2,', 'asdasdasd', '6,7,8,9,10,11,', 'mirror to reflect its own slow', 'Tag1', '2015-03-19 19:16:09', '2015-03-19 21:11:25', '2015-03-19 21:11:25'),
(156, 11, 19, 'paragraph5', 'line4,', 'asdasdasd', '0,1,2,3,4,5,6,', 'A far sea moves in my ear.', 'description', '2015-03-19 21:19:52', '2015-03-19 21:19:52', '0000-00-00 00:00:00'),
(157, 11, 19, 'paragraph1', 'line1,', 'asdasdasd', '2,3,', 'slapped your', 'description', '2015-03-19 21:20:00', '2015-03-19 21:20:00', '0000-00-00 00:00:00'),
(158, 11, 19, 'paragraph2', 'line1,', 'dddddd', '4,', ' your', 'Tag2', '2015-03-19 21:20:09', '2015-03-19 21:20:09', '0000-00-00 00:00:00'),
(159, 7, 21, 'paragraph1', 'line2,', 'asdasd\nasdasdasd\nasdasd', '0,', '{', 'None', '2015-03-19 21:38:13', '2015-03-19 21:38:19', '2015-03-19 21:38:19'),
(160, 7, 19, 'paragraph1', 'line2,', 'asdasda', '0,1,2,3,4,5,', 'Took its place among the elements', 'asdas, asdasd', '2015-03-19 21:46:33', '2015-03-19 21:55:14', '2015-03-19 21:55:14'),
(161, 7, 19, 'paragraph7', 'line1,', 'asdasd', '0,1,2,3,4,5,6,', 'Your mouth opens clean as a cat''s.', 'asdas, asdasd', '2015-03-19 21:47:45', '2015-03-19 21:55:22', '2015-03-19 21:55:22'),
(162, 7, 19, 'paragraph8', 'line1,', 'ddddd', '0,1,2,3,4,5,', 'Whitens and swallows its dull stars.', 'tag1, tag2', '2015-03-19 21:53:21', '2015-03-19 21:53:39', '2015-03-19 21:53:39'),
(163, 7, 19, 'paragraph4', 'line2,', 'dddddd', '', 'cloud that distills a mirror to reflect its own slow', 'description, sadasd', '2015-03-19 21:53:55', '2015-03-19 21:55:21', '2015-03-19 21:55:21'),
(164, 7, 19, 'paragraph7', 'line1,', 'ddddd', '0,1,2,3,4,5,6,', 'Your mouth opens clean as a cat''s.', 'one, two', '2015-03-19 21:55:53', '2015-03-19 21:57:02', '2015-03-19 21:57:02'),
(165, 7, 19, 'paragraph4', 'line2,', 'asdasdasdasdad', '3,4,5,6,7,8,9,10,11,', 'that distills a mirror to reflect its own slow', 'one, two', '2015-03-19 21:56:52', '2015-03-19 21:57:02', '2015-03-19 21:57:02'),
(166, 7, 19, 'paragraph6', 'line2,', 'sss', '0,1,2,3,', 'In my Victorian nightgown.', 'None', '2015-03-19 22:18:31', '2015-03-19 22:19:53', '2015-03-19 22:19:53'),
(167, 7, 19, 'paragraph4', 'line2,', '333', '3,4,5,6,', 'that distills a mirror', '333', '2015-03-19 22:20:06', '2015-03-19 22:20:12', '2015-03-19 22:20:12'),
(168, 7, 21, 'paragraph1', 'line5,', 'annote', '9,', 'n', 'varialbe', '2015-03-19 22:45:54', '2015-03-19 22:45:54', '0000-00-00 00:00:00'),
(169, 7, 19, 'paragraph1', 'line2,', 'new', '0,1,2,', 'Took its place', 'spiffing', '2015-03-19 22:46:27', '2015-03-19 22:46:47', '2015-03-19 22:46:47'),
(170, 7, 19, 'paragraph1', 'line2,', 'sss', '0,1,2,3,', 'Took its place among', 'spiffing', '2015-03-19 23:00:11', '2015-03-19 23:00:11', '0000-00-00 00:00:00'),
(171, 7, 19, 'paragraph2', 'line1,', 'sssss', '0,1,2,', 'Our voices echo,', 'spiffing', '2015-03-19 23:02:48', '2015-03-19 23:02:48', '0000-00-00 00:00:00'),
(172, 7, 19, 'paragraph7', 'line1,', 'ddddd', '4,5,6,', ' as a cat''s.', 'spiffing, Tag1', '2015-03-19 23:03:10', '2015-03-19 23:03:10', '0000-00-00 00:00:00'),
(173, 7, 19, 'paragraph7', 'line1,', 'asdasd', '0,1,2,', 'Your mouth opens', 'description, 2222', '2015-03-19 23:58:21', '2015-03-19 23:58:21', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `permission_level`, `email`, `firstnames`, `surname`, `password`, `password_temp`, `code`, `active`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 1, 'adavidsonFYPROJECT@gmail.com', 'Anthony', 'Davidson', '$2y$10$omnapbGwaFSFsY8xjV/KGOEa1cekCourar6d8ZbTTxJuOacrpk.5S', '', '', 1, 'tDmNGhgjgMA4VbX7b6pWxRnf7AqrpTWytiASmmkY9XE9Z76DFhv86AQQyg5D', '2014-12-11 20:19:28', '2015-03-19 21:19:01', '0000-00-00 00:00:00'),
(10, 2, 'anthony.davidson.2011@nuim.ie', 'A', 'Davidson', '$2y$10$h7PaMtFeOS83LdHTrnGrceJi2pSUeO8IKZJ0zO/DGL2p8yOobvueC', '', '', 1, 'TDurjxJQ0E97Xw70e3g8ydniUD9RNCmkJmMTJLdDHTZWXhZ00w2lvkhIgqAS', '2014-12-12 14:28:58', '2015-03-19 21:17:59', '0000-00-00 00:00:00'),
(11, 1, 'darkshineo@hotmail.com', 'Test', 'User', '$2y$10$1ownWsE8qzDYNxjIkpTJO.UlBGHeAMBOiEWG46WYfg05Q/VyAE9Fa', '', '', 1, '95eKKFfi9osd4NfMNM3POXfLrqff3W4hCp4L5t2bO0QFcw7gy756usWsZpAz', '2015-03-19 21:13:20', '2015-03-19 21:24:12', '0000-00-00 00:00:00');

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
