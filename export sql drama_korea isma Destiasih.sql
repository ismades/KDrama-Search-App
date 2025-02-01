-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2025 at 02:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drama_korea`
--

-- --------------------------------------------------------

--
-- Table structure for table `drakor`
--

CREATE TABLE `drakor` (
  `id_drama` varchar(10) NOT NULL,
  `nama_drama` varchar(100) DEFAULT NULL,
  `rating` float(2,1) DEFAULT NULL,
  `genre_drama` varchar(100) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drakor`
--

INSERT INTO `drakor` (`id_drama`, `nama_drama`, `rating`, `genre_drama`, `tahun`) VALUES
('DR001', 'Crash Landing on You', 8.7, 'Romantis, Komedi', 2020),
('DR002', 'Itaewon Class', 8.2, 'Drama', 2020),
('DR003', 'Its Okay to Not Be Okay', 8.6, 'Romantis, Drama', 2020),
('DR004', 'The King: Eternal Monarch', 8.1, 'Fantasi, Romantis', 2020),
('DR005', 'Hospital Playlist', 8.8, 'Medis, Drama', 2020),
('DR006', 'Extracurricular', 7.7, 'Kejahatan, Drama', 2020),
('DR007', 'Sweet Home', 7.4, 'Horor, Thriller', 2020),
('DR008', 'Start-Up', 7.6, 'Romantis, Drama', 2020),
('DR009', 'Kingdom Season 2', 8.4, 'Horor, Thriller, Sejarah', 2020),
('DR010', 'My Holo Love', 7.6, 'Romantis, Sci-Fi', 2020),
('DR011', 'Vincenzo', 8.5, 'Kejahatan, Komedi Hitam', 2021),
('DR012', 'Squid Game', 8.0, 'Thriller, Drama', 2021),
('DR013', 'Hometown Cha-Cha-Cha', 8.4, 'Komedi Romantis, Slice of Life', 2021),
('DR014', 'My Name', 7.8, 'Aksi, Thriller', 2021),
('DR015', 'Hellbound', 6.6, 'Fantasi, Horor', 2021),
('DR016', 'Move to Heaven', 8.6, 'Drama', 2021),
('DR017', 'The Silent Sea', 6.9, 'Sci-Fi, Thriller', 2021),
('DR018', 'D.P.', 8.2, 'Drama, Militer', 2021),
('DR019', 'Navillera', 8.8, 'Drama', 2021),
('DR020', 'Sisyphus: The Myth', 7.1, 'Sci-Fi, Thriller', 2021),
('DR021', 'All of Us Are Dead', 7.5, 'Horor, Thriller', 2022),
('DR022', 'Twenty-Five Twenty-One', 8.7, 'Romantis, Drama', 2022),
('DR023', 'Business Proposal', 8.1, 'Komedi Romantis', 2022),
('DR024', 'Our Blues', 7.8, 'Drama, Slice of Life', 2022),
('DR025', 'Extraordinary Attorney Woo', 8.9, 'Hukum, Drama', 2022),
('DR026', 'Little Women', 8.5, 'Thriller, Drama', 2022),
('DR027', 'Alchemy of Souls', 8.3, 'Fantasi, Romantis', 2022),
('DR028', 'Narco-Saints', 7.3, 'Kejahatan, Thriller', 2022),
('DR029', 'Reborn Rich', 8.1, 'Fantasi, Drama', 2022),
('DR030', 'The Glory', 8.0, 'Thriller, Drama', 2022),
('DR031', 'The Glory Part 2', 9.0, 'Thriller, Drama', 2023),
('DR032', 'The Good Bad Mother', 8.9, 'Drama, Keluarga', 2023),
('DR033', 'King the Land', 8.5, 'Komedi Romantis', 2023),
('DR034', 'Crash Course in Romance', 8.0, 'Komedi Romantis', 2023),
('DR035', 'Bloodhounds', 8.1, 'Aksi, Thriller', 2023),
('DR036', 'Doctor Cha', 7.7, 'Medis, Drama', 2023),
('DR037', 'Celebrity', 7.5, 'Thriller, Drama', 2023),
('DR038', 'Mask Girl', 7.4, 'Thriller, Drama', 2023),
('DR039', 'Queenmaker', 7.3, 'Drama, Politik', 2023),
('DR040', 'D.P. Season 2', 8.2, 'Drama, Militer', 2023),
('DR041', 'Queen of Tears', 9.0, 'Komedi Romantis', 2024),
('DR042', 'Lovely Runner', 9.1, 'Romantis, Komedi, Drama', 2024),
('DR043', 'The Atypical Family', 8.7, 'Drama, Keluarga', 2024),
('DR044', 'Doctor Slump', 8.3, 'Medis, Komedi, Romantis', 2024),
('DR045', 'Captivating The King', 8.4, 'Sejarah, Romantis, Drama', 2024),
('DR046', 'A Killer Paradox', 8.6, 'Thriller, Aksi, Misteri', 2024),
('DR047', 'Frankly Speaking', 8.2, 'Komedi, Romantis', 2024),
('DR048', 'Gyeongseong Creature Season 2', 8.5, 'Thriller, Fantasi, Sejarah', 2024),
('DR049', 'Mr. Plankton', 8.0, 'Romantis, Drama, Komedi', 2024),
('DR050', 'When the Stars Gossip', 8.5, 'Fiksi Ilmiah, Romantis, Komedi', 2024);

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_pencarian`
--

CREATE TABLE `riwayat_pencarian` (
  `urutan` int(11) NOT NULL,
  `query` varchar(10) DEFAULT NULL,
  `id_user` varchar(10) DEFAULT NULL,
  `id_drama` varchar(10) DEFAULT NULL,
  `nama_drama` varchar(100) DEFAULT NULL,
  `rating` float(2,1) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `waktu` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Id_User` varchar(10) NOT NULL,
  `Username` varchar(10) DEFAULT NULL,
  `Password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Id_User`, `Username`, `Password`) VALUES
('A01', 'isdes', '2222'),
('A02', 'isma', '0000'),
('A03', 'nur', '1111'),
('A04', 'limbad', '222'),
('A05', 'limbad', '2222'),
('A06', 'ipu', 'ipu'),
('A07', 'pipo', '5432');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drakor`
--
ALTER TABLE `drakor`
  ADD PRIMARY KEY (`id_drama`);

--
-- Indexes for table `riwayat_pencarian`
--
ALTER TABLE `riwayat_pencarian`
  ADD PRIMARY KEY (`urutan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_drama` (`id_drama`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Id_User`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `riwayat_pencarian`
--
ALTER TABLE `riwayat_pencarian`
  MODIFY `urutan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `riwayat_pencarian`
--
ALTER TABLE `riwayat_pencarian`
  ADD CONSTRAINT `riwayat_pencarian_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`Id_User`),
  ADD CONSTRAINT `riwayat_pencarian_ibfk_2` FOREIGN KEY (`id_drama`) REFERENCES `drakor` (`id_drama`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
