SELECT *
FROM `curso`.`clientes`
WHERE LOWER(CONVERT(`Cli_Id` USING utf8mb4)) LIKE 'a%' OR LOWER(CONVERT(`Cli_RazonSocial` USING utf8mb4)) LIKE 'a%' ;
SELECT *
FROM `curso`.`productos`
WHERE LOWER(CONVERT(`Prod_Id` USING utf8mb4)) LIKE 'a%' OR LOWER(CONVERT(`Prod_Descripcion` USING utf8mb4)) LIKE 'a%' OR LOWER(CONVERT(`Prod_Color` USING utf8mb4)) LIKE 'a%' OR LOWER(CONVERT(`Prod_Status` USING utf8mb4)) LIKE 'a%' OR LOWER(CONVERT(`Prod_Precio` USING utf8mb4)) LIKE 'a%' OR LOWER(CONVERT(`Prod_ProvId` USING utf8mb4)) LIKE 'a%' ;
SELECT *
FROM `curso`.`proveedores`
WHERE LOWER(CONVERT(`Prov_Id` USING utf8mb4)) LIKE 'a%' OR LOWER(CONVERT(`Prov_Nombre` USING utf8mb4)) LIKE 'a%' ;

SELECT v.Ventas_NroFactura, v.Ventas_CliId, c.Cli_RazonSocial, v.Ventas_Fecha, vd.VD_ProdId, p.Prod_Descripcion
FROM ventas v, clientes c, ventas_detalle vd, productos p
WHERE v.Ventas_CliId = c.Cli_Id AND v.Ventas_CliId > 1 AND vd.VD_VentasId = v.Ventas_Id AND vd.VD_ProdId = p.Prod_Id
ORDER BY v.Ventas_Fecha DESC, p.Prod_Descripcion

SELECT vd.VD_ProdId, p.Prod_Descripcion, count(*) AS ventas
FROM ventas_detalle vd, productos p
WHERE p.Prod_Id = vd.VD_ProdId
GROUP BY vd.VD_ProdId HAVING ventas > 100
ORDER BY ventas DESC

SELECT *
FROM productos p
WHERE p.Prod_Id NOT IN (
SELECT DISTINCT vd.VD_ProdId AS producto
FROM ventas_detalle vd
)

SELECT DISTINCT v.Ventas_CliId AS producto
FROM ventas v

SELECT *
FROM clientes c
WHERE c.Cli_Id NOT IN (
   SELECT DISTINCT v.Ventas_CliId
   FROM ventas v
   WHERE v.ventas_Total > 1000
)

SELECT p.Prod_Id, p.Prod_Descripcion, p.Prod_Color
FROM productos p
WHERE CONCAT(p.Prod_Descripcion, p.Prod_Color) LIKE "%NEGRO%"

SELECT Prod_Id, Prod_Descripcion, IF(Prod_Status=1,'Habilitado','Deshabilitado') AS Estado
FROM productos

SELECT Prod_Id, Prod_Descripcion,
CASE  Prod_Status 
   WHEN 1 THEN 'Habilitado'
   WHEN 0 THEN 'Deshabilitado'
   WHEN 2 THEN 'Otro estado qseyo'
END AS Estado
FROM productos
WHERE 