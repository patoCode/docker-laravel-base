# Script de inicialización de la base de datos
-- Crear la base de datos
CREATE DATABASE project;

-- Crear usuario con permisos
CREATE USER prj_user WITH ENCRYPTED PASSWORD 'secret';
GRANT ALL PRIVILEGES ON DATABASE project TO prj_user;

-- Permitir que el usuario cree extensiones si es necesario
ALTER DATABASE project OWNER TO prj_user;


