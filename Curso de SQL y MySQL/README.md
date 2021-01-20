# Curso de SQL y MySQL

## La diferencia entre SQL y MySQL

**SQL** es un **_lenguaje de programación orientado a consultas_** de bases de datos **(Structured Query Language)**.

**MySQL** es un **_sistema de administración de bases de datos (Database Management System, DBMS)_** o también llamado motor de bases de datos.

Existen muchos tipos de bases de datos, desde un simple archivo hasta sistemas relacionales orientados a objetos. **MySQL**, como base de datos relacional, utiliza múltiples tablas para almacenar y organizar la información.

Fue escrito en **C y C++** y se integra perfectamente con los lenguajes de programación más usados en todo el mundo.

## Tipos de tablas

### InnoDB

InnoDB es un mecanismo de almacenamiento de datos de código abierto para la base de datos MySQL.

Es más nueva, más robusta y más recuperable en caso de una falla, peor es un poco más lenta.

### MyISAM

MyISAM es el mecanismo de almacenamiento de datos usado por defecto por el sistema administrador de bases de datos relacionales MySQ.

Es una tabla más directa más sencilla, muy rápida y las operaciones son completamente uno a uno lo que aumenta la velocidad de escritura y de lectura.

## Conectar desde la consola a MySQL

```
mysql -u usuario -h hosts -p
```

## CREATE

### Create database

```SQL
CREATE database platzi_operation

CREATE DATABASE IS NOT EXISTS platzi_operation
```

### Create table

```SQL
CREATE TABLE IS NOT EXISTS books (
  book_id INTEGER UNSIGNED PRIMARY AUTO_INCREMENT,
  author ,
  title VARCHAR(100) NOT NULL,
  `year` INTEGER UNSIGNED NOT NULL DEFAULT 2000,
  language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 Language',
  cover_url VARCHAR(500),
  price DOUBLE(6,2) NOT NULL DEFAULT 10,
  sellable TINYINT(1) DEFAULT 1,
  copies INT NOT NULL DEFAULT 1,
  description TEXT
);


show full columns from name_table;
```

## INSERT

```SQL
INSERT INTO name_table(columns) VALUES(values)

-- =====================

INSERT INTO authors(name, nationality)
  VALUES('Gabriel García Márquez', 'COL');

```

## Archivos SQL

```
source (path del archivo sql)
```

## SELECT

```SQL

SELECT (propiedades) FROM (tabla);

SELECT (propiedades) FROM (tabla) WHERE (condición);

SELECT (propiedades) FROM (tabla) WHERE (condición) LIMIT (limite);

```

### JOIN

Existen diferentes formas en las que se pueden unir las tablas en nuestras consultas y de acuerdo con esta unión se va a mostrar información, y es importante siempre tener clara esta relación. En esta clase te voy a mostrar gráficamente 7 diferentes tipos de uniones que puedes realizar.

Usar correctamente estas uniones puede reducir el tiempo de ejecución de tus consultas y mejorar el rendimiento de tus aplicaciones.

Como yo lo veo cuando hacemos uniones en las consultas para seleccionar información, estamos trabajando con tablas, estas tablas podemos verlas como conjuntos de información, de forma que podemos asimilar los joins entre tablas como uniones e intersecciones entre conjuntos.

Supongamos que contamos con dos conjuntos, el conjunto A y el conjunto B, o, la tabla A y la tabla B. Sobre estos conjuntos veamos cuál es el resultado si aplicamos diferentes tipos de join.

1. **Inner Join**

Esta es la forma mas fácil de seleccionar información de diferentes tablas, es tal vez la que mas usas a diario en tu trabajo con bases de datos. Esta union retorna todas las filas de la tabla A que coinciden en la tabla B. Es decir aquellas que están en la tabla A Y en la tabla B, si lo vemos en conjuntos la intersección entre la tabla A y la B.

<img src="assets/inner-join.webp" >
