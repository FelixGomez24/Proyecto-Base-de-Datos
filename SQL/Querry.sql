/* Consultas para el Zoológico de Huitziltepec*/

-- 1.
-- Mostrar el nombre y tipo de los alimentos que se distribuyen en los biomas "franja costera" y "bosque templado"
select distinct a.nombre ,a.tipoalimento, b.tipobioma 
from alimento a join distribuiralimento d on a.idinsumo = d.idinsumo
	join bioma b on d.idbioma = b.idbioma
where b.tipobioma = 'franja costera' or
	b.tipobioma = 'desierto';


-- 2.
-- Nombre y su fecha de caducidad de medicinas que comiencen con la cadena 'zoo' y que caduquen antes
-- del 2026
select m.nombre, m.fechacad 
from medicina m 
where m.nombre ilike 'zoo%' and 
	extract(year from m.fechacad) < (2026);
	
-- 3.
-- Nombre de las medicinas que necesitan refrigeración, provienen de un laboratorio
-- y que el costo del servicio del proveedor esté entre $10,000 y $50,000
select m.nombre, m.labprocedencia, pr.costoservicio
from medicina m join proveermedicina p on m.idinsumo = p.idinsumo 
	join proveedor pr on pr.rfc  = p.rfc
where refigeracion = true and m.labprocedencia ilike 'Laboratorio%'
	and pr.costoservicio between 10000 and 50000;


-- 4.
-- Mostar el RFC, nombre, apellido paterno de los veterinarios con mayor salario 
-- por especialidad, así como mostrar esta misma.
select v.rfc, v.nombre, v.apellidop as "apellido paterno", 
        v.especialidad, to_char(max_salario,
            'LFM999,999,999.00') "mayor salario"
from veterinario v
    join (
    select especialidad, max(salario) as max_salario
    from veterinario
    group by especialidad
	) max_salarios on v.especialidad = max_salarios.especialidad 
    and v.salario = max_salarios.max_salario;


-- 5.
-- Imprimir el id de los animales que son herbívoros y que habitan en el bioma
-- de bosque templado
select a.idanimal, al.alimentacion, b.tipobioma 
from animal a join alimentacion al on a.idanimal = al.idanimal 
	join bioma b on a.idbioma = b.idbioma
where al.alimentacion = 'Herbivoro' and b.tipobioma = 'bosque templado';


-- 6.
-- Mostrar la información de los clientes menores a 30 años y que asistieron a un
-- Evento de tipo 'Infantil' (ordenarlos por edad)
select distinct c.idcliente, c.nombre as Nombre, c.apellidop as "Apellido paterno",
	extract (year from current_date) - extract(year from c.nacimiento) as edad,
	e.tipoevento as "Tipo de evento"
from cliente c join asistir a on c.idcliente = a.idcliente
	join evento e on e.idevento = a.idevento
where e.tipoEvento = 'Infantil' and extract(year from current_date) - extract(year from c.nacimiento) < 30
order by edad;


-- 7.
-- Id y nombre de los cocodrilos que son omnívoros
select distinct a.idanimal, a.nombre, al.alimentacion 
from animal a join alimentacion al on a.idanimal = al.idanimal
where a.especie ilike 'Cocodrilo%' and 
	al.alimentacion = 'Omnivoro';
   
   
-- 8. 
-- Extrae el número de años que les quedan a las medicinas que terminan con
-- la cadena 'health'
select distinct nombre, 
	extract(year from age(fechacad,current_date)) "años restantes",
	fechacad
from medicina
where nombre ilike '%health';


-- 9.
-- Información de los veterinarios que tienen salario mayor a 100,000
-- y que trabajan en algún bosque
select distinct v.rfc, v.nombre, v.apellidop as "apellido paterno",
	v.salario, b.tipobioma
from veterinario v
    join trabajar t on v.rfc = t.rfc 
    join bioma b on b.idbioma = t.idbioma 
where v.salario > 100000 and tipobioma ilike 'bosque%';


-- 10.
-- Id y nombre de los animales que estén en el bioma 1-2 y
-- que son atendidos por veterinarios que su apellido
-- paterno comience con A-M y el apellido materno empiece con las letras N-Z
select distinct  a.idanimal, a.nombre as "Nombre animal",
	v.apellidop as "Apellido paterno",
	v.apellidom as "Apellido materno", b.idbioma 
from animal a join atender a2 on a.idanimal = a2.idanimal 
	join veterinario v on v.rfc = a2.rfc 
	join bioma b on b.idbioma = a.idbioma 
where v.apellidop ~* '^[a-m].*' and
	v.apellidom ~* '^[n-z].*' and 
	b.idbioma between 1 and 2;


-- 11.
-- Los veterinarios y cuidadores que comparten el apellido.
-- Si solo debe concordar con al menos uno
select *
from (
    select nombre, apellidoP, apellidoM, rfc
    from cuidador
    where apellidoP in (select apellidoP from veterinario)
    union
    select nombre, apellidoP, apellidoM, rfc
    from veterinario
    where apellidoP in (select apellidoP from cuidador)
) as resultado
order by apellidoP;


-- 12.
-- Alimentos de tipo carne, que son distribuidos en el aviario y pastizales
select *
from alimento
where tipoAlimento = 'carnes'
  and idInsumo in (
    select idInsumo
    from distribuirAlimento
    where idBioma in (
      select idBioma
      from Bioma
      where tipoBioma = 'aviario' or
      tipoBioma = 'pastizales'
    )
  );

 
-- 13.
-- Los cuidadores y proveedores que vivan en el mismo estado.
select distinct *
from (
    select nombre, apellidoP, apellidoM, estado
    from cuidador
    where estado in (select estado from proveedor)
    union
    select nombre, apellidoP, apellidoM, estado
    from proveedor
    where estado in (select estado from cuidador)
) as resultado
order by estado;


-- 14.
-- Imprimir la información de las medicinas que fueron distribuidas por
-- proveedores de la ciudad de méxico o Tamaulipas y que el lote
-- de la medicina esté entre los valores 100 y 199
select distinct m.idinsumo, m.nombre, m.lote, pr.rfc, 
	pr.nombre, pr.apellidop as "Apellido paterno", pr.estado 
from medicina m join proveermedicina p on m.idinsumo = p.idinsumo 
	join proveedor pr on pr.rfc = p.rfc
where (pr.estado = 'Ciudad de México' or  pr.estado = 'Tamaulipas') 
	and m.lote between 100 and 199;

-- 15.
-- Información del total de tickets por servicio en cada bioma 
-- en cada año y trimestre, ordenados por año
select b.idbioma,
	  count(t.numticket) as "Total de tickets", Año, Trimestre
from bioma b natural join ticket t,
      extract(year from t.fecha) as Año,
      extract(quarter from t.fecha) as Trimestre
      group by b.idbioma, Año, Trimestre
      order by Año, Trimestre, b.idbioma;
      
