# Imagen base de Nginx
FROM nginx:latest

# Copiar la configuración de Nginx personalizada
COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf
COPY docker/nginx/snippets/ /etc/nginx/snippets/

# Copiar el contenido de la aplicación Laravel a la carpeta de Nginx
COPY app /var/www/html

# Exponer el puerto 80 para el acceso a la aplicación
EXPOSE 80

# Comando para iniciar Nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]
