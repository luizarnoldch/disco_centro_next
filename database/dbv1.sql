--DELETE SCHEMA IF EXISTS disco_centro;

CREATE SCHEMA IF NOT EXISTS disco_centro;

SHOW search_path;
SET search_path TO disco_centro;
--SET search_path TO myschema, myschema2;

-- Entidad Producto Cliente
DROP TABLE IF EXISTS ProductoCliente;           -- 23

-- Entidad Prodcuto
DROP TABLE IF EXISTS Producto;                  -- 22
DROP TABLE IF EXISTS GeneroMusical;             -- 21

-- Entidad Canción - Album - Artista
DROP TABLE IF EXISTS CancionAlbumArtista;       -- 20
DROP TABLE IF EXISTS Cancion;                   -- 19
DROP TABLE IF EXISTS Album;                     -- 18
DROP TABLE IF EXISTS Artista;                   -- 17

-- Entidad Detalle del Producto
DROP TABLE IF EXISTS DetalleProducto;           -- 16
DROP TABLE IF EXISTS Imagen;                    -- 15
DROP TABLE IF EXISTS TipoImagen;                -- 14
DROP TABLE IF EXISTS Presentacion;              -- 13
DROP TABLE IF EXISTS TipoProducto;              -- 12
DROP TABLE IF EXISTS Epoca;                     -- 11
DROP TABLE IF EXISTS Precio;                    -- 10
DROP TABLE IF EXISTS Descuento;                 -- 09

-- Entidad Usuario
DROP TABLE IF EXISTS Usuario;                   -- 08
DROP TABLE IF EXISTS TipoSesion;                -- 07

-- Entidad Cliente
DROP TABLE IF EXISTS Cliente;                   -- 06
DROP TABLE IF EXISTS Sexo;                      -- 05

-- Entidad Ubicacion 
DROP TABLE IF EXISTS Ubicacion;                 -- 04
DROP TABLE IF EXISTS Ciudad;                    -- 03
DROP TABLE IF EXISTS Pais;                      -- 02
DROP TABLE IF EXISTS Distrito;                  -- 01


-- En caso de no tener la opción de colpasar,
-- buscar con "Ctrl + F" las tablas.

---------------------   TABLAS ---------------------
/*
 *   Distrito                    | 01
 *   Pais                        | 02
 *   Ciudad                      | 03
 *   Ubicacion                   | 04
 *   Sexo                        | 05
 *   Cliente                     | 06
 *   TipoSesion                  | 07
 *   Usuario                     | 08
 *   Descuento                   | 09
 *   Precio                      | 10
 *   Epoca                       | 11
 *   TipoProducto                | 12
 *   Presentacion                | 13
 *   TipoImagen                  | 14
 *   Imagen                      | 15
 *   DetalleProducto             | 16
 *   GeneroMusical               | 17
 *   Artista                     | 18
 *   Album                       | 19
 *   Cancion                     | 20
 *   CancionAlbumArtista         | 21
 *   Producto                    | 22
 *   ProductoCliente             | 23
 */

