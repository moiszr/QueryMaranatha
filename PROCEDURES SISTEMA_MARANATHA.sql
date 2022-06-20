USE SISTEMA_MARANATHA

--------------------------------------------------------- STOREPROCEDURES CATEGORIA ---------------------------------------------------------

-- PROCEDIMIENTO ALMACENADO BUSCAR CATEGORIA

CREATE PROC SP_BUSCARCATEGORIA
@BUSCAR NVARCHAR(20)
AS
SELECT * FROM CATEGORIA
WHERE NOMBRE LIKE @BUSCAR + '%'

-- PROCEDIMIENTO ALMACENADO INSERTAR CATEGORIA

CREATE PROC SP_INSERTARCATEGORIA
@NOMBRE NVARCHAR(20),
@DESCRIPCION NVARCHAR(256),
@PORCIENTO_VENTA DECIMAL (8,2),
@PORCIENTO_DESCUENTO DECIMAL (8,2)
AS
INSERT INTO CATEGORIA VALUES (@NOMBRE, @DESCRIPCION,@PORCIENTO_VENTA,@PORCIENTO_DESCUENTO)

-- PROCEDIMIENTO ALMACENADO EDITAR CATEGORIA

CREATE PROC SP_EDITARCATEGORIA
@IDCATEGORIA INT,
@NOMBRE NVARCHAR(30),
@DESCRIPCION NVARCHAR(256),
@PORCIENTO_VENTA DECIMAL (8,2),
@PORCIENTO_DESCUENTO DECIMAL (8,2)
AS
UPDATE CATEGORIA SET NOMBRE = @NOMBRE, DESCRIPCION = @DESCRIPCION, PORCIENTO_VENTA = @PORCIENTO_VENTA,PORCIENTO_DESCUENTO = @PORCIENTO_DESCUENTO
WHERE IDCATEGORIA = @IDCATEGORIA

-- PROCEDIMIENTO ALMACENADO ELIMINAR CATEGORIA

CREATE PROC SP_ELIMINARCATEGORIA
@IDCATEGORIA INT
AS
DELETE CATEGORIA
WHERE IDCATEGORIA = @IDCATEGORIA

--------------------------------------------------------- STOREPROCEDURES MARCAS ---------------------------------------------------------

-- PROCEDIMIENTO ALMACENADO BUSCAR MARCA

CREATE PROC SP_BUSCARMARCA
@BUSCAR NVARCHAR(20)
AS
SELECT * FROM MARCA
WHERE NOMBRE LIKE @BUSCAR + '%'

-- PROCEDIMIENTO ALMACENADO INSERTAR MARCA

CREATE PROC SP_INSERTARMARCA
@NOMBRE NVARCHAR(20),
@DESCRIPCION NVARCHAR(256)
AS
INSERT INTO MARCA VALUES (@NOMBRE, @DESCRIPCION)

-- PROCEDIMIENTO ALMACENADO EDITAR MARCA

CREATE PROC SP_EDITARMARCA
@IDMARCA INT,
@NOMBRE NVARCHAR(30),
@DESCRIPCION NVARCHAR(256)
AS
UPDATE MARCA SET NOMBRE = @NOMBRE, DESCRIPCION = @DESCRIPCION
WHERE IDMARCA = @IDMARCA

-- PROCEDIMIENTO ALMACENADO ELIMINAR CATEGORIA

CREATE PROC SP_ELIMINARMARCA
@IDMARCA INT
AS
DELETE MARCA
WHERE IDMARCA = @IDMARCA

--------------------------------------------------------- STOREPROCEDURES PRODUCTOS ---------------------------------------------------------

-- PROCEDIMIENTO ALMACENADO LISTAR PRODUCTOS

CREATE PROC SP_LISTARPRODUCTOS
AS
SELECT TOP 100
PRODUCTOS.IDPRODUCTO,
PRODUCTOS.CODIGO,
PRODUCTOS.PRODUCTO,
PRODUCTOS.IDCATEGORIA,
CATEGORIA.NOMBRE AS CATEGORIA,
PRODUCTOS.IDMARCA,
MARCA.NOMBRE AS MARCA,
PRODUCTOS.PRECIO_COMPRA,
PRODUCTOS.PRECIO_VENTA,
PRODUCTOS.STOCK
FROM PRODUCTOS
INNER JOIN CATEGORIA ON PRODUCTOS.IDCATEGORIA = CATEGORIA.IDCATEGORIA
INNER JOIN MARCA ON PRODUCTOS.IDMARCA = MARCA.IDMARCA
ORDER BY IDPRODUCTO ASC

