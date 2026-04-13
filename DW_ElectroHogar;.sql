-- =============================================
-- CREACIÓN DE LA BASE DE DATOS DATA WAREHOUSE
-- =============================================

--se crea la base de datos 
CREATE DATABASE DW_ElectroHogar;
GO

-- Se selecciona la base de datos para trabajar
USE DW_ElectroHogar;
GO


-- se crea la tabla Dim_Tiendas
CREATE TABLE Dim_Tiendas (
    id_tienda INT PRIMARY KEY,
    ciudad VARCHAR(50),
    departamento VARCHAR(50),
    region VARCHAR(50)
);

-- se insertan los valores a la tabla Dim_Tiendas

INSERT INTO Dim_Tiendas VALUES (1,'Bogotá','Bogotá D.C.','Centro');
INSERT INTO Dim_Tiendas VALUES (2,'Medellín','Antioquia','Noroccidente');
INSERT INTO Dim_Tiendas VALUES (3,'Cali','Valle del Cauca','Suroccidente');
INSERT INTO Dim_Tiendas VALUES (4,'Barranquilla','Atlántico','Caribe Norte');
INSERT INTO Dim_Tiendas VALUES (5,'Cartagena','Bolívar','Caribe Norte');
INSERT INTO Dim_Tiendas VALUES (6,'Bucaramanga','Santander','Nororiente');
INSERT INTO Dim_Tiendas VALUES (7,'Pereira','Risaralda','Eje Cafetero');
INSERT INTO Dim_Tiendas VALUES (8,'Manizales','Caldas','Eje Cafetero');
INSERT INTO Dim_Tiendas VALUES (9,'Ibagué','Tolima','Andina');
INSERT INTO Dim_Tiendas VALUES (10,'Santa Marta','Magdalena','Caribe Norte');
INSERT INTO Dim_Tiendas VALUES (11,'Cúcuta','Norte de Santander','Nororiente');
INSERT INTO Dim_Tiendas VALUES (12,'Villavicencio','Meta','Oriente');
INSERT INTO Dim_Tiendas VALUES (13,'Pasto','Nariño','Sur');
INSERT INTO Dim_Tiendas VALUES (14,'Montería','Córdoba','Caribe');
INSERT INTO Dim_Tiendas VALUES (15,'Neiva','Huila','Oriente');


-- =============================================
-- LIMPIEZA Y TRANSFORMACIÓN DE DATOS DIM_TIENDAS
-- =============================================

-- Se actualizan los campos de texto para eliminar espacios
-- y convertir los valores a mayúsculas

UPDATE Dim_Tiendas
SET 
    ciudad = UPPER(LTRIM(RTRIM(ciudad))),
    departamento = UPPER(LTRIM(RTRIM(departamento))),
    region = UPPER(LTRIM(RTRIM(region)));

    -- Se consulta la tabla para verificar los cambios
    Select * from Dim_Tiendas




-- se crea la tabla Productos_Staging
CREATE TABLE Productos_Staging (
    IdProducto INT,
    ProductoNombre VARCHAR(100),
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Categoria VARCHAR(50),
    Subcategoria VARCHAR(50),
    Precio INT
);

