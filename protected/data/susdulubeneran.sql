-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Inang: 127.0.0.1
-- Waktu pembuatan: 14 Nov 2013 pada 11.20
-- Versi Server: 5.5.27
-- Versi PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Basis data: `susdulubeneran`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `airport`
--

CREATE TABLE IF NOT EXISTS `airport` (
  `ID` char(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `airport`
--

INSERT INTO `airport` (`ID`, `name`) VALUES
('CGK', 'Soekarno Hatta'),
('DPS', 'Ngurah Rai');

-- --------------------------------------------------------

--
-- Struktur dari tabel `flight`
--

CREATE TABLE IF NOT EXISTS `flight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_plane` int(11) NOT NULL,
  `flight_number` varchar(10) NOT NULL,
  `departure_date` date NOT NULL,
  `departure_time` time NOT NULL,
  `arrival_date` date NOT NULL,
  `arrival_time` time NOT NULL,
  `origin` char(3) NOT NULL,
  `destination` char(3) NOT NULL,
  `distance` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_plane` (`ID_plane`,`origin`,`destination`),
  KEY `destination` (`destination`),
  KEY `origin` (`origin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `flight`
--

INSERT INTO `flight` (`ID`, `ID_plane`, `flight_number`, `departure_date`, `departure_time`, `arrival_date`, `arrival_time`, `origin`, `destination`, `distance`) VALUES
(1, 1, 'GA101', '2013-10-31', '08:45:00', '2013-10-31', '11:45:00', 'CGK', 'DPS', 100),
(2, 1, 'GA102', '2013-10-31', '11:00:00', '2013-10-31', '13:00:00', 'CGK', 'DPS', 100),
(3, 1, 'GA103', '2013-10-31', '15:00:00', '2013-10-31', '17:00:00', 'DPS', 'CGK', 100);

-- --------------------------------------------------------

--
-- Struktur dari tabel `plane`
--

CREATE TABLE IF NOT EXISTS `plane` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(10) NOT NULL,
  `baggage_capacity` int(11) NOT NULL,
  `passenger_capacity` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `plane`
--

INSERT INTO `plane` (`ID`, `model`, `baggage_capacity`, `passenger_capacity`) VALUES
(1, 'ABC', 100, 200);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ticket`
--

CREATE TABLE IF NOT EXISTS `ticket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_user` int(11) DEFAULT NULL,
  `ID_flight` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` enum('MALE','FEMALE','','') NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `class` enum('FIRSTCLASS','BUSINESS','ECONOMY','') NOT NULL,
  `price` int(11) NOT NULL,
  `seat` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_user` (`ID_user`,`ID_flight`),
  KEY `ID_flight` (`ID_flight`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Dumping data untuk tabel `ticket`
--

INSERT INTO `ticket` (`ID`, `ID_user`, `ID_flight`, `email`, `first_name`, `middle_name`, `last_name`, `address`, `phone`, `gender`, `city`, `province`, `postcode`, `class`, `price`, `seat`) VALUES
(1, 1, 1, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'jawa barat', '10135', 'ECONOMY', 300000, '1A'),
(18, 1, 1, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '1B'),
(19, 1, 1, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '1C'),
(20, 1, 2, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '1D'),
(21, 1, 3, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '1D'),
(22, 1, 2, 'sonmanurung@gmail.com', 'Sonny', 'Theo Tumbur', 'Manurung', 'Jalan Cisitu Indah', '0812121212212', 'MALE', 'Bandung', 'jawa barat', '10135', 'FIRSTCLASS', 1000000, '1D'),
(23, 1, 3, 'sonmanurung@gmail.com', 'Sonny', 'Theo Tumbur', 'Manurung', 'Jalan Cisitu Indah', '0812121212212', 'MALE', 'Bandung', 'jawa barat', '10135', 'FIRSTCLASS', 1000000, '1D'),
(24, 1, 2, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '1E'),
(25, 1, 3, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '1E'),
(26, 1, 2, 'sonmanurung@gmail.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'FEMALE', 'bandung', 'Jawa Barat', '10135', 'BUSINESS', 1000000, '1E'),
(27, 1, 3, 'sonmanurung@gmail.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'FEMALE', 'bandung', 'Jawa Barat', '10135', 'BUSINESS', 1000000, '1E'),
(28, 1, 2, 'sonmanurung@gmail.com', 'Sonny', 'Theo Tumbur', 'Manurung', 'Jalan Cisitu Indah', '0812121212212', 'MALE', 'Bandung', 'jawa barat', '10135', 'FIRSTCLASS', 1000000, '1E'),
(29, 1, 3, 'sonmanurung@gmail.com', 'Sonny', 'Theo Tumbur', 'Manurung', 'Jalan Cisitu Indah', '0812121212212', 'MALE', 'Bandung', 'jawa barat', '10135', 'FIRSTCLASS', 1000000, '1E'),
(30, 1, 2, 's@s.com', 'smanurung', 'middle', '', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '1F'),
(31, 1, 2, 's@s.com', 'smanurung', '', '', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '2A'),
(32, 1, 2, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '2B'),
(33, 1, 1, 'mike@portnoy.com', 'Mike', 'Manurung', 'Portnoy', 'Jalan Jalan', '081818121218', 'FEMALE', 'Boston', 'Jawa Timur', '19809', 'FIRSTCLASS', 1000000, '2C'),
(34, 1, 2, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '2D'),
(35, 1, 2, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '2E'),
(36, 1, 1, 'sonmanurung@gmail.com', 'Johan', 'Ridho', 'Tumpuan', 'Jalan Jalan', '0812121212212', 'FEMALE', 'Boston', 'Jawa Timur', '19809', 'FIRSTCLASS', 1000000, '3B'),
(37, 1, 2, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '2F'),
(38, 1, 1, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '3A'),
(39, 2, 2, 'sonmanurung@gmail.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '3C'),
(40, 1, 2, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '3D'),
(44, 2, 2, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '3E'),
(45, NULL, 1, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '3F'),
(46, NULL, 1, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'FEMALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '4A'),
(47, NULL, 2, 's@s.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '4B'),
(48, NULL, 1, 'sonmanurung@gmail.com', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'FEMALE', 'bandung', 'Jawa Barat', '10135', 'FIRSTCLASS', 1000000, '4C');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` enum('MALE','FEMALE','','') NOT NULL,
  `city` varchar(100) NOT NULL,
  `province` varchar(100) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `total_miles` int(11) NOT NULL,
  `current_miles` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`ID`, `email`, `password`, `first_name`, `middle_name`, `last_name`, `address`, `phone`, `gender`, `city`, `province`, `postcode`, `total_miles`, `current_miles`) VALUES
(1, 's@s.com', 'smanurung', 'smanurung', 'middle', 'last', 'jalan address', '081212121212', 'MALE', 'bandung', 'jawa barat', '10135', 100, 50),
(2, 'sonmanurung@gmail.com', '1000:2bl5jCN0mVZii1s49Lgxo+XgYHLOd2Zy:qj6RgCpUt17QbjN/qXm7L79tvf0a8K8s', 'Johan', 'Ridho', 'Tumpuan', 'Ga Punya', '0812121212212', 'FEMALE', 'Boston', 'Jawa Timur', '19809', 0, 0);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`ID_plane`) REFERENCES `plane` (`ID`),
  ADD CONSTRAINT `flight_ibfk_2` FOREIGN KEY (`origin`) REFERENCES `airport` (`ID`),
  ADD CONSTRAINT `flight_ibfk_3` FOREIGN KEY (`destination`) REFERENCES `airport` (`ID`);

--
-- Ketidakleluasaan untuk tabel `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`ID_user`) REFERENCES `user` (`ID`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`ID_flight`) REFERENCES `flight` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
