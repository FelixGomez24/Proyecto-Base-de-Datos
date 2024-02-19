/* Verificamos que el veterinario solo pueda estar trabajando a lo mas en 2 biomas */
CREATE OR REPLACE FUNCTION validar_limitacion_biomas()
RETURNS TRIGGER AS
$$
DECLARE
    cantidad_biomas INT;
BEGIN
    -- Contar la cantidad de biomas en los que ya trabaja el veterinario
    SELECT COUNT(*)
    INTO cantidad_biomas
    FROM trabajar
    WHERE rfc = NEW.rfc;

    -- Verificar si el veterinario ya trabaja en dos biomas
    IF cantidad_biomas >= 2 THEN
        RAISE EXCEPTION 'Un veterinario no puede trabajar en más de dos biomas.';
    END IF;

    -- Si pasa la validación, permite la inserción
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_limitacion_biomas_trigger
BEFORE INSERT ON trabajar
FOR EACH ROW
EXECUTE FUNCTION validar_limitacion_biomas();


-- Insertamos un ejemplo de veterinario 
INSERT INTO veterinario(rfc, nombre, apellidoP, apellidoM, calle, numExt, numInt, colonia, estado, genero, nacimiento, fechaInicioC, fechaFinalizacionC, especialidad, salario)
VALUES ('BBBB994448JF0', 'Martín', 'Juárez', 'Duarte', 'Avenida Morelos', 473, 728, 'San José Insurgentes', 'Colima', 'M', '6/4/2001', '8/27/2022', '3/29/2028', 'Cardiología', 67292.69);

-- Checamos que se haya insertado bien 
select * from veterinario where rfc = 'BBBB994448JF0'; 

-- Checamos que no este trabando aun en un bioma 
select * from trabajar where rfc = 'BBBB994448JF0'; 
-- Inserciónes válidas
INSERT INTO trabajar(idBioma, rfc) VALUES (1, 'BBBB994448JF0');
INSERT INTO trabajar(idBioma, rfc) VALUES (2, 'BBBB994448JF0');

-- Checamos que ya este trabando en un bioma 
select * from trabajar where rfc = 'BBBB994448JF0'; 

-- Inserción válida (ya que seria su tercer bioma y eso no esta permitido)
INSERT INTO trabajar(idBioma, rfc) VALUES (3, 'BBBB994448JF0');

--------------------------------------------------------------------------------------------------------------------------------
/*Verificamos que el cuidador solo pueda estar trabajando a lo mas en 1 bioma */
CREATE OR REPLACE FUNCTION validar_limitacion_bioma_cuidador()
RETURNS TRIGGER AS
$$
BEGIN
    -- Verificar si el cuidador ya trabaja en algún bioma
    IF EXISTS (
        SELECT 1
        FROM cuidador
        WHERE rfc = NEW.rfc
    ) THEN
        RAISE EXCEPTION 'Un cuidador solo puede trabajar en un bioma.';
    END IF;

    -- Si pasa la validación, permite la inserción
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_limitacion_bioma_cuidador_trigger
BEFORE INSERT ON cuidador
FOR EACH ROW
EXECUTE FUNCTION validar_limitacion_bioma_cuidador();

-- Insertamos al cuidador 
INSERT INTO cuidador(rfc, idBioma, nombre, apellidoP, apellidoM, calle, numExt, numInt, colonia, estado, genero, nacimiento, fechaInicioC, fechaFinalizacionC, DiasTrabajo, HorarioLaboral, Salario)
VALUES ('BBBA343999GXQ', 2, 'Carlos', 'Ríos', 'Gutiérrez', 'Boulevard Zaragoza', 494, 841, 'Moctezuma 2a Sección', 'Jalisco', 'F', '1988-11-17', '2018-10-21', '2031-01-15', 2, '4:12 PM', 36054.25);

-- verificamos que el cuidador se haya insertado de forma correcta 
select * from cuidador where rfc = 'BBBA343999GXQ'; 

