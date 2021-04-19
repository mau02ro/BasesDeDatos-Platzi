# Curso de Introducción a Elasticsearch

bin\elasticsearch.bat

Elasticsearch es un motor de búsqueda que se basa en Lucene el cual nos permite realizar búsquedas por una gran cantidad de datos de un texto específico. Está escrito en Java y se basa sobre una licencia Apache.

Gracias al motor Lucene sobre el que está implementado, Elasticsearch nos ofrece capacidades de búsquedas de texto, autocompletado, soporte de geolocalización,…

En si mismo podríamos definir a Elasticsearch como un base de datos NoSQL orientada a documentos JSON, los cuales pueden ser consultados, creados, actualizados o borrados mediante un un sencillo API Rest.

- Elasticsearch provee búsquedas y analitica en tiempo real.
- Luego del guardado un documento, es indexado y buscable en casi timpo real(+- 1 segundo).
- Interfaz HTTP con documentos JSON.
- Guardado e indexación eficiente.
- Naturaleza distribuida.

## Características Elasticsearch

Si tuviésemos que definir cuales son las principales características de Elasticsearch podríamos definir las siguientes:

### Orientación a Documentos

- Es una base de datos NoSQL orientada a documentos JSON, al estilo de MongoDB. Por lo cual no necesita que se definan esquemas a la hora de insertar los datos.

- Nos permite indexar grandes volúmenes de datos, para poder consultarlos posteriormente. Elasticsearch se basa en los documentos JSON para poder realizar esta indexación. El documento JSON son un conjunto de pares clave/valor. Las claves son cadenas de texto y los valores pueden ser cadenas, números, fechas o listas.

- Elasticsearch, al basarse en modelos NoSQL, almacena la información de forma desnormalizada. Es por ello que no se permiten hacer joins o subqueries.

### Indexación

- El proceso de añadir información a Elasticsearch se llama “indexación”. Ya que cuando insertamos datos en Elasticsearch lo que se está haciendo es insertando en los índices de Apache Lucene.

### Escalabilidad

- Elasticsearch es una base de datos distribuida que escala de manera dinámica de forma horizontal, por lo que a mayor demanda podemos ir creciendo en nodos. Llegando a poder almacenar petabytes de información.

- Elasticsearch se organiza mediante nodos, los cuales son alojados dentro de un cluster. Permite añadir nuevos nodos al cluster para poder acometer nuevas cargas.

- Los documentos son particionados mediante técnicas de sharding, por lo cual los va distribuyendo a diferentes nodos. Esta distribución permite que las cargas de búsqueda se distribuyan por los diferentes nodos, mejorando los tiempos de respuesta.

- Pero a parte de distribuir los documentos mediante sharding aplica técnicas de replica. Estas técnicas hace que los documentos estén replicados en varios nodos. Esto permite que el sistema disponga de alta disponibilidad y tolerancia a fallos.

- Elasticsearch enruta las peticiones al nodo específico del cluster el cual contenga la información necesaria que se está buscando.

- En el caso de que haya algún problema, Elasticsearch puede detectar si hay algún nodo que está fallando. De esta manera es capaz de reorganizar la información y conseguir que los datos estén siempre accesibles.

### Acceso por API

- Elasticsearch permite acceder a los datos en tiempo real. Para ello dispone el acceso a todas sus capacidades mediante un API RESTful.

- Aunque el API que nos ofrece es muy completo, Elasticsearch también cuenta con librerías integradas para diferentes lenguajes de programación: Java, C#, Python, Javascript, PHP, Ruby,…

- Elasticsearch tiene su propio Query Domain Specific Language (DSL) mediante el cual permite realizar consultas mediante JSON. De esta forma podremos buscar sobre campos, aplicar filtros,… y así poder construir consultas complejas. Se basa sobre las operaciones que define Lucene.

## Subir archivos

```http

POST /{INDICE}/_bulk

Enviar en el body el binario
```

## Vervos HTTP

### GET

- Obtener un doucmento.
- Realizar una busqueda dentro de un indice.
- Obtener el mapeo de un indice.

```http
http://localhost:9200/{INDICE}/_search
```

#### Obetener un documento

