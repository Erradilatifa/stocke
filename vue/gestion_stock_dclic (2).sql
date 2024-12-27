

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";






CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `nom_article` varchar(50) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire` int(11) NOT NULL,
  `date_fabrication` datetime NOT NULL,
  `date_expiration` datetime NOT NULL,
  `images` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `article` (`id`, `nom_article`, `id_categorie`, `quantite`, `prix_unitaire`, `date_fabrication`, `date_expiration`, `images`) VALUES
(10, 'dell', 1, 997, 40000, '2024-03-04 14:09:00', '2024-03-27 14:09:00', '../public/images/Dell-Vostro-3360.png'),
(11, 'iphone-13', 4, 197, 200000, '2024-02-27 14:19:00', '2024-03-27 14:19:00', '../public/images/ipohone.jpeg'),
(12, 'imprimante', 2, 62, 630000, '2024-03-02 14:23:00', '2024-04-07 14:23:00', '../public/images/impri.webp'),
(13, 'hp i5 8ème génération', 1, 38, 520000, '2024-03-10 14:27:00', '2024-03-27 14:27:00', '../public/images/hp5.webp'),
(14, 'camera', 5, 29, 3000000, '2024-02-29 14:44:00', '2024-03-29 14:45:00', '../public/images/pngimg.com - photo_camera_PNG101644.png'),
(15, 'Samsung Galaxy S23 Ultra', 4, 21, 2000000, '2024-03-25 01:35:00', '2024-03-28 01:35:00', '../public/images/n-africa-feature-galaxy-s23-s918-535239936.avif');

-- --------------------------------------------------------



CREATE TABLE `categorie_article` (
  `id` int(11) NOT NULL,
  `libelle_categorie` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `categorie_article` (`id`, `libelle_categorie`) VALUES
(1, 'Ordinateur'),
(2, 'Imprimante'),
(3, 'Accessoire'),
(4, 'smartphone'),
(5, 'Appareil photo');

-- --------------------------------------------------------



CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `telephone` varchar(30) NOT NULL,
  `adresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `client` (`id`, `nom`, `prenom`, `telephone`, `adresse`) VALUES
(1, 'Rami', 'Sanae', '0766590468', 'casa'),
(2, 'Boutaher', 'Nada', '0633567899', 'hay riad bouznika'),
(3, 'Erradi', 'Yuness', '0744356609', 'mohmmedi  '),
(5, 'bela', 'Nbila', '0755342134', 'mohmmedi'),
(6, 'Boustany', 'Hoda', '0766590468', 'casa'),
(7, 'Erradi', 'Latifa', '0655097754', ' mimosa mohmmedi');

-- --------------------------------------------------------


CREATE TABLE `commande` (
  `id` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `id_fournisseur` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `date_commande` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `commande` (`id`, `id_article`, `id_fournisseur`, `quantite`, `prix`, `date_commande`) VALUES
(6, 12, 2, 2, 1260000, '2024-03-27 13:50:14'),
(7, 15, 1, 1, 2000000, '2024-03-28 00:41:22');

-- --------------------------------------------------------



CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `nom` varchar(2) NOT NULL,
  `prenom` varchar(3) NOT NULL,
  `email` varchar(4) NOT NULL,
  `numero_de_téléphone` char(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `contact` (`id`, `nom`, `prenom`, `email`, `numero_de_téléphone`) VALUES
(1, 'Ja', 'Ama', 'jaha', '1234567890');

-- --------------------------------------------------------



CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `adresse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




INSERT INTO `fournisseur` (`id`, `nom`, `prenom`, `telephone`, `adresse`) VALUES
(1, 'Erradi', 'Latifa', '+22792470763', 'mimosa,mohmmedia'),
(2, 'Karim', 'Mohammed', '+22798655425', 'casa');

-- --------------------------------------------------------


CREATE TABLE `vente` (
  `id` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `date_vente` timestamp NOT NULL DEFAULT current_timestamp(),
  `etat` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



INSERT INTO `vente` (`id`, `id_article`, `id_client`, `quantite`, `prix`, `date_vente`, `etat`) VALUES
(22, 13, 6, 3, 520000, '2024-03-27 13:30:27', '0'),
(23, 10, 7, 3, 120000, '2024-03-27 13:31:04', '1'),
(24, 13, 6, 2, 1040000, '2024-03-27 13:33:04', '1'),
(26, 14, 2, 1, 3000000, '2024-03-27 13:49:21', '1'),
(27, 11, 7, 2, 400000, '2024-03-28 00:33:35', '1');


ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categorie` (`id_categorie`);


ALTER TABLE `categorie_article`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `id_fournisseur` (`id_fournisseur`);


ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `vente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_article` (`id_article`),
  ADD KEY `id_client` (`id_client`);


ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;


ALTER TABLE `categorie_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

-
ALTER TABLE `commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `fournisseur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `vente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;


ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id`);


ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`id_article`) REFERENCES `article` (`id`),
  ADD CONSTRAINT `vente_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`);
COMMIT;

