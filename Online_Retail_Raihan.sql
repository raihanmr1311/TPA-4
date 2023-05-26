-- Membuat database
CREATE DATABASE online_retail

-- Membuat tabel (semua table harus dibuat)
CREATE TABLE   `user`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `username`  VARCHAR(50) NOT NULL DEFAULT '',
    `password` VARCHAR(50) NOT NULL DEFAULT '',
    `name` VARCHAR(50) NOT NULL DEFAULT '',
    `address` VARCHAR(50) NOT NULL DEFAULT '',
    `phone` VARCHAR(50) NOT NULL DEFAULT '',
    PRIMARY KEY  (`id`)
)

DESC user

-- Mengisi data ke tabel (minimal 10 data per tabel)
INSERT INTO user (username, password, name, address, phone)
VALUES ("raihan13", "12345", "Raihan", "Jl.Kacapiring nomor 1", "082461728461")
INSERT INTO user (username, password, name, address, phone)
VALUES ("syhar19", "12345", "Syahrul", "Jl.Rambutan nomor 11", "082182917391")
INSERT INTO user (username, password, name, address, phone)
VALUES ("prst123", "12345", "Prasta", "Jl.Semangka nomor 12", "083181928133")
INSERT INTO user (username, password, name, address, phone)
VALUES ("ffan52", "12345", "Fafan", "Jl.Jeruk nomor 3", "085672982339")
INSERT INTO user (username, password, name, address, phone)
VALUES ("yds098", "12345", "Yudis", "Jl.Ki Hajar Dewantara nomor 5", "085361892647")
INSERT INTO user (username, password, name, address, phone)
VALUES ("satr24",    "12345", "Satrio", "Jl.Diponegoro nomor 1", "085761832734")
INSERT INTO user (username, password, name, address, phone)
VALUES ("tanq12", "12345", "Andika", "Jl.Mastrip nomor 8", "081313749263")
INSERT INTO user (username, password, name, address, phone)
VALUES ("dapp12", "12345", "Daffa", "Jl.Jawa nomor 9", "085719124776")
INSERT INTO user (username, password, name, address, phone)
VALUES ("ayu56", "12345", "Ayu", "Jl.Kalimantan nomor 7", "083126384618")
INSERT INTO user (username, password, name, address, phone)
VALUES ("esti19", "12345", "Esti", "Jl.Sumatera nomor 4", "083618264998")

-- Mengambil data dari tabel
SELECT * FROM user

DROP TABLE user

CREATE TABLE   `category`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `category_name`  VARCHAR(50) NOT NULL DEFAULT '',
    PRIMARY KEY  (`id`)
)

DESC category

INSERT INTO category (category_name)
VALUES ("Eletronik")
INSERT INTO category (category_name)
VALUES ("Otomotif")
INSERT INTO category (category_name)
VALUES ("Toys")
INSERT INTO category (category_name)
VALUES ("Sport")

SELECT * FROM category

DROP TABLE category

CREATE TABLE `product`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `product_name` VARCHAR(50) NOT NULL DEFAULT '',
    `description` TEXT NOT NULL DEFAULT '',
    `price` INT(50) NOT NULL,
    `id_category` INT(10) NOT NULL,
    PRIMARY KEY  (`id`),
    CONSTRAINT `id_category` FOREIGN KEY (`id_category`) REFERENCES `sql12620326`.`category` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
)

DESC product

INSERT INTO product (product_name, description, price, id_category)
VALUES ("Mouse", "Mouse bluetooth untuk komputer/pc menggunakan baterai AA", 150000, 1)
INSERT INTO product (product_name, description, price, id_category)
VALUES ("Sepatu Futsal", "Tersedia ukuran 39-45", 350000, 4)
INSERT INTO product (product_name, description, price, id_category)
VALUES ("Seker Megapro", "Seker Megapro ori AHM", 175000, 2)
INSERT INTO product (product_name, description, price, id_category)
VALUES ("Charger HP", "Charger hp untuk keluaran 10V~15V", 50000, 1)
INSERT INTO product (product_name, description, price, id_category)
VALUES ("Finger Spin", "Mainan tangan cocok untuk mengisi waktu kosong", 25000, 3)
INSERT INTO product (product_name, description, price, id_category)
VALUES ("Proyektor", "Proyektor dengan kekuatan 4000 Lumens", 1000000, 1)
INSERT INTO product (product_name, description, price, id_category)
VALUES ("Sarung Tangan Kiper", "Sarung tangan kiper tersedia dari ukuran S - XL", 250000, 4)
INSERT INTO product (product_name, description, price, id_category)
VALUES ("Bola plastik", "Untuk mainan anak - anak", 10000, 3)
INSERT INTO product (product_name, description, price, id_category)
VALUES ("Headlamp Scoopy", "Headlamp all new Scoopy", 300000, 2)
INSERT INTO product (product_name, description, price, id_category)
VALUES ("Lampu Tumbler", "Tumbler cocok untuk menghias kamar", 45000, 1)

