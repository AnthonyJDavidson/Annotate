-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 12, 2015 at 09:50 PM
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
  `annotation` mediumtext NOT NULL,
  `words_Covered` varchar(60) NOT NULL,
  `a_text` varchar(60) NOT NULL,
  `tags` varchar(60) NOT NULL DEFAULT 'None',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=99 ;

--
-- Dumping data for table `annotations`
--

INSERT INTO `annotations` (`id`, `user_id`, `doc_id`, `paragraph_id`, `annotation`, `words_Covered`, `a_text`, `tags`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 10, 13, 'paragraph0', '', '', 'Lorem ipsum dolor sit amet, c', 'None', '2015-03-07 22:59:26', '2015-03-07 22:59:26', '0000-00-00 00:00:00'),
(59, 10, 18, 'paragraph0', 'Spanish League', '8,9,', 'La Liga ', 'football', '2015-03-11 18:55:06', '2015-03-11 18:55:06', '0000-00-00 00:00:00'),
(61, 10, 18, 'paragraph0', 'With Barcelona', '', '', 'football', '2015-03-11 18:56:52', '2015-03-11 18:56:52', '0000-00-00 00:00:00'),
(62, 10, 18, 'paragraph0', 'Football Team', '13,', 'Barcelona ', 'football', '2015-03-11 18:58:18', '2015-03-11 18:58:18', '0000-00-00 00:00:00'),
(63, 10, 18, 'paragraph2', 'Barcelona''s rivals', '5,6,', 'Real Madrid''s ', 'football', '2015-03-11 18:59:19', '2015-03-11 18:59:19', '0000-00-00 00:00:00'),
(64, 10, 18, 'paragraph4', 'Barcelona Striker', '0,', 'Suarez ', 'football', '2015-03-11 19:01:04', '2015-03-11 19:01:04', '0000-00-00 00:00:00'),
(65, 10, 18, 'paragraph2', 'Good for barcelona', '5,6,7,', 'Real Madrid''s defeat ', 'football', '2015-03-11 19:02:29', '2015-03-11 19:02:29', '0000-00-00 00:00:00'),
(67, 10, 18, 'paragraph2', '3 annotations', '3,4,5,6,', 'advantage of Real Madrid''s ', 'annotation', '2015-03-11 19:06:39', '2015-03-11 19:06:39', '0000-00-00 00:00:00'),
(68, 10, 18, 'paragraph6', 'long annotation test', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,', 'scored a twice-taken penalty, tapped in the fourth and added', 'annotation', '2015-03-11 19:11:41', '2015-03-11 19:11:41', '0000-00-00 00:00:00'),
(69, 10, 18, 'paragraph9', 'long annotation test', '0,1,2,3,', 'Barca defender Dani Alves ', 'annotation', '2015-03-11 19:12:06', '2015-03-11 19:12:06', '0000-00-00 00:00:00'),
(71, 10, 18, 'paragraph8', 'Teams usually have 11 players', '4,5,', '10 men ', 'football', '2015-03-11 19:23:09', '2015-03-11 19:23:09', '0000-00-00 00:00:00'),
(72, 10, 18, 'paragraph14', 'Real Madrid forward', '0,1,', 'Cristiano Ronaldo ', 'football', '2015-03-11 19:24:15', '2015-03-11 19:24:15', '0000-00-00 00:00:00'),
(73, 10, 18, 'paragraph16', 'Young Barcelona player from Brazil', '0,', 'Neymar ', 'football, annotation, tag', '2015-03-11 19:25:04', '2015-03-11 19:25:04', '0000-00-00 00:00:00'),
(74, 10, 18, 'paragraph27', 'One-on-one shot with the keeper', '5,', 'penalty ', 'football', '2015-03-12 13:37:40', '2015-03-12 13:37:40', '0000-00-00 00:00:00'),
(75, 10, 18, 'paragraph9', '80th minute', '7,8,', '10 minutes ', 'football', '2015-03-12 13:38:25', '2015-03-12 13:38:25', '0000-00-00 00:00:00'),
(76, 10, 18, 'paragraph18', 'Next best team after Barca and Real', '2,3,', '(Atletico Madrid)\n ', 'football', '2015-03-12 13:45:00', '2015-03-12 13:45:00', '0000-00-00 00:00:00'),
(77, 10, 18, 'paragraph41', 'Good Coach', '2,3,', 'Luis Enrique:\n ', 'coach', '2015-03-12 13:45:28', '2015-03-12 13:45:28', '0000-00-00 00:00:00'),
(78, 10, 18, 'paragraph37', 'When a defender is closer than the rules allow on a kick off, corner kick, goal kick, free kick or PK', '16,', 'encroachment ', 'definition, football', '2015-03-12 13:47:47', '2015-03-12 13:47:47', '0000-00-00 00:00:00'),
(79, 7, 18, 'paragraph2', 'Forer Liverpool player', '12,13,', 'Luis Suarez ', 'football', '2015-03-12 15:27:12', '2015-03-12 15:27:12', '0000-00-00 00:00:00'),
(93, 7, 18, 'paragraph0', 'flourishing or spreading unchecked.', '12,', 'rampant ', 'definition, TagTest', '2015-03-12 17:54:10', '2015-03-12 17:54:10', '0000-00-00 00:00:00'),
(94, 10, 18, 'paragraph0', 'Good Footballer', '0,1,', 'Lionel Messi ', 'football', '2015-03-12 20:33:45', '2015-03-12 20:33:45', '0000-00-00 00:00:00'),
(96, 10, 18, 'paragraph8', 'equates to red', '11,12,', 'second yellow ', 'football, definition', '2015-03-12 20:36:33', '2015-03-12 20:36:33', '0000-00-00 00:00:00'),
(97, 10, 18, 'paragraph0', '3 goals in a game', '5,', 'hat-trick ', 'football', '2015-03-12 20:45:38', '2015-03-12 20:45:38', '0000-00-00 00:00:00'),
(98, 10, 18, 'paragraph9', 'foul', '13,', 'tripping ', 'football', '2015-03-12 20:46:39', '2015-03-12 20:46:39', '0000-00-00 00:00:00');

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
(7, 1, 'adavidsonFYPROJECT@gmail.com', 'Anthony James', 'Davidson', '$2y$10$omnapbGwaFSFsY8xjV/KGOEa1cekCourar6d8ZbTTxJuOacrpk.5S', '', '', 1, 'A0neJYYDNbtDtKWGEbfyTtP3r727o8jGWg6GSYEJg0gfmWonTzINMQRHnd7t', '2014-12-11 20:19:28', '2015-03-12 18:45:22', '0000-00-00 00:00:00'),
(10, 2, 'anthony.davidson.2011@nuim.ie', 'A', 'Davidson', '$2y$10$h7PaMtFeOS83LdHTrnGrceJi2pSUeO8IKZJ0zO/DGL2p8yOobvueC', '', '', 1, 'b3tRXqv7GoLkycAHGjH2RiCU9VV1Hd07g5imaGvhjKWXzk550mzYmg5VmnXR', '2014-12-12 14:28:58', '2015-03-12 15:26:26', '0000-00-00 00:00:00');

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
