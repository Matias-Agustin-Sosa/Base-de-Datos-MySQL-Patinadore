# Creación de base de datos y sus tablas.

CREATE DATABASE patinaje_grupo_6;

USE patinaje_grupo_6;

CREATE TABLE division(
Id_division INT AUTO_INCREMENT PRIMARY KEY,
nombre_division VARCHAR(40)
);

CREATE TABLE nivel_eficiencia(
Id_eficiencia INT AUTO_INCREMENT PRIMARY KEY,
nivel VARCHAR(20)
);

CREATE TABLE rango_edad(
Id_rango_edad INT AUTO_INCREMENT PRIMARY KEY,
rango_edad VARCHAR(20),
rango_min INT,
rango_max INT,
CONSTRAINT rango_check CHECK(rango_min > 0 AND rango_min < 99)
);

CREATE TABLE categoria(
Id_categoria INT AUTO_INCREMENT PRIMARY KEY,
Id_division INT,
Id_eficiencia INT,
Id_rango_edad INT,
FOREIGN KEY (Id_division) REFERENCES division(Id_division),
FOREIGN KEY (Id_eficiencia) REFERENCES nivel_eficiencia(Id_eficiencia),
FOREIGN KEY (Id_rango_edad) REFERENCES rango_edad(Id_rango_edad)
);

CREATE TABLE cargo(
Id_cargo INT AUTO_INCREMENT PRIMARY KEY,
cargo VARCHAR(20)
);

CREATE TABLE historico_cargo(
Id_historico INT AUTO_INCREMENT PRIMARY KEY,
Id_cargo INT,
nro_legajo INT,
FOREIGN KEY (Id_cargo) REFERENCES cargo(Id_cargo)
);

CREATE TABLE profesor(
nro_legajo INT AUTO_INCREMENT PRIMARY KEY,
nombre_profesor VARCHAR(60),
apellido_profesor VARCHAR(60),
Id_sede INT
);

ALTER TABLE historico_cargo
ADD CONSTRAINT fk_nro_legajo
FOREIGN KEY (nro_legajo)
REFERENCES profesor(nro_legajo);

CREATE TABLE torneo(
Id_torneo INT AUTO_INCREMENT PRIMARY KEY,
nombre_torneo VARCHAR(20),
año_torneo INT,
CONSTRAINT año_check CHECK(año_torneo > 0 AND año_torneo < 9999)
);

CREATE TABLE competencia(
Id_competencia INT AUTO_INCREMENT PRIMARY KEY,
fecha DATE,
Id_torneo INT,
FOREIGN KEY (Id_torneo) REFERENCES torneo(Id_torneo)
);

CREATE TABLE sede(
Id_sede INT AUTO_INCREMENT PRIMARY KEY,
nombre_sede VARCHAR(40),
Id_torneo INT,
FOREIGN KEY (Id_torneo) REFERENCES torneo(Id_torneo)
);

CREATE TABLE patinador(
nro_socio INT AUTO_INCREMENT PRIMARY KEY,
nombre_patinador VARCHAR(40),
apellido_patinador VARCHAR(40),
fecha_nacimiento DATE,
Id_categoria INT,
Id_sede INT,
FOREIGN KEY (Id_categoria) REFERENCES categoria(Id_categoria),
FOREIGN KEY (Id_sede) REFERENCES sede(Id_sede)
);

ALTER TABLE profesor
ADD CONSTRAINT fk_Id_sede
FOREIGN KEY (Id_sede)
REFERENCES sede(Id_sede);

# Inserción de datos en las tablas para su testeo.

INSERT INTO `patinaje_grupo_6`.`division` (`nombre_division`) VALUES ('A');
INSERT INTO `patinaje_grupo_6`.`division` (`nombre_division`) VALUES ('B');
INSERT INTO `patinaje_grupo_6`.`division` (`nombre_division`) VALUES ('C');

INSERT INTO `patinaje_grupo_6`.`nivel_eficiencia` (`nivel`) VALUES ('1');
INSERT INTO `patinaje_grupo_6`.`nivel_eficiencia` (`nivel`) VALUES ('2');
INSERT INTO `patinaje_grupo_6`.`nivel_eficiencia` (`nivel`) VALUES ('3');
INSERT INTO `patinaje_grupo_6`.`nivel_eficiencia` (`nivel`) VALUES ('4');
INSERT INTO `patinaje_grupo_6`.`nivel_eficiencia` (`nivel`) VALUES ('5');

INSERT INTO `patinaje_grupo_6`.`rango_edad` (`rango_edad`, `rango_min`, `rango_max`) VALUES ('Mini Inf', '8', '9');
INSERT INTO `patinaje_grupo_6`.`rango_edad` (`rango_edad`, `rango_min`, `rango_max`) VALUES ('Infantil', '10', '12');
INSERT INTO `patinaje_grupo_6`.`rango_edad` (`rango_edad`, `rango_min`, `rango_max`) VALUES ('Juvenil', '13', '16');
INSERT INTO `patinaje_grupo_6`.`rango_edad` (`rango_edad`, `rango_min`) VALUES ('Mayores', '17');

