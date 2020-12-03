USE PruebaCorta1
GO

CREATE VIEW vArticulos AS
-- Select rows from a Table or View 'TableOrViewName' in schema 'SchemaName'
SELECT Articulos.id, Articulos.precioUnitario, Inventario.idProveedor FROM articulos
INNER JOIN Inventario on Articulos.id=Inventario.idArticulo
GO

CREATE PROCEDURE SP_Proveedores AS
SELECT Inventario.idArticulo, Inventario.Cantidad, Proveedor.Nombre from Inventario
INNER JOIN Proveedor on Inventario.idProveedor=proveedor.id
ORDER BY Inventario.Cantidad DESC

EXECUTE SP_Proveedores
