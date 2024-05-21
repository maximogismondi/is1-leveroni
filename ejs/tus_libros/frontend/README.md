# Readme Tus Libros Web

## Levantar el front

1. Si no hizo la [configuración inicial](#configuración-inicial), siga los pasos indicados en dicha sección.
2. Iniciar el frontend con `npm start`
3. Verifique que tenga activado el plugin para baipasear las restricciones CORS

### Iniciar el frontend con `npm start`

En el directorio del front (donde se encuentra el archivo package.json) evaluar `npm start`. Esto
corre la aplicación en modo desarrollo, abriendo el navegador en [http://localhost:3000](http://localhost:3000).

## Configuración inicial

1. Instalar Node JS
2. Instalar NPM: `sudo apt-get install npm`
3. Instalar las dependencias del proyecto
4. Instalar un plugin para baipasear las restricciones CORS  

### Instalar Node JS

Si no lo tienen, deben instalarse [Node JS](https://nodejs.org/en/download). Buscar como
instalarlo en su sistema operativo. Por ejemplo en ubuntu:

- `sudo apt-get update`
- `sudo apt-get install nodejs`
- `node -v`

### Instalar las dependencias del proyecto

En el directorio del front (donde se encuentra el archivo package.json) evaluar `npm install`

### Instalar un plugin para baipasear las restricciones CORS

Por ejemplo para firefox puede utilizar [CORS Everywhere](https://addons.mozilla.org/es/firefox/addon/cors-everywhere/)
