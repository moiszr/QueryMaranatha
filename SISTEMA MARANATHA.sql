CREATE DATABASE SISTEMA_MARANATHA

USE SISTEMA_MARANATHA

CREATE TABLE CATEGORIA(
	IDCATEGORIA INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	CODIGO AS ('CAT'+RIGHT ('00'+ CONVERT(VARCHAR, IDCATEGORIA),(2))),
	NOMBRE NVARCHAR(30) UNIQUE NOT NULL,
	DESCRIPCION NVARCHAR(256) NULL
)

CREATE TABLE MARCA(
	IDMARCA INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	CODIGO AS ('MRC'+RIGHT ('00'+ CONVERT(VARCHAR, IDMARCA),(2))),
	NOMBRE NVARCHAR(30) UNIQUE NOT NULL,
	DESCRIPCION NVARCHAR(256) NULL
)

CREATE TABLE PRODUCTO(
	IDPRODUCTO INT IDENTITY (1,1) PRIMARY KEY,
	CODIGO AS ('PRO'+RIGHT ('00'+ CONVERT(VARCHAR, IDPRODUCTO),(2))),
	PRODUCTO NVARCHAR(50) NOT NULL,
	PRECIO_COMPRA DECIMAL (18,2) NULL,
	PRECIO_VENTA DECIMAL (18,2) NULL,
	STOCK INT NULL,

	-- FOREIGN KEYS
	IDCATEGORIA INT NOT NULL,
	IDMARCA INT NOT NULL

	-- REFERENCIAR O RELACIONAR
	CONSTRAINT RELACIONAR_CATEGORIA FOREIGN KEY (IDCATEGORIA) REFERENCES CATEGORIA(IDCATEGORIA),
	CONSTRAINT RELACIONAR_MARCA FOREIGN KEY (IDMARCA) REFERENCES MARCA(IDMARCA)
)

CREATE TABLE ROL(
	IDROL INT IDENTITY (1,1) PRIMARY KEY,
	ROL VARCHAR(20) NOT NULL
)

CREATE TABLE EMPLEADO(
	IDEMPLEADO INT IDENTITY (1,1) PRIMARY KEY,
	CODIGO AS ('EMP'+RIGHT ('00'+ CONVERT(VARCHAR, IDEMPLEADO),(2))),
	NOMBRE NVARCHAR(30) NOT NULL,
	APELLIDO NVARCHAR(60) NOT NULL,
	CEDULA VARCHAR(11) NOT NULL,
	TELEFONO VARCHAR(10) NULL,
	DIRECION NVARCHAR(256) NULL
)

CREATE TABLE USUARIO(
	IDUSUARIO INT IDENTITY (1,1) PRIMARY KEY,
	CODIGO AS ('USU'+RIGHT ('00'+ CONVERT(VARCHAR, IDUSUARIO),(2))),
	USUARIO NVARCHAR(15) UNIQUE NOT NULL,
	CONTRASEÑA NVARCHAR(100) NOT NULL,

	-- FOREIGN KEYS
	IDROL INT NOT NULL,
	IDEMPLEADO INT NOT NULL

	-- REFERENCIAR O RELACIONAR
	CONSTRAINT RELACIONAR_ROL FOREIGN KEY (IDROL) REFERENCES ROL(IDROL),
	CONSTRAINT RELACIONAR_EMPLEADO FOREIGN KEY (IDEMPLEADO) REFERENCES EMPLEADO(IDEMPLEADO)
)

CREATE TABLE CLIENTE(
	IDCLIENTE INT IDENTITY (1,1) PRIMARY KEY,
	CODIGO AS ('CLI'+RIGHT ('00'+ CONVERT(VARCHAR, IDCLIENTE),(2))),
	NOMBRE NVARCHAR (30) NOT NULL,
	APELLIDO NVARCHAR(60) NOT NULL,
	APODO NVARCHAR(50) NULL,
	TELEFONO1 VARCHAR(10) NULL,
	TELEFONO2 VARCHAR(10) NULL,
	CELULAR VARCHAR(10) NOT NULL,
	DIRECCION NVARCHAR(256) NOT NULL,
	CASA VARCHAR(50) NOT NULL,
	LUGARDETRABAJO NVARCHAR(60) NULL,
	TELEFONOTRABAJO VARCHAR(10) NULL,
	NOMBRESUPERIOR NVARCHAR(70) NULL,
	TELEFONOSUPERIOR VARCHAR(10) NULL,
	TIEMPOLABORANDO VARCHAR(10) NULL,
	SALARIOMENSUAL DECIMAL(18,2) NULL,
	NOMBRECONYUGUE NVARCHAR(70) NULL,
	TELEFONOCONYUGUE VARCHAR(10) NULL,
	TRABAJOCONYUGUE NVARCHAR(60) NULL,
	TELEFONOTRABAJOCONYUGUE VARCHAR(10) NULL,
	NOMBRESUPERIORCONYUGUE NVARCHAR(70) NULL,
	TELEFONOSUPERIORCONYUGUE VARCHAR(10) NULL,
	TIEMPOLABORANDOCONYUGUE VARCHAR(10) NULL,
	SALARIOMENSUALCONYUGUE DECIMAL(18,2) NULL,
	NOMBRE_APELLIDO_TELEFONO_REFERENCIA1 NVARCHAR(100),
	NOMBRE_APELLIDO_TELEFONO_REFERENCIA2 NVARCHAR(100),
	NOMBRE_APELLIDO_TELEFONO_REFERENCIA3 NVARCHAR(100),
	NOMBRE_APELLIDO_TELEFONO_FAMILIAR1 NVARCHAR(100),
	NOMBRE_APELLIDO_TELEFONO_FAMILIAR2 NVARCHAR(100),
	NOMBRE_APELLIDO_TELEFONO_FAMILIAR3 NVARCHAR(100)
)

CREATE TABLE VENTA(
	IDVENTA INT IDENTITY (1,1) PRIMARY KEY,
	CODIGO AS ('VEN'+RIGHT ('00'+ CONVERT(VARCHAR, IDVENTA),(2))),
	FECHA DATE,
	TOTAL DECIMAL(18,2),

	-- FOREIGN KEYS
	IDEMPLEADO INT NOT NULL,
	IDCLIENTE INT NOT NULL

	-- REFERENCIAR O RELACIONAR
	CONSTRAINT RELACIONAR_EMPLEADOS FOREIGN KEY (IDEMPLEADO) REFERENCES EMPLEADO(IDEMPLEADO),
	CONSTRAINT RELACIONAR_CLIENTE FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE(IDCLIENTE)
)

CREATE TABLE DETALLE_VENTA(
	IDDETALLEVENTA INT IDENTITY (1,1) PRIMARY KEY,
	CODIGO AS ('DVT'+RIGHT ('00'+ CONVERT(VARCHAR, IDDETALLEVENTA),(2))),
	PRECIOVENTA DECIMAL (18,2) NULL,
	CANTIDAD INT NOT NULL,
	SUBTOTAL DECIMAL(18,2),

	-- FOREIGN KEYS
	IDVENTA INT NOT NULL,
	IDPRODUCTO INT NOT NULL

	-- REFERENCIAR O RELACIONAR
	CONSTRAINT RELACIONAR_VENTA FOREIGN KEY (IDVENTA) REFERENCES VENTA(IDVENTA),
	CONSTRAINT RELACIONAR_PRODUCTO FOREIGN KEY (IDPRODUCTO) REFERENCES PRODUCTO(IDPRODUCTO)
)









