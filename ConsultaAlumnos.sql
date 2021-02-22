select a.id as CodAlumno, a.Nombre, a.Edad, a.Sexo, a.FechaRegistr, c.Nombre as NombreCiudad
from Alumno a
inner join Ciudad c on a.CodCiudad = c.id
where a.Edad > 18;

select distinct a.Nombre, a.Apellidos, m.Nombre as Materia, c.Nota1, c.Nota2, c.Nota3, c.Nota4 from Alumno a 
inner join Calificacion c 
on a.id = c.id_alumno
inner join Materia m 
on c.id_materia = m.Id_Materia; 