-- se insertan los valores 
INSERT INTO Productos_Staging VALUES
(1,'Lavadora Smart 8kg','HogarPlus','LAV-8S','Electrodomésticos','Lavadoras',1600000),
(2,'Lavadora 10kg','HogarPlus','LAV-10','Electrodomésticos','Lavadoras',2000000),
(3,'Nevera No Frost 300L','FrioMax','NF300','Electrodomésticos','Refrigeración',2800000),
(4,'Mini nevera 120L','FrioMax','MN120','Electrodomésticos','Refrigeración',900000),
(5,'Microondas 25L','CocinaPro','MW25','Electrodomésticos','Cocina',450000),
(6,'MiniComponente de Sonido','Samsung','MX50','Electrodomésticos','Sonido',800000),
(7,'Lavavajillas 12c','LimpiaPlus','LD12','Electrodomésticos','Limpieza',1500000),
(8,'Secadora 7kg','HogarPlus','SD7','Electrodomésticos','Secadoras',1400000),
(9,'Televisor 50" 4K','VisioMax','TV50-4K','Electrodomésticos','TV',2200000),
(10,'Televisor 43" FHD','VisioMax','TV43-FHD','Electrodomésticos','TV',1200000),
(11,'Aspiradora Robot','CleanBot','RB1','Electrodomésticos','Limpieza',900000),
(12,'PlayStation 5','Sony','PS5','Electrodomésticos','Videojuegos',3000000),
(13,'Cafetera Automática','CoffeeX','CA200','Electrodomésticos','Pequeños',500000),
(14,'Extractor de Jugos','VitalJuice','EJ50','Electrodomésticos','Pequeños',250000),
(15,'Parrilla Eléctrica','AsaPro','PE40','Electrodomésticos','Cocina',300000),
(16,'Nintendo Switch','Nintendo','NS10','Electrodomésticos','Videojuegos',1400000),
(17,'Aire Acondicionado 12000 BTU','ClimaCool','AC12000','Electrodomésticos','Climatización',1300000),
(18,'Aire Acondicionado 18000 BTU','ClimaCool','AC18000','Electrodomésticos','Climatización',2100000),
(19,'Congelador 200L','FrioMax','CF200','Electrodomésticos','Refrigeración',1700000),
(20,'Hidrolavadora','LimpiaPro','HL200','Electrodomésticos','Limpieza',600000);

-- verificacion de la tabla 
select * from Productos_Staging

-- se crea la tabla Dim
CREATE TABLE Dim_Productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    categoria VARCHAR(50),
    subcategoria VARCHAR(50),
    precio INT
);

-- =============================================
-- PROCESO ETL: CARGA DE DATOS A DIM_PRODUCTOS
-- =============================================

INSERT INTO Dim_Productos
SELECT 
    IdProducto,
    UPPER(LTRIM(RTRIM(ProductoNombre))),
    UPPER(LTRIM(RTRIM(Marca))),
    UPPER(LTRIM(RTRIM(Modelo))),
    UPPER(LTRIM(RTRIM(Categoria))),
    UPPER(LTRIM(RTRIM(Subcategoria))),
    Precio
FROM Productos_Staging;

-- =============================================
-- CONSULTA DE DATOS ORIGINALES Y DATOS LIMPIOS
-- =============================================

-- 1 Datos originales (como vienen de Excel)
SELECT * FROM Productos_Staging;

--Datos limpios (Data Warehouse)
SELECT * FROM Dim_Productos





CREATE TABLE Dim_Clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    telefono VARCHAR(20),
    segmento VARCHAR(50),
    ciudad VARCHAR(50),
    sexo VARCHAR(20),
    edad INT
);

-- aca la tabla se exporta de excel a SQL 
CREATE TABLE [dbo].[Clientes_Staging](
	[idCliente] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Email] [varchar](50) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[Segmento] [varchar](40) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[Sexo] [varchar](50) NOT NULL,
	[Edad] [int] NOT NULL,
 CONSTRAINT [PK_Clientes ] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- =============================================
-- PROCESO ETL CLIENTES
-- =============================================

INSERT INTO Dim_Clientes
SELECT
    idCliente,
    UPPER(LTRIM(RTRIM(Nombre))),
    UPPER(LTRIM(RTRIM(Email))),
    Telefono,
    UPPER(LTRIM(RTRIM(Segmento))),
    UPPER(LTRIM(RTRIM(Ciudad))),
    ISNULL(UPPER(LTRIM(RTRIM(Sexo))), 'NO REGISTRA'),
    Edad
FROM Clientes_Staging;

-- VERIFICACIÓN DE DATOS

-- Datos originales importados desde Excel
SELECT * FROM Clientes_Staging;

-- Datos limpios en la dimensión
SELECT * FROM Dim_Clientes;
GO


