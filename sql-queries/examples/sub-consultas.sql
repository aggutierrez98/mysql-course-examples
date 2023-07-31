SELECT Prod_Id AS Articulo,
       Prod_descripcion AS Descripcion,
       (
         SELECT MAX(Ventas_Fecha) AS UltF
         FROM ventas v
         JOIN ventas_detalle vd ON v.Ventas_Id = vd.VD_VentasId
         WHERE Prod_Id=1633
       ) AS UltFecha,
       (
         SELECT COUNT(DISTINCT(v.Ventas_CliId)) AS conteo
         FROM ventas v
         JOIN ventas_detalle vd ON v.Ventas_Id = vd.VD_VentasId
         WHERE Prod_Id=1633
       ) AS Cant_Cli
FROM productos
WHERE Prod_Id=1633
