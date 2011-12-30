CREATE TABLE IF NOT EXISTS `exercise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `solution` text,
  `create_date` datetime NOT NULL,
  `last_modification` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `difficulty` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `account_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `name_short` varchar(20) NOT NULL,
  `description` text,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `sort_priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `exercise_category` (
  `id_exercise` bigint(20) NOT NULL,
  `id_category` bigint(20) NOT NULL,
  `sort_priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_exercise`,`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `nickname` varchar(40) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `description` text,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ban_date` datetime DEFAULT NULL,
  `ban_days` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exercise_id` bigint(20) NOT NULL,
  `account_id` bigint(20) NOT NULL,
  `content` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `read` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `exercise_id` (`exercise_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

ALTER TABLE `account` ADD FOREIGN KEY ( `group_id` ) REFERENCES `exercises`.`group` (
`id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `comment` ADD FOREIGN KEY ( `exercise_id` ) REFERENCES `exercises`.`exercise` (
`id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `comment` ADD FOREIGN KEY ( `account_id` ) REFERENCES `exercises`.`account` (
`id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;

ALTER TABLE `exercise_category` ADD FOREIGN KEY ( `id_exercise` ) REFERENCES `exercises`.`exercise` (
`id`
) ON DELETE CASCADE ON UPDATE RESTRICT ;

ALTER TABLE `exercise_category` ADD FOREIGN KEY ( `id_category` ) REFERENCES `exercises`.`category` (
`id`
) ON DELETE CASCADE ON UPDATE RESTRICT ;

ALTER TABLE `exercise` ADD FOREIGN KEY ( `account_id` ) REFERENCES `exercises`.`account` (
`id`
) ON DELETE RESTRICT ON UPDATE RESTRICT ;


INSERT INTO `group`(`id`, `name`, `description`) VALUES (1, 'administrator','Grupa administratorów portalu');
INSERT INTO `group`(`id`, `name`, `description`) VALUES (2, 'user','Użytkownicy serwisu');

/*
password is admin
*/
INSERT INTO `account`( `group_id`, `name`, `surname`, `nickname`, `email`, `password`, `description`) VALUES (1,'admin','admin','admin','none','21232f297a57a5a743894a0e4a801fc3','none');
