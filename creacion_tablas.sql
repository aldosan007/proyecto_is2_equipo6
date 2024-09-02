--Creación de Tablas en la Base de Datos:
--Tabla Usuarios:
CREATE TABLE Usuarios (
    ID_Usuario NUMBER(10) PRIMARY KEY,
    Nom_Usuario VARCHAR2(50),
    Correo VARCHAR2(100) UNIQUE NOT NULL,
    Contrasenha VARCHAR2(100),
    ID_SSO VARCHAR2(100)
);
--Tabla Espacios de Trabajo:
CREATE TABLE Espacios_de_Trabajo (
    ID_Espacio NUMBER(10) PRIMARY KEY,
    Nombre_Espacio VARCHAR2(100),
    ID_Propietario NUMBER(10),
    Estado VARCHAR2(20),
    Fecha_Crea DATE,
    FOREIGN KEY (ID_Propietario) REFERENCES Usuarios(ID_Usuario)
);
--Tabla Tableros:
CREATE TABLE Tableros (
    ID_Tablereo NUMBER(10) PRIMARY KEY,
    Nom_Tablereo VARCHAR2(100),
    ID_Espacio NUMBER(10),
    Fecha_Crea DATE,
    FOREIGN KEY (ID_Espacio) REFERENCES Espacios_de_Trabajo(ID_Espacio)
);
--Tabla Listas:
CREATE TABLE Listas (
    ID_Lista NUMBER(10) PRIMARY KEY,
    Nom_Lista VARCHAR2(100),
    MaxWIP NUMBER(5),
    ID_Tablereo NUMBER(10),
    FOREIGN KEY (ID_Tablereo) REFERENCES Tableros(ID_Tablereo)
);
--Tabla Tarjetas:
CREATE TABLE Tarjetas (
    ID_Tarjeta NUMBER(10) PRIMARY KEY,
    Nom_Acti VARCHAR2(100),
    Descripcion VARCHAR2(500),
    Fecha_Crea DATE,
    Fecha_Venci DATE,
    ID_Usu_Asignado NUMBER(10),
    Etiqueta VARCHAR2(50),
    ID_Lista NUMBER(10),
    FOREIGN KEY (ID_Usu_Asignado) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (ID_Lista) REFERENCES Listas(ID_Lista)
);
--Tabla Tareas:
CREATE TABLE Tareas (
    ID_Tarea NUMBER(10) PRIMARY KEY,
    Descripcion VARCHAR2(500),
    Estado VARCHAR2(20),
    Fecha_Venci DATE,
    ID_Tarjeta NUMBER(10),
    FOREIGN KEY (ID_Tarjeta) REFERENCES Tarjetas(ID_Tarjeta)
);
--Tabla Espacio_Usuario:
CREATE TABLE Espacio_Usuario (
    ID_Espacio NUMBER(10),
    ID_Usuario NUMBER(10),
    PRIMARY KEY (ID_Espacio, ID_Usuario),
    FOREIGN KEY (ID_Espacio) REFERENCES Espacios_de_Trabajo(ID_Espacio),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario)
);
--Tabla Listas_Tarjetas_Estados:
CREATE TABLE Listas_Tarjetas_Estados (
    ID_Lista NUMBER(10),
    ID_Tarjeta NUMBER(10),
    Estado VARCHAR2(20),
    Fecha_Mod_Estado DATE,
    Comentarios VARCHAR2(500),
    PRIMARY KEY (ID_Lista, ID_Tarjeta),
    FOREIGN KEY (ID_Lista) REFERENCES Listas(ID_Lista),
    FOREIGN KEY (ID_Tarjeta) REFERENCES Tarjetas(ID_Tarjeta)
);

