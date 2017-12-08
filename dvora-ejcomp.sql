-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 06-Nov-2017 às 20:19
-- Versão do servidor: 10.1.22-MariaDB
-- PHP Version: 7.0.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dvora-ejcomp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('2od4t9q9qhfu5n6i6jfi8jae3etrbplt', '::1', 1509992683, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393939323638333b696e76616c69646f7c623a303b7469706f5f7573756172696f7c733a313a2232223b69645f7573756172696f7c4e3b6c6f6761646f7c623a313b),
('3qfdh08bd0jtjqgle6a11ve2tgcrphef', '::1', 1509993103, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393939333130333b696e76616c69646f7c623a303b7469706f5f7573756172696f7c733a313a2232223b69645f7573756172696f7c4e3b6c6f6761646f7c623a313b),
('41s9gupma689qrgnrr6vpljdm1ig4o8m', '::1', 1509994498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393939343439383b696e76616c69646f7c623a303b7469706f5f7573756172696f7c733a313a2232223b69645f7573756172696f7c4e3b6c6f6761646f7c623a313b),
('6s1maeed4b14c4avl6thsctpb6bii9vv', '::1', 1509995222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393939353232323b696e76616c69646f7c623a303b7469706f5f7573756172696f7c733a313a2232223b69645f7573756172696f7c4e3b6c6f6761646f7c623a313b),
('7m72q581l7j2h4hjnec1vfcj37q7gpmc', '::1', 1509994036, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393939343033363b696e76616c69646f7c623a303b7469706f5f7573756172696f7c733a313a2232223b69645f7573756172696f7c4e3b6c6f6761646f7c623a313b),
('9q4bff53f65760390gbqi6psc63n938o', '::1', 1509995237, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393939353232323b696e76616c69646f7c623a303b7469706f5f7573756172696f7c733a313a2232223b69645f7573756172696f7c4e3b6c6f6761646f7c623a313b),
('q9n6c7r7ni4fgfj51v4i5n0pdt7dtvdk', '::1', 1509994801, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393939343830313b696e76616c69646f7c623a303b7469706f5f7573756172696f7c733a313a2232223b69645f7573756172696f7c4e3b6c6f6761646f7c623a313b),
('salhiol782hvjrttbhgbrr2j070klgn7', '::1', 1509993727, 0x5f5f63695f6c6173745f726567656e65726174657c693a313530393939333732373b696e76616c69646f7c623a303b7469706f5f7573756172696f7c733a313a2232223b69645f7573756172696f7c4e3b6c6f6761646f7c623a313b);

-- --------------------------------------------------------

--
-- Estrutura da tabela `equipamento`
--