-- PROCEDIMIENTO ALMACENADO BUSCAR PRODUCTOS

CREATE PROC SP_BUSCARPRODUCTOS
@BUSCAR NVARCHAR(20)
AS
SELECT TOP 100
PRODUCTOS.IDPRODUCTO,
PRODUCTOS.CODIGO,
PRODUCTOS.PRODUCTO,
PRODUCTOS.IDCATEGORIA,
CATEGORIA.NOMBRE AS CATEGORIA,
PRODUCTOS.IDMARCA,
MARCA.NOMBRE AS MARCA,
PRODUCTOS.PRECIO_COMPRA,
PRODUCTOS.PRECIO_VENTA,
PRODUCTOS.STOCK
FROM PRODUCTOS
INNER JOIN CATEGORIA ON PRODUCTOS.IDCATEGORIA = CATEGORIA.IDCATEGORIA
INNER JOIN MARCA ON PRODUCTOS.IDMARCA = MARCA.IDMARCA
WHERE PRODUCTO LIKE @BUSCAR + '%'
ORDER BY IDPRODUCTO ASC

-- PROCEDIMIENTO ALMACENADO INSERTAR PRODUCTOS

CREATE PROC SP_INSERTARPRODUCTOS
@PRODUCTO NVARCHAR(50),
@PRECIO_COMPRA DECIMAL (18,2),
@PRECIO_VENTA DECIMAL (18,2),
@STOCK INT,
@IDCATEGORIA INT,
@IDMARCA INT
AS
INSERT INTO PRODUCTOS VALUES (@PRODUCTO, @PRECIO_COMPRA, @PRECIO_VENTA, @STOCK, @IDCATEGORIA, @IDMARCA)

-- PROCEDIMIENTO ALMACENADO EDITAR PRODUCTO

CREATE PROC SP_EDITARPRODUCTOS
@IDPRODUCTO INT,
@PRODUCTO NVARCHAR(50),
@PRECIO_COMPRA DECIMAL (18,2),
@PRECIO_VENTA DECIMAL (18,2),
@STOCK INT,
@IDCATEGORIA INT,
@IDMARCA INT
AS
UPDATE PRODUCTOS SET PRODUCTO = @PRODUCTO, PRECIO_COMPRA = @PRECIO_COMPRA, PRECIO_VENTA = @PRECIO_VENTA, STOCK = @STOCK, IDCATEGORIA = @IDCATEGORIA, IDMARCA = @IDMARCA
WHERE IDPRODUCTO = @IDPRODUCTO

-- PROCEDIMIENTO ALMACENADO ELIMINAR PRODUCTO

CREATE PROC SP_ELIMINARPRODUCTOS
@IDPRODUCTO INT
AS
DELETE PRODUCTOS 
WHERE IDPRODUCTO = @IDPRODUCTO

-- PROCEDIMIENTO ALMACENADO CUENTAS TOTALES

CREATE PROC SP_TOTALESPRODUCT
@TOTALCATEGORIA INT OUTPUT,
@TOTALMARCA INT OUTPUT,
@TOTALPRODUCTO INT OUTPUT,
@SUMSTOCK INT OUTPUT
AS
SET @TOTALCATEGORIA = (SELECT COUNT(IDCATEGORIA) AS CATEGORIAS FROM CATEGORIA)
SET @TOTALMARCA = (SELECT COUNT(IDMARCA) AS MARCA FROM MARCA)
SET @TOTALPRODUCTO = (SELECT COUNT(IDPRODUCTO) AS PRODUCTO FROM PRODUCTOS)
SET @SUMSTOCK = (SELECT SUM(STOCK) AS TOTALPRODUCTOS FROM PRODUCTOS)


--------------------------------------------------------- STOREPROCEDURES ROL ---------------------------------------------------------


-- PROCEDIMIENTO ALMACENADO BUSCAR ROL

CREATE PROC SP_BUSCAR_ROL
@BUSCAR NVARCHAR(20)
AS
SELECT * FROM ROL
WHERE ROL LIKE @BUSCAR + '%'

-- PROCEDIMIENTO ALMACENADO INSERTAR ROL

CREATE PROC SP_INSERTAR_ROL
@ROL NVARCHAR(20)
AS
INSERT INTO ROL VALUES (@ROL)
-- PROCEDIMIENTO ALMACENADO EDITAR ROL

CREATE PROC SP_EDITAR_ROL
@IDROL INT,
@ROL NVARCHAR(20)

AS
UPDATE ROL SET ROL = @ROL
WHERE IDROL = @IDROL

