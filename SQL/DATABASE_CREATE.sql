DROP DATABASE IF EXISTS `KGB`;
CREATE DATABASE `KGB`;
USE `KGB`;

CREATE TABLE `Person` (
    `id_person` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `name` VARCHAR(60),
    `lastname` VARCHAR(60),
    `codename` VARCHAR(60),
    `birthdate` DATETIME,
    `id_country` INT
)engine=INNODB;

CREATE TABLE `Country` (
    `id_country` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `name` VARCHAR(60),
    UNIQUE (`name`)
)engine=INNODB;

CREATE TABLE `Role` (
    `id_role` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `name` VARCHAR(60)
)engine=INNODB;

CREATE TABLE `Speciality` (
    `id_speciality` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `name` VARCHAR(60)
)engine=INNODB;

CREATE TABLE `Account` (
    `id_account` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `email` VARCHAR(255),
    `password` VARCHAR(60),
    `created_at` DATETIME DEFAULT NOW(),
    `id_person` INT,
    UNIQUE (`email`)
)engine=INNODB;

CREATE TABLE `House` (
    `id_house` INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `code` VARCHAR(60),
    `address` VARCHAR(60),
    `type` VARCHAR(60),
    `id_country` INT
)engine=INNODB;

CREATE TABLE `Mission` (
    `id_mission`INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `title` VARCHAR(60),
    `description` LONGTEXT,
    `codename` VARCHAR(60),
    `type`VARCHAR(60),
    `status` VARCHAR(60),
    `date_start` DATETIME DEFAULT NOW(),
    `date_end` DATETIME,
    `id_speciality` INT,
    `id_country` INT
)engine=INNODB;

CREATE TABLE `Person_Role` (
    `id_person` INT,
    `id_role` INT,
    PRIMARY KEY (`id_person`, `id_role`),
    FOREIGN KEY (`id_person`) REFERENCES `Person`(`id_person`),
    FOREIGN KEY (`id_role`) REFERENCES `Role`(`id_role`)
)engine=INNODB;


CREATE TABLE `Person_Speciality`(
    `id_person` INT,
    `id_speciality` INT,
    PRIMARY KEY (`id_person`,`id_speciality`),
    FOREIGN KEY (`id_person`) REFERENCES `Person`(`id_person`), 
    FOREIGN KEY (`id_speciality`) REFERENCES `Speciality`(`id_speciality`) 
)engine=INNODB;

CREATE TABLE `Person_Mission`(
    `id_person` INT,
    `id_mission` INT,
    PRIMARY KEY (`id_person`,`id_mission`),
    FOREIGN KEY (`id_person`) REFERENCES `Person`(`id_person`), 
    FOREIGN KEY (`id_mission`) REFERENCES `Mission`(`id_mission`) 
)engine=INNODB;

ALTER TABLE `Person` ADD FOREIGN KEY (`id_country`) REFERENCES `Country`(`id_country`);
ALTER TABLE `Account` ADD FOREIGN KEY (`id_person`) REFERENCES `Person`(`id_person`);
ALTER TABLE `House` ADD FOREIGN KEY (`id_country`) REFERENCES `Country`(`id_country`);
ALTER TABLE `Mission` ADD FOREIGN KEY (`id_speciality`) REFERENCES `Speciality`(`id_speciality`);
ALTER TABLE `Mission` ADD FOREIGN KEY (`id_country`) REFERENCES `Country`(`id_country`);