CREATE TABLE IF NOT EXISTS `exercise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8 NOT NULL,
  `solution` text CHARACTER SET utf8,
  `create_date` datetime NOT NULL,
  `last_modification` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `difficulty` int(11) NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
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

ALTER TABLE `exercise_category` ADD FOREIGN KEY ( `id_exercise` ) REFERENCES `exercises`.`exercise` (
`id`
) ON DELETE CASCADE ON UPDATE RESTRICT ;

ALTER TABLE `exercise_category` ADD FOREIGN KEY ( `id_category` ) REFERENCES `exercises`.`category` (
`id`
) ON DELETE CASCADE ON UPDATE RESTRICT ;