-- PROCEDIMIENTO ALMACENADO ELIMINAR ROL

CREATE PROC SP_ELIMINAR_ROL
@IDROL INT
AS
DELETE ROL
WHERE IDROL = @IDROL

--------------------------------------------------------- STOREPROCEDURES EMPLEADO ---------------------------------------------------------


-- PROCEDIMIENTO ALMACENADO BUSCAR EMPLEADO

CREATE PROC SP_BUSCAR_EMPLEADO
@BUSCAR NVARCHAR(20)
AS
SELECT * FROM EMPLEADO
WHERE NOMBRE LIKE @BUSCAR + '%'

-- PROCEDIMIENTO ALMACENADO INSERTAR EMPLEADO

CREATE PROC SP_INSERTAR_EMPLEADO
@NOMBRE NVARCHAR(30),
@APELLIDO NVARCHAR(60),
@CEDULA VARCHAR(11),
@TELEFONO VARCHAR(10),
@DIRECION NVARCHAR(256) 
AS
INSERT INTO EMPLEADO VALUES (@NOMBRE, @APELLIDO, @CEDULA, @TELEFONO, @DIRECION)

-- PROCEDIMIENTO ALMACENADO EDITAR EMPLEADO

CREATE PROC SP_EDITAR_EMPLEADO
@IDEMPLEADO INT,
@NOMBRE NVARCHAR(30),
@APELLIDO NVARCHAR(60),
@CEDULA VARCHAR(11),
@TELEFONO VARCHAR(10),
@DIRECION NVARCHAR(256) 
AS
UPDATE EMPLEADO SET NOMBRE = @NOMBRE, APELLIDO = @APELLIDO, CEDULA = @CEDULA, TELEFONO = @TELEFONO, DIRECION = @DIRECION
WHERE IDEMPLEADO = @IDEMPLEADO

-- PROCEDIMIENTO ALMACENADO ELIMINAR EMPLEADO

CREATE PROC SP_ELIMINAR_EMPLEADO
@IDEMPLEADO INT
AS
DELETE EMPLEADO
WHERE IDEMPLEADO = @IDEMPLEADO

--------------------------------------------------------- STOREPROCEDURES USUARIO ---------------------------------------------------------


-- PROCEDIMIENTO ALMACENADO BUSCAR USUARIO

CREATE PROC SP_BUSCAR_USUARIO
@BUSCAR NVARCHAR(20)
AS
SELECT * FROM USUARIO
WHERE USUARIO LIKE @BUSCAR + '%'

-- PROCEDIMIENTO ALMACENADO INSERTAR USUARIO

CREATE PROC SP_INSERTAR_USUARIO
@USUARIO NVARCHAR(15),
@CONTRASEŅA NVARCHAR(100),
@NOMBRE NVARCHAR(40),
@APELLIDO NVARCHAR(40),
@IDROL INT
AS
INSERT INTO USUARIO VALUES (@USUARIO, @CONTRASEŅA,@NOMBRE ,@APELLIDO,@IDROL)

-- PROCEDIMIENTO ALMACENADO EDITAR USUARIO

CREATE PROC SP_EDITAR_USUARIO
@IDUSUARIO INT,
@USUARIO NVARCHAR(15),
@CONTRASEŅA NVARCHAR(100),
@NOMBRE NVARCHAR(40),
@APELLIDO NVARCHAR(40),
@IDROL INT
AS
UPDATE USUARIO SET USUARIO = @USUARIO, CONTRASEŅA = @CONTRASEŅA, IDROL=@IDROL, NOMBRE = @NOMBRE, APELLIDO = @APELLIDO
WHERE IDUSUARIO = @IDUSUARIO

-- PROCEDIMIENTO ALMACENADO ELIMINAR USUARIO

CREATE PROC SP_ELIMINAR_USUARIO
@IDUSUARIO INT
AS
DELETE USUARIO
WHERE IDUSUARIO = @IDUSUARIO

-----PROCEDIMIENTO ALMACENADO listar usuarios
CREATE PROC SP_LISTARUSUARIO
AS
SELECT TOP 100
USUARIO.IDUSUARIO,
USUARIO.CODIGO,
USUARIO.NOMBRE,
USUARIO.APELLIDO,
USUARIO.USUARIO,
USUARIO.CONTRASEŅA,
ROL.ROL AS ROL
FROM USUARIO
INNER JOIN ROL ON USUARIO.IDROL = ROL.IDROL



