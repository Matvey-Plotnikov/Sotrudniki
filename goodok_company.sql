-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Май 11 2026 г., 14:37
-- Версия сервера: 5.7.24
-- Версия PHP: 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `goodok_company`
--

-- --------------------------------------------------------

--
-- Структура таблицы `access_levels`
--

CREATE TABLE `access_levels` (
  `id_access_level` int(11) NOT NULL,
  `level_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `access_levels`
--

INSERT INTO `access_levels` (`id_access_level`, `level_name`) VALUES
(1, 'Guest'),
(2, 'User'),
(3, 'Editor'),
(4, 'Manager'),
(5, 'Administrator');

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `id_account` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`id_account`, `username`, `password`) VALUES
(1, '1', '1'),
(2, '2', '2'),
(3, '3', '3'),
(4, '4', '4'),
(5, '5', '5'),
(6, '6', '6'),
(7, '7', '7'),
(8, '8', '8'),
(9, '9', '9'),
(10, '10', '10'),
(12, '11', '11');

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `id_department` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`id_department`, `department_name`) VALUES
(1, 'IT Department'),
(2, 'Human Resources'),
(3, 'Sales'),
(4, 'Finance'),
(5, 'Legal'),
(6, 'Marketing'),
(7, 'Technical Support'),
(8, 'R&D'),
(9, 'Logistics'),
(10, 'Security');

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE `employees` (
  `id_employee` int(11) NOT NULL,
  `id_position` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `id_department` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`id_employee`, `id_position`, `id_account`, `id_department`, `full_name`, `email`) VALUES
(1, 1, 1, 1, 'John Doe', 'john.doe@company.com'),
(2, 2, 2, 2, 'Jane Smith', 'jane.smith@company.com'),
(3, 3, 3, 1, 'Robert Brown', 'robert.b@company.com'),
(4, 4, 4, 4, 'Emily Davis', 'emily.d@company.com'),
(5, 5, 5, 1, 'Michael Wilson', 'm.wilson@company.com'),
(6, 6, 6, 6, 'Sarah Miller', 's.miller@company.com'),
(7, 7, 7, 3, 'David Taylor', 'd.taylor@company.com'),
(8, 8, 8, 8, 'Linda Moore', 'l.moore@company.com'),
(9, 9, 9, 1, 'James Anderson', 'j.anderson@company.com'),
(10, 10, 10, 10, 'William Thomas', 'w.thomas@company.com'),
(12, 10, 12, 1, '11', '11@company.com');

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `id_file` int(11) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `file_data` longblob,
  `is_public` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `files`
--

INSERT INTO `files` (`id_file`, `file_name`, `file_size`, `file_data`, `is_public`) VALUES
(11, 'тест.txt', 14, 0x48656c6c6f20576f726c64210d0a, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `file_transfers`
--

CREATE TABLE `file_transfers` (
  `id_transfer` int(11) NOT NULL,
  `id_file` int(11) NOT NULL,
  `id_sender` int(11) NOT NULL,
  `id_receiver` int(11) NOT NULL,
  `transfer_datetime` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `file_transfers`
--

INSERT INTO `file_transfers` (`id_transfer`, `id_file`, `id_sender`, `id_receiver`, `transfer_datetime`, `status`) VALUES
(1, 1, 7, 4, '2026-02-25 10:59:58', 'Completed'),
(2, 2, 9, 5, '2026-02-25 10:59:58', 'In Progress'),
(3, 3, 1, 2, '2026-02-25 10:59:58', 'Completed'),
(4, 4, 8, 10, '2026-02-25 10:59:58', 'Pending'),
(5, 5, 4, 7, '2026-02-25 10:59:58', 'Completed'),
(6, 6, 3, 1, '2026-02-25 10:59:58', 'Failed'),
(7, 7, 5, 9, '2026-02-25 10:59:58', 'Completed'),
(8, 8, 9, 3, '2026-02-25 10:59:58', 'Completed'),
(9, 9, 10, 8, '2026-02-25 10:59:58', 'Processing'),
(10, 10, 2, 6, '2026-02-25 10:59:58', 'Completed');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id_message` int(11) NOT NULL,
  `id_account` int(11) NOT NULL,
  `message_text` text NOT NULL,
  `send_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id_message`, `id_account`, `message_text`, `send_date`) VALUES
(1, 8, 'Привет, я новый Менеджер!', '2026-03-11 21:51:19'),
(2, 6, 'Привет, я тоже новенький!', '2026-03-11 21:51:55'),
(3, 6, 'Проверка времени...', '2026-03-11 21:52:08'),
(4, 8, 'проверка', '2026-03-12 10:33:34'),
(5, 8, 'урааа', '2026-03-12 10:40:49'),
(6, 6, 'cfvgbhnjmk,l.;/\'', '2026-03-12 11:02:46'),
(7, 6, 'привет', '2026-03-15 14:42:51'),
(8, 10, '!', '2026-03-16 10:31:50'),
(9, 10, '123', '2026-04-29 10:02:03');