-- 01
CREATE TABLE Distrito (
    id_distrito BIGINT GENERATED ALWAYS AS IDENTITY,
    distrito VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_distrito)
);
-- 02
CREATE TABLE Pais (
    id_pais BIGINT GENERATED ALWAYS AS IDENTITY,
    pais VARCHAR(10) NOT NULL,
    PRIMARY KEY(id_pais)
);
-- 03
CREATE TABLE Ciudad (
    id_ciudad BIGINT GENERATED ALWAYS AS IDENTITY,
    ciudad VARCHAR(100) NOT NULL,
    PRIMARY KEY(id_ciudad)
);
-- 04
CREATE TABLE Ubicacion (
    id_ubicacion BIGINT GENERATED ALWAYS AS IDENTITY,
    direccion_ubicacion TEXT,
    coordenadas_ubicacion TEXT,
    id_distrito BIGINT,
    id_ciudad BIGINT NOT NULL,
    id_pais BIGINT NOT NULL,
    PRIMARY KEY(id_ubicacion),
    CONSTRAINT fk_ubicacion_distrito
        FOREIGN KEY(id_distrito)
            REFERENCES Distrito(id_distrito),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_ubicacion_ciudad
        FOREIGN KEY(id_ciudad)
            REFERENCES Ciudad(id_ciudad),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_ubicacion_pais
        FOREIGN KEY(id_pais)
            REFERENCES Pais(id_pais)
            --ON DELETE []
            --ON UPDATE [],
);
-- 05
CREATE TABLE Sexo (
    id_sexo BIGINT GENERATED ALWAYS AS IDENTITY,
    sexo VARCHAR(15),
    PRIMARY KEY(id_sexo)
);
-- 06
CREATE TABLE Cliente (
    id_cliente BIGINT GENERATED ALWAYS AS IDENTITY,
    nombre_cliente VARCHAR(75) NOT NULL,
    apellido_paterno_cliente VARCHAR(25) NOT NULL,
    apellido_materno_cliente VARCHAR(25),
    edad_cliente INT NOT NULL,
    dni_cliente BIGINT UNIQUE,
    PRIMARY KEY(id_cliente)
);
-- 07
CREATE TABLE TipoSesion (
    id_tipo_sesion BIGINT GENERATED ALWAYS AS IDENTITY,
    tipo_sesion VARCHAR(50),
    PRIMARY KEY(id_tipo_sesion)
);
-- 08
CREATE TABLE Usuario (
    id_usuario BIGINT GENERATED ALWAYS AS IDENTITY,
    correo_usuario VARCHAR(255) UNIQUE NOT NULL,
    contraseña_usuario VARCHAR(255) NOT NULL,
    token_usuario VARCHAR(255) NOT NULL,
    id_tipo_sesion BIGINT NOT NULL,
    PRIMARY KEY(id_usuario),
    CONSTRAINT fk_usuario_tipo_sesion
        FOREIGN KEY (id_tipo_sesion)
            REFERENCES TipoSesion(id_tipo_sesion)
            --ON DELETE []
            --ON UPDATE [],
);
-- 09
CREATE TABLE Descuento (
    id_descuento BIGINT GENERATED ALWAYS AS IDENTITY,
    cantidad_descuento DECIMAL(10,2),
    codigo_descuento BIGINT GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY(id_descuento)
);
-- 10
CREATE TABLE Precio (
    id_precio BIGINT GENERATED ALWAYS AS IDENTITY,
    compra_precio DECIMAL(10,2) NOT NULL,
    venta_precio DECIMAL(10,2),
    final_precio DECIMAL(10,2),
    id_descuento BIGINT,
    PRIMARY KEY(id_precio),
    CONSTRAINT fk_precio_descuento
        FOREIGN KEY (id_descuento)
            REFERENCES Descuento(id_descuento)
            --ON DELETE []
            --ON UPDATE [],
);
-- 11
CREATE TABLE Epoca (
    id_epoca BIGINT GENERATED ALWAYS AS IDENTITY,
    epoca VARCHAR(100),
    PRIMARY KEY(id_epoca)
);
-- 12
CREATE TABLE TipoProducto (
    id_tipo_producto BIGINT GENERATED ALWAYS AS IDENTITY,
    tipo_producto VARCHAR(100),
    PRIMARY KEY(id_tipo_producto)
);
-- 13
CREATE TABLE Presentacion (
    id_presentacion BIGINT GENERATED ALWAYS AS IDENTITY,
    presentacion VARCHAR(100),
    PRIMARY KEY(id_presentacion)
);

-- 14
CREATE TABLE TipoImagen (
    id_tipo_imagen BIGINT GENERATED ALWAYS AS IDENTITY,
    tipo_imagen VARCHAR(100),
    PRIMARY KEY(id_tipo_imagen)
);
-- 15
CREATE TABLE Imagen (
    id_imagen BIGINT GENERATED ALWAYS AS IDENTITY,
    url_imagen TEXT NOT NULL,
    resolucion_imagen TEXT,
    id_tipo_imagen BIGINT,
    PRIMARY KEY(id_imagen),
    CONSTRAINT fk_imagen_tipo_imagen
        FOREIGN KEY (id_tipo_imagen)
            REFERENCES TipoImagen(id_tipo_imagen)
            --ON DELETE []
            --ON UPDATE [],
);

-- 16
CREATE TABLE DetalleProducto (
    id_detalle_producto BIGINT GENERATED ALWAYS AS IDENTITY,
    stock INT DEFAULT(0),
    id_pais BIGINT,
    id_epoca BIGINT,
    id_tipo_producto BIGINT,
    id_presentacion BIGINT,
    id_precio BIGINT,
    id_imagen BIGINT,
    PRIMARY KEY(id_detalle_producto),
    CONSTRAINT fk_detalle_producto_pais
        FOREIGN KEY (id_pais)
            REFERENCES Pais(id_pais),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_detalle_producto_epoca
        FOREIGN KEY (id_epoca)
            REFERENCES Epoca(id_epoca),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_detalle_producto_tipo_producto
        FOREIGN KEY (id_tipo_producto)
            REFERENCES TipoProducto(id_tipo_producto),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_detalle_producto_presentacion
        FOREIGN KEY (id_presentacion)
            REFERENCES Presentacion(id_presentacion),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_detalle_producto_precio
        FOREIGN KEY (id_precio)
            REFERENCES Precio(id_precio),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_detalle_producto_imagen
        FOREIGN KEY (id_imagen)
            REFERENCES Imagen(id_imagen)
            --ON DELETE []
            --ON UPDATE [],
);