CREATE TABLE `equipamento` (
  `id_equipamento` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `detalhes` varchar(300) NOT NULL,
  `imagem` int(11) NOT NULL,
  `apagado` int(11) DEFAULT '0',
  `emprestado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `equipamento`
--

INSERT INTO `equipamento` (`id_equipamento`, `descricao`, `detalhes`, `imagem`, `apagado`, `emprestado`) VALUES
(3, 'Maquina fotográfica', 'Máquina zica <br> Muitos megapixels <br> boa de verdade', 0, 0, 0),
(4, 'Tablet', 'Tablet ruim <br> Lento <br> Vários problemas', 0, 0, 0),
(5, 'MacBook', 'Puta computador bom', 0, 0, 0),
(6, 'Canetão', 'Caneta de escrever na lousa', 0, 0, 0),
(7, 'Cadeira de rodinhas', 'Cadeira bem boa', 0, 0, 0),
(8, 'iPhone 7', 'iPhone 7 vermelho', 0, 0, 0),
(9, 'Cadeira sem rodinhas', '', 0, 0, 0),
(10, 'Notebook Linux', '', 0, 0, 0),
(11, 'Notebook Acer', '', 0, 0, 0),
(12, 'Notebook Dell', '', 0, 0, 0),
(13, 'Lixeira', 'Lixeira de tamanho 30x15', 0, 0, 0),
(14, 'Bolsa de Notebook', 'Bolsa azul', 0, 0, 0),
(15, 'Bolsa de Ipad', 'Bolsa Azul\r\n', 0, 0, 0),
(16, 'AllInOne', 'AllInOne Bonitão\r\n', 0, 0, 0),
(17, 'Pen drive', '', 0, 0, 0),
(18, 'HD Externo', '', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento`
--

CREATE TABLE `evento` (
  `id_evento` int(11) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `tipo` int(11) NOT NULL DEFAULT '1',
  `inicio` time DEFAULT NULL,
  `final` time NOT NULL,
  `data` date NOT NULL,
  `apagado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `evento`
--

INSERT INTO `evento` (`id_evento`, `descricao`, `tipo`, `inicio`, `final`, `data`, `apagado`) VALUES
(43, 'Primeiro Turno ', 1, '07:00:00', '15:00:00', '2017-10-25', 1),
(44, 'Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-01', 1),
(45, 'Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-08', 1),
(46, 'Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-15', 1),
(47, 'Segundo Turno', 1, '16:00:00', '23:00:00', '2017-10-25', 1),
(48, 'Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-01', 1),
(49, 'Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-08', 1),
(50, 'Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-15', 1),
(51, 'Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-10-26', 1),
(52, 'Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-02', 1),
(53, 'Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-09', 1),
(54, 'Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-16', 1),
(55, 'Quarta: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-10-25', 0),
(56, 'Quarta: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-01', 0),
(57, 'Quarta: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-10-25', 0),
(58, 'Quarta: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-01', 0),
(59, 'Quarta: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-08', 0),
(60, 'Quinta: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-10-26', 0),
(61, 'Quinta: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-02', 0),
(62, 'Quinta: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-09', 0),
(63, 'Quinta: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-10-26', 0),
(64, 'Quinta: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-02', 0),
(65, 'Quinta: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-09', 0),
(66, 'Sexta: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-10-27', 0),
(67, 'Sexta: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-03', 0),
(68, 'Sexta: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-10', 0),
(69, 'Sexta: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-17', 0),
(70, 'Sexta: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-24', 0),
(71, 'Sexta: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-10-27', 0),
(72, 'Sexta: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-03', 0),
(73, 'Sexta: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-10', 0),
(74, 'Sexta: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-17', 0),
(75, 'Sexta: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-24', 0),
(76, 'Segunda: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-10-30', 0),
(77, 'Segunda: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-06', 0),
(78, 'Segunda: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-13', 0),
(79, 'Segunda: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-20', 0),
(80, 'Segunda: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-27', 0),
(81, 'Segunda: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-10-30', 0),
(82, 'Segunda: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-06', 0),
(83, 'Segunda: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-13', 0),
(84, 'Segunda: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-20', 0),
(85, 'Segunda: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-27', 0),
(86, 'Terça: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-10-31', 0),
(87, 'Terça: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-07', 0),
(88, 'Terça: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-14', 0),
(89, 'Terça: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-21', 0),
(90, 'Terça: Primeiro Turno', 1, '07:00:00', '15:00:00', '2017-11-28', 0),
(91, 'Terça: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-10-31', 0),
(92, 'Terça: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-07', 0),
(93, 'Terça: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-14', 0),
(94, 'Terça: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-21', 0),
(95, 'Terça: Segundo Turno', 1, '16:00:00', '23:00:00', '2017-11-28', 0),
(96, 'Reunião com o Gabriel', 1, '23:00:00', '23:30:00', '2017-10-28', 0);

--
-- Acionadores `evento`
--
DELIMITER $$
CREATE TRIGGER `deleteLogEvento` AFTER DELETE ON `evento` FOR EACH ROW INSERT INTO `log` (`tabela`, `operacao`, `informacao`, `data_registro`) VALUES ('login', 'DELETE', OLD.descricao, CURRENT_TIMESTAMP)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertLogEvento` AFTER INSERT ON `evento` FOR EACH ROW INSERT INTO `log` (`tabela`, `operacao`, `informacao`, `data_registro`) VALUES ('login', 'INSERT', NEW.descricao, CURRENT_TIMESTAMP)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateLogEvento` AFTER UPDATE ON `evento` FOR EACH ROW INSERT INTO `log` (`tabela`, `operacao`, `informacao`, `data_registro`) VALUES ('login', 'UPDATE', NEW.descricao, CURRENT_TIMESTAMP)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `tabela` varchar(100) NOT NULL,
  `operacao` varchar(50) NOT NULL,
  `informacao` varchar(100) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `log`
--

INSERT INTO `log` (`id`, `tabela`, `operacao`, `informacao`, `data_registro`) VALUES
(1, 'login', 'UPDATE', 'pietro', '2017-10-19 12:25:22'),
(2, 'login', 'UPDATE', 'pietro', '2017-10-19 12:26:02'),
(3, 'login', 'UPDATE', 'pietro', '2017-10-19 14:40:42'),
(4, 'membro', 'INSERT', 'Membro de Teste', '2017-10-19 14:43:40'),
(5, 'membro', 'UPDATE', 'Adrielle Poli', '2017-10-19 14:45:28'),
(6, 'membro', 'UPDATE', 'Membro de Teste', '2017-10-19 14:45:43'),
(7, 'login', 'UPDATE', 'pietro', '2017-10-19 19:40:44'),
(8, 'login', 'UPDATE', 'Reunião Apresentação Sistema 1', '2017-10-19 19:42:54'),
(9, 'login', 'UPDATE', 'Reunião Apresentação Sistema', '2017-10-19 19:43:02'),
(10, 'login', 'UPDATE', 'pietro', '2017-10-19 19:43:40'),
(11, 'login', 'UPDATE', 'pietro', '2017-10-19 19:44:08'),
(12, 'login', 'UPDATE', 'pietro', '2017-10-19 19:44:16'),
(13, 'membro', 'UPDATE', 'Adrielle Poli', '2017-10-23 20:59:32'),
(14, 'membro', 'UPDATE', 'Adrielle Poli', '2017-10-23 21:08:30'),
(15, 'login', 'DELETE', 'Plantão Quarta-Feira', '2017-10-24 11:19:06'),
(16, 'login', 'DELETE', 'Plantão Quarta-Feira', '2017-10-24 11:19:10'),
(17, 'login', 'DELETE', 'Plantão Quarta-Feira', '2017-10-24 11:19:10'),
(18, 'login', 'DELETE', 'Plantão Quarta-Feira', '2017-10-24 11:19:10'),
(19, 'login', 'DELETE', 'Plantão Quarta-Feira', '2017-10-24 11:19:10'),
(20, 'login', 'DELETE', 'Plantão de Quinta-Feira', '2017-10-24 11:19:10'),
(21, 'login', 'DELETE', 'Plantão de Quinta-Feira', '2017-10-24 11:19:10'),
(22, 'login', 'DELETE', 'Plantão de Quinta-Feira', '2017-10-24 11:19:10'),
(23, 'login', 'DELETE', 'Plantão de Quinta-Feira', '2017-10-24 11:19:10'),
(24, 'login', 'DELETE', 'Plantão de Quinta-Feira', '2017-10-24 11:19:10'),
(25, 'login', 'DELETE', 'Reunião Recursos Humanos', '2017-10-24 11:19:10'),
(26, 'login', 'DELETE', 'ENEJUNESP ', '2017-10-24 11:19:10'),
(27, 'login', 'DELETE', 'Plantão Manhã ', '2017-10-24 11:19:10'),
(28, 'login', 'DELETE', 'Plantão Manhã ', '2017-10-24 11:19:10'),
(29, 'login', 'DELETE', 'Plantão Manhã ', '2017-10-24 11:19:10'),
(30, 'login', 'DELETE', 'Reunião Teste', '2017-10-24 11:19:10'),
(31, 'login', 'DELETE', 'Reunião Apresentação Sistema', '2017-10-24 11:19:10'),
(32, 'login', 'DELETE', 'Reunião Apresentação Sistema', '2017-10-24 11:19:10'),
(33, 'login', 'DELETE', 'Reunião Geral', '2017-10-24 11:19:10'),
(34, 'login', 'DELETE', 'Teste', '2017-10-24 11:19:10'),
(35, 'login', 'DELETE', 'Segunda-feira Depois da Aula', '2017-10-24 11:19:10'),
(36, 'login', 'DELETE', 'Segunda-feira Depois da Aula', '2017-10-24 11:19:10'),
(37, 'login', 'DELETE', 'Segunda-feira Depois da Aula', '2017-10-24 11:19:10'),
(38, 'login', 'DELETE', 'Segunda-feira Depois da Aula', '2017-10-24 11:19:10'),
(39, 'login', 'DELETE', 'Segunda-feira Depois da Aula', '2017-10-24 11:19:10'),
(40, 'login', 'DELETE', 'Segunda-feira Depois da Aula', '2017-10-24 11:19:10'),
(41, 'login', 'DELETE', 'Segunda-feira Depois da Aula', '2017-10-24 11:19:10'),
(42, 'login', 'DELETE', 'Segunda-feira Depois da Aula', '2017-10-24 11:19:10'),
(43, 'login', 'DELETE', 'Segunda-feira Depois da Aula', '2017-10-24 11:19:10'),
(44, 'login', 'DELETE', 'Segunda-feira Depois da Aula', '2017-10-24 11:19:10'),
(45, 'login', 'DELETE', 'Segunda-feira antes da aula', '2017-10-24 11:19:10'),
(46, 'login', 'DELETE', 'Segunda-feira antes da aula', '2017-10-24 11:19:10'),
(47, 'login', 'DELETE', 'Segunda-feira antes da aula', '2017-10-24 11:19:10'),
(48, 'login', 'DELETE', 'Segunda-feira antes da aula', '2017-10-24 11:19:10'),
(49, 'login', 'DELETE', 'Segunda-feira antes da aula', '2017-10-24 11:19:10'),
(50, 'login', 'DELETE', 'Segunda-feira antes da aula', '2017-10-24 11:19:10'),
(51, 'login', 'DELETE', 'Segunda-feira antes da aula', '2017-10-24 11:19:10'),
(52, 'login', 'DELETE', 'Segunda-feira antes da aula', '2017-10-24 11:19:10'),
(53, 'login', 'DELETE', 'Segunda-feira antes da aula', '2017-10-24 11:19:10'),
(54, 'login', 'DELETE', 'Segunda-feira antes da aula', '2017-10-24 11:19:10'),
(55, 'login', 'DELETE', 'Aula do Celso', '2017-10-24 11:19:10'),
(56, 'login', 'DELETE', 'Pietro Evento', '2017-10-24 11:19:10'),
(57, 'membro', 'DELETE', 'Adrielle Poli', '2017-10-24 11:19:32'),
(58, 'membro', 'DELETE', 'Amanda Cassab', '2017-10-24 11:19:32'),
(59, 'membro', 'DELETE', 'Ana Luisa Pelosi', '2017-10-24 11:19:32'),
(60, 'membro', 'DELETE', 'Beatriz Moreira', '2017-10-24 11:19:32'),
(61, 'membro', 'DELETE', 'Beatriz Martinez', '2017-10-24 11:19:32'),
(62, 'membro', 'DELETE', 'Beatriz Silva', '2017-10-24 11:19:32'),
(63, 'membro', 'DELETE', 'Daniele Rocha', '2017-10-24 11:19:32'),
(64, 'membro', 'DELETE', 'Deivide Nascimento', '2017-10-24 11:19:32'),
(65, 'membro', 'DELETE', 'Elaine Figueiredo', '2017-10-24 11:19:32'),
(66, 'membro', 'DELETE', 'Elvis Silva', '2017-10-24 11:19:32'),
(67, 'membro', 'DELETE', 'Erika Kamuchena', '2017-10-24 11:19:32'),
(68, 'membro', 'DELETE', 'Felipe Nassif', '2017-10-24 11:19:32'),
(69, 'membro', 'DELETE', 'Flávia Gabriela', '2017-10-24 11:19:32'),
(70, 'membro', 'DELETE', 'Flávio Castilho', '2017-10-24 11:19:32'),
(71, 'membro', 'DELETE', 'Gabrielle Menezes', '2017-10-24 11:19:32'),
(72, 'membro', 'DELETE', 'Igor Pressoto', '2017-10-24 11:19:32'),
(73, 'membro', 'DELETE', 'Jullia Gaudencio', '2017-10-24 11:19:32'),
(74, 'membro', 'DELETE', 'Kamille Kathellen', '2017-10-24 11:19:32'),
(75, 'membro', 'DELETE', 'Letícia Levorato', '2017-10-24 11:19:32'),
(76, 'membro', 'DELETE', 'Letícia Mayumi', '2017-10-24 11:19:32'),
(77, 'membro', 'DELETE', 'Matheus Horácio', '2017-10-24 11:19:32'),
(78, 'membro', 'DELETE', 'Monique Zati', '2017-10-24 11:19:32'),
(79, 'membro', 'DELETE', 'Natália Paulucci', '2017-10-24 11:19:32'),
(80, 'membro', 'DELETE', 'Nicole Freitas', '2017-10-24 11:19:32'),
(81, 'membro', 'DELETE', 'Pamella Ng', '2017-10-24 11:19:32'),
(82, 'membro', 'DELETE', 'Roger Costa', '2017-10-24 11:19:32'),
(83, 'membro', 'DELETE', 'Talita Araujo', '2017-10-24 11:19:32'),
(84, 'membro', 'DELETE', 'Thaís Cunha', '2017-10-24 11:19:32'),
(85, 'membro', 'DELETE', 'Usman Gomes', '2017-10-24 11:19:32'),
(86, 'membro', 'DELETE', 'Victor Rhéa', '2017-10-24 11:19:32'),
(87, 'membro', 'DELETE', 'Wellington Hilário', '2017-10-24 11:19:32'),
(88, 'membro', 'DELETE', 'Pietro', '2017-10-24 11:19:32'),
(89, 'membro', 'DELETE', 'Membro de Teste', '2017-10-24 11:19:32'),
(90, 'login', 'UPDATE', 'admin@ejcomp.com.br', '2017-10-24 11:20:43'),
(91, 'login', 'UPDATE', 'sede@ejcomp.com.br', '2017-10-24 11:20:51'),
(92, 'login', 'INSERT', 'bruna', '2017-10-24 11:21:21'),
(93, 'membro', 'INSERT', 'Bruna Tumiatti de Freitas Milani', '2017-10-24 12:20:42'),
(94, 'membro', 'INSERT', 'Beatriz Gonçalves Silva', '2017-10-24 12:24:20'),
(95, 'membro', 'INSERT', 'André Henrique Gonçales Dias', '2017-10-24 12:25:48'),
(96, 'membro', 'INSERT', 'Phillipe SantAna', '2017-10-24 12:27:19'),
(97, 'membro', 'INSERT', 'Bruno Santos', '2017-10-24 12:29:11'),
(98, 'membro', 'INSERT', 'Gustavo Lopes', '2017-10-24 12:30:03'),
(99, 'membro', 'INSERT', 'Vinicius Vedovotto', '2017-10-24 12:30:44'),
(100, 'membro', 'INSERT', 'Giulia Campos de Oliveira', '2017-10-24 12:31:44'),
(101, 'membro', 'INSERT', 'Felipe de Aguiar Porteiro', '2017-10-24 12:32:37'),
(102, 'membro', 'INSERT', 'Arthur Reis', '2017-10-24 12:33:22'),
(103, 'membro', 'INSERT', 'Fernanda Carolina', '2017-10-24 12:34:01'),
(104, 'membro', 'INSERT', 'Matheus Palmeira', '2017-10-24 12:34:34'),
(105, 'membro', 'INSERT', 'Pedro Vicari', '2017-10-24 12:35:18'),
(106, 'membro', 'INSERT', 'Pietro', '2017-10-24 12:36:40'),
(107, 'membro', 'INSERT', 'Darlan Nakamura', '2017-10-24 12:38:21'),
(108, 'membro', 'INSERT', 'Felipe Tanji', '2017-10-24 12:38:50'),
(109, 'membro', 'INSERT', 'Vinicius Jabes', '2017-10-24 12:40:08'),
(110, 'membro', 'INSERT', 'Fábio Tondin', '2017-10-24 12:40:44'),
(111, 'membro', 'INSERT', 'João Pedro Baptista', '2017-10-24 12:41:37'),
(112, 'membro', 'INSERT', 'Jediael Morais Souza', '2017-10-24 12:42:39'),
(113, 'membro', 'INSERT', 'João Pedro Junqueira', '2017-10-24 12:43:16'),
(114, 'membro', 'INSERT', 'Luiz Filipe Monge', '2017-10-24 12:43:46'),
(115, 'membro', 'INSERT', 'Gilmar Santos', '2017-10-24 12:44:23'),
(116, 'membro', 'INSERT', 'Igor Forucho', '2017-10-24 12:44:53'),
(117, 'membro', 'INSERT', 'João Guilherme F. Tonhon', '2017-10-24 12:45:30'),
(118, 'login', 'INSERT', 'Primeiro Turno', '2017-10-24 13:19:33'),
(119, 'login', 'INSERT', 'Primeiro Turno', '2017-10-24 13:19:33'),
(120, 'login', 'INSERT', 'Primeiro Turno', '2017-10-24 13:19:33'),
(121, 'login', 'INSERT', 'Primeiro Turno', '2017-10-24 13:19:33'),
(122, 'login', 'INSERT', 'Segundo Turno', '2017-10-24 13:20:32'),
(123, 'login', 'INSERT', 'Segundo Turno', '2017-10-24 13:20:32'),
(124, 'login', 'INSERT', 'Segundo Turno', '2017-10-24 13:20:32'),
(125, 'login', 'INSERT', 'Segundo Turno', '2017-10-24 13:20:32'),
(126, 'login', 'INSERT', 'Primeiro Turno', '2017-10-24 13:22:13'),
(127, 'login', 'INSERT', 'Primeiro Turno', '2017-10-24 13:22:13'),
(128, 'login', 'INSERT', 'Primeiro Turno', '2017-10-24 13:22:13'),
(129, 'login', 'INSERT', 'Primeiro Turno', '2017-10-24 13:22:13'),
(130, 'login', 'UPDATE', 'Primeiro Turno Quarta', '2017-10-24 13:22:48'),
(131, 'login', 'UPDATE', 'Primeiro Turno ', '2017-10-24 13:22:56'),
(132, 'login', 'UPDATE', 'Primeiro Turno ', '2017-10-24 13:23:34'),
(133, 'login', 'UPDATE', 'Segundo Turno', '2017-10-24 13:23:38'),
(134, 'login', 'UPDATE', 'Primeiro Turno', '2017-10-24 13:23:42'),
(135, 'login', 'UPDATE', 'Primeiro Turno', '2017-10-24 13:23:48'),
(136, 'login', 'UPDATE', 'Segundo Turno', '2017-10-24 13:23:52'),
(137, 'login', 'UPDATE', 'Primeiro Turno', '2017-10-24 13:25:26'),
(138, 'login', 'UPDATE', 'Primeiro Turno', '2017-10-24 13:25:31'),
(139, 'login', 'UPDATE', 'Segundo Turno', '2017-10-24 13:25:34'),
(140, 'login', 'UPDATE', 'Primeiro Turno', '2017-10-24 13:25:38'),
(141, 'login', 'UPDATE', 'Primeiro Turno', '2017-10-24 13:25:42'),
(142, 'login', 'UPDATE', 'Segundo Turno', '2017-10-24 13:25:47'),
(143, 'login', 'UPDATE', 'Primeiro Turno', '2017-10-24 13:26:07'),
(144, 'login', 'INSERT', 'Quarta: Primeiro Turno', '2017-10-24 13:27:01'),
(145, 'login', 'INSERT', 'Quarta: Primeiro Turno', '2017-10-24 13:27:01'),
(146, 'login', 'INSERT', 'Quarta: Segundo Turno', '2017-10-24 13:28:25'),
(147, 'login', 'INSERT', 'Quarta: Segundo Turno', '2017-10-24 13:28:25'),
(148, 'login', 'INSERT', 'Quarta: Segundo Turno', '2017-10-24 13:28:25'),
(149, 'login', 'INSERT', 'Quinta: Primeiro Turno', '2017-10-24 13:29:07'),
(150, 'login', 'INSERT', 'Quinta: Primeiro Turno', '2017-10-24 13:29:08'),
(151, 'login', 'INSERT', 'Quinta: Primeiro Turno', '2017-10-24 13:29:08'),
(152, 'login', 'INSERT', 'Quinta: Segundo Turno', '2017-10-24 13:29:51'),
(153, 'login', 'INSERT', 'Quinta: Segundo Turno', '2017-10-24 13:29:51'),
(154, 'login', 'INSERT', 'Quinta: Segundo Turno', '2017-10-24 13:29:51'),
(155, 'login', 'INSERT', 'Sexta: Primeiro Turno', '2017-10-24 13:31:21'),
(156, 'login', 'INSERT', 'Sexta: Primeiro Turno', '2017-10-24 13:31:21'),
(157, 'login', 'INSERT', 'Sexta: Primeiro Turno', '2017-10-24 13:31:21'),
(158, 'login', 'INSERT', 'Sexta: Primeiro Turno', '2017-10-24 13:31:22'),
(159, 'login', 'INSERT', 'Sexta: Primeiro Turno', '2017-10-24 13:31:22'),
(160, 'login', 'INSERT', 'Sexta: Segundo Turno', '2017-10-24 13:32:07'),
(161, 'login', 'INSERT', 'Sexta: Segundo Turno', '2017-10-24 13:32:07'),
(162, 'login', 'INSERT', 'Sexta: Segundo Turno', '2017-10-24 13:32:07'),
(163, 'login', 'INSERT', 'Sexta: Segundo Turno', '2017-10-24 13:32:07'),
(164, 'login', 'INSERT', 'Sexta: Segundo Turno', '2017-10-24 13:32:07'),
(165, 'login', 'INSERT', 'Segunda: Primeiro Turno', '2017-10-24 13:51:55'),
(166, 'login', 'INSERT', 'Segunda: Primeiro Turno', '2017-10-24 13:51:56'),
(167, 'login', 'INSERT', 'Segunda: Primeiro Turno', '2017-10-24 13:51:57'),
(168, 'login', 'INSERT', 'Segunda: Primeiro Turno', '2017-10-24 13:51:58'),
(169, 'login', 'INSERT', 'Segunda: Primeiro Turno', '2017-10-24 13:51:58'),
(170, 'login', 'INSERT', 'Segunda: Segundo Turno', '2017-10-24 13:52:29'),
(171, 'login', 'INSERT', 'Segunda: Segundo Turno', '2017-10-24 13:52:29'),
(172, 'login', 'INSERT', 'Segunda: Segundo Turno', '2017-10-24 13:52:30'),
(173, 'login', 'INSERT', 'Segunda: Segundo Turno', '2017-10-24 13:52:30'),
(174, 'login', 'INSERT', 'Segunda: Segundo Turno', '2017-10-24 13:52:30'),
(175, 'login', 'INSERT', 'Terça: Primeiro Turno', '2017-10-24 13:56:17'),
(176, 'login', 'INSERT', 'Terça: Primeiro Turno', '2017-10-24 13:56:17'),
(177, 'login', 'INSERT', 'Terça: Primeiro Turno', '2017-10-24 13:56:17'),
(178, 'login', 'INSERT', 'Terça: Primeiro Turno', '2017-10-24 13:56:18'),
(179, 'login', 'INSERT', 'Terça: Primeiro Turno', '2017-10-24 13:56:18'),
(180, 'login', 'INSERT', 'Terça: Segundo Turno', '2017-10-24 13:57:01'),
(181, 'login', 'INSERT', 'Terça: Segundo Turno', '2017-10-24 13:57:01'),
(182, 'login', 'INSERT', 'Terça: Segundo Turno', '2017-10-24 13:57:01'),
(183, 'login', 'INSERT', 'Terça: Segundo Turno', '2017-10-24 13:57:01'),
(184, 'login', 'INSERT', 'Terça: Segundo Turno', '2017-10-24 13:57:02'),
(185, 'login', 'UPDATE', 'pietro', '2017-10-26 18:59:14'),
(186, 'login', 'UPDATE', 'pietro', '2017-10-26 23:11:19'),
(187, 'login', 'INSERT', 'Reunião com o Gabriel', '2017-10-29 01:03:19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login`
--

CREATE TABLE `login` (
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `tipo_usuario` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `login`
--

INSERT INTO `login` (`username`, `password`, `tipo_usuario`) VALUES
('admin@ejcomp.com.br', 'LuNR3px5ZBaG63nE', 1),
('bruna', '124827#ejcomp', 2),
('pietro', 'pietro', 2),
('sede@ejcomp.com.br', '68aeffd#P', 1);

--
-- Acionadores `login`
--
DELIMITER $$
CREATE TRIGGER `deleteLogLogin` AFTER DELETE ON `login` FOR EACH ROW INSERT INTO `log` (`tabela`, `operacao`, `informacao`, `data_registro`) VALUES ('login', 'DELETE', OLD.username, CURRENT_TIMESTAMP)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertLogLogin` AFTER INSERT ON `login` FOR EACH ROW INSERT INTO `log` (`tabela`, `operacao`, `informacao`, `data_registro`) VALUES ('login', 'INSERT', NEW.username, CURRENT_TIMESTAMP)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateLogLogin` AFTER UPDATE ON `login` FOR EACH ROW INSERT INTO `log` (`tabela`, `operacao`, `informacao`, `data_registro`) VALUES ('login', 'UPDATE', NEW.username, CURRENT_TIMESTAMP)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `membro`
--

CREATE TABLE `membro` (
  `id_membro` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rg` varchar(20) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `numero` varchar(10) NOT NULL,
  `bairro` varchar(10) NOT NULL,
  `cidade` varchar(100) NOT NULL,
  `celular` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `foto` varchar(100) NOT NULL DEFAULT 'default.jpg',
  `apagado` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `membro`
--

INSERT INTO `membro` (`id_membro`, `nome`, `cargo`, `email`, `rg`, `cpf`, `endereco`, `numero`, `bairro`, `cidade`, `celular`, `status`, `foto`, `apagado`) VALUES
(39, 'Bruna Tumiatti de Freitas Milani', 'Gerente - Recursos Humanos', 'bruna.t.f.milani@hotmail.com', '00.000.000-0', '474.080.728-96', '-', '-', '-', '-', '(', 1, 'default.jpg', 0),
(40, 'Beatriz Gonçalves Silva', 'Diretora Recursos Humanos', 'beatrizgsx@gmail.com', '00.000.000-0', '000.000.000-00', '-', '-', '-', '-', '(', 1, 'default.jpg', 0),
(41, 'André Henrique Gonçales Dias', 'Membro', 'andredias131299@gmail.com', '00.000.000-0', '000.000.000-00', '0', '0', '0', '0', '(0', 1, 'default.jpg', 0),
(42, 'Phillipe SantAna', 'Membro', 'ph_santana@outlook.com', '00.000.000-0', '000.000.000-00', '0', '0', '0', '0', '(0', 1, 'default.jpg', 0),
(43, 'Bruno Santos', 'Diretor Financeiro', 'bruh_santos@live.com', '00.000.000-0', '000.000.000-00', '0', '0', '0', '0', '(0', 1, 'default.jpg', 0),
(44, 'Gustavo Lopes', 'Membro', 'gustavo.lopes2@hotmail.com', '00.000.000-0', '000.000.000-00', '000000000000', '0', '0', '0', '(0', 1, 'default.jpg', 0),
(45, 'Vinicius Vedovotto', 'Membro', 'vinicius_vedovotto@hotmail.com', '00.000.000-0', '000.000.000-00', '0', '0', '0', '0', '(0', 1, 'default.jpg', 0),
(46, 'Giulia Campos de Oliveira', 'Diretora Administrativa', 'giuliacoliveira@gmail.com', '00.000.000-0', '000.000.000-0', '0', '0', '0', '0', '(0', 1, 'default.jpg', 0),
(47, 'Felipe de Aguiar Porteiro', 'Membro', 'felipe_porteiro@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(48, 'Arthur Reis', 'Conselheiro', 'arthur_aero@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(49, 'Fernanda Carolina', 'Membro', 'fccs1998@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(50, 'Matheus Palmeira', 'Presidente', 'matheus_160497@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(51, 'Pedro Vicari', 'Membro', 'peehvicari@gmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(52, 'Pietro', 'Membro', 'pietro_cheetos@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(53, 'Darlan Nakamura', 'Diretor Projetos', 'darlannakamura@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(54, 'Felipe Tanji', 'Membro', 'ftanji@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(55, 'Vinicius Jabes', 'Membro', 'vinijabes@gmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(56, 'Fábio Tondin', 'Membro', 'fabiotperez@gmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(57, 'João Pedro Baptista', 'Membro', 'joaosbaptista@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(58, 'Jediael Morais Souza', 'Membro', 'jediaelms@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(59, 'João Pedro Junqueira', 'Membro', 'jopjunqueira1@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(60, 'Luiz Filipe Monge', 'Membro', 'luizfilipemonge@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(61, 'Gilmar Santos', 'Membro', 'gilmarfrancisos828@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(62, 'Igor Forucho', 'Gerente Financeiro', 'igor_012@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0),
(63, 'João Guilherme F. Tonhon', 'Membro', 'joaoo_tonhon@hotmail.com', '00.000.000-0', '000.000.000-00', '', '', '', '', '', 1, 'default.jpg', 0);

--
-- Acionadores `membro`
--
DELIMITER $$
CREATE TRIGGER `deleteLogMembro` AFTER DELETE ON `membro` FOR EACH ROW INSERT INTO `log` (`tabela`, `operacao`, `informacao`, `data_registro`) VALUES ('membro', 'DELETE', OLD.nome, CURRENT_TIMESTAMP)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `insertLog` AFTER INSERT ON `membro` FOR EACH ROW INSERT INTO `log` (`tabela`, `operacao`, `informacao`, `data_registro`) VALUES ('membro', 'INSERT', NEW.nome, CURRENT_TIMESTAMP)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateLogMembro` AFTER UPDATE ON `membro` FOR EACH ROW INSERT INTO `log` (`tabela`, `operacao`, `informacao`, `data_registro`) VALUES ('membro', 'UPDATE', NEW.nome, CURRENT_TIMESTAMP)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `membro_equipamento`
--

CREATE TABLE `membro_equipamento` (
  `id` int(11) NOT NULL,
  `id_membro` int(11) NOT NULL,
  `id_equipamento` int(11) NOT NULL,
  `motivo` varchar(500) NOT NULL,
  `data_emprestimo` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_devolucao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `membro_equipamento`
--

INSERT INTO `membro_equipamento` (`id`, `id_membro`, `id_equipamento`, `motivo`, `data_emprestimo`, `data_devolucao`) VALUES
(3, 41, 4, 'Estou pegando o tablet emprestado para aperfeiçoar os layouts android que estou desenvolvendo', '2017-10-27 19:23:58', NULL),
(4, 41, 4, 'Eu quero', '2017-10-27 19:38:54', NULL),
(5, 41, 3, 'Descreva aqui o motivo de seu empréstimo', '2017-10-28 00:57:12', NULL),
(6, 41, 5, 'Descreva aqui o motivo de seu empréstimo', '2017-10-28 00:58:36', NULL),
(7, 41, 8, 'Quero ver nudes', '2017-11-06 11:46:27', NULL),
(8, 41, 13, 'Preciso dela no banheiro', '2017-11-06 12:11:14', NULL),
(9, 41, 6, 'Quero', '2017-11-06 13:13:10', NULL),
(10, 41, 3, 'Quero tirar fotos nus', '2017-11-06 17:03:39', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `membro_evento`
--

CREATE TABLE `membro_evento` (
  `id` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `id_membro` int(11) NOT NULL,
  `chegada` time DEFAULT NULL,
  `saida` time DEFAULT NULL,
  `justificativa` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `membro_evento`
--

INSERT INTO `membro_evento` (`id`, `id_evento`, `id_membro`, `chegada`, `saida`, `justificativa`) VALUES
(188, 43, 43, NULL, NULL, NULL),
(189, 43, 42, NULL, NULL, NULL),
(190, 43, 41, NULL, NULL, NULL),
(191, 43, 44, NULL, NULL, NULL),
(192, 44, 43, NULL, NULL, NULL),
(193, 44, 42, NULL, NULL, NULL),
(194, 44, 41, NULL, NULL, NULL),
(195, 44, 44, NULL, NULL, NULL),
(196, 45, 43, NULL, NULL, NULL),
(197, 45, 42, NULL, NULL, NULL),
(198, 45, 41, NULL, NULL, NULL),
(199, 45, 44, NULL, NULL, NULL),
(200, 46, 43, NULL, NULL, NULL),
(201, 46, 42, NULL, NULL, NULL),
(202, 46, 41, NULL, NULL, NULL),
(203, 46, 44, NULL, NULL, NULL),
(204, 47, 39, NULL, NULL, NULL),
(205, 47, 40, NULL, NULL, NULL),
(206, 47, 45, NULL, NULL, NULL),
(207, 48, 39, NULL, NULL, NULL),
(208, 48, 40, NULL, NULL, NULL),
(209, 48, 45, NULL, NULL, NULL),
(210, 49, 39, NULL, NULL, NULL),
(211, 49, 40, NULL, NULL, NULL),
(212, 49, 45, NULL, NULL, NULL),
(213, 50, 39, NULL, NULL, NULL),
(214, 50, 40, NULL, NULL, NULL),
(215, 50, 45, NULL, NULL, NULL),
(216, 51, 46, NULL, NULL, NULL),
(217, 51, 47, NULL, NULL, NULL),
(218, 51, 48, NULL, NULL, NULL),
(219, 51, 49, NULL, NULL, NULL),
(220, 52, 46, NULL, NULL, NULL),
(221, 52, 47, NULL, NULL, NULL),
(222, 52, 48, NULL, NULL, NULL),
(223, 52, 49, NULL, NULL, NULL),
(224, 53, 46, NULL, NULL, NULL),
(225, 53, 47, NULL, NULL, NULL),
(226, 53, 48, NULL, NULL, NULL),
(227, 53, 49, NULL, NULL, NULL),
(228, 54, 46, NULL, NULL, NULL),
(229, 54, 47, NULL, NULL, NULL),
(230, 54, 48, NULL, NULL, NULL),
(231, 54, 49, NULL, NULL, NULL),
(232, 55, 43, '10:54:19', '13:55:08', NULL),
(233, 55, 44, '10:46:40', '13:11:11', NULL),
(234, 55, 41, '10:46:49', '13:29:12', NULL),
(235, 55, 42, '10:47:01', '13:10:14', NULL),
(236, 56, 43, NULL, NULL, NULL),
(237, 56, 44, NULL, NULL, NULL),
(238, 56, 41, NULL, NULL, NULL),
(239, 56, 42, NULL, NULL, NULL),
(240, 57, 40, NULL, NULL, NULL),
(241, 57, 39, '17:51:09', '19:12:35', NULL),
(242, 57, 45, '17:28:38', '19:12:22', NULL),
(243, 58, 40, NULL, NULL, NULL),
(244, 58, 39, NULL, NULL, NULL),
(245, 58, 45, NULL, NULL, NULL),
(246, 59, 40, NULL, NULL, NULL),
(247, 59, 39, NULL, NULL, NULL),
(248, 59, 45, NULL, NULL, NULL),
(249, 60, 46, '10:22:58', '12:22:12', NULL),
(250, 60, 47, '10:22:52', '11:01:39', NULL),
(251, 61, 46, NULL, NULL, NULL),
(252, 61, 47, NULL, NULL, NULL),
(253, 62, 46, NULL, NULL, NULL),
(254, 62, 47, NULL, NULL, NULL),
(255, 63, 48, '18:48:34', '19:38:29', NULL),
(256, 63, 49, '16:58:53', '19:01:09', NULL),
(257, 64, 48, NULL, NULL, NULL),
(258, 64, 49, NULL, NULL, NULL),
(259, 65, 48, NULL, NULL, NULL),
(260, 65, 49, NULL, NULL, NULL),
(261, 66, 50, NULL, NULL, NULL),
(262, 67, 50, NULL, NULL, NULL),
(263, 68, 50, NULL, NULL, NULL),
(264, 69, 50, NULL, NULL, NULL),
(265, 70, 50, NULL, NULL, NULL),
(266, 71, 51, NULL, NULL, NULL),
(267, 72, 51, NULL, NULL, NULL),
(268, 73, 51, NULL, NULL, NULL),
(269, 74, 51, NULL, NULL, NULL),
(270, 75, 51, NULL, NULL, NULL),
(271, 76, 52, NULL, NULL, NULL),
(272, 76, 57, NULL, NULL, NULL),
(273, 76, 55, NULL, NULL, NULL),
(274, 76, 56, NULL, NULL, NULL),
(275, 77, 52, '12:20:54', NULL, NULL),
(276, 77, 57, NULL, NULL, NULL),
(277, 77, 55, NULL, NULL, NULL),
(278, 77, 56, NULL, NULL, NULL),
(279, 78, 52, NULL, NULL, NULL),
(280, 78, 57, NULL, NULL, NULL),
(281, 78, 55, NULL, NULL, NULL),
(282, 78, 56, NULL, NULL, NULL),
(283, 79, 52, NULL, NULL, NULL),
(284, 79, 57, NULL, NULL, NULL),
(285, 79, 55, NULL, NULL, NULL),
(286, 79, 56, NULL, NULL, NULL),
(287, 80, 52, NULL, NULL, NULL),
(288, 80, 57, NULL, NULL, NULL),
(289, 80, 55, NULL, NULL, NULL),
(290, 80, 56, NULL, NULL, NULL),
(291, 81, 53, NULL, NULL, NULL),
(292, 81, 54, NULL, NULL, NULL),
(293, 82, 53, NULL, NULL, NULL),
(294, 82, 54, NULL, NULL, NULL),
(295, 83, 53, NULL, NULL, NULL),
(296, 83, 54, NULL, NULL, NULL),
(297, 84, 53, NULL, NULL, NULL),
(298, 84, 54, NULL, NULL, NULL),
(299, 85, 53, NULL, NULL, NULL),
(300, 85, 54, NULL, NULL, NULL),
(301, 86, 59, NULL, NULL, NULL),
(302, 86, 60, NULL, NULL, NULL),
(303, 86, 58, NULL, NULL, NULL),
(304, 87, 59, NULL, NULL, NULL),
(305, 87, 60, NULL, NULL, NULL),
(306, 87, 58, NULL, NULL, NULL),
(307, 88, 59, NULL, NULL, NULL),
(308, 88, 60, NULL, NULL, NULL),
(309, 88, 58, NULL, NULL, NULL),
(310, 89, 59, NULL, NULL, NULL),
(311, 89, 60, NULL, NULL, NULL),
(312, 89, 58, NULL, NULL, NULL),
(313, 90, 59, NULL, NULL, NULL),
(314, 90, 60, NULL, NULL, NULL),
(315, 90, 58, NULL, NULL, NULL),
(316, 91, 61, NULL, NULL, NULL),
(317, 91, 62, NULL, NULL, NULL),
(318, 91, 63, NULL, NULL, NULL),
(319, 92, 61, NULL, NULL, NULL),
(320, 92, 62, NULL, NULL, NULL),
(321, 92, 63, NULL, NULL, NULL),
(322, 93, 61, NULL, NULL, NULL),
(323, 93, 62, NULL, NULL, NULL),
(324, 93, 63, NULL, NULL, NULL),
(325, 94, 61, NULL, NULL, NULL),
(326, 94, 62, NULL, NULL, NULL),
(327, 94, 63, NULL, NULL, NULL),
(328, 95, 61, NULL, NULL, NULL),
(329, 95, 62, NULL, NULL, NULL),
(330, 95, 63, NULL, NULL, NULL),
(331, 96, 52, '23:03:27', '23:03:35', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `operacao`
--

CREATE TABLE `operacao` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `operacao`
--

INSERT INTO `operacao` (`id`, `nome`) VALUES
(1, 'Ver Eventos'),
(2, 'Novo Evento'),
(3, 'Ver Membros'),
(4, 'Novo Membro'),
(5, 'Inserir Presença'),
(6, 'Editar Evento'),
(7, 'Excluir Evento'),
(8, 'Editar Membro'),
(9, 'Excluir Membro'),
(10, 'Ver Membro Especifico'),
(11, 'Ver Evento Especifico');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `nome`) VALUES
(1, 'Usuário'),
(2, 'Administrador'),
(3, 'Usuário só Insere Presença');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_usuario_operacao`
--

CREATE TABLE `tipo_usuario_operacao` (
  `id` int(11) NOT NULL,
  `tipo_usuario_id` int(11) NOT NULL,
  `operacao_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tipo_usuario_operacao`
--

INSERT INTO `tipo_usuario_operacao` (`id`, `tipo_usuario_id`, `operacao_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5),
(6, 1, 1),
(7, 1, 5),
(8, 2, 6),
(9, 2, 7),
(11, 2, 9),
(13, 1, 11),
(14, 1, 3),
(15, 1, 10),
(16, 2, 10),
(17, 2, 11),
(19, 2, 8),
(21, 3, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `equipamento`
--
ALTER TABLE `equipamento`
  ADD PRIMARY KEY (`id_equipamento`);

--
-- Indexes for table `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id_evento`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `membro`
--
ALTER TABLE `membro`
  ADD PRIMARY KEY (`id_membro`);

--
-- Indexes for table `membro_equipamento`
--
ALTER TABLE `membro_equipamento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membro_evento`
--
ALTER TABLE `membro_evento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operacao`
--
ALTER TABLE `operacao`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_usuario_operacao`
--
ALTER TABLE `tipo_usuario_operacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipo_usuario_id` (`tipo_usuario_id`),
  ADD KEY `operacao_id` (`operacao_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipamento`
--
ALTER TABLE `equipamento`
  MODIFY `id_equipamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `evento`
--
ALTER TABLE `evento`
  MODIFY `id_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;
--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;
--
-- AUTO_INCREMENT for table `membro`
--
ALTER TABLE `membro`
  MODIFY `id_membro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `membro_equipamento`
--
ALTER TABLE `membro_equipamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `membro_evento`
--
ALTER TABLE `membro_evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;
--
-- AUTO_INCREMENT for table `operacao`
--
ALTER TABLE `operacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tipo_usuario_operacao`
--
ALTER TABLE `tipo_usuario_operacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tipo_usuario_operacao`
--
ALTER TABLE `tipo_usuario_operacao`
  ADD CONSTRAINT `fk_operacao_id` FOREIGN KEY (`operacao_id`) REFERENCES `operacao` (`id`),
  ADD CONSTRAINT `fk_tipo_usuario_id` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