-- Intentamos insertar al cuidador a otro bioma y ya no lo podemos hacer ya que cuenta con uno 
INSERT INTO cuidador(rfc, idBioma, nombre, apellidoP, apellidoM, calle, numExt, numInt, colonia, estado, genero, nacimiento, fechaInicioC, fechaFinalizacionC, DiasTrabajo, HorarioLaboral, Salario)
VALUES ('BBBA343999GXQ', 3, 'Carlos', 'Ríos', 'Gutiérrez', 'Boulevard Zaragoza', 494, 841, 'Moctezuma 2a Sección', 'Jalisco', 'F', '1988-11-17', '2018-10-21', '2031-01-15', 2, '4:12 PM', 36054.25);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Un animal solo puede pertnercer a un bioma*/
CREATE OR REPLACE FUNCTION validar_limitacion_jaula_bioma()
RETURNS TRIGGER AS
$$
BEGIN
    -- Verificar si el animal ya pertenece a algún bioma
    IF EXISTS (
        SELECT 1
        FROM animal
        WHERE idAnimal = NEW.idAnimal AND idBioma IS NOT NULL
    ) THEN
        RAISE EXCEPTION 'El animal ya pertenece a un bioma.';
    END IF;

    -- Verificar si el animal ya tiene una jaula asignada
    IF EXISTS (
        SELECT 1
        FROM animal
        WHERE numJaulas IS NOT NULL AND idAnimal = NEW.idAnimal
    ) THEN
        RAISE EXCEPTION 'Un animal solo puede tener una jaula asignada.';
    END IF;

    -- Verificar si el bioma existe
    IF NOT EXISTS (
        SELECT 1
        FROM bioma
        WHERE idBioma = NEW.idBioma
    ) THEN
        RAISE EXCEPTION 'El bioma especificado no existe.';
    END IF;

    -- Verificar si el animal ya tiene bioma asignado
    IF EXISTS (
        SELECT 1
        FROM animal
        WHERE idAnimal = NEW.idAnimal AND idBioma IS NOT NULL
    ) THEN
        RAISE EXCEPTION 'El animal ya tiene un bioma asignado.';
    END IF;

    -- Si pasa la validación, permite la inserción
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_limitacion_jaula_bioma_trigger
BEFORE INSERT ON animal
FOR EACH row
EXECUTE FUNCTION validar_limitacion_jaula_bioma();



-- Intentar insertar un animal con idBioma existente, pero sin bioma asignado y sin jaula asignada (debería ser válida)
INSERT INTO animal(idAnimal, idBioma, rfc, nombre, especie, peso, altura, sexo, numJaulas) VALUES (900, 1, 'WIGY2767496IJ', 'MaurisVulputate', 'Cocodrilo Galáctico', 80.72, 3.42, 'F', 3);

select * from animal where idAnimal = 900; 
-- Intentar insertar el mismo animal en el mismo bioma (debería generar una excepción)
INSERT INTO animal(idAnimal, idBioma, rfc, nombre, especie, peso, altura, sexo, numJaulas) VALUES (900, 1, 'WIGY2767496IJ', 'MaurisVulputate', 'Cocodrilo Galáctico', 80.72, 3.42, 'F', null);

-- Intentar insertar el mismo animal en otro bioma (debería generar una excepción)
INSERT INTO animal(idAnimal, idBioma, rfc, nombre, especie, peso, altura, sexo, numJaulas) VALUES (900, 2, 'WIGY2767496IJ', 'MaurisVulputate', 'Cocodrilo Galáctico', 80.72, 3.42, 'F', 3);

-- Intentar insertar un animal con jaula asignada (debería generar una excepción)
INSERT INTO animal(idAnimal, idBioma, rfc, nombre, especie, peso, altura, sexo, numJaulas) VALUES (900, 1, 'WIGY2767496IJ', 'Otro Animal', 'Especie XYZ', 50.0, 2.0, 'M', 1);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Disparador que verifica que el animla y el veterinario sean pertencientes al mismo bioma para que este animal pueda ser atendido*/
CREATE OR REPLACE FUNCTION validar_atencion_veterinarios_bioma()
RETURNS TRIGGER AS
$$
BEGIN
    -- Verificar si el animal ya tiene asignado un bioma
    IF NOT EXISTS (
        SELECT 1
        FROM animal
        WHERE idAnimal = NEW.idAnimal AND idBioma IS NOT NULL
    ) THEN
        RAISE EXCEPTION 'El animal debe tener asignado un bioma antes de ser atendido.';
    END IF;

    -- Verificar si el veterinario pertenece al mismo bioma que el animal
    IF NEW.rfc IS NOT NULL AND NOT EXISTS (
        SELECT 1
        FROM trabajar t
        WHERE t.rfc = NEW.rfc AND t.idBioma = (SELECT idBioma FROM animal WHERE idAnimal = NEW.idAnimal)
    ) THEN
        RAISE EXCEPTION 'El veterinario no pertenece al mismo bioma que el animal.';
    END IF;

    -- Si pasa la validación, permite la inserción
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER validar_atencion_veterinarios_bioma_trigger
BEFORE INSERT ON atender
FOR EACH ROW
EXECUTE FUNCTION validar_atencion_veterinarios_bioma();


-- Probar de que si pertenecen al mismo bioma si pueden atenderlo (Caso malo) 

-- Insertar datos de ejemplo en la tabla veterinario
INSERT INTO veterinario(rfc, nombre, apellidoP, apellidoM, calle, numExt, numInt, colonia, estado, genero, nacimiento, fechaInicioC, fechaFinalizacionC, especialidad, salario) VALUES ('BBBB3890928FR', 'Rafaela', 'Cárdenas', 'Villa', 'Avenida Insurgentes', 757, 777, 'Juárez', 'Querétaro', 'F', '8/9/1980', '1/22/2014', '8/20/2004', 'Ortopedia', 128671.12);

