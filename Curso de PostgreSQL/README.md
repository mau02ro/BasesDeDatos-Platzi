# Curso de PostgreSQL

## ¿Qué es Postgresql?

Es un sistema de gestión de bases de datos relacional orientado a objetos y de código abierto.

_Motor: Permite estructurar la información dentro de un servidor._
_Servidor: Un queripo el cual tiene una memoria y una ram para que funcione el motor de la base de datos._

PostgreSQL usa como objeto principal del núcleo el **Objeto-Relacional**, este se programa teniendo como referencia también la programación orientada a objetos por temas como la herencia y las interfaces.

Es muy conocida por los servicios que usa de PostGIS(corresponde a un servicio de geolocalización que permite hacer muchas funciones con respecto a mapas) y de Pl/PgSQL(permiten desarrollar funcionalidades de un backend directamente en PostgreSQL) que corresponden a los servicios de desarrollo de código interno de la base de datos.

PostgreSQL cumple con el esquema **_A.C.I.D_**

- **A: Atomicity – Atomicidad ->** Separar las funciones desarrolladas en la BD como pequeñas tareas y ejecutarlas como un todo. Si alguna tarea falla se hace un rollback(Se deshacen los cambios).
- **C: Consistency – Consistencia ->** Todo lo que se desarrolló en base al objeto relacional. Los datos tienen congruencia.
- **I: Isolation – Aislamiento ->** Varias tareas ejecutándose al mismo tiempo dentro de la BD.
- **D: Durability – Durabilidad ->** Puedes tener seguridad que la información no se perderá por un fallo catastrófico. -

PostgreSQL guarda la información en una Bitácora.

## Archivos de Configuración

A través de la sentencia SHOW CONFIG se nos muestra donde están los archivos de configuración.

- **Postgresql.conf:** Configuración general de postgres, múltiples opciones referentes a direcciones de conexión de entrada, memoria, cantidad de hilos de pocesamiento, replica, etc.

- **pg_hba.conf:** Muestra los roles así como los tipos de acceso a la base de datos.

- **pg_ident.conf:** Permite realizar el mapeo de usuarios. Permite definir roles a usuarios del sistema operativo donde se ejecuta postgres.

## Comandos más utilizados en PostgreSQL

### Comandos de ayuda

- **\?**: Con el cual podemos ver la lista de todos los comandos disponibles en consola, comandos que empiezan con backslash ().

- **\h**: Con este comando veremos la información de todas las consultas SQL disponibles en consola.

### Comandos de navegación y consulta de información

- **\c**: Saltar entre bases de datos.

- **\l**: Listar base de datos disponibles.

- **\dt**: Listar las tablas de la base de datos.

- **\d**: <nombre_tabla> Describir una tabla.

- **\dn**: Listar los esquemas de la base de datos actual.

- **\df**: Listar las funciones disponibles de la base de datos actual.

- **\dv**: Listar las vistas de la base de datos actual.

- **\du**: Listar los usuarios y sus roles de la base de datos actual.

### Comandos de inspección y ejecución

- **\g**: Volver a ejecutar el comando ejecutando justo antes.

- **\s**: Ver el historial de comandos ejecutados.

- **\s**: <nombre_archivo> Si se quiere guardar la lista de comandos ejecutados en un archivo de texto plano.

- **\i**: <nombre_archivo> Ejecutar los comandos desde un archivo.

- **\e**: Permite abrir un editor de texto plano, escribir comandos y ejecutar en lote. \e abre el editor de texto, escribir allí todos los comandos, luego guardar los cambios y cerrar, al cerrar se ejecutarán todos los comandos guardados.

- **\ef**: Equivalente al comando anterior pero permite editar también funciones en PostgreSQL.

### Comandos para debug y optimización

- **\timing**: Activar / Desactivar el contador de tiempo por consulta.

### Comandos para cerrar la consola

- **\q**: Cerrar la consola.

## Jerarquía de Bases de Datos

Toda jerarquía de base de datos se basa en los siguientes elementos:

- **Servidor de base de datos**: Computador que tiene un motor de base de datos instalado y en ejecución.

- **Motor de base de datos**: Software que provee un conjunto de servicios encargados de administrar una base de datos.

- **Base de datos**: Grupo de datos que pertenecen a un mismo contexto.

- **Esquemas de base de datos en PostgreSQL**: Grupo de objetos de base de datos que guarda relación entre sí (tablas, funciones, relaciones, secuencias).

- **Tablas de base de datos**: Estructura que organiza los datos en filas y columnas formando una matriz.

## Particiones

A veces cuando estamos manejando tablas con un numero grande de registros, varios millones o mas es necesario particionar las tablas para obtener un mejor desempeño a la hora de consultar dichas tablas. A este proceso se le suele denominar "Partitioning" y es le metodo usado para descomponer una enorme tabla (father) en un cojunto de tablas hijas (child).

Algunas de las enormes ventajas son:

    - Desempeño mejorado para la obtencion de registros (Querys).

    - Desempeño mejorado para la actualización (update).

    - Indices mas pequeños para cada tabla hija contra indices grandes y dificiles de colocar en memoria en una tabla grande.

    - Eliminación rapida de registros. Empleando DROP TABLE en vez de DELETE.

    - Los datos pueden ser migrados o respaldados en medios economicos y pequeños como DVDs, discos duros extraibles, etc.

En postgresql el tipo de partitioning soportado se denomina particionado mediante herencia de tablas. Cada partición puede ser creada como una tabla hija de una unica tabla padre. La tabla padre normalmente debe de ser una tabla vacia, que representara a todo el conjunto de datos.