INSERT INTO `patinaje_grupo_6`.`categoria` (`Id_division`, `Id_eficiencia`, `Id_rango_edad`) VALUES ('1', '3', '4');
INSERT INTO `patinaje_grupo_6`.`categoria` (`Id_division`, `Id_eficiencia`, `Id_rango_edad`) VALUES ('2', '2', '3');
INSERT INTO `patinaje_grupo_6`.`categoria` (`Id_division`, `Id_eficiencia`, `Id_rango_edad`) VALUES ('3', '5', '1');
INSERT INTO `patinaje_grupo_6`.`categoria` (`Id_division`, `Id_eficiencia`, `Id_rango_edad`) VALUES ('2', '4', '2');
INSERT INTO `patinaje_grupo_6`.`categoria` (`Id_division`, `Id_eficiencia`, `Id_rango_edad`) VALUES ('1', '1', '4');
INSERT INTO `patinaje_grupo_6`.`categoria` (`Id_division`, `Id_eficiencia`, `Id_rango_edad`) VALUES ('1', '2', '4');
INSERT INTO `patinaje_grupo_6`.`categoria` (`Id_division`, `Id_eficiencia`, `Id_rango_edad`) VALUES ('3', '3', '2');
INSERT INTO `patinaje_grupo_6`.`categoria` (`Id_division`, `Id_eficiencia`, `Id_rango_edad`) VALUES ('2', '5', '2');
INSERT INTO `patinaje_grupo_6`.`categoria` (`Id_division`, `Id_eficiencia`, `Id_rango_edad`) VALUES ('3', '3', '3');

INSERT INTO `patinaje_grupo_6`.`torneo` (`nombre_torneo`, `año_torneo`) VALUES ('Locomotora Castro', '2022');
INSERT INTO `patinaje_grupo_6`.`torneo` (`nombre_torneo`, `año_torneo`) VALUES ('Gladys Florimonti', '2020');
INSERT INTO `patinaje_grupo_6`.`torneo` (`nombre_torneo`, `año_torneo`) VALUES ('Ricardo Fort', '2013');

INSERT INTO `patinaje_grupo_6`.`competencia` (`fecha`, `Id_torneo`) VALUES ('2022-01-25', '1');
INSERT INTO `patinaje_grupo_6`.`competencia` (`fecha`, `Id_torneo`) VALUES ('2020-06-27', '2');
INSERT INTO `patinaje_grupo_6`.`competencia` (`fecha`, `Id_torneo`) VALUES ('2013-12-15', '3');

INSERT INTO `patinaje_grupo_6`.`sede` (`nombre_sede`, `Id_torneo`) VALUES ('Almagro', '1');
INSERT INTO `patinaje_grupo_6`.`sede` (`nombre_sede`, `Id_torneo`) VALUES ('Balvanera', '2');
INSERT INTO `patinaje_grupo_6`.`sede` (`nombre_sede`, `Id_torneo`) VALUES ('Flores  ', '3');

INSERT INTO `patinaje_grupo_6`.`patinador` (`nombre_patinador`, `apellido_patinador`, `fecha_nacimiento`, `Id_categoria`, `Id_sede`) VALUES ('Patricia', 'Sosa', '2004-03-25', '1', '1');
INSERT INTO `patinaje_grupo_6`.`patinador` (`nombre_patinador`, `apellido_patinador`, `fecha_nacimiento`, `Id_categoria`, `Id_sede`) VALUES ('Julio', 'Boca', '2010-01-01', '2', '2');
INSERT INTO `patinaje_grupo_6`.`patinador` (`nombre_patinador`, `apellido_patinador`, `fecha_nacimiento`, `Id_categoria`, `Id_sede`) VALUES ('Sebastian', 'Estevanez', '2016-08-25', '3', '3');
INSERT INTO `patinaje_grupo_6`.`patinador` (`nombre_patinador`, `apellido_patinador`, `fecha_nacimiento`, `Id_categoria`, `Id_sede`) VALUES ('Veronica', 'Ojeda', '2014-05-29', '4', '2');
INSERT INTO `patinaje_grupo_6`.`patinador` (`nombre_patinador`, `apellido_patinador`, `fecha_nacimiento`, `Id_categoria`, `Id_sede`) VALUES ('Gladys', 'Florimonti ', '1991-05-25', '5', '1');
INSERT INTO `patinaje_grupo_6`.`patinador` (`nombre_patinador`, `apellido_patinador`, `fecha_nacimiento`, `Id_categoria`, `Id_sede`) VALUES ('Locomotora', 'Castro', '1994-12-10', '6', '3');
INSERT INTO `patinaje_grupo_6`.`patinador` (`nombre_patinador`, `apellido_patinador`, `fecha_nacimiento`, `Id_categoria`, `Id_sede`) VALUES ('Marcela', 'Tauro', '2014-12-09', '7', '3');
INSERT INTO `patinaje_grupo_6`.`patinador` (`nombre_patinador`, `apellido_patinador`, `fecha_nacimiento`, `Id_categoria`, `Id_sede`) VALUES ('Catherine', 'Fulop', '2015-01-28', '8', '1');
INSERT INTO `patinaje_grupo_6`.`patinador` (`nombre_patinador`, `apellido_patinador`, `fecha_nacimiento`, `Id_categoria`, `Id_sede`) VALUES ('Juan Manuel', 'Fangio', '2009-11-09', '9', '2');