-- Comprobamos que si funcione bien la insercion 
select * from veterinario where rfc = 'BBBB3890928FR';

-- Insertar datos de ejemplo en la tabla animal
INSERT INTO animal(idAnimal, idBioma, rfc, nombre, especie, peso, altura, sexo, numJaulas) VALUES (994, 3, 'GUQG547306YVF', 'DapibusAugueVel', 'Búho Galáctico', 4.44, 1.14, 'F', 57);

-- Comprobamos que si funcione bien la insercion 
select * from animal where idanimal = 994 and idBioma = 3; 

-- Insertar datos de ejemplo en la tabla trabajar
INSERT INTO trabajar(idBioma, rfc) VALUES (2, 'BBBB3890928FR');

-- Comprobamos que si funcione bien la insercion 
select * from trabajar where idBioma = 2 and rfc = 'BBBB3890928FR'; 

-- Intentar atender al animal con un veterinario del mismo bioma (Sabemos que no va a pasar debido a la restriccion de que tienen que ser del mismo bioma)
INSERT INTO atender(idAnimal, rfc, indicacionMedica) VALUES (994, 'BBBB3890928FR', 'Antioxidante SerenitiGreen');

-- Comprobamos de que no se hizo una insersion, sabemos que esta no se hace por que no pertenecen al mismo bioma 
select * from atender where idanimal = 994; 



-- Probar de que si pertenecen al mismo bioma si pueden atenderlo (Caso bueno) 

-- Insertar datos de ejemplo en la tabla trabajar (cambiamos el bioma al animal que queremos atender)
INSERT INTO trabajar(idBioma, rfc) VALUES (3, 'BBBB3890928FR');

-- Comprobamos que si funcione bien la insercion 
select * from trabajar where idBioma = 3 and rfc = 'BBBB3890928FR';


-- Intentar atender al animal con un veterinario del mismo bioma (ya que comparten bioma es valida la insercion)
INSERT INTO atender(idAnimal, rfc, indicacionMedica) VALUES (994, 'BBBB3890928FR', 'Antioxidante SerenitiGreen');

-- Comprobamos que si funcione bien la insercion 
select * from atender where idanimal = 994; 

---------------------------------------------------------------------------------------------------------------------------------
/* Disparador que verifica que la insercion de un ticket sea valida*/
CREATE OR REPLACE FUNCTION aplicar_descuento_generar_tickets()
RETURNS TRIGGER AS
$$
DECLARE
    nuevo_num_ticket INT;
BEGIN
    -- Verificar si el cliente existe
    IF NOT EXISTS (
        SELECT 1
        FROM cliente
        WHERE idCliente = NEW.idCliente
    ) THEN
        RAISE EXCEPTION 'El cliente especificado no existe.';
    END IF;

    -- Verificar si el bioma existe
    IF NOT EXISTS (
        SELECT 1
        FROM bioma
        WHERE idBioma = NEW.idBioma
    ) THEN
        RAISE EXCEPTION 'El bioma especificado no existe.';
    END IF;

    -- Verificar si se aplica descuento
    IF NEW.porcentajeDesc IS NOT NULL AND (NEW.porcentajeDesc < 0 OR NEW.porcentajeDesc > 80) THEN
        RAISE EXCEPTION 'El porcentaje de descuento debe estar entre 0 y 80.';
    END IF;

    -- Aplicar descuento y generar nuevo ticket
    INSERT INTO ticket(idCliente, numTicket, idBioma, costoParcial, fecha, porcentajeDesc)
    VALUES (NEW.idCliente, NEW.numTicket + 1, NEW.idBioma, NEW.costoParcial * (1 - NEW.porcentajeDesc / 100), CURRENT_DATE, NEW.porcentajeDesc);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER aplicar_descuento_generar_tickets_trigger
AFTER INSERT ON ticket
FOR EACH ROW
EXECUTE FUNCTION aplicar_descuento_generar_tickets();


--- Prueva de que este funcionando bien el disparador de tickets 

-- Insertar datos de ejemplo en la tabla cliente
INSERT INTO cliente(idCliente, nombre, apellidoP, apellidoM, genero, nacimiento) VALUES (999, 'Juan', 'Perez', 'Gomez', 'M', '1990-05-15');

select * from cliente where idCliente = 999; 


-- Insertar un ticket con descuento
INSERT INTO ticket(idCliente, numTicket, idBioma, costoParcial, fecha, porcentajeDesc) VALUES (999, 991, 1, 120.50, '2022-12-01', 10);

select * from ticket where idCliente = 999 and numticket = 991; 
