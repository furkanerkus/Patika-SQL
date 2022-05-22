--test veritabanınızda employee isimli sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo oluşturalım.
CREATE DATABASE test;

CREATE TABLE employee(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	birthday DATE,
	email VARCHAR(100)
);

--Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
insert into employee (name, birthday, email) values ('Nelie Walczak', '1975-08-01', 'nwalczak0@scribd.com');
...
insert into employee (name, birthday, email) values ('Jehanna Bacop', '1963-09-18', 'jbacop1d@disqus.com');


--Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım
UPDATE employee
SET name = 'Furkan Erkuş',
	birthday = '1995-01-14',
	email = 'furkan@erkus.com'
WHERE id = 23
RETURNING *;

UPDATE employee
SET birthday = '1989-09-01'
WHERE birthday BETWEEN '1989-09-01' AND '1989-09-30'
RETURNING *;

UPDATE employee
SET birthday = '2000-01-01'
WHERE name = 'Urbanus Aslott'
RETURNING name, birthday;

UPDATE employee
SET Name = 'Lebron James',
	birthday = '1985-06-06',
	email = 'lebron@james.com'
WHERE id = 25;

UPDATE employee
SET Name = 'Irmak Rouft'
WHERE email = 'irouft@360.cn'
RETURNING *;

--Sütunların her birine göre ilgili satırı silecek 5 adet DELETE işlemi yapalım.
DELETE FROM employee
WHERE id > 48
RETURNING *;

DELETE FROM employee
WHERE name = 'Irmak Rouft';

DELETE FROM employee
WHERE email = 'lebron@james.com';

DELETE FROM employee
WHERE birthday = '1995-01-14'
RETURNING *;

DELETE FROM employee
WHERE id = 5;