----PROCEDIMIENTO ALMACENADO LOGIN
CREATE PROC SP_LOGIN
@USUARIO NVARCHAR(100),
@CONTRASEŅA NVARCHAR(15)
AS
SELECT
USUARIO.IDUSUARIO,
USUARIO.CODIGO,
USUARIO.NOMBRE,
USUARIO.APELLIDO,
USUARIO.USUARIO,
USUARIO.CONTRASEŅA,
ROL.ROL AS ROL
FROM USUARIO
INNER JOIN ROL ON USUARIO.IDROL = ROL.IDROL
WHERE USUARIO = 'DANIELPBA' and CONTRASEŅA = '123456'


select * from USUARIO

--------------------------------------------------------- STOREPROCEDURES CLIENTE ---------------------------------------------------------
-- PROCEDIMIENTO ALMACENADO BUSCAR CLIENTE

CREATE PROC SP_BUSCAR_CLIENTE
@BUSCAR NVARCHAR(20)
AS
SELECT * FROM CLIENTE
WHERE NOMBRE LIKE @BUSCAR + '%'

-- PROCEDIMIENTO ALMACENADO INSERTAR CLIENTE

CREATE PROC SP_INSERTAR_CLIENTE

@NOMBRE NVARCHAR (30),
@APELLIDO NVARCHAR(60),
@CEDULA VARCHAR(15),
@APODO NVARCHAR(50) ,
@TELEFONO1 VARCHAR(10) ,
@TELEFONO2 VARCHAR(10) ,
@CELULAR VARCHAR(10),
@DIRECCION NVARCHAR(256),
@CASA VARCHAR(50),
@LUGARDETRABAJO NVARCHAR(60),
@TELEFONOTRABAJO VARCHAR(10),
@NOMBRESUPERIOR NVARCHAR(70),
@TELEFONOSUPERIOR VARCHAR(10),
@TIEMPOLABORANDO VARCHAR(10),
@SALARIOMENSUAL DECIMAL(18,2),
@NOMBRECONYUGUE NVARCHAR(70),
@TELEFONOCONYUGUE VARCHAR(10),
@TRABAJOCONYUGUE NVARCHAR(60),
@TELEFONOTRABAJOCONYUGUE VARCHAR(10),
@NOMBRESUPERIORCONYUGUE NVARCHAR(70),
@TELEFONOSUPERIORCONYUGUE VARCHAR(10),
@TIEMPOLABORANDOCONYUGUE VARCHAR(10),
@SALARIOMENSUALCONYUGUE DECIMAL(18,2),
@NOMBRE_APELLIDO_TELEFONO_REFERENCIA1 NVARCHAR(100),
@NOMBRE_APELLIDO_TELEFONO_REFERENCIA2 NVARCHAR(100),
@NOMBRE_APELLIDO_TELEFONO_REFERENCIA3 NVARCHAR(100),
@NOMBRE_APELLIDO_TELEFONO_FAMILIAR1 NVARCHAR(100),
@NOMBRE_APELLIDO_TELEFONO_FAMILIAR2 NVARCHAR(100),
@NOMBRE_APELLIDO_TELEFONO_FAMILIAR3 NVARCHAR(100) 

AS
INSERT INTO CLIENTE VALUES (@NOMBRE, @APELLIDO, @CEDULA, @APODO, @TELEFONO1, @TELEFONO2, @CELULAR, @DIRECCION, @CASA,
							@LUGARDETRABAJO, @TELEFONOTRABAJO, @NOMBRESUPERIOR, @TELEFONOSUPERIOR, @TIEMPOLABORANDO,
							@SALARIOMENSUAL, @NOMBRECONYUGUE, @TELEFONOCONYUGUE, @TRABAJOCONYUGUE,
							@TELEFONOTRABAJOCONYUGUE, @NOMBRESUPERIORCONYUGUE, @TELEFONOSUPERIORCONYUGUE, @TIEMPOLABORANDOCONYUGUE,
							@SALARIOMENSUALCONYUGUE, @NOMBRE_APELLIDO_TELEFONO_REFERENCIA1, @NOMBRE_APELLIDO_TELEFONO_REFERENCIA2,
							@NOMBRE_APELLIDO_TELEFONO_REFERENCIA3, @NOMBRE_APELLIDO_TELEFONO_FAMILIAR1,
							@NOMBRE_APELLIDO_TELEFONO_FAMILIAR2, @NOMBRE_APELLIDO_TELEFONO_FAMILIAR3)

