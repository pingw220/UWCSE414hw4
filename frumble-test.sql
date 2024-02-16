/* name -> discount 3286 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name
	AND S1.discount != S2.discount;

/* name -> month 4620 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name
	AND S1.month != S2.month;

/* discount -> name 61398 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.discount = S2.discount
	AND S1.name != S2.name;

/* discount -> month 48032 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.discount = S2.discount
	AND S1.month != S2.month;

/* discount -> price 55170 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.discount = S2.discount
	AND S1.price != S2.price;

/* month -> name 14700 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.month = S2.month
	AND S1.name != S2.name;

/* month -> discount 13208 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.month = S2.month
	AND S1.price != S2.price;

/* price -> name 17906 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.price = S2.price
	AND S1.name != S2.name;

/* price -> discount 14964 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.price = S2.price
	AND S1.discount != S2.discount;

/* price -> month 21034 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.price = S2.price
	AND S1.month != S2.month;

/* name, discount -> month 1334 lines*/
SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.name = S2.name
	AND S1.discount = S2.discount
	AND S1.month != S2.month;


/* b. A -> D, C -> B*/
A -> CB no
A -> CD no
AB -> C no
AB -> D yes
AB -> CD no
AC -> B yes
AC -> D yes
AD -> C no
AD -> B no
AD -> CB no

B -> AD no
B -> CD no
BC -> A no
BC -> D no
BC -> AD no

C -> AB no
C -> AD no
CD -> A no
CD -> B yes
CD -> AB no

D -> AB no
D -> CB no

SELECT COUNT(*)
FROM Sales AS S1, Sales AS S2
WHERE S1.month = S2.month
	AND S1.price = S2.price
	AND (S1.discount != S2.discount OR S1.name != S2.name);