```http
GET /{INDICE}/_doc/{ID}

## Sin metadatos
http://localhost:9200/{INDICE}/_source/{ID}

```

#### Mapeo de documento

```http
GET /{INDICE}/_mapping
```

### POST and PUT

- Crear y actualizar documentos.

```http
POST /{INDICE}/_update/{ID}

BODY:
{
    "doc": {}
}
```

### DELETE

```http
DELETE /{INDICE}

DELETE /{INDICE}/_doc/{ID}

```

## Tipos de datos

- Texto

  - text
  - keyword

- Fechas

  - date

- Números

  - integer
  - long
  - float
  - double

- Booleanos

  - boolean

- Objetos

  - object
  - nested

Geograficos

- geo_point
- geo_shape

## Mapeo de datos

Para rendimiento óptimo se debe indicar un mapeo explícito.

Para texto: text y keyword

- **text**: búsquedas de texto completo (match).
- **keyword**: valores exactos (term).

**Ejemplo:**

Una propiedad que se llame estado solo puede tener tres valores posibles (activo, pendiente, inactivo).

- Si el cmapo estado es keyword y se busca 'activ' no generara resultados.
- Si el cmapo estado es text y se busca 'activ' retornara activo e inactivo.

```http
PUT /{INDICE}

{
    "mappings": {
        "properties": {
            "nombre": {"type": "text"},
            "descripcion": {"type": "text"},
            "pedidosUltimaHora": {"type": "integer"},
            "ultimaModificacion": {
                "properties": {
                    "usuario": {"type": "text"},
                    "fecha": {"type": "date"}
                }
            }
        }
    }
}
```

```htpp
PUT /{INDICE}
{
    "properties": {
        "estado": {"type": "keyword"}
    }
}
```

```
{
    "nombre": "Arepa",
    "descripcion": "Pollo, carne y queso",
    "estado": "activo",
    "pedidosUltimaHora": 11,
    "ultimaModificacion": {
        "usuario": "Tomas",
        "fecha": "2021-04-08"
    }
}
```

## Puntaje

El puntaje es el valor de concidencia de un valor de búsqueda con los documentos almacenados en un índice de elaticsearch. Mientras más valor de puntaje se tenga, más relevante es el coumento.

El algoritmo verifica el # ocurrencias / unicidad de las palabras.

Las búsquedas son ordenadas pro puntaje o relevancia del documento.

Para las búsquedas usamos GET /\_search:

```
{
    "query":{
        "simple_query_string": {
            "query":"pollo saludable picante",
            "fields": ["nombre^2", "descripcion"]
        }
    }
}
```

## Tipos de cláusulas

**Must**, **Filter**, **Should** y **Must Not**.

**_Para una solo consulta utilizar un objeto{} y para varias utilizar una lista de objetos[]_**

- **Must**: es como un **AND** lógico, la consulta debe aparecer en los documentos retornados, _INFLUYE EN EL PUNTAJE_.

```http
GET /{INDICE}/_search

{
    "query": {
        "bool": {
            "must": {
                "match": {"descripcion": "picante"}
            },
        }
    }
}
```

- **Filter**: es como un **AND** lógico, la consulta debe aparecer en los documentos retornados, _NO INFLUYE EN EL PUNTAJE_, se deberia utilizar **Filter** en vez de **Must** si no nos interessa el puntaje, permite caché.

```http
GET /{INDICE}/_search

{
    "query": {
        "bool": {
            "filter": {
                "term": {"estado": "activo"}
            }
        }
    }
}
```

- **Should**: es como un **OR** lógico, alguna de las consultas debería aparecer en los documentos retornados, _INFLUYE EN EL PUNTAJE_, **"minimum_should_match"** permite alterar el comportamiento(cuántas consultas deben coincidir).

Si **Must o Filter(AND)** están presnetes en la consulta booleana **minimum_should_match=0**(este se vuelve opcional), de lo contrario **minimum_should_match=1**(Al estar sola almenos una condición debe cumplirse).

```http
GET /{INDICE}/_search

{
    "query": {
        "bool": {
            "must": {
            },
            "filter": {
            },
            "must_not": {
            },
            "should": [
                {"match": {"descripcion": "queso"}},
                {"match": {"descripcion": "platano"}}
            ],
            "minimum_should_match": 1
        }
    }
}
```

