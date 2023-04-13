-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 13 apr 2023 om 15:21
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imdb`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230413095356', '2023-04-13 11:54:04', 116),
('DoctrineMigrations\\Version20230413102517', '2023-04-13 12:25:22', 22),
('DoctrineMigrations\\Version20230413103528', '2023-04-13 12:35:34', 268);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `episode`
--

CREATE TABLE `episode` (
  `id` int(11) NOT NULL,
  `serie_id` int(11) NOT NULL,
  `season` int(11) NOT NULL,
  `part` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `episode`
--

INSERT INTO `episode` (`id`, `serie_id`, `season`, `part`, `name`, `duration`) VALUES
(1, 1, 1, 1, 'Everbody Lies', '03:12:30'),
(2, 1, 1, 2, 'Paternity', '02:09:30'),
(3, 1, 2, 1, 'Acceptance', '04:07:30'),
(4, 1, 2, 2, 'Autopsy', '13:07:30'),
(5, 2, 1, 0, 'Celebration', '02:07:15'),
(8, 2, 1, 2, 'Show at the Factory', '01:05:07'),
(9, 2, 2, 1, 'The Summer Palace', '07:05:07'),
(11, 2, 2, 2, 'Vaulter', '23:05:07'),
(12, 6, 1, 1, 'Spy Night', '19:08:40'),
(13, 3, 3, 3, 'The Ruined King', '49:15:19'),
(14, 4, 32, 7, 'The Thong Eatah', '12:16:17'),
(15, 5, 2, 1, 'Slime block', '12:17:19');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Komedie'),
(2, 'Drama'),
(3, 'Action'),
(4, 'Fantasie');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `serie`
--

CREATE TABLE `serie` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `serie`
--

INSERT INTO `serie` (`id`, `title`, `description`, `year`, `genre_id`) VALUES
(1, 'House', 'House M.D. is een Amerikaanse ziekenhuisserie ontwikkeld door David Shore voor de Amerikaanse televisiezender Fox. De hoofdrol van Dr. Gregory House wordt vertolkt door de Engelse acteur Hugh Laurie. De serie liep acht seizoenen. House werd na zijn debuut in 2004 meermaals met prijzen bekroond.', 2004, 2),
(2, 'Succession', 'The Roy family is known for controlling the biggest media and entertainment company in the world. However, their world changes when their father steps down from the company.', 2018, 2),
(3, 'Game of Thrones', 'Game of Thrones is een Amerikaanse fantasy-televisieserie die werd uitgezonden op de televisiezender HBO. Het is gebaseerd op de boeken uit de serie Het lied van ijs en vuur van de Amerikaanse schrijver George R.R. Martin. De serie liep van 17 april 2011 tot 19 mei 2019', 2011, 4),
(4, 'The Vampire Diaries', 'The Vampire Diaries is een Amerikaanse drama/fantasy-televisieserie, gebaseerd op de gelijknamige boekenreeks van L.J. Smith. The CW Television Network begon op 10 september 2009 met het uitzenden van de serie in de Verenigde Staten', 2009, 4),
(5, 'Forrest Gump', 'Forrest Gump vertelt het verhaal van de simpele man genaamd Forrest Gump. Zijn lage IQ weerhoudt hem er niet van om een grote rol te spelen bij diverse belangrijke gebeurtenissen in de Amerikaanse geschiedenis. Drie turbulente decennia lang overkomt Forrest een stroom van gebeurtenissen, die hem meevoeren van football-held tot Vietnam-veteraan en garnalen-magnaat. Tussen deze gebeurtenissen door komt hij eens in de zoveel jaar zijn grote liefde Jenny tegen.', 1994, 1),
(6, 'The Night Agent', 'Low-level FBI agent, Peter Sutherland, works in the basement of the White House manning a phone that never rings--until the night it does--propelling him into a conspiracy that leads all the way to the Oval Office.', 2023, 3);

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `episode`
--
ALTER TABLE `episode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_DDAA1CDAD94388BD` (`serie_id`);

--
-- Indexen voor tabel `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AA3A93344296D31F` (`genre_id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `episode`
--
ALTER TABLE `episode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT voor een tabel `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `serie`
--
ALTER TABLE `serie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `episode`
--
ALTER TABLE `episode`
  ADD CONSTRAINT `FK_DDAA1CDAD94388BD` FOREIGN KEY (`serie_id`) REFERENCES `serie` (`id`);

--
-- Beperkingen voor tabel `serie`
--
ALTER TABLE `serie`
  ADD CONSTRAINT `FK_AA3A93344296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
