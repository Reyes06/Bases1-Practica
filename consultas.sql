/*
	1RA CONSULA: Ciudades de la tabla componentes, omitiendo duplicados
 _____________
|   | ciudad  |
| 1 | MADRID  |
| 2 | MALAGA  |
| 3 | SEVILLA |
|___|_________|

*/

SELECT DISTINCT ciudad
FROM COMPONENTE;

/*
	2DA CONSULTA: Los PNombre de la tabla proveedores que suministren los articulos CLASIFICADORA y PERFORADORA
 _____________
|  	| PNOMBRE |
| 1 | CARLOS  |
| 2 | EVA     |
| 3 | JOSE    |
| 4 | JUAN    |
|___|_________|
*/

SELECT DISTINCT PNOMBRE
FROM ENVIO
INNER JOIN PROVEEDOR ON proveedor.p = envio.p
INNER JOIN ARTICULO ON articulo.t = envio.t
WHERE articulo.tnombre = 'PERFORADORA' OR articulo.tnombre = 'CLASIFICADORA';

/*
	3RA CONSULTA: La ciudad del proveedor, el nombre del componente y la ciudad del articulo donde la cantidad sea mayor a 300
 ________________________________________
|  	 | CIUDAD_PRO |	CNOMBRE	| CIUDAD_ART |
| 1	 | SEVILLA	  | X3A	    | CACERES    |
| 2	 | MADRID	  | C4B	    | MADRID     |
| 3	 | MADRID	  | C4B	    | CACERES    |
| 4	 | MADRID	  | C4B	    | SEVILLA    |
| 5	 | MADRID	  | C4B	    | BARCELONA  |
| 6	 | MADRID	  | C4B	    | SEVILLA    |
| 7	 | SEVILLA	  | C4B	    | MALAGA     |
| 8	 | CACERES	  | C4B	    | CACERES    |
| 9	 | CACERES	  | VT8	    | CACERES    |
| 10 | CACERES	  | VT8	    | SEVILLA    |
| 11 | CACERES	  | C30	    | CACERES    |
|____|____________|_________|____________|

*/

SELECT proveedor.CIUDAD AS CIUDAD_PRO, componente.CNOMBRE, articulo.CIUDAD AS CIUDAD_ART
FROM ENVIO
INNER JOIN PROVEEDOR ON proveedor.p = envio.p
INNER JOIN ARTICULO ON articulo.t = envio.t
INNER JOIN COMPONENTE ON componente.c = envio.c
WHERE cantidad > 300;

/*
	4TA CONSULTA: Nombre de los componentes que son suministrados en una cantidad total superior a 500 (Utilizar JOINS)
 ____________________
| 	| CNOMBRE |	CANT |
| 1	| C30	  | 1300 |
| 2	| C4B	  | 4800 |
| 3	| VT8	  | 1100 |
| 4	| X3A	  | 1000 |
|___|_________|______|

*/

SELECT CNOMBRE, CANT
FROM (
        SELECT CNOMBRE, SUM(CANTIDAD) AS CANT
        FROM ENVIO
        INNER JOIN COMPONENTE ON envio.c = componente.c
        GROUP BY CNOMBRE
     ) AS TEMP
WHERE CANT > 500;

/*
	5TA CONSULTA: Para cada articulo y componente suministrado, mostrar el nombre del articulo, nombre del componente y la cantidad total correspondiente
 _______________________________________________
|    | NOMBRE_COMP  | NOMBRE_ART	| CANTIDAD  |
| 1	 | C30			| CINTA			| 300		|
| 2	 | C4B			| CINTA			| 800		|
| 3	 | VT8			| CINTA			| 100		|
| 4	 | C4B			| CLASIFICADORA	| 600		|
| 5	 | X3A			| CLASIFICADORA	| 200		|
| 6	 | B85			| CONSOLA		| 100		|
| 7	 | C30			| CONSOLA		| 500		|
| 8	 | C4B			| CONSOLA		| 1500		|
| 9	 | VT8			| CONSOLA		| 500		|
| 10 | X3A			| CONSOLA		| 800		|
| 11 | C30			| LECTORA		| 300		|
| 12 | C4B			| LECTORA		| 200		|
| 13 | C4B			| MEZCLADORA	| 600		|
| 14 | VT8			| MEZCLADORA	| 400		|
| 15 | B85			| PERFORADORA	| 200		|
| 16 | C30			| PERFORADORA	| 200		|
| 17 | C4B			| PERFORADORA	| 700		|
| 18 | VT8			| PERFORADORA	| 100		|
| 19 | C4B			| TERMINAL		| 400		|
|____|______________|_______________|___________|

*/

SELECT CNOMBRE AS NOMBRE_COMP, TNOMBRE AS NOMBRE_ART, SUM(CANTIDAD) AS CANTIDAD
FROM ENVIO
INNER JOIN COMPONENTE ON componente.c = envio.c
INNER JOIN ARTICULO ON articulo.t = envio.t
GROUP BY CNOMBRE, TNOMBRE
ORDER BY  TNOMBRE, CNOMBRE;