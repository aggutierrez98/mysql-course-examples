# Insertar datos JSON
INSERT INTO productos (Prod_Descripcion, Prod_Propiedades) VALUES (
   'Producto con JSON', '{"propiedades": { "electrico": true, "garantia": true, "nuevo": false, "presentaFallas": true } }'
)

SELECT Prod_Id, Prod_Descripcion, Prod_Propiedades->'$.propiedades.electrico' AS Electrico
FROM productos

# Actualizar el valor de un campo JSON
UPDATE productos 
SET Prod_Propiedades = JSON_REPLACE(Prod_Propiedades,'$.propiedades.electrico',false)
WHERE Prod_Id = 6991

# 2 Maneras de filtrar con WHERE campos JSON
SELECT Prod_Id, Prod_Descripcion
FROM productos
WHERE JSON_EXTRACT(Prod_Propiedades,'$.propiedades.electrico') = FALSE

SELECT Prod_Id, Prod_Descripcion
FROM productos
WHERE Prod_Propiedades->'$.propiedades.electrico' = FALSE

# Eliminar una propiedad de un campo JSON
UPDATE productos 
SET Prod_Propiedades = JSON_REMOVE(Prod_Propiedades,'$.propiedades.presentaFallas')
WHERE Prod_Id = 6991