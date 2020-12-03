USE PruebaCorta1
GO

CREATE VIEW vArticulos AS
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT Articulos.id, Articulos.precioUnitario, Inventario.idProveedor FROM articulos
INNER JOIN Inventario on Articulos.id=Inventario.idArticulo
GO

CREATE VIEW vFactura AS
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT Factura.Total, factura.Fecha, DetalleFactura.Monto FROM Factura
INNER JOIN DetalleFactura on Factura.id=DetalleFactura.idFactura
GO

CREATE VIEW vRegistroPagos AS
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT Cliente.id, Cliente.nombre, PagosCliente.Cantidad, PagosCliente.Fecha FROM Cliente
INNER JOIN RegistroPagos on Cliente.id=RegistroPagos.idCliente
INNER JOIN PagosCliente on RegistroPagos.idPago=PagosCliente.id
GO

CREATE VIEW vCompraProveedor AS
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT Proveedor.id, Proveedor.Nombre, DetalleCompraProveedor.Cantidad, DetalleCompraProveedor.Monto FROM Proveedor
INNER JOIN Inventario on Proveedor.id=Inventario.idProveedor
INNER JOIN Articulos on Inventario.idArticulo=Articulos.id
INNER JOIN DetalleCompraProveedor on Articulos.id=DetalleCompraProveedor.idArticulo
GO




