drop database bd_escuela;

create database bd_escuela;
use bd_escuela;
#Crear tabla profesor

create table profesor(
idProfesor int auto_increment primary key,
apellidos varchar(100),
nombres varchar(100),
dni int,
f_creacion date
);

create table alumno(
idAlumno int auto_increment primary key,
apellidos varchar(100),
nombres varchar(100),
edad int,
talla double,
f_creacion date);

create table curso(
idCurso int auto_increment primary key,
descripcion varchar(100),
f_creacion date,
idAlumno int,
idProfesor int,
foreign key (idAlumno) references Alumno(idAlumno),
foreign key (idProfesor) references Profesor(idProfesor)
);

alter table profesor
add estadoCivil varchar(2);

/*Insertar datos*/

insert into profesor(apellidos,nombres, dni, estadoCivil,f_creacion) values('Cervantes','Juan',45785624,'C',now());
insert into profesor(apellidos,nombres, dni, estadoCivil,f_creacion) values('Robles','Julian',457985624,'C',now());
insert into profesor(apellidos,nombres, dni, estadoCivil,f_creacion) values('Marquez Cornejo','Roberto',45785624,'C',now());
insert into profesor(apellidos,nombres, dni, estadoCivil,f_creacion) values('Santibañez Osorio','Miguel',45785624,'C',now());
insert into profesor(apellidos,nombres, dni, estadoCivil,f_creacion) values('Vasquez FLores','Juan',45785624,'C',now());

select * from profesor;

insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Romero Espejo','Maria',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Marcos Sanchez','Jusephe',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Romero Martinez','Jordan',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Espejo Espejo','Juana',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Martinez Villareal','Robert',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Lancaster Ruiz','Maria',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Ruiz Gregorio','Magdalena',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Sanchez Sanchez','Juan',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Rivas Maldonado','Yola',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Rivas Castillo','Blanca',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Romero2 Espejo','Rosaly',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Romero3 Espejo','Fiorela',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Romero4 Espejo','Josafat',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Romero5 Espejo','Jhon',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Romero6 Espejo','Flor',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Romero7 Espejo','Liz',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Romero8 Espejo','Gabriela',20,1.65,now());
insert into alumno(apellidos,nombres,edad,talla,f_creacion) values('Romero9 Espejo','Steven',20,1.65,now());

select * from alumno;

insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Ingles',now(),1,1);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Ingles',now(),2,1);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Ingles',now(),3,1);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Ingles',now(),4,1);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Ingles',now(),5,1);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Ingles',now(),6,1);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Ingles',now(),7,1);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Programacion',now(),8,2);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Programacion',now(),9,2);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Programacion',now(),10,2);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Programacion',now(),11,2);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Programacion',now(),12,2);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Programacion',now(),13,2);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Programacion',now(),14,2);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Programacion',now(),15,2);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Programacion',now(),16,2);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Programacion',now(),17,2);
insert into curso (descripcion,f_creacion,idAlumno,idProfesor) values('Programacion',now(),18,2);

select * from curso;

/*Seleccionar los profedores con esta civil soltero*/

update profesor
set estadoCivil='V'
where idProfesor in(5);

select * from profesor
where estadoCivil='S';

select * from profesor where nombres like '%uan%';

select * from alumno where edad between 18 and 19;

select cur.idCurso,cur.descripcion,cur.f_creacion,cur.idAlumno,concat(alum.apellidos,' ',alum.nombres) as 'Alumno'
from curso cur, alumno alum
where cur.idAlumno=alum.idAlumno;

create procedure sp_obtener_alumnos_mayores()
select * from alumno
where edad>=18;	

CALL `bd_escuela`.`sp_obtener_alumnos_mayores`();

create procedure sp_obtener_cursos()
select * from curso where descripcion='Ingles';

CALL `bd_escuela`.`sp_obtener_cursos`();

select * from alumno
where idAlumno in(42,43);