-- PROCEDIMIENTO ALMACENADO EDITAR CLIENTE
CREATE PROC SP_EDITAR_CLIENTE
@IDCLIENTE INT ,
@NOMBRE NVARCHAR (30),
@APELLIDO NVARCHAR(60),
@APODO NVARCHAR(50) ,
@TELEFONO1 VARCHAR(10) ,
@TELEFONO2 VARCHAR(10) ,
@CELULAR VARCHAR(10),
@DIRECCION NVARCHAR(256),
@CASA VARCHAR(50),
@LUGARDETRABAJO NVARCHAR(60),
@TELEFONOTRABAJO VARCHAR(10),
@NOMBRESUPERIOR NVARCHAR(70),
@TELEFONOSUPERIOR VARCHAR(10),
@TIEMPOLABORANDO VARCHAR(10),
@SALARIOMENSUAL DECIMAL(18,2),
@NOMBRECONYUGUE NVARCHAR(70),
@TELEFONOCONYUGUE VARCHAR(10),
@TRABAJOCONYUGUE NVARCHAR(60),
@TELEFONOTRABAJOCONYUGUE VARCHAR(10),
@NOMBRESUPERIORCONYUGUE NVARCHAR(70),
@TELEFONOSUPERIORCONYUGUE VARCHAR(10),
@TIEMPOLABORANDOCONYUGUE VARCHAR(10),
@SALARIOMENSUALCONYUGUE DECIMAL(18,2),
@NOMBRE_APELLIDO_TELEFONO_REFERENCIA1 NVARCHAR(100),
@NOMBRE_APELLIDO_TELEFONO_REFERENCIA2 NVARCHAR(100),
@NOMBRE_APELLIDO_TELEFONO_REFERENCIA3 NVARCHAR(100),
@NOMBRE_APELLIDO_TELEFONO_FAMILIAR1 NVARCHAR(100),
@NOMBRE_APELLIDO_TELEFONO_FAMILIAR2 NVARCHAR(100),
@NOMBRE_APELLIDO_TELEFONO_FAMILIAR3 NVARCHAR(100) 

AS
UPDATE CLIENTE SET NOMBRE = @NOMBRE, APELLIDO = @APELLIDO, APODO = @APODO,TELEFONO1 = @TELEFONO1,TELEFONO2 =  @TELEFONO2, CELULAR = @CELULAR, 
					DIRECCION =  @DIRECCION, CASA = @CASA, LUGARDETRABAJO = @LUGARDETRABAJO, TELEFONOTRABAJO = @TELEFONOTRABAJO, 
					NOMBRESUPERIOR = @NOMBRESUPERIOR, TELEFONOSUPERIOR = @TELEFONOSUPERIOR, TIEMPOLABORANDO = @TIEMPOLABORANDO,
					SALARIOMENSUAL = @SALARIOMENSUAL, NOMBRECONYUGUE = @NOMBRECONYUGUE, TELEFONOCONYUGUE = @TELEFONOCONYUGUE, TRABAJOCONYUGUE = @TRABAJOCONYUGUE,
					TELEFONOTRABAJOCONYUGUE = @TELEFONOTRABAJOCONYUGUE, NOMBRESUPERIORCONYUGUE = @NOMBRESUPERIORCONYUGUE, 
					TELEFONOSUPERIORCONYUGUE = @TELEFONOSUPERIORCONYUGUE,TIEMPOLABORANDOCONYUGUE = @TIEMPOLABORANDOCONYUGUE, SALARIOMENSUALCONYUGUE = @SALARIOMENSUALCONYUGUE, 
					NOMBRE_APELLIDO_TELEFONO_REFERENCIA1 = @NOMBRE_APELLIDO_TELEFONO_REFERENCIA1, NOMBRE_APELLIDO_TELEFONO_REFERENCIA2 = @NOMBRE_APELLIDO_TELEFONO_REFERENCIA2,
					NOMBRE_APELLIDO_TELEFONO_REFERENCIA3 = @NOMBRE_APELLIDO_TELEFONO_REFERENCIA3, NOMBRE_APELLIDO_TELEFONO_FAMILIAR1 = @NOMBRE_APELLIDO_TELEFONO_FAMILIAR1,
					NOMBRE_APELLIDO_TELEFONO_FAMILIAR2 = @NOMBRE_APELLIDO_TELEFONO_FAMILIAR2, NOMBRE_APELLIDO_TELEFONO_FAMILIAR3 = @NOMBRE_APELLIDO_TELEFONO_FAMILIAR3

					WHERE IDCLIENTE = @IDCLIENTE


-- PROCEDIMIENTO ALMACENADO ELIMINAR CLIENTE

