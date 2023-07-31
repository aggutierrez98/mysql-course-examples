SELECT Prod_Id AS Articulo,
       Prod_Descripcion AS Descripcion
FROM productos
WHERE Prod_Id>0 AND (
   SELECT Permiso
   FROM permisos
) = 1