- **Must Not**: es como un **NOT** lógico, la consulta **no** debe aparecer en los documentos retornados, _NO INFLUYE EN EL PUNTAJE_, permite caché.

```http
GET /{INDICE}/_search

{
    "query": {
        "bool": {
            "must_not": {
                "term": {"pedidosUltimaHora": 0}
            }
        }
    }
}
```

## Consultas Booleanas

```http
GET /{INDICE}/_search

{
    "query": {
        "bool": {
            "must": {
                "match": {"descripcion": "picante"}
            },
            "filter": {
                "term": {"estado": "activo"}
            },
            "must_not": {
                "term": {"pedidosUltimaHora": 0}
            },
            "should": [
                {"match": {"descripcion": "queso"}},
                {"match": {"descripcion": "platano"}}
            ],
            "minimum_should_match": 1
        }
    }
}
```

## Consultas Compuestas

```
{
    "query":{
        "bool":{
            "must": [
                {
                    "bool": {
                        "should": [
                            {"term": {"estado": "activo"}},
                            {"term": {"estado": "pendiente"}},
                        ]
                    }
                },
                {
                    "bool": {
                        "should": [
                            {"match": {"ultimaModificacion.usuario": "Tomas"}},
                            {"match": {"ultimaModificacion.usuario": "Pedro"}},
                        ]
                    }
                },
                {
                    "term": {"pedidosUltimaHora": 0}
                }
            ]
        }
    }
}
```

## Consultas Anidadas

**Anidación**: Guardar una lista de objetos dentro de un documento(pertenecia).

Las consultas anidadas encuentre documentos usando sus objetos anidados, al encontrar una coincidencia el documento raíz es devuelto.

```http
PUT /{INDEX}/

{
    "mappings": {
        "properties": {
            "nombre": {"type": "text"},
            "categorias": {
                "type": "nested",
                "properties": {
                    "nombre": {"type": "keyword"},
                    "principal": {"type": "boolean"}
                }
            }
        }
    }
}
```

```http
GET /{INDEX}/_search

{
  "query": {
    "nested": {
      "path": "categorias",
      "query": {
        "bool": {
          "must": [
            {"term": { "categorias.nombre": "Comida rapida" }},
            {"term": { "categorias.principal": true }}
          ]
        }
      }
    }
  }
}
```

## Consultas de rango y agregaciones

### Rangos

```

{
    "_source": ["nombre", "calificacion"],
    "query": {
        "range": {
            "calificacion": {
                "gt": 3.5,
                "lte": 4.5
            }
        }
    }
}

{
  "_source": ["nombre", "ultimaModificacion.fecha"],
  "query": {
    "range": {
      "ultimaModificacion.fecha": {
        "gte": "2021-04-01",
        "lt": "2021-04-28"
      }
    }
  }
}

```

### Agregaciones

Las agregaciones son metricas que s epuedne relizar sobre los resultados de una consulta.

```
{
  "aggs": {
    "calificaionPromedio": {
      "avg": { "field": "calificacion", "missing": 3.0 }
    },
    "calificaionMaxima": { "max": { "field": "calificacion", "missing": 3.0 } },
    "calificaionMinima": { "min": { "field": "calificacion", "missing": 3.0 } }
  }
}
```

```
{
  "query": {
    "bool": {
      "must": [
        {
          "bool": {
            "should": [
              {
                "match": {
                  "direccion": "centro"
                }
              },
              {
                "match": {
                  "direccion": "norte"
                }
              }
            ]
          }
        },
        {
          "bool": {
            "should": [
              {
                "nested": {
                  "path": "categorias",
                  "query": {
                    "bool": {
                      "must": {
                        "term": {
                          "categorias.nombre": "Comida rapida"
                        }
                      }
                    }
                  }
                }
              },
              {
                "nested": {
                  "path": "platos",
                  "query": {
                    "bool": {
                      "must": {
                        "match": {
                          "descripcion": "picante"
                        }
                      }
                    }
                  }
                }
              }
            ]
          }
        }
      ]
    }
  }
}

```
