SELECT CONCAT('$', UtilidadTotal('2018-01-01','2018-01-31')) AS "UtilidadTotal";

CALL CodigosABC('2018-01-01','2018-01-31');

SELECT p.Prod_Id, p.Prod_Descripcion, p.Prod_ABC
FROM productos p
WHERE p.Prod_ABC IS NOT NULL