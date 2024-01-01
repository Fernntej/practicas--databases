-- SQLBook: Code
--CREACION DE LA BASE DE DATOS
CREATE DATABASE facturacion;

--USO DE LA BASE DE DATOS
USE facturacion;

-- CREACION DE LAS TABLAS

CREATE TABLE ROL (
    ID_ROL          INT         AUTO_INCREMENT  PRIMARY KEY,
    NOMBRE          VARCHAR(50) UNIQUE          NOT NULL    
);

CREATE TABLE USUARIO (
    ID_USUARIO      INT             AUTO_INCREMENT  PRIMARY KEY NOT NULL,
    CORREO          VARCHAR(255)    UNIQUE          NOT NULL,    
    PASSWORD        TINYBLOB                        NOT NULL,
    ESTADO          BOOLEAN                         NOT NULL,     
    ID_ROL          INT                             NOT NULL,
    FOREIGN KEY (ID_ROL) REFERENCES ROL(ID_ROL) ON DELETE CASCADE
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA    INT             NOT NULL    AUTO_INCREMENT  PRIMARY KEY,
    NOMBRE          VARCHAR(50)     NOT NULL    UNIQUE,
    ESTADO          BOOLEAN         NOT NULL
);

CREATE TABLE PRODUCTO (
    ID_PRODUCTO     INT             NOT NULL    AUTO_INCREMENT  PRIMARY KEY,
    NOMBRE          VARCHAR(150)    NOT NULL    UNIQUE,
    MARCA           VARCHAR(50)     NOT NULL,
    COSTO           DECIMAL(10,4)   NOT NULL,
    PRECIO          DECIMAL(10,4)   NOT NULL,
    STOCK           INT             NOT NULL,
    ESTADO          BOOLEAN         NOT NULL,
    ID_CATEGORIA    INT             NOT NULL,
    FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA) ON DELETE CASCADE
);

CREATE TABLE STOCK (
    ID_STOCK        INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_PRODUCTO     INT             NOT NULL,
    UBICACION       VARCHAR(50)     NOT NULL,
    CANTIDAD        INT             NOT NULL,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO) ON DELETE CASCADE
);

CREATE TABLE CLIENTES (
    ID_CLIENTE      INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOMBRE          VARCHAR(100)    NOT NULL,
    DIRECCION       VARCHAR(255)    NOT NULL,
    TELEFONO        VARCHAR(15)     NOT NULL
);

CREATE TABLE PROVEEDORES (
    ID_PROVEEDOR    INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,
    NOMBRE          VARCHAR(100)    NOT NULL,
    DIRECCION       VARCHAR(255)    NOT NULL,
    TELEFONO        VARCHAR(15)     NOT NULL
);

CREATE TABLE VENTAS (
    ID_VENTA        INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FECHA_VENTA     DATE            NOT NULL,
    ID_PRODUCTO     INT             NOT NULL,
    CANTIDAD        INT             NOT NULL,
    MONTO_TOTAL     DECIMAL(10,4)   NOT NULL,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO),
    CONSTRAINT fk_producto_venta FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO),
    INDEX (ID_PRODUCTO)
);

CREATE TABLE VENTAS_DETALLE (
    ID_DETALLE        INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_VENTA          INT             NOT NULL,
    ID_PRODUCTO       INT             NOT NULL,
    CANTIDAD          INT             NOT NULL,
    MONTO_TOTAL       DECIMAL(10,4)   NOT NULL,
    FOREIGN KEY (ID_VENTA) REFERENCES VENTAS(ID_VENTA),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO)
);

CREATE TABLE PEDIDOS (
    ID_PEDIDO       INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FECHA_PEDIDO    DATE            NOT NULL,
    ID_PRODUCTO     INT             NOT NULL,
    CANTIDAD        INT             NOT NULL,
    MONTO_TOTAL     DECIMAL(10,4)   NOT NULL,
    ID_CLIENTE      INT             NOT NULL,
    ID_PROVEEDOR    INT             NOT NULL,  -- Nueva columna para la relación con proveedores
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE),
    FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDORES(ID_PROVEEDOR)
);