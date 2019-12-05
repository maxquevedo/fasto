# fasto
* [Versiones](#Versiones)
* [Instrucciones](#Instrucciones)


## Versiones

#### php 
* version: 7.1.29

#### laravel framework
* version: 5.8.35

#### postgresql
* version: 10


## Instrucciones

Como el proyecto usa postgre, hay que habilitar primero el conector de postgre en php,
para lo cual vamos a ir a nuestra carpeta de php y abriremos php.ini, donde buscaremos la siguiente linea para editarla, para descomentar solo hay que eliminar el punto y coma ``` ; ``` del principio de la línea

```
extension=php_pdo_pgsql.dll
extension=php_pgsql.dll
```

En la carpeta del proyecto abrir un terminal y colocar lo siguiente: 

```
php artisan serve
```
