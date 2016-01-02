# SQL-Sparse-Matrix
*Implement a sparse matrix in SQL.*

A sparse matrix can be implemented in SQL by storing a matrix as a table with columns for element row, element column, and value:
    <*matrix name*>(i, j, val)

In a table, columns *i* and *j* are declared as the table's primary key, to prevent multiple entries for the same matrix element.

This project shows how to use SQL to implement matrix multiplcation.

The development platform is 64-bit Linux Mint 17.2 Rafaela, based on Ubuntu  14.04.2 LTS, Trusty Tahr.

## Install sqlite3

The demo database is sqlite3. To install sqlite3 on Mint, Ubuntu, and other Debian-flavored Linux:
```
sudo apt-get install sqlite3
```

## Set Up Database

To illustrate multiplecation, we first need to create a database with the appropriate tables.

Create database *sparse_matrix.db*; define and populate tables *Left* and *Right*:
```
sqlite3 sparse_matrix.db < create_tabs.sql
```

## Multiply Left and Right
The SQL that computes the product of matrices "Left" and "Right" is in file *mat_mult.sql*.  After you create and load the tables, you can execute
this SQL as follows:
```
sqlite3 sparse_matrix.db < mat_mult.sql 
```

The "secret sauce" of the *mat_mult.sql* sample is the *GROUP BY* command:
```
SELECT row_num, col_num, sum(prod)
FROM
(
	SELECT Left.i as row_num, Right.j as col_num, (Left.val * Right.val) prod
	FROM Left, Right
	WHERE Left.j = Right.i
)
GROUP BY row_num, col_num;
```

## LICENSE
This sample code is licensed under Eclipse Public License 1.0.  See file [LICENSE](https://github.com/rstinejr/SQL-Sparse-Matrix/edit/master/LICENSE)
