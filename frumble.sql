/* a. */
CREATE TABLE Sales (
	name VARCHAR(20),
	discount VARCHAR(20),
	month VARCHAR(20),
	price INT);

.mode tab
.import mrFrumbleData.txt Sales

/*-----------------------------------------------------------------------------------------*/

/* b - 1. */
/* month -> discount 0 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.month = S2.month
	AND S1.discount != S2.discount;

/* name -> price 0 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name
	AND S1.price != S2.price;

/* name, discount -> price 0 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name
	AND S1.discount = S2.discount
	AND S1.price != S2.price;

/* name, month -> price 0 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name
	AND S1.month = S2.month
	AND S1.price != S2.price;

/* name, month -> discount 0 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name
	AND S1.month = S2.month
	AND S1.discount != S2.discount;

/* price, month -> discount 0 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.price = S2.price
	AND S1.month = S2.month
	AND S1.discount != S2.discount;

/* b - 2. */
/* name -> discount 3286 lines*/
/* This is the query that does not hold, the lines is over 3000+, so the functional dependency does not exist. */
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name
	AND S1.discount != S2.discount;

/*-----------------------------------------------------------------------------------------*/

/* c. */
CREATE TABLE NamePrice (
	name VARCHAR(255) PRIMARY KEY,
	price INT);

CREATE TABLE DiscountMonth (
	discount VARCHAR(255),
	month INT PRIMARY KEY);

CREATE TABLE NameMonth (
	name VARCHAR(255) REFERENCES NamePrice,
	month INT REFERENCES DiscountMonth);

/*-----------------------------------------------------------------------------------------*/

/* d. */
/* TABLE DiscountMonth 36 lines */
INSERT INTO NamePrice SELECT DISTINCT name, price FROM Sales;

/* TABLE DiscountMonth 12 lines */
INSERT INTO DiscountMonth SELECT DISTINCT discount, month FROM Sales;

/* Table NameMonth 426 lines */
INSERT INTO NameMonth SELECT DISTINCT name, month FROM Sales;