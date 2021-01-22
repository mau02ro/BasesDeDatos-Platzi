# Platzi Mongo

Todo el código que escribirás para el proyecto platzi-mongo
estará en el archivo db.py

# Postman

1. Descargar e instalar [Postman](https://www.getpostman.com/downloads/)
2. La URI de las colecciones de Postman usada para el proyecto está en [Postman-platzi-mongo](https://www.getpostman.com/collections/ffcbfb5c8d5cd2dc52d2)
3. Importar colección dentro de Postman [Instrucciones](https://learning.getpostman.com/docs/postman/collections/data_formats/#exporting-and-importing-postman-data)

## Instalar Anaconda

La forma más simple de ejecutar el proyecto es instalando [Anaconda](https://www.anaconda.com/distribution/).

Con Anaconda instalado de manera correcta, navegar hasta el directorio del proyecto
y ejecutar:

```
# navegar hasta el directorio del proyecto
cd platzi-mongo
# crear un nuevo ambiente
conda create --name platzi-mongo
# activar el ambiente
conda activate platzi-mongo
# para desactivar el ambiente
conda deactivate
```

Si usas Python frecuentemente y tienes una versión 3.3+ no es necesario que
instales Anaconda, crea un ambiente virtual con venv o virtualenv y sigue con
el paso de instalar las dependencias.

### Crea un ambiente virtual con venv o virtualenv

#### Ambiente virtual

_Nos permite encapsular un proyecto para poder instalar las versiones de los paquetes que se requieran sin tenerlos que instalar en todo el sistema operativo. Esto evita conflictos de paquetes en el intérprete principal._

**Instalar ambiente virtual**

1. Lo primero que se debe hacer es instalar el paquete de virtualenv (**_pip install virtualenv_**) el cual es el que nos va a permitir crear los entornos virtuales, este se instalará de forma global. Para verificar que se instaló correctamente podemos ejecutar **_which virtualenv_**.

2. Una vez instalado el virtualenv debemos crear o seleccionar la carpeta en donde tendremos nuestro entorno virtual, estando ahí ejecutamos el siguiente para crear el entorno virtual: **_virtualenv name_env_** por convención es recomendable llamarlo **_venv_**.

3. Después de crear el entorno virtual debemos activarlo, para ello se ejecuta el siguiente comando: **_.\venv\Scripts\activate_** para windows, en linux sería **_source /venv/bin/activate_** con esto quedará activado y nos aparecerá el nombre del entorno virtual al inicio de la línea en la terminal de comandos, (venv en este caso). Para desactivarlo sería lo mismo pero al final se coloca **_desactivate_**.

4. Para ver los paquetes que tenemos instalados en nuestro entorno virtual ejecutamos el siguiente comando: **_pip freeze_**. Esto nos mostrará el listado de los paquetes, si no aparece nada es porque no se ha instalado ningún paquete aún.

5. Si queremos tener todos los paquetes agrupados y con su versión correspondiente, podemos hacer uso del archivo **_requirements.txt_** en donde colocaremos cada uno de los paquetes y que luego podremos instalar usando el siguiente comando: **_pip install -r requirements.txt_**

## Instalar dependenias del proyecto

Con el ambiente activado, instalar las dependencias:

```
pip install -r requirements.txt
```

## Variables de entorno necesarias para ejecutar el proyecto

Asegurate de reemplazar el valor de PLATZI_DB_URI por la URI de tu cluster en MongoDB Atlas

```
export FLASK_APP=platzi-api
export FLASK_ENV=development
export PLATZI_DB_URI="MONGO-URI"
```

## Iniciar el servidor de platzi-mongo

```
flask run
```
