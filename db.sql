CREATE TABLE users (
	id serial PRIMARY KEY,
	name VARCHAR(100),
	email text UNIQUE NOT NULL,
	phone VARCHAR(100) NOT NULL,
	joined TIMESTAMP NOT NULL
);
ALTER TABLE "users" OWNER TO myuser;
ALTER TABLE "users" OWNER TO postgres;

CREATE TABLE login (
	id serial PRIMARY KEY,
	hash varchar(100) NOT NULL,
	email text UNIQUE NOT NULL
);

CREATE TABLE products (
	id serial PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	price int,
	img VARCHAR(100) NOT NULL,
	description VARCHAR(1000),
	category int,
	supplier VARCHAR(100),
	check(price >=0)	
);

ALTER TABLE "products" OWNER TO postgres;

INSERT INTO products(name, price, img, description, category, supplier)
VALUES('Áo bóng rổ',100,'themes/images/products/anh1.jpg',NULL,1,'USA')
;
INSERT INTO products(name, price, img, description, category, supplier)
VALUES('Quần jeans',120, 'themes/images/products/anh2.jpg','Ôm dáng',2,'Levis')
;
INSERT INTO products(name, price, img, description, category, supplier)
VALUES('Quần thể thao',50, 'themes/images/products/anh3.jpg','Chất liệu thấm hút',2,'Made in VietNam')
;
INSERT INTO products(name, price, img, description, category, supplier)
VALUES('Áo ngắn tay',45, 'themes/images/products/anh4.jpg','vải cotton',1,'Made in VietNam')
;
INSERT INTO products(name, price, img, description, category, supplier)
VALUES('Áo thể thao',220, 'themes/images/products/anh5.jpg','Chính hãng',1,'Adidas')
;
INSERT INTO products(name, price, img, description, category, supplier)
VALUES('Quần jogger',70, 'themes/images/products/anh6.jpg','Thời trang',2,'Adidas')
;
INSERT INTO products(name, price, img, description, category, supplier)
VALUES('Quần tây',75, 'themes/images/products/anh7.jpg','Kiểu dáng mới',2,'Uniqlo')
;
INSERT INTO products(name, price, img, description, category, supplier)
VALUES('Áo hoodie',84, 'themes/images/products/anh8.jpg','100% cotton',1,'USA')
;
CREATE TABLE carousels (
	id serial PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	img VARCHAR(100) NOT NULL
);
ALTER TABLE "carousels" OWNER TO postgres;
INSERT INTO carousels(name,img)
VALUES('anh 1','themes/images/carousel/carousel1.jpg');
INSERT INTO carousels(name,img)
VALUES('anh 2','themes/images/carousel/carousel2.jpg');

CREATE TABLE cartsessions (
	id serial PRIMARY KEY,
	sessionId VARCHAR(100),
	productId int,
	name VARCHAR(100),
	price int,
	img VARCHAR(100),
	description VARCHAR(1000),
	quantity int
);

ALTER TABLE "cartsessions" OWNER TO postgres;

CREATE TABLE sessions (
	id serial PRIMARY KEY,
	sessionId VARCHAR(100)
);

ALTER TABLE "sessions" OWNER TO postgres;

CREATE TABLE orders (
	id serial PRIMARY KEY,
	name VARCHAR(30),
	phone VARCHAR(20),
	email VARCHAR(30),
	address VARCHAR(100),
	city INT,
	addinfor VARCHAR(100),
	dateOrder timestamp,
	totalprice INT,
	status INT DEFAULT 0
);
ALTER TABLE "orders" OWNER TO postgres;

CREATE TABLE admin (
	id serial PRIMARY KEY,
	hash varchar(100) NOT NULL,
	email text UNIQUE NOT NULL
);
ALTER TABLE "admin" OWNER TO postgres;

CREATE TABLE orderdetail (
	id serial PRIMARY KEY,
	orderId int,
	productId int,
	name VARCHAR(100),
	price int,
	img VARCHAR(100),
	description VARCHAR(1000),
	quantity int
);

ALTER TABLE "orderdetail" OWNER TO postgres;
alter table orderdetail add constraint fk_productID foreign key (productID) references products(id);
alter table orderdetail add constraint fk_orderID foreign key (orderID) references orders(id);
alter table cartsessions add constraint fk_productID foreign key (productID) references products(id);
