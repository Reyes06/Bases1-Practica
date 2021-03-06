CREATE TABLE PROVEEDOR (
  P VARCHAR(50) NOT NULL,
  PNOMBRE VARCHAR(50) NOT NULL,
  CATEGORIA INT NOT NULL,
  CIUDAD VARCHAR(50) NOT NULL,
  CONSTRAINT PK_PROVEEDOR PRIMARY KEY (P)
);

CREATE TABLE COMPONENTE(
  C VARCHAR(50) NOT NULL,
  CNOMBRE VARCHAR(50) NOT NULL,
  COLOR VARCHAR(50) NOT NULL,
  PESO INT NOT NULL,
  CIUDAD VARCHAR(50) NOT NULL,
  CONSTRAINT PK_COMPONENTE PRIMARY KEY (C)
);

CREATE TABLE ARTICULO(
  T VARCHAR(50) NOT NULL,
  TNOMBRE VARCHAR(50) NOT NULL,
  CIUDAD VARCHAR(50) NOT NULL,
  CONSTRAINT PK_ARTICULO PRIMARY KEY (T)
);

CREATE TABLE ENVIO(
  P VARCHAR(50) NOT NULL,
  C VARCHAR(50) NOT NULL,
  T VARCHAR(50) NOT NULL,
  CANTIDAD INT NOT NULL,
  CONSTRAINT PK_ENVIO PRIMARY KEY (P,C,T),
  CONSTRAINT FK_P FOREIGN KEY (P) REFERENCES PROVEEDOR (P),
  CONSTRAINT FK_C FOREIGN KEY (C) REFERENCES COMPONENTE (C),
  CONSTRAINT FK_T FOREIGN KEY (T) REFERENCES ARTICULO (T)
);

INSERT INTO PROVEEDOR (P, PNOMBRE, CATEGORIA, CIUDAD) VALUES ('P1', 'CARLOS', 20, 'SEVILLA');
INSERT INTO PROVEEDOR (P, PNOMBRE, CATEGORIA, CIUDAD) VALUES ('P2', 'JUAN', 10, 'MADRID');
INSERT INTO PROVEEDOR (P, PNOMBRE, CATEGORIA, CIUDAD) VALUES ('P3', 'JOSE', 30, 'SEVILLA');
INSERT INTO PROVEEDOR (P, PNOMBRE, CATEGORIA, CIUDAD) VALUES ('P4', 'INMA', 20, 'SEVILLA');
INSERT INTO PROVEEDOR (P, PNOMBRE, CATEGORIA, CIUDAD) VALUES ('P5', 'EVA', 30, 'CACERES');

INSERT INTO COMPONENTE (C, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C1', 'X3A', 'ROJO',12 , 'SEVILLA');
INSERT INTO COMPONENTE (C, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C2', 'B85', 'VERDE',17 , 'MADRID');
INSERT INTO COMPONENTE (C, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C3', 'C4B', 'AZUL',17 , 'MALAGA');
INSERT INTO COMPONENTE (C, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C4', 'C4B', 'ROJO',14 , 'SEVILLA');
INSERT INTO COMPONENTE (C, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C5', 'VT8', 'AZUL',12 , 'MADRID');
INSERT INTO COMPONENTE (C, CNOMBRE, COLOR, PESO, CIUDAD) VALUES ('C6', 'C30', 'ROJO',19 , 'SEVILLA');


INSERT INTO ARTICULO (T, TNOMBRE, CIUDAD) VALUES ('T1', 'CLASIFICADORA', 'MADRID');
INSERT INTO ARTICULO (T, TNOMBRE, CIUDAD) VALUES ('T2', 'PERFORADORA', 'MALAGA');
INSERT INTO ARTICULO (T, TNOMBRE, CIUDAD) VALUES ('T3', 'LECTORA', 'CACERES');
INSERT INTO ARTICULO (T, TNOMBRE, CIUDAD) VALUES ('T4', 'CONSOLA', 'CACERES');
INSERT INTO ARTICULO (T, TNOMBRE, CIUDAD) VALUES ('T5', 'MEZCLADORA', 'SEVILLA');
INSERT INTO ARTICULO (T, TNOMBRE, CIUDAD) VALUES ('T6', 'TERMINAL', 'BARCELONA');
INSERT INTO ARTICULO (T, TNOMBRE, CIUDAD) VALUES ('T7', 'CINTA', 'SEVILLA');

INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P1', 'C1', 'T1',200);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P1', 'C1', 'T4',700);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P2', 'C3', 'T1',400);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P2', 'C3', 'T2',200);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P2', 'C3', 'T3',200);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P2', 'C3', 'T4',500);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P2', 'C3', 'T5',600);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P2', 'C3', 'T6',400);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P2', 'C3', 'T7',800);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P2', 'C5', 'T2',100);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P3', 'C3', 'T1',200);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P3', 'C4', 'T2',500);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P4', 'C6', 'T3',300);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P4', 'C6', 'T7',300);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P5', 'C2', 'T2',200);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P5', 'C2', 'T4',100);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P5', 'C5', 'T4',500);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P5', 'C5', 'T7',100);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P5', 'C6', 'T2',200);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P5', 'C1', 'T4',100);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P5', 'C3', 'T4',200);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P5', 'C4', 'T4',800);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P5', 'C5', 'T5',400);
INSERT INTO ENVIO (P, C, T, CANTIDAD) VALUES ('P5', 'C6', 'T4',500);