#1 Traer la cantidad de productos que se han vendido
SELECT COUNT(DISTINCT(vd.VD_ProdId)) AS total_vendidos
FROM productos p
RIGHT JOIN ventas_detalle vd ON vd.VD_ProdId = p.Prod_Id

#2 Traer el total vendido de los productos que fueron vendidos entre el 2/1/18 y el 10/1/18 y cuyo proveedor se encuentre
# entre el 2 y el 100
SELECT SUM((vd.VD_Precio * vd.VD_Cantidad)) AS total_vendido
FROM ventas_detalle vd
JOIN ventas v ON v.Ventas_Id = vd.VD_VentasId
JOIN productos p ON vd.VD_ProdId = p.Prod_Id
WHERE (v.Ventas_Fecha BETWEEN '2018-01-02' AND '2018-01-10') AND 
 (p.Prod_ProvId BETWEEN 2 AND 100)
 
#3 Traer la factura de valor maximo, que haya tenido en sus items vendidos el producto 656
SELECT Ventas_NroFactura, MAX(Ventas_Total) AS costo
FROM ventas
JOIN ventas_detalle ON VD_VentasId = Ventas_Id
WHERE VD_ProdId = 656