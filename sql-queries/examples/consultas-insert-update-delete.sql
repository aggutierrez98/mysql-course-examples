INSERT INTO alumnos (Alum_Nombre) VALUES(
"Pedro Narvaja"
)

UPDATE productos 
SET Prod_Precio=100
WHERE Prod_ProvId IN (
   SELECT Prov_Id 
   FROM proveedores
   WHERE Prov_CompraSuspendida=0
)

DELETE FROM ventas_detalle vd
WHERE vd.VD_ProdId IN (
   SELECT Prod_Id
   FROM productos
   WHERE Prod_Status = 1
)