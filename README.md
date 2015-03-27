# vagrant-web-gis-base
Configuración con Vagrant de una máquina base para desarrollo geoweb

Box de Vagrant basado en Ubuntu trusty32 (podría cambiar a trusty64), configurado con lo básico para desarrollar aplicaciones geográficas.
Instala:

* postgresql 9.3 (configurado para crear bases de datos en UTF-8)
* PostGis 2.1 y crea la base de datos postgis-template con soporte básico (sin topología).
* python-virtualenv y virtualenv-wrapper
* pillow en lugar de PIL (Python Imaging Library)
* cache de pip con Django y paquetes comunes
* git
* Node.js, CoffeeScript y LESS (por si se ocupa)

El chiste es que sirva como base genérica, cada proyecto específico debe usar esta máquina como base e instalar sus propios requerimientos específicos.

## Instrucciones:

Para crear el .box:

````
    ./build.sh
````

Para instalarla localmente:

````
    vagrant box add geoweb-base-v1.0 geoweb-base-v1.0.box
````