-- 17
CREATE TABLE GeneroMusical (
    id_genero_musical BIGINT GENERATED ALWAYS AS IDENTITY,
    genero_musical VARCHAR(100),
    PRIMARY KEY(id_genero_musical)
);
-- 18
CREATE TABLE Artista (
    id_artista BIGINT GENERATED ALWAYS AS IDENTITY,
    nombre_artista VARCHAR(100) NOT NULL,
    fecha_nacimiento_artista DATE,
    id_pais BIGINT,
    id_sexo BIGINT,
    PRIMARY KEY(id_artista),
    CONSTRAINT fk_artista_pais
        FOREIGN KEY (id_pais)
            REFERENCES Pais(id_pais),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_artista_sexo
        FOREIGN KEY (id_sexo)
            REFERENCES Sexo(id_sexo)
            --ON DELETE []
            --ON UPDATE [],
);
-- 19
CREATE TABLE Album (
    id_album BIGINT GENERATED ALWAYS AS IDENTITY,
    nombre_album VARCHAR(100) NOT NULL,
    fecha_publicacion_album DATE,
    id_pais BIGINT,
    PRIMARY KEY(id_album),
    CONSTRAINT fk_album_pais
        FOREIGN KEY (id_pais)
            REFERENCES Pais(id_pais)
            --ON DELETE []
            --ON UPDATE [],
);
-- 20
CREATE TABLE Cancion (
    id_cancion BIGINT GENERATED ALWAYS AS IDENTITY,
    nombre_cancion VARCHAR(100) NOT NULL,
    duracion_cancion INT NOT NULL,
    fecha_publicacion_cancion DATE,
    PRIMARY KEY(id_cancion)
);
-- 21
CREATE TABLE CancionAlbumArtista (
    id_cancion_album_artista BIGINT GENERATED ALWAYS AS IDENTITY,
    id_cancion BIGINT,
    id_artista BIGINT,
    id_album BIGINT,
    PRIMARY KEY(id_cancion_album_artista),
    CONSTRAINT fk_cancion_album_artista_cancion
        FOREIGN KEY (id_cancion)
            REFERENCES Cancion(id_cancion),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_cancion_album_artista_artista
        FOREIGN KEY (id_artista)
            REFERENCES Artista(id_artista),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_cancion_album_artista_album
        FOREIGN KEY (id_album)
            REFERENCES Album(id_album)
            --ON DELETE []
            --ON UPDATE [],
);
-- 22
CREATE TABLE Producto (
    id_producto BIGINT GENERATED ALWAYS AS IDENTITY,
    id_genero_musical BIGINT,
    id_detalle_producto BIGINT,
    id_cancion_album_artista BIGINT,
    portada TEXT,
    PRIMARY KEY(id_producto),
    CONSTRAINT fk_producto_genero_musical
        FOREIGN KEY (id_genero_musical)
            REFERENCES GeneroMusical(id_genero_musical),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_producto_detalle_producto
        FOREIGN KEY (id_detalle_producto)
            REFERENCES DetalleProducto(id_detalle_producto),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_producto_cancion_album_artista
        FOREIGN KEY (id_cancion_album_artista)
            REFERENCES CancionAlbumArtista(id_cancion_album_artista)
            --ON DELETE []
            --ON UPDATE [],
);
-- 23
CREATE TABLE ProductoCliente (
    id_producto_cliente BIGINT GENERATED ALWAYS AS IDENTITY,
    id_producto BIGINT,
    id_cliente BIGINT,
    fecha_compra_producto_cliente DATE,
    PRIMARY KEY(id_producto_cliente),
    CONSTRAINT fk_producto_cliente_producto
        FOREIGN KEY (id_producto)
            REFERENCES Producto(id_producto),
            --ON DELETE []
            --ON UPDATE [],
    CONSTRAINT fk_producto_cliente_cliente
        FOREIGN KEY (id_cliente)
            REFERENCES Cliente(id_cliente)
            --ON DELETE []
            --ON UPDATE [],
);