SELECT * FROM product

DROP TABLE product

CREATE TABLE `shipper`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `shipper_name` VARCHAR(50) NOT NULL DEFAULT '',
    `phone` TEXT NOT NULL DEFAULT '',
    PRIMARY KEY  (`id`)
)

DESC shipper

INSERT INTO shipper (shipper_name, phone)
VALUES ("J&T", "082419127428")
INSERT INTO shipper (shipper_name, phone)
VALUES ("JNE", "085319274198")
INSERT INTO shipper (shipper_name, phone)
VALUES ("SiCepat", "082345716291")
INSERT INTO shipper (shipper_name, phone)
VALUES ("ShopeeXpress", "083778819102")

SELECT * FROM shipper

DROP TABLE shipper

CREATE TABLE `orders`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `order_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `id_user` INT(50) NOT NULL,
    `id_shipper` INT(50) NOT NULL,
    PRIMARY KEY  (`id`),
    CONSTRAINT `id_user` FOREIGN KEY (`id_user`) REFERENCES `sql12620326`.`user` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `id_shipper` FOREIGN KEY (`id_shipper`) REFERENCES `sql12620326`.`shipper` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
)

DESC orders

INSERT INTO orders (id_user, id_shipper)
VALUES (2, 1)
INSERT INTO orders (id_user, id_shipper)
VALUES (1, 1)
INSERT INTO orders (id_user, id_shipper)
VALUES (7, 1)
INSERT INTO orders (id_user, id_shipper)
VALUES (8, 1)
INSERT INTO orders (id_user, id_shipper)
VALUES (9, 1)
INSERT INTO orders (id_user, id_shipper)
VALUES (10, 1)
INSERT INTO orders (id_user, id_shipper)
VALUES (5, 1)
INSERT INTO orders (id_user, id_shipper)
VALUES (4, 1)
INSERT INTO orders (id_user, id_shipper)
VALUES (1, 1)
INSERT INTO orders (id_user, id_shipper)
VALUES (6, 1)

SELECT * FROM orders

DROP TABLE orders

CREATE TABLE `orders_detail`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `quantity` INT(100) NOT NULL,
    `id_order` INT(50) NOT NULL,
    `id_product` INT(50) NOT NULL,
    PRIMARY KEY  (`id`),
    CONSTRAINT `id_order` FOREIGN KEY (`id_order`) REFERENCES `sql12620326`.`orders` (`id`) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT `id_product` FOREIGN KEY (`id_product`) REFERENCES `sql12620326`.`product` (`id`) ON UPDATE CASCADE ON DELETE CASCADE
)

DESC orders_detail

INSERT INTO orders_detail (quantity, id_order, id_product)
VALUES (1, 2, 2)
INSERT INTO orders_detail (quantity, id_order, id_product)
VALUES (1, 2, 7)
INSERT INTO orders_detail (quantity, id_order, id_product)
VALUES (2, 5, 8)
INSERT INTO orders_detail (quantity, id_order, id_product)
VALUES (5, 5, 5)
INSERT INTO orders_detail (quantity, id_order, id_product)
VALUES (1, 7, 1)
INSERT INTO orders_detail (quantity, id_order, id_product)
VALUES (1, 7, 4)
INSERT INTO orders_detail (quantity, id_order, id_product)
VALUES (1, 7, 6)
INSERT INTO orders_detail (quantity, id_order, id_product)
VALUES (1, 7, 10)
INSERT INTO orders_detail (quantity, id_order, id_product)
VALUES (1, 8, 3)
INSERT INTO orders_detail (quantity, id_order, id_product)
VALUES (1, 8, 9)

-- 1 pelanggan membeli 3 barang yang berbeda.
SELECT * FROM orders_detail

-- Menghapus tabel
DROP TABLE orders_detail

-- Mengubah data di tabel
UPDATE user
SET password = '1263'
WHERE id = 2

-- Menghapus data di tabel
DELETE user
WHERE username = "esti19"

-- Melihat 3 produk yang paling sering dibeli oleh pelanggan.
SELECT orders_detail.id_product,
orders_detail.quantity,
product.product_name AS product_name
FROM orders_detail
INNER JOIN product
ON product.id = orders_detail.id_product
ORDER BY quantity DESC LIMIT 3

-- Menghapus database
DROP DATABASE online_retail
