SET foreign_key_checks=0;

CREATE TABLE IF NOT EXISTS `branch` (
  `branch_id` INTEGER NOT NULL auto_increment,
  `project` VARCHAR(255) NOT NULL,
  `branch` VARCHAR(255) NOT NULL,
  `last_report_id` INTEGER NULL,
  `ctime` DATETIME NOT NULL,
  UNIQUE INDEX `project_branch_uniq` (`project`, `branch`),
  PRIMARY KEY (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `report` (
  `report_id` INTEGER NOT NULL auto_increment,
  `branch_id` INTEGER NOT NULL,
  `status` TINYINT NOT NULL,
  `repo` text NULL,
  `revision` VARCHAR(255) NULL,
  `vc_log` text NULL,
  `body` text NULL,
  `ctime` DATETIME NOT NULL,
  INDEX (`branch_id`),
  CONSTRAINT `report_fk` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`) ON DELETE CASCADE,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8;

SET foreign_key_checks=1;