CREATE PROC SP_ELIMINAR_CLIENTE
@IDCLIENTE INT
AS
DELETE CLIENTE
WHERE IDCLIENTE = @IDCLIENTE

-- PROCEDIMIENTO ALMACENADO LISTAR CLIENTE

CREATE PROC SP_LISTACLIENTE
AS
SELECT * FROM CLIENTE

--------------------------------------------------------- STOREPROCEDURES COMPRAS ---------------------------------------------------------

-- PROCEDIMIENTO ALMACENADO BUSCAR COMPRAS

CREATE PROC SP_BUSCAR_COMPRA(
@BUSCAR INT
)
AS
SELECT * FROM COMPRA WHERE IDCOMPRA = @BUSCAR

-- PROCEDIMIENTO ALMACENADO INSERTAR COMPRAS

CREATE PROC SP_COMPRA(
	@FECHA DATETIME,
	@TOTAL DECIMAL(18,2),
	@IDEMPLEADO INT
	)
	AS

	INSERT INTO COMPRA VALUES (@FECHA,@TOTAL,@IDEMPLEADO)

--------------------------------------------------------- STOREPROCEDURES DETALLECOMPRA ---------------------------------------------------------

-- PROCEDIMIENTO ALMACENADO BUSCAR DETALLECOMPRA
CREATE PROC SP_BUSCAR_DETALLE_COMPRA(
@BUSCAR INT
)
AS
SELECT * FROM DETALLECOMPRA WHERE IDCOMPRA = @BUSCAR

-- PROCEDIMIENTO ALMACENADO INSERTAR  DETALLECOMPRA

CREATE PROC SP_DETALLE_COMPRA(
	@PRECIOCOMPRA DECIMAL (18,2),
	@CANTIDAD INT,
	@SUBTOTAL DECIMAL(18,2),
	@IDCOMPRA INT,
	@IDPRODUCTO INT 
)
AS
INSERT INTO DETALLE_COMPRA VALUES(@PRECIOCOMPRA,@CANTIDAD,@SUBTOTAL,@IDCOMPRA,@IDPRODUCTO)
UPDATE DETALLE_COMPRA SET SUBTOTAL = @PRECIOCOMPRA * @CANTIDAD WHERE IDDETALLECOMPRA = IDENT_CURRENT('DETALLE_COMPRA')
UPDATE COMPRA SET TOTAL = TOTAL + (@CANTIDAD * @PRECIOCOMPRA)
UPDATE PRODUCTOS SET STOCK = STOCK + @CANTIDAD WHERE IDPRODUCTO = @IDPRODUCTO



--------------------------------------------------------- STOREPROCEDURES VENTAS ---------------------------------------------------------

-------------------------------VENTAS -----------------------------------

-- PROCEDIMIENTO ALMACENADO BUSCAR VENTAS
CREATE PROC SP_BUSCAR_VENTA(
@BUSCAR INT
)
AS
SELECT * FROM VENTA WHERE IDVENTA = @BUSCAR

-- PROCEDIMIENTO ALMACENADO INSERTAR VENTAS

CREATE PROC SP_VENTA(
	@FECHA DATE,
	@TOTAL DECIMAL(18,2),
	@IDEMPLEADO INT,
	@IDCLIENTE INT
)
AS
INSERT INTO VENTA VALUES(@FECHA,@TOTAL,@IDEMPLEADO,@IDCLIENTE)

--------------------------------------------------------- STOREPROCEDURES DETALLEVENTA ---------------------------------------------------------

------------------------------BUSCAR DETALLEVENTA
CREATE PROC SP_BUSCAR_DETALLE_VENTA(
@BUSCAR INT
)
AS
SELECT * FROM DETALLE_VENTA WHERE IDVENTA = @BUSCAR
-----------------------------CREATE DETALLEVENTA--------
CREATE PROC SP_DETALLE_VENTA(
	@PRECIOVENTA DECIMAL (18,2),
	@CANTIDAD INT,
	@SUBTOTAL DECIMAL(18,2),
	@IDVENTA INT,
	@IDPRODUCTO INT
	)
	AS
	INSERT INTO DETALLE_VENTA VALUES(@PRECIOVENTA,@CANTIDAD,@SUBTOTAL,@IDVENTA,@IDPRODUCTO)
	UPDATE DETALLE_VENTA SET SUBTOTAL = @PRECIOVENTA * @CANTIDAD WHERE IDDETALLEVENTA = IDENT_CURRENT('DETALLE_VENTA')
	UPDATE VENTA SET TOTAL = TOTAL + (@CANTIDAD * @PRECIOVENTA) WHERE IDVENTA = @IDVENTA
	UPDATE PRODUCTOS SET STOCK = STOCK - @CANTIDAD WHERE IDPRODUCTO = @IDPRODUCTO

