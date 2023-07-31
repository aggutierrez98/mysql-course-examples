#1 Traer todos los articulos que la descripcion empieze con 'SUBTERRANEO'
SELECT *
FROM productos p
WHERE p.Prod_Descripcion LIKE 'SUBTERRANEO%'

#2 Traer todos los articulos que en la descripcion,color o nombre de proveedor tenga el string 'FERRO'
SELECT p.Prod_Id, p.Prod_Descripcion, pv.Prov_Nombre
FROM productos p
JOIN proveedores pv ON p.Prod_ProvId = pv.Prov_Id
WHERE concat(p.Prod_Descripcion, p.Prod_Color, p.Prod_ProvId) LIKE '%FERRO%'

#3 Traer todos los articulos cuya descripcion tenga el string 'CINTA' y que tengan ventas realizadas
SELECT p.Prod_Id, p.Prod_Descripcion
FROM productos p
WHERE p.Prod_Id IN (
   SELECT vd.VD_ProdId
   FROM ventas_detalle vd
) AND p.Prod_Descripcion LIKE '%CINTA%'

#--3b Otra manera (pasando el id del producto por parametro)--#
SELECT p.Prod_Id, p.Prod_Descripcion
FROM productos p
WHERE EXISTS(
   SELECT * 
   FROM ventas_detalle vd
   WHERE vd.VD_ProdId=4444
) 
AND p.Prod_Descripcion LIKE '%CINTA%'

