
# Uso de BD information_schema para ver datos de estructuras guardadas en el motor de bases de datos
# Lo utilizan los SGBD
USE information_schema;

# Informacion de todas las columnas en general guardadas en el motor para la BD curso
SELECT * FROM COLUMNS
WHERE TABLE_SCHEMA = 'curso';

# Informacion de todas las columnas de la tabla productos para la BD curso
SELECT * FROM COLUMNS
WHERE TABLE_SCHEMA = 'curso' AND TABLE_NAME='productos';


# Ver procesos corriendo o que corrio el motor de bases de datos
SHOW PROCESSLIST;

# Matar proceso segun id (8 para este ejemplo)
KILL 8;


# Analizar consultas para optimizarlas con EXPLAIN
EXPLAIN SELECT Prod_Id AS id, Prod_Descripcion AS descripcion, Ventas_Fecha AS fecha, SUM(VD_Cantidad*VD_Precio) AS vendidos
FROM productos
JOIN ventas_detalle ON VD_ProdId = Prod_Id
JOIN ventas ON VD_VentasId = Ventas_Id
WHERE Ventas_Fecha BETWEEN '2018-01-02' AND '2018-01-07'
GROUP BY id, Descripcion, fecha
ORDER BY Prod_Id;