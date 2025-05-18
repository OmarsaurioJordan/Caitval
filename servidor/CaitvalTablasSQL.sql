-- Tablas para videojuego Caitval, por Omarsaurio 2019
-- phpMyAdmin SQL Dump version 4.8.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `mensajes` (
  `tipo` tinyint(3) UNSIGNED NOT NULL,
  `receptor` tinytext NOT NULL,
  `emisor` tinytext NOT NULL,
  `cantidad` smallint(5) UNSIGNED NOT NULL,
  `limitepro` smallint(5) UNSIGNED NOT NULL,
  `dinero` smallint(5) UNSIGNED NOT NULL,
  `texto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `partidas` (
  `nombre` tinytext NOT NULL,
  `avatar` tinyint(3) UNSIGNED NOT NULL,
  `codigo` smallint(5) UNSIGNED NOT NULL,
  `actividad` bigint(20) UNSIGNED NOT NULL,
  `edad` smallint(5) UNSIGNED NOT NULL,
  `actualizar` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `listar` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `espro` tinyint(3) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

COMMIT;