--------------------------------------------------------- STOREPROCEDURES PAGOS ---------------------------------------------------------

-- PROCEDIMIENTO ALMACENADO BUSCAR PAGOS
CREATE PROC SP_BUSCAR_PAGOS(
@BUSCAR INT
)
AS
SELECT * FROM PAGOS WHERE IDPAGOS = @BUSCAR


-- PROCEDIMIENTO ALMACENADO INSERTAR PAGOS
CREATE PROC SP_INSERT_PAGOS(
@FECHA DATE,
@NOMBRE NVARCHAR (30), 
@INTERES_MORA DECIMAL (8,2),
@CUOTA DECIMAL(18,2),
@MORA DECIMAL (18,2),
@TOTAL DECIMAL (18,2),
@IDCREDIO INT,
@IDCLIENTE INT  
)
AS
INSERT INTO PAGOS VALUES (@FECHA,@NOMBRE,@INTERES_MORA,@CUOTA,@MORA,@TOTAL,@IDCREDIO,@IDCLIENTE)


-- PROCEDIMIENTO ALMACENADO EDITAR PAGOS
CREATE PROC SP_EDITAR_PAGOS(
@IDPAGOS INT,
@FECHA DATE,
@NOMBRE NVARCHAR (30), 
@INTERES_MORA DECIMAL (8,2),
@CUOTA DECIMAL(18,2),
@MORA DECIMAL (18,2),
@TOTAL DECIMAL (18,2),
@IDCREDIO INT,
@IDCLIENTE INT  
)
AS
UPDATE PAGOS SET FECHA = @FECHA,  NOMBRE = @NOMBRE, INTERES_MORA = @INTERES_MORA, CUOTA = @CUOTA,
				MORA = @MORA, TOTAL = @TOTAL, IDCREDIO = @IDCREDIO, IDCLIENTE = @IDCLIENTE 

-- PROCEDIMIENTO ALMACENADO ELIMINAR PAGOS
CREATE PROC SP_ELIMINAR_PAGOS
@IDPAGOS INT
AS
DELETE PAGOS
WHERE IDPAGOS = @IDPAGOS


--------------------------------------------------------- STOREPROCEDURES GARANTE ---------------------------------------------------------

-- PROCEDIMIENTO ALMACENADO BUSCAR GARANTE
CREATE PROC SP_BUSCAR_GARANTE(
@BUSCAR INT
)
AS
SELECT * FROM GARANTE WHERE NOMBRE LIKE @BUSCAR + '%'


-- PROCEDIMIENTO ALMACENADO INSERTAR GARANTE
CREATE PROC SP_INSERT_GARANTE(
@FECHA DATE,
@NOMBRE NVARCHAR (30),
@APELLIDO NVARCHAR(60),
@CEDULA NVARCHAR(15),
@TELEFONO1 VARCHAR(10),
@CELULAR VARCHAR(10),
@DIRECCION NVARCHAR(256),
@TRABAJO NVARCHAR(70),
@SUELDO DECIMAL (18,2) 
)
AS
INSERT INTO GARANTE VALUES (@FECHA, @NOMBRE, @APELLIDO, @CEDULA, @TELEFONO1, @CELULAR, @DIRECCION, @TRABAJO, @SUELDO)


-- PROCEDIMIENTO ALMACENADO EDITAR GARANTE
CREATE PROC SP_EDIT_GARANTE(
@IDGARANTE INT,
@FECHA DATE,
@NOMBRE NVARCHAR (30),
@APELLIDO NVARCHAR(60),
@CEDULA NVARCHAR(15),
@TELEFONO1 VARCHAR(10),
@CELULAR VARCHAR(10),
@DIRECCION NVARCHAR(256),
@TRABAJO NVARCHAR(70),
@SUELDO DECIMAL (18,2) 
)
AS
UPDATE GARANTE SET FECHA = @FECHA, NOMBRE = @NOMBRE, APELLIDO = @APELLIDO, CEDULA = @CEDULA, 
					TELEFONO1 = @TELEFONO1, CELULAR = @CELULAR, DIRECCION = @DIRECCION, 
					TRABAJO = @TRABAJO, SUELDO = @SUELDO


-- PROCEDIMIENTO ALMACENADO ELIMINAR GARANTE
CREATE PROC SP_ELIMINAR_GARANTE
@IDGARANTE INT
AS
DELETE GARANTE
WHERE IDGARANTE = @IDGARANTE


