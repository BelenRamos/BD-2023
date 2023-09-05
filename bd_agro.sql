--drop database bd_agro

--create database bd_agro;

Use bd_agro;
go
-- Creación de tablas

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    UsuarioID INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Apellido NVARCHAR(50),
    email NVARCHAR(100),
    Password NVARCHAR(100),
);
go

-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nombre NVARCHAR(50),
    Direccion NVARCHAR(100),
    Telefono NVARCHAR(15),
    email NVARCHAR(100)
);
go

-- Tabla de Unidades de Medida
CREATE TABLE UnidadesMedida (
    UnidadMedidaID INT PRIMARY KEY,
    NombreUnidad NVARCHAR(50)
);
go

-- Tabla de Productos Agrícolas
CREATE TABLE ProductosAgricolas (
    ProductoID INT PRIMARY KEY,
    NombreProducto NVARCHAR(100),
    Descripcion NVARCHAR(MAX),
    PrecioPorUnidad DECIMAL(10, 2),
    UnidadMedidaID INT,
    FOREIGN KEY (UnidadMedidaID) REFERENCES UnidadesMedida(UnidadMedidaID)
);
go


-- Tabla de Herramientas
CREATE TABLE Herramientas (
    HerramientaID INT PRIMARY KEY,
    NombreHerramienta NVARCHAR(100),
    Descripcion NVARCHAR(MAX),
    UnidadMedidaID INT,
    FOREIGN KEY (UnidadMedidaID) REFERENCES UnidadesMedida(UnidadMedidaID)
);
go


-- Tabla de Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY,
    RazonSocial NVARCHAR(100),
    Direccion NVARCHAR(100),
    Telefono NVARCHAR(15),
    email NVARCHAR(100)
);
go

-- Tabla Intermedia Proveedores_Herramientas
CREATE TABLE Proveedores_ProductosSiembra (
    ProveedorHerramientaID INT PRIMARY KEY,
    ProveedorID INT,
    HerramientaID INT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID),
    FOREIGN KEY (HerramientaID) REFERENCES Herramientas(HerramientaID)
);
go


-- Tabla de Siembras
CREATE TABLE Siembras (
    SiembraID INT PRIMARY KEY,
    FechaSiembra DATE,
    ProductoID INT,
    CantidadSembrada DECIMAL(10, 2),
    LoteSiembra NVARCHAR(50),
	HerramientaUtilizadaID INT, 
    FOREIGN KEY (ProductoID) REFERENCES ProductosAgricolas(ProductoID),
	FOREIGN KEY (HerramientaUtilizadaID) REFERENCES Herramientas(HerramientaID)
);
go

-- Tabla de Ventas
CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY,
    ClienteID INT,
    FechaVenta DATE,
    TotalVenta DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);
go

-- Tabla Intermedia DetallesVenta
CREATE TABLE DetallesVenta (
    DetalleVentaID INT PRIMARY KEY,
    VentaID INT,
    ProductoID INT,
    CantidadVendida DECIMAL(10, 2),
    FOREIGN KEY (VentaID) REFERENCES Ventas(VentaID),
    FOREIGN KEY (ProductoID) REFERENCES ProductosAgricolas(ProductoID)
);
GO
