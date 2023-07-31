#1 Traer fechas y numeros de factura y monto total de mis ventas
SELECT v.Ventas_Fecha, v.Ventas_NroFactura, v.Ventas_Total
FROM ventas v

#2 Traer ids de productos, cantidad y precio de detalles de ventas de los registros donde el precio sea mayor a 0
SELECT VD_ProdId, VD_Cantidad, VD_Precio
FROM ventas_detalle
WHERE VD_Precio > 0

#3 Traer total vendido por fecha de factura
SELECT v.Ventas_Fecha, SUM(v.Ventas_Total) AS total_vendido
FROM ventas v
GROUP BY v.Ventas_Fecha

#4 Traer total vendido por año y por mes 
SELECT YEAR(v.Ventas_Fecha) AS año, MONTHNAME(v.Ventas_Fecha) AS mes, SUM(v.Ventas_Total) AS total_vendido
FROM ventas v
GROUP BY año, mes

#5 Traer los productos de la tabla productos que pertenezcan al proveedor 62
SELECT *
FROM productos p
WHERE p.Prod_ProvId = 62

#6 Traer productos vendidos (solo id) sin repeticiones y con total vendido de cada uno
SELECT VD_ProdId AS producto, SUM(VD_Cantidad*VD_Precio) AS total_venta
FROM ventas_detalle
GROUP BY producto
