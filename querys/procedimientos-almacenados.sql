USE PruebaCorta1
GO

CREATE PROCEDURE SP_Proveedores AS
SELECT Inventario.idArticulo, Inventario.Cantidad, Proveedor.Nombre from Inventario
INNER JOIN Proveedor on Inventario.idProveedor=proveedor.id
ORDER BY Inventario.Cantidad DESC
GO

CREATE PROCEDURE SP_Facturas AS
SELECT Factura.id, Factura.Fecha, Factura.Total, DetalleFactura.idArticulo from Factura
INNER JOIN DetalleFactura on Factura.id=DetalleFactura.idFactura
ORDER BY Factura.Total DESC