INSERT INTO `patinaje_grupo_6`.`profesor` (`nombre_profesor`, `apellido_profesor`, `Id_sede`) VALUES ('Diego Armando', 'Maradona ', '3');
INSERT INTO `patinaje_grupo_6`.`profesor` (`nombre_profesor`, `apellido_profesor`, `Id_sede`) VALUES ('Gabriela', 'Sabatini', '1');
INSERT INTO `patinaje_grupo_6`.`profesor` (`nombre_profesor`, `apellido_profesor`, `Id_sede`) VALUES ('Emanuel', 'Ginobili', '2');
INSERT INTO `patinaje_grupo_6`.`profesor` (`nombre_profesor`, `apellido_profesor`, `Id_sede`) VALUES ('Pablo', 'Aymar', '1');
INSERT INTO `patinaje_grupo_6`.`profesor` (`nombre_profesor`, `apellido_profesor`, `Id_sede`) VALUES ('Hernan', 'Crespo', '2');
INSERT INTO `patinaje_grupo_6`.`profesor` (`nombre_profesor`, `apellido_profesor`, `Id_sede`) VALUES ('Gisella', 'Dulko', '3');

INSERT INTO `patinaje_grupo_6`.`cargo` (`cargo`) VALUES ('Titular');
INSERT INTO `patinaje_grupo_6`.`cargo` (`cargo`) VALUES ('Suplente');

INSERT INTO `patinaje_grupo_6`.`historico_cargo` (`Id_historico`, `Id_cargo`, `nro_legajo`) VALUES ('1', '1', '1');
INSERT INTO `patinaje_grupo_6`.`historico_cargo` (`Id_historico`, `Id_cargo`, `nro_legajo`) VALUES ('2', '1', '2');
INSERT INTO `patinaje_grupo_6`.`historico_cargo` (`Id_historico`, `Id_cargo`, `nro_legajo`) VALUES ('3', '1', '3');
INSERT INTO `patinaje_grupo_6`.`historico_cargo` (`Id_historico`, `Id_cargo`, `nro_legajo`) VALUES ('4', '1', '4');
INSERT INTO `patinaje_grupo_6`.`historico_cargo` (`Id_historico`, `Id_cargo`, `nro_legajo`) VALUES ('5', '2', '5');
INSERT INTO `patinaje_grupo_6`.`historico_cargo` (`Id_historico`, `Id_cargo`, `nro_legajo`) VALUES ('6', '2', '6');

# Consultas de Prueba.

# 1)
SELECT  nombre_sede AS Sede, CONCAT(p.nombre_profesor, " " ,p.apellido_profesor) AS Profesor, c.cargo AS Cargo
FROM sede s
JOIN profesor p ON s.Id_sede = p.Id_sede
JOIN historico_cargo h ON h.nro_legajo = p.nro_legajo
JOIN cargo c ON c.Id_cargo = h.Id_cargo;

# 2)
SELECT CONCAT(pt.nombre_patinador, " ", pt.apellido_patinador) AS Patinador,t.año_torneo AS "Año Torneo", CONCAT(d.nombre_division,"-",n.nivel,"-", r.rango_edad) AS Categoria
FROM patinador pt 
JOIN sede s ON s.Id_sede = pt.Id_sede
JOIN torneo t ON s.Id_torneo = t.Id_torneo
JOIN categoria ca ON pt.Id_categoria = ca.Id_categoria
JOIN division d ON ca.Id_division = d.Id_division
JOIN nivel_eficiencia n ON ca.Id_eficiencia = n.Id_eficiencia
JOIN rango_edad r ON ca.Id_rango_edad = r.Id_rango_edad
WHERE t.año_torneo >= 2017;

# 3)
SELECT CONCAT(nombre_patinador, " ", apellido_patinador) AS Patinador, TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS Edad
FROM patinador
WHERE TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) < 14;

# 4)
SELECT CONCAT(nombre_patinador, " ", apellido_patinador) AS Patinador, n.nivel AS Nivel, s.nombre_sede AS Sede
FROM patinador p
JOIN categoria c ON c.Id_categoria = p.Id_categoria
JOIN nivel_eficiencia n ON n.Id_eficiencia = c.Id_eficiencia
JOIN sede s ON s.Id_sede = p.Id_sede
WHERE n.nivel > 4;