--------------------------------------------------------- STOREPROCEDURES CREDITO ---------------------------------------------------------

-- PROCEDIMIENTO ALMACENADO BUSCAR CREDITO
CREATE PROC SP_BUSCAR_CREDITO(
@BUSCAR INT
)
AS
SELECT * FROM CREDITO WHERE IDCREDIO = @BUSCAR


-- PROCEDIMIENTO ALMACENADO INSERTAR CREDITO
CREATE PROC SP_INSERT_CREDITO(
@FECHA DATE,
@TOTAL_VENTA DECIMAL(18,2),
@INTERES DECIMAL (8,2),
@TIEMPO INT,
@CUOTAS_PAGADAS INT,
@CUOTA DECIMAL(18,2),
@TOTAL_PAGADO DECIMAL(18,2),
@TOTAL_PAGAR DECIMAL(18,2),
@IDVENTA INT,
@IDCLIENTE INT 
)
AS
INSERT INTO CREDITO VALUES (@FECHA,@TOTAL_VENTA,@INTERES,@TIEMPO,@CUOTAS_PAGADAS,@CUOTA,@TOTAL_PAGADO,@TOTAL_PAGAR,@IDVENTA,@IDCLIENTE)

-- PROCEDIMIENTO ALMACENADO EDITAR CREDITO
CREATE PROC SP_EDIT_CREDITO(
@IDCREDIO INT,
@FECHA DATE,
@TOTAL_VENTA DECIMAL(18,2),
@INTERES DECIMAL (8,2),
@TIEMPO INT,
@CUOTAS_PAGADAS INT,
@CUOTA DECIMAL(18,2),
@TOTAL_PAGADO DECIMAL(18,2),
@TOTAL_PAGAR DECIMAL(18,2),
@IDVENTA INT,
@IDCLIENTE INT
)
AS
UPDATE CREDITO SET FECHA = @FECHA, TOTAL_VENTA = @TOTAL_VENTA, INTERES = @INTERES, TIEMPO = @TIEMPO, 
					CUOTAS_PAGADAS = @CUOTAS_PAGADAS, CUOTA = @CUOTA, TOTAL_PAGADO =  @TOTAL_PAGADO,  
					TOTAL_PAGAR = @TOTAL_PAGAR, IDVENTA = @IDVENTA, IDCLIENTE = @IDCLIENTE

-- PROCEDIMIENTO ALMACENADO ELIMINAR CREDITO
CREATE PROC SP_ELIMINAR_CREDITO
@IDCREDIO INT
AS
DELETE CREDITO
WHERE IDCREDIO = @IDCREDIO

--------------------------------------------------------- STOREPROCEDURES CONTROLDATOS ---------------------------------------------------------


CREATE PROC SP_CONTROLDATOS
as
SELECT sum(TOTAL) as ToVentas from VENTA 
SELECT COUNT(IDPRODUCTO) as CantProducto from PRODUCTO 
SELECT COUNT(IDCATEGORIA)as Cant from CATEGORIA 
SELECT COUNT(IDMARCA) as CantMarcas from MARCA 
SELECT COUNT(IDEMPLEADO)as Cantempleado from EMPLEADO
SELECT COUNT(IDCLIENTE) as CantCliente from CLIENTE
go

--------------------------------------------------------- STOREPROCEDURES PRODFAVORITOS ---------------------------------------------------------
CREATE PROC SP_PRODFAVORITOS
as
SELECT  C.NOMBRE +' '+ M.NOMBRE +' '+ P.PRODUCTO as PRODUCTOS, COUNT(DV.IDPRODUCTO)as Procfav from Detalle_Venta as DV
inner join PRODUCTO as P on P.IDPRODUCTO = DV.IDPRODUCTO 
inner join CATEGORIA as C on C.IDCATEGORIA = P.IDCATEGORIA
inner join MARCA as M on M.IDMARCA = P.IDMARCA
group by DV.IDPRODUCTO, C.NOMBRE, M.NOMBRE,P.PRODUCTO
order by COUNT(2) desc
go


--------------------------------------------------------- STOREPROCEDURES PRODCATEGORIA ---------------------------------------------------------
CREATE PROC SP_PRODCATEGORIA
as
SELECT C.NOMBRE ,COUNT(P.IDCATEGORIA)as CANT
from PRODUCTO as P
inner join CATEGORIA as C on C.IDCATEGORIA = P.IDCATEGORIA
group by P.IDCATEGORIA, C.NOMBRE
order by COUNT(2) desc
go
