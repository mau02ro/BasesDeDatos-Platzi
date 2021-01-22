# Curso Básico de MongoDB

## Bases de datos NoSQL

Las bases de datos NoSQL tienen 4 grandes familias: **Key Value Stores**, **basadas en grafos**, **columnares** y **basadas en documentos**.

**Key Value Stores**: Guardan la información en formato de llaves y valores. Las usamos para guardar cache, información de sesión de los usuarios o cosas muy sencillas. Son muy rápidas de consultar pero no podemos usarlas en casos más complejos donde necesitamos estructuras más especiales. El mejor ejemplo de estas bases de datos es Redis.

**Graph Databases**: Bases de datos basadas en Grafos. Nos permiten establecer conexiones entre nuestras entidades para realizar consultas de una forma más eficiente que en bases de datos relacionales (así como Twitter o Medium donde cada publicación tiene diferentes relaciones entre sus usuarios, likes, etc). Por ejemplo: Neo4j o JanusGraph.

**Wide-column Stores**: Bases de datos columnares. Tienen una llave de fila y otra de columnas para hacer consultas muy rápidas y guardar grandes cantidades de información pero modelar los datos se puede volver un poco complicado. Las usamos en Big Data, IoT, sistemas de recomendaciones, entre otras. Por ejemplo: Cassandra o HBase.

**Document Databases**: Bases de datos basadas en documentos. Nos permiten guardar documentos(_BSON_) dentro de colecciones, tiene muy buena performance y flexibilidad que nos permite modelar casos de la vida real de forma sencilla y efectiva. Por ejemplo: MongoDB o CouchBase.

## Definición de MongoDB y su ecosistema (herramientas de uso)

MongoDB es una base de datos gratis y de código abierto No Relacional basada en documentos que nos permite guardar una gran cantidad de documentos de forma distribuida. Mongo también es el nombre de la compañía que desarrolla el código de esta base de datos.

Una de sus principales características es que nos permite guardar nuestras estructuras o documentos en formato JSON (no exactamente JSON, pero si algo muy parecido, lo veremos más adelante) para tener una gran flexibilidad a la hora de modelar situaciones de la vida real.

Por ser una base de datos distribuida podemos hablar no de uno sino de varios servidores, lo que conocemos como el Cluster de MongoDB. Gracias a esto obtenemos una gran [escalabilidad](https://www.oscarblancarteblog.com/2017/03/07/escalabilidad-horizontal-y-vertical/) de forma horizontal ([escalabilidad](https://www.oscarblancarteblog.com/2017/03/07/escalabilidad-horizontal-y-vertical/) en cantidad de servidores).

MongoDB es **“Schema Less”** lo que permite que nuestros documentos tengan estructuras diferentes sin afectar su funcionamiento, algo que no podemos hacer con las tablas de las bases de datos relacionales. Su lenguaje para realizar queries, índices y agregaciones es muy expresivo.

## MongoDB Atlas

Tenemos varios proveedores que nos permiten utilizar o alquilar **MongoDB** como servicio y en este caso vamos a usar **MongoDB Atlas** por ser desarrollado por las mismas personas que desarrollan **MongoDB**.

**MongoDB Atlas** tiene las siguientes características:

- Aprovisionamiento automático de clusters con MongoDB
- Alta disponibilidad
- Altamente escalable
- Seguro
- Disponible en AWS, GCP y Microsoft Azure
- Fácil monitoreo y optimización

## MongoDB + Drivers

### ¿Qué son los drivers en MongoDB?

Los drivers de MongoDB son librerías oficiales o desarrolladas por la comunidad que podemos usar para comunicar nuestras aplicaciones con las bases de datos. Una de las más populares es Mongoid, un ORM que convierte nuestros código Ruby en queries que entiende nuestra base de datos.

## Operaciones CRUD

### Bases de datos, Colecciones y Documentos en MongoDB

Las **Bases de Datos** son los contenedores físicos para nuestras colecciones. Cada base de datos tiene un archivo propio en el sistema de archivos de nuestra computadora o servidor y un Cluster puede tener múltiples bases de datos.

Las **Colecciones** son agrupaciones de documentos. Son equivalentes a las tablas en bases de datos relacionales pero NO nos imponen un esquema o estructura rígida para guardar información.

Los **Documentos** son registros dentro de las colecciones. Son la unidad básica de MongoDB y son análogos a los objetos **JSON** pero en realidad son **_BSON_**.

### Operaciones CRUD desde la consola de MongoDB

- Listar las bases de datos de nuestro cluster:

```
show dbs
```

Seleccionar una base de datos:

```
use NOMBRE_BD
```

**_Debemos crear por lo menos un documento si la base de datos es nueva porque MongoDB no crea bases de datos vacías._**

- Recordar qué base de datos estamos usando:

```
db
```

- Listar las colecciones de nuestra base de datos:

```
show collections
```

- Crear una colección (opcional) y añadir un elemento en formato JSON:

```
db.NOMBRE_COLECCIÓN.insertOne({ ... })
```

**_La base de datos responde true si la operación fue exitosa y crea el campo irrepetible de \_id si nosotros no lo especificamos._**

- Crear una colección (opcional) y añadir algunos elementos en formato JSON:

```
db.NOMBRE_COLECCIÓN.insertMany([{ ... }, { ... }])
```

**_Recibe un array de elementos y devuelve todos los IDs de los elementos que se crearon correctamente._**

- Encontrar elementos en una colección:

```
db.NOMBRE_COLECCIÓN.find()
```

**_Podemos aplicar filtros si queremos o encontrar solo el primer resultado con el método findOne()._**

Listar todos los posibles comandos que podemos ejecutar:

```
db.NOMBRE_COLECCIÓN.help()
```

## Tipos de datos

- [Tipos de datos](https://docs.mongodb.com/manual/reference/bson-types/)

- **Strings**: Nos sirven para guardar textos.
- **Boolean**: Información cierta o falsa (true y false).
- **ObjectId**: Utilizan el tiempo exacto en el que generamos la consulta para siempre generan IDs únicos. Existen en **BSON** pero no en **JSON**.
- **Date**: Nos sirven para guardar fechas y hacer operaciones de rangos entre ellas.
- **Números**: Doubles, Integers(32bits), Integers(64bits) y Decimals.
- **Documentos Embebidos**: Documentos dentro de otros documentos ({}).
- **Arrays**: Arreglos o listas de cualquier otro tipo de datos, incluso, de otras listas.

**_NOTA: Los documentos no pueden ser mas grandes que 16MB_**

## ¿Qué son los esquemas y las relaciones?

Los **esquemas** son la forma en que organizamos nuestros documentos en nuestras colecciones. MongoDB no impone ningún esquema pero podemos seguir buenas prácticas y estructurar nuestros documentos de forma parecida (no igual) para aprovechar la flexibilidad y escalabilidad de la base de datos sin aumentar la complejidad de nuestras aplicaciones.

Las **relaciones** son la forma en que nuestras entidades o documentos sen encuentran enlazados unos con otros. Por ejemplo: Una carrera tiene multiples cursos y cada curso tiene multiples clases.

## Relaciones entre documentos

Las documentos embebidos nos ayudan a guardar la información en un solo documento y nos ahorra el tiempo que tardamos en consultar diferentes documentos a partir de referencias. Sin embargo, las referencias siguen siendo muy importantes cuando debemos actualizar información en diferentes lugares de forma continua.

_Nota:_

- **One to one**: Documentos embebidos.
- **One to many**: Documentos embebidos cuando la información no va a cambiar muy frecuentemente y referencias cuando si.