-- se crea la tabla dim_tiempo
CREATE TABLE Dim_Tiempo (
    id_tiempo INT PRIMARY KEY,
    fecha DATE,
    dia INT,
    mes INT,
    anio INT,
    trimestre INT,
    dia_semana VARCHAR(20),
    es_fin_semana VARCHAR(10)
);


-- =============================================
-- PROCESO ETL DIM_TIEMPO
-- =============================================

INSERT INTO Dim_Tiempo
SELECT
    IdTiempo,
    Fecha,
    Dia,
    Mes,
    Año,
    Trimestre,
    UPPER(LTRIM(RTRIM(DiaSemana))),
    UPPER(LTRIM(RTRIM(EsfinSemana)))
FROM Tiempo_Staging;

--VERIFICACIÓN DE DATOS

-- Datos originales de excel
SELECT * FROM Tiempo_Staging;

-- datos limpios en la dimension
SELECT * FROM Dim_Tiempo;
GO

-- =============================================
-- CREACIÓN DE LA TABLA DE HECHOS FACT_VENTAS
-- =============================================

CREATE TABLE Fact_Ventas (
    id_venta INT PRIMARY KEY,
    id_tiempo INT,
    id_cliente INT,
    id_producto INT,
    id_tienda INT,
    cantidad INT,
    precio_unitario INT,
    total_venta INT,
    costo_unitario INT,
    margen_unitario INT,
    margen_total INT,

    FOREIGN KEY (id_tiempo) REFERENCES Dim_Tiempo(id_tiempo),
    FOREIGN KEY (id_cliente) REFERENCES Dim_Clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES Dim_Productos(id_producto),
    FOREIGN KEY (id_tienda) REFERENCES Dim_Tiendas(id_tienda)
);

-- PROCESO ETL: CARGA DE LA TABLA DE HECHOS

INSERT INTO Fact_Ventas
SELECT
    IdVenta,
    IdTiempo,
    IdCliente,
    IdProducto,
    IdTienda,
    Cantidad,
    PrecioUnitario,
    TotalVenta,
    CostoUnitario,
    MargenUnitario,
    MargenTotal
FROM Ventas_Staging;

--CONSULTA DE VERIFICACIÓN (JOIN)

SELECT 
    c.nombre,
    p.nombre_producto,
    t.ciudad,
    ti.fecha,
    v.cantidad,
    v.total_venta
FROM Fact_Ventas v
JOIN Dim_Clientes c ON v.id_cliente = c.id_cliente
JOIN Dim_Productos p ON v.id_producto = p.id_producto
JOIN Dim_Tiendas t ON v.id_tienda = t.id_tienda
JOIN Dim_Tiempo ti ON v.id_tiempo = ti.id_tiempo;

-- =============================================
-- CREACIÓN DE LA VISTA CUBO_VENTAS
-- =============================================

CREATE VIEW Cubo_Ventas AS
SELECT
    ti.mes,
    p.subcategoria,
    t.region,
    t.departamento,
    t.ciudad,

    -- Métricas agregadas
    SUM(v.cantidad) AS Cantidad_Vendida,
    SUM(v.total_venta) AS Total_Venta,
    SUM(v.costo_unitario * v.cantidad) AS Costo_Total,
    SUM(v.margen_total) AS Margen_Total

FROM Fact_Ventas v

-- Relaciones con dimensiones
JOIN Dim_Productos p ON v.id_producto = p.id_producto
JOIN Dim_Tiendas t ON v.id_tienda = t.id_tienda
JOIN Dim_Tiempo ti ON v.id_tiempo = ti.id_tiempo

-- Niveles de agregación (granularidad)
GROUP BY
    ti.mes,
    p.subcategoria,
    t.region,
    t.departamento,
    t.ciudad;
GO

-- CONSULTA DE LA VISTA (VER EL CUBO)

-- se consulta la vista para visualizar los datos agregados

SELECT * FROM Cubo_Ventas;
GO