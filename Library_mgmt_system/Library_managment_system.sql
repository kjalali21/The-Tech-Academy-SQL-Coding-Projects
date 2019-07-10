use db_library

CREATE TABLE tbl_book (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	book_title VARCHAR(50) NOT NULL,
	book_publisher_name VARCHAR(50) NOT NULL CONSTRAINT fk_book_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name)
	);


CREATE TABLE tbl_book_author(
	author_name VARCHAR (50) NOT NULL,
	author_book_id INT NOT NULL CONSTRAINT fk_author_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE
	);


CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL
	);



CREATE TABLE tbl_publisher (
	publisher_name varchar(50) PRIMARY KEY NOT NULL,
	publisher_address varchar(50) NOT NULL,
	publisher_phone varchar(50) NOT NULL
	);


CREATE TABLE tbl_book_copies(
	number_of_copies INT NOT NULL,
	copies_branch_id INT NOT NULL CONSTRAINT fk_copies_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	copies_book_id INT NOT NULL CONSTRAINT fk_copies_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

CREATE TABLE tbl_borrower(
	card_no INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrow_phone_number VARCHAR (50) NOT NULL
	);


CREATE TABLE tbl_book_loans(
	date_out VARCHAR(30) NOT NULL,
	date_due VARCHAR(30) NOT NULL,
	card_no INT NOT NULL CONSTRAINT fk_loans_card_no FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_loans_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	book_id INT NOT NULL CONSTRAINT fk_loans_book_id FOREIGN KEY REFERENCES tbl_book(book_id) ON UPDATE CASCADE ON DELETE CASCADE    /* Include in insert statements, count id by 1,2,3,4 since identity is incremented by 1,1 */
	);

		/******************************************************
	 *  tables are built, populate them
	 ******************************************************/

	INSERT INTO tbl_library_branch
	(branch_name, branch_address)
	VALUES
	('Sharpstown','1311-1st-Street'),
	('Central','2451-29th-Street'),
	('Eastern','8134-30th-Street'),
	('Western','1591-90th-Street')
	;
	SELECT * FROM tbl_library_branch
	INSERT INTO tbl_book
	(book_title, book_publisher_name)
	VALUES
	('The-Lost-Tribe','HarperCollins'),
	('Becoming','Penguin-Random-House'),
	('Magnolia-Table','Scholastic'),
	('Girl, Wash-Your-Face','Wiley'),
	('Diary-of-a-Wimpy-Kid','HarperCollins'),
	('Fire-and-Fury','Penguin-Random-House'),
	('The-Wonky-Donkey','Scholastic'),
	('Fear','Wiley'),
	('Dog-Man-and-Cat-Kid','HarperCollins'),
	('You-Are-a-Badass','Penguin-Random-House'),
	('The-President-Is-Missing ','Scholastic'),
	('12-Rules-for-Life','Wiley'),
	('Dog Man: Brawl-of-the-Wild','HarperCollins'),
	('A-Wrinkle-in-Time ','Penguin-Random-House'),
	('A-Higher-Loyalty','Scholastic'),
	('Crazy-Rich-Asians','Wiley'),
	('The-Reckoning','HarperCollins'),
	('It','Penguin-Random-House'),
	('Harry-Potter','Scholastic'),
	('Star-Wars','Wiley'),
	('Tarzan','HarperCollins')
	;
	select * from tbl_book

	INSERT INTO tbl_book_author
	(author_name,author_book_id)
	VALUES
	('Stephen-King',1),
	('Larry-Smith',2),
	('J.K-Rowling',3),
	('Kurt-Vonnegut',4),
	('Virginia-Woolf',5),
	('Ernest-Hemingway',6),
	('William-Faulkner',7),
	('Ayn-Rand',8),
	('Dr-Suess',9),
	('Obi-Wan',10),
	('Stephen-King',11),
	('Larry-Smith',12),
	('J.K-Rowling',13),
	('Kurt-Vonnegut',14),
	('Virginia-Woolf',15),
	('Ernest-Hemingway',16),
	('William-Faulkner',17),
	('Ayn-Rand',18),
	('Dr-Suess',19),
	('Obi-Wan',20)
	;

	/* 5.  put 10 book titles in Sharpstown & 10 in Central, both need 2 copies of each title (copy and paste 10 book titles) */

	INSERT INTO tbl_borrower			/* 7.  8 borrowers required in table, 2 of them have more than 5 books loaned to them */
	(borrower_name, borrower_address, borrow_phone_number)
	VALUES
	('John Smith','414 st','618-891-5115'),
	('Jerry Jones','8114 st','871-041-5156'),
	('Jim Buss','140 st','145-561-8210'),
	('Bob Smith','031 st','841-461-6701'),
    ('John Dean','141 st','715-411-6001'),
	('Shawna Jones','898 st','819-901-0191'),
	('Sean Johnson','01941 st','014-551-9101'),
	('Stephanie Johanson','90145 st','760-015-5191')
	;

	SELECT * FROM tbl_borrower

	INSERT INTO tbl_publisher
	(publisher_name,publisher_address,publisher_phone)
	VALUES
	('Penguin-Random-House','741-ave','760-241-6001'),
	('Scholastic','814-ave','858-145-1999'),
	('Wiley','919-ave','971-151-1566'),
	('HarperCollins','690-ave','807-145-1001')
	;

	INSERT INTO tbl_book_copies
	(number_of_copies,copies_branch_id,copies_book_id)
	VALUES
	('10',1,1),
	('11',2,2),
	('12',3,3),
	('13',4,4),
	('14',1,5),
	('15',2,6),
	('16',3,7),
	('17',4,8),
	('18',1,9),
	('19',2,10),
	('20',3,11),
	('21',4,12),
	('22',1,13),
	('23',2,14),
	('24',3,15),
	('25',4,16),
	('26',1,17),
	('27',2,18),
	('28',3,19),
	('29',4,20),
	('30',1,21),
	('31',2,1),
	('32',3,2),
	('33',4,3),
	('34',1,4),
	('35',2,5),
	('36',3,6),
	('37',4,7),
	('38',1,8),
	('39',2,9),
	('40',3,10),
	('41',4,11),
	('42',1,12),
	('43',2,13),
	('44',3,14),
	('45',4,15),
	('46',1,16),
	('47',2,17),
	('48',3,18),
	('49',4,19),
	('50',1,20),
	('51',2,21)
	;

	INSERT INTO tbl_book_loans
	(date_out, date_due, branch_id, card_no, book_id)
	VALUES
	('2019-12-01','2019-01-02',1,1,1),
	('2019-01-02','2019-12-01',2,2,2),
	('2019-03-07','2019-04-01',3,3,3),
	('2019-04-01','2018-12-09',4,4,4),
	('2018-12-09','2019-11-12',1,5,5),
	('2019-11-12','2019-08-19',2,6,6),
	('2019-08-19','2018-12-01',3,7,7),
	('2018-12-01','2017-12-01',4,8,8),
	('2017-12-01','2018-07-19',1,1,9),
	('2018-07-19','2018-12-14',2,2,10),
	('2018-12-14','2018-11-18',3,3,11),
	('2018-11-18','2017-08-12',4,4,12),
	('2017-08-12','2019-06-01',1,5,13),
	('2019-06-01','2018-03-30',2,6,14),
	('2018-03-30','2018-12-01',3,7,15),
	('2018-12-01','2018-09-14',4,8,16),
	('2018-09-14','2019-07-14',1,1,17),
	('2019-07-14','2018-10-12',2,2,18),
	('2018-10-12','2019-08-12',3,3,19),
	('2019-08-12','2019-04-30',4,4,20),
	('2019-04-30','2019-02-13',1,5,21),
	('2019-02-13','2018-04-24',2,6,1),
	('2018-04-24','2019-01-12',3,7,2),
	('2019-01-12','2019-04-19',4,8,3),
	('2019-04-19','2020-04-20',1,1,4),
	('2020-04-20','2018-06-10',2,2,5),
	('2018-06-10','2019-12-13',3,3,6),
	('2019-12-13','2019-08-19',4,4,7),
	('2019-08-19','2018-11-08',1,5,8),
	('2018-11-08','2019-10-12',2,6,9),
	('2019-10-12','2019-07-10',3,7,10),
	('2019-07-10','2019-05-12',4,8,11),
	('2019-05-12','2019-03-29',1,1,12),
	('2019-03-29','2019-05-12',2,2,13),
	('2019-05-12','2019-03-24',3,3,14),
	('2019-03-24','2019-02-30',4,4,15),
	('2019-02-30','2018-11-12',1,5,16),
	('2018-11-12','2018-07-13',2,6,17),
	('2018-07-13','2018-05-13',3,7,18),
	('2018-05-13','2019-01-08',4,8,19),
	('2019-01-08','2018-12-20',1,1,20),
	('2018-12-20','2019-04-12',2,2,21),
	('2019-04-12','2019-12-13',3,3,1),
	('2019-12-13','2019-10-12',4,4,2),
	('2019-10-12','2019-04-19',1,5,3),
	('2019-04-19','2019-08-13',2,6,4),
	('2019-08-13','2018-11-19',3,7,5),
	('2018-11-19','2018-10-20',4,8,6),
	('2018-10-20','2018-09-12',1,1,7),
	('2018-09-12','2019-05-20',2,2,8),
	('2019-05-20','2019-11-19',3,3,9),
	('2019-11-19','2019-12-06',4,4,10)
	;

	SELECT * FROM tbl_book_loans

	SELECT * FROM tbl_book_copies


	--============================================================
	--BEGIN PROCEDURES
	--============================================================
	/*             */
	CREATE PROCEDURE lostTribeSharpsTown
	AS
	SELECT tbl_book.book_title, tbl_library_branch.branch_name AS 'Branch Name', tbl_book_copies.number_of_copies AS 'book copies'
	FROM tbl_book_copies
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_copies.copies_branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copies.copies_book_id
	Where tbl_book.book_title = 'The-Lost-Tribe' AND tbl_library_branch.branch_name = 'Sharpstown'
	;

	CREATE PROCEDURE lostTribelibraryBranch
	AS
	SELECT tbl_book.book_title, tbl_library_branch.branch_name AS 'Branch Name', tbl_book_copies.number_of_copies AS 'book copies'
	FROM tbl_book_copies
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_copies.copies_branch_id
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copies.copies_book_id
	WHERE tbl_book.book_title = 'The-Lost-Tribe'
	;

	CREATE PROCEDURE nobookscheckedout
	AS
	SELECT tbl_borrower.borrower_name, COUNT (tbl_book_loans.card_no) AS 'Books Checked Out'
	FROM tbl_book_loans
	INNER JOIN tbl_borrower ON tbl_borrower.card_no = tbl_book_loans.card_no
	GROUP BY tbl_borrower.borrower_name, tbl_borrower.card_no
	HAVING COUNT (tbl_book_loans.card_no) =0;

	CREATE PROCEDURE SharpstownDue
	AS
	SELECT tbl_book.book_title, tbl_borrower.borrower_name, tbl_borrower.borrower_address
    FROM tbl_library_branch
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book.book_id
	INNER JOIN tbl_book_loans ON tbl_book_loans.book_id = tbl_library_branch.branch_id
	INNER JOIN tbl_borrower ON tbl_borrower.card_no = tbl_book_loans.card_no
	WHERE tbl_library_branch.branch_name = 'Sharpstown'
	AND tbl_book_loans.date_due = '2019-01-02'
	;

	CREATE PROCEDURE totalnumberofbooksloaned
	AS
	SELECT tbl_library_branch.branch_name, COUNT (tbl_book_loans.book_id) AS 'Books Loaned'
	FROM tbl_library_branch 
	INNER JOIN tbl_book_loans ON tbl_book_loans.card_no = tbl_library_branch.branch_id
	GROUP BY tbl_library_branch.branch_name
	;

	CREATE PROCEDURE borrowersmorethan5books
	AS
	SELECT tbl_borrower.borrower_name, tbl_borrower.borrower_address, COUNT(tbl_book_loans.card_no) AS '5 or more Books checked Out'
	FROM tbl_borrower
	INNER JOIN tbl_book_loans ON tbl_book_loans.card_no = tbl_borrower.card_no
	GROUP BY tbl_borrower.borrower_name, tbl_borrower.borrower_address, tbl_borrower.card_no
	HAVING COUNT (tbl_book_loans.card_no) > 5
	;

	SELECT * FROM tbl_borrower
	SELECT * FROM tbl_book_loans


	Create PROCEDURE stephenkingcentral
	AS
	SELECT tbl_book.book_title, tbl_book_author.author_name, tbl_library_branch.branch_name
	FROM tbl_book_copies
	INNER JOIN tbl_library_branch ON tbl_library_branch.branch_id = tbl_book_copies.copies_branch_id
	INNER JOIN tbl_book_author ON tbl_book_author.author_book_id = tbl_book_copies.number_of_copies
	INNER JOIN tbl_book ON tbl_book.book_id = tbl_book_copies.copies_book_id
	WHERE tbl_library_branch.branch_name = 'Central'
	AND tbl_book_author.author_name = 'Stephen-King'
	;

