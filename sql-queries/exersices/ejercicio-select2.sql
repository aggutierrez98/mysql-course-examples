#1 Traer fecha de factura, nro de factura, id del cliente, razon social de cliente y monto total vendidos
SELECT v.Ventas_Fecha, v.Ventas_NroFactura, v.Ventas_CliId, c.Cli_RazonSocial, v.Ventas_Total
FROM ventas v
JOIN clientes c ON v.Ventas_CliId = c.Cli_Id

#2 Traer fecha de factura, numero de factura, id del producto, descripcion del producto, id del proveedor,
# nombre del proveedor, cantidad, precio unitario y precio parcial (cantidad * precio)
SELECT v.Ventas_Fecha, v.Ventas_NroFactura, vd.VD_ProdId, p.Prod_Descripcion, p.Prod_ProvId, pv.Prov_Nombre, 
 vd.VD_Cantidad, vd.VD_Precio, (vd.VD_Cantidad * vd.VD_Precio) AS parcial
FROM ventas v
JOIN ventas_detalle vd ON vd.VD_VentasId = v.Ventas_Id
JOIN productos p ON vd.VD_ProdId = p.Prod_Id
JOIN proveedores pv ON p.Prod_ProvId = pv.Prov_Id

#3 Traer todos los productos que hayan sido vendidos entre el 14/1/2018 y el 16/1/18 (sin repetir) 
# y calculando cantidad de unidades vendidas
SELECT p.Prod_Id, p.Prod_Descripcion, SUM(vd.VD_Cantidad) AS total_unidades_vendidas
FROM productos p
JOIN ventas_detalle vd ON vd.VD_ProdId = p.Prod_Id 
JOIN ventas v ON v.Ventas_Id = vd.VD_VentasId
WHERE v.Ventas_Fecha BETWEEN '14-01-2018' AND '16-01-18'
GROUP BY p.Prod_Id