-- --------------------------------------------------------

--
-- Структура таблицы `operations`
--

CREATE TABLE `operations` (
  `id_operation` int(11) NOT NULL,
  `id_file` int(11) NOT NULL,
  `id_transfer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `operations`
--

INSERT INTO `operations` (`id_operation`, `id_file`, `id_transfer`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

-- --------------------------------------------------------

--
-- Структура таблицы `positions`
--

CREATE TABLE `positions` (
  `id_position` int(11) NOT NULL,
  `id_access_level` int(11) NOT NULL,
  `position_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `positions`
--

INSERT INTO `positions` (`id_position`, `id_access_level`, `position_name`) VALUES
(1, 1, 'Intern'),
(2, 1, 'Junior Assistant'),
(3, 2, 'Developer'),
(4, 2, 'Analyst'),
(5, 3, 'Senior Developer'),
(6, 3, 'Content Editor'),
(7, 4, 'Project Manager'),
(8, 4, 'Department Head'),
(9, 5, 'System Architect'),
(10, 5, 'Chief Technology Officer');

-- --------------------------------------------------------

--
-- Структура таблицы `private_messages`
--

CREATE TABLE `private_messages` (
  `id_msg` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message_text` text NOT NULL,
  `send_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `private_messages`
--

INSERT INTO `private_messages` (`id_msg`, `sender_id`, `receiver_id`, `message_text`, `send_date`) VALUES
(1, 3, 10, 'Привет!', '2026-04-30 08:34:01'),
(2, 5, 3, 'привет', '2026-04-30 08:37:31'),
(3, 3, 5, 'привет привет', '2026-04-30 08:37:51'),
(4, 10, 3, 'Привет привет', '2026-04-30 08:51:02'),
(5, 3, 10, 'Привет!!!', '2026-04-30 12:12:44'),
(6, 10, 3, 'КУ', '2026-04-30 12:12:59'),
(7, 3, 10, 'рпррл', '2026-04-30 12:20:05');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `access_levels`
--
ALTER TABLE `access_levels`
  ADD PRIMARY KEY (`id_access_level`);

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id_account`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id_department`);

--
-- Индексы таблицы `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id_employee`),
  ADD UNIQUE KEY `id_account` (`id_account`),
  ADD KEY `fk_emp_position` (`id_position`),
  ADD KEY `fk_emp_department` (`id_department`);

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id_file`);

--
-- Индексы таблицы `file_transfers`
--
ALTER TABLE `file_transfers`
  ADD PRIMARY KEY (`id_transfer`),
  ADD KEY `fk_trans_file` (`id_file`),
  ADD KEY `fk_trans_sender` (`id_sender`),
  ADD KEY `fk_trans_receiver` (`id_receiver`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id_message`),
  ADD KEY `id_account` (`id_account`);

--
-- Индексы таблицы `operations`
--
ALTER TABLE `operations`
  ADD PRIMARY KEY (`id_operation`),
  ADD KEY `fk_op_file` (`id_file`),
  ADD KEY `fk_op_transfer` (`id_transfer`);

--
-- Индексы таблицы `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id_position`),
  ADD KEY `fk_pos_access` (`id_access_level`);

--
-- Индексы таблицы `private_messages`
--
ALTER TABLE `private_messages`
  ADD PRIMARY KEY (`id_msg`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `access_levels`
--
ALTER TABLE `access_levels`
  MODIFY `id_access_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id_account` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `id_department` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `employees`
--
ALTER TABLE `employees`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `file_transfers`
--
ALTER TABLE `file_transfers`
  MODIFY `id_transfer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id_message` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `operations`
--
ALTER TABLE `operations`
  MODIFY `id_operation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `positions`
--
ALTER TABLE `positions`
  MODIFY `id_position` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `private_messages`
--
ALTER TABLE `private_messages`
  MODIFY `id_msg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_emp_account` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id_account`),
  ADD CONSTRAINT `fk_emp_department` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id_department`),
  ADD CONSTRAINT `fk_emp_position` FOREIGN KEY (`id_position`) REFERENCES `positions` (`id_position`);

--
-- Ограничения внешнего ключа таблицы `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`id_account`) REFERENCES `accounts` (`id_account`);

--
-- Ограничения внешнего ключа таблицы `private_messages`
--
ALTER TABLE `private_messages`
  ADD CONSTRAINT `private_messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `accounts` (`id_account`),
  ADD CONSTRAINT `private_messages_ibfk_2` FOREIGN KEY (`receiver_id`) REFERENCES `accounts` (`id_account`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
