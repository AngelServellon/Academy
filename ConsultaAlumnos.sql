select a.id as CodAlumno, a.Nombre, a.Edad, a.Sexo, a.FechaRegistr, c.Nombre as NombreCiudad
from Alumno a
inner join Ciudad c on a.CodCiudad = c.id
where a.Edad > 18;