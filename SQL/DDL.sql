DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

-------------TABLAS CON LLAVES PRIMARIAS-----------------

CREATE TABLE proveedor (
    rfc CHAR(13),
    nombre VARCHAR(50),
    apellidoP VARCHAR(50), 
    apellidoM VARCHAR(50), 
    calle VARCHAR(50),
    numExt INT, 
    numInt INT, 
    colonia VARCHAR(50), 
    estado VARCHAR(50),
    genero CHAR(1), 
    nacimiento DATE, 
    fechaInicioC DATE, 
    fechaFinalizacionC DATE, 
    frecuenciaServicio VARCHAR(50),
    costoServicio NUMERIC(8,2)
);
 
--Restricciones Operador
--Dominio
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d1 
CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d2
CHECK(nombre <> '' and nombre SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d3
CHECK(apellidoP <> '' and apellidoP SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d4
CHECK(apellidoM <> '' and apellidoM SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d5
CHECK(calle <> '');
ALTER TABLE proveedor ALTER COLUMN numExt 
SET NOT NULL;
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d6
CHECK(colonia <> '' and colonia SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ0-9 ]+');
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d7
CHECK(estado <> '' and estado SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ0-9 ]+');
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d8
CHECK(genero = 'F' OR genero  = 'M');
ALTER TABLE proveedor ALTER COLUMN nacimiento
SET NOT NULL;
ALTER TABLE proveedor ALTER COLUMN fechaInicioC
SET NOT NULL;
ALTER TABLE proveedor ALTER COLUMN fechaFinalizacionC
SET NOT NULL;
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d9
CHECK(frecuenciaServicio <> '' and frecuenciaServicio SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE proveedor ALTER COLUMN costoServicio 
SET NOT NULL;

--Entidad
ALTER TABLE proveedor ADD CONSTRAINT proveedor_pkey
PRIMARY KEY (rfc);

--COMMENT proveedor

COMMENT ON TABLE proveedor IS 'Tabla proveedor, contiene atributos del proveedor';
COMMENT ON COLUMN proveedor.rfc IS 'Id del proveedor (rfc)';
COMMENT ON column proveedor.nombre IS 'Nombre del proveedor';
COMMENT ON column proveedor.apellidoP IS 'Apellido Paterno del proveedor';
COMMENT ON column proveedor.apellidoM IS 'Apellido Materno del proveedor';
COMMENT ON column proveedor.calle IS 'Calle del proveedor';
COMMENT ON column proveedor.numExt IS 'Numero Externo del proveedor';
COMMENT ON column proveedor.numInt IS 'Numero Interno del proveedor';
COMMENT ON column proveedor.colonia IS 'Colonia del proveedor';
COMMENT ON column proveedor.estado IS 'Estado del proveedor';
COMMENT ON COLUMN proveedor.genero IS 'Genero del proveedor';
COMMENT ON COLUMN proveedor.nacimiento IS 'Nacimiento del proveedor';
COMMENT ON COLUMN proveedor.fechaInicioC IS 'Fecha de Inicio de contratacion del proveedor';
COMMENT ON COLUMN proveedor.fechaFinalizacionC IS 'Fecha de Finalizacion de contratacion del proveedor';
COMMENT ON column proveedor.frecuenciaServicio IS 'Frecuencia en la que el proveedor reabastece';
COMMENT ON column proveedor.costoServicio IS 'Pago a realizar al proveedor';
COMMENT ON CONSTRAINT proveedor_d1 ON proveedor IS 'Limitamos y restringimos a que el rfc tenga un tamaño de 13';
COMMENT ON CONSTRAINT proveedor_d2 on proveedor IS 'Una restriccion check que nos asegura que el nombre no sea una cadena vacia';
COMMENT ON CONSTRAINT proveedor_d3 ON proveedor IS 'Una restriccion check que nos asegura que el Apellido Paterno no sea una cadena vacia';
COMMENT ON CONSTRAINT proveedor_d4 on proveedor IS 'Una restriccion check que nos asegura que el Apellido Materno no sea una cadena vacia';
COMMENT ON CONSTRAINT proveedor_d5 on proveedor IS 'Una restriccion check que nos asegura que el calle no sea una cadena vacia';
COMMENT ON CONSTRAINT proveedor_d6 on proveedor IS 'Una restriccion check que nos asegura que el colonia no sea una cadena vacia';
COMMENT ON CONSTRAINT proveedor_d7 on proveedor IS 'Una restriccion check que nos asegura que el estado no sea una cadena vacia';
COMMENT ON CONSTRAINT proveedor_d8 ON proveedor IS 'Una restriccion check que nos asegura que el genero no sea una cadena diferente a H: Hombre o M:Mujer';
COMMENT ON CONSTRAINT proveedor_d9 on proveedor IS 'Una restriccion check que nos asegura que la frecuencia del proveedor no sea vacía';
COMMENT ON CONSTRAINT proveedor_pkey ON proveedor IS 'La llave primaria id del proveedor (rfc) de la tabla proveedor';

CREATE TABLE veterinario (
    rfc CHAR(13),
    nombre VARCHAR(50),
    apellidoP VARCHAR(50), 
    apellidoM VARCHAR(50), 
    calle VARCHAR(50),
    numExt INT, 
    numInt INT, 
    colonia VARCHAR(50), 
    estado VARCHAR(50),
    genero CHAR(1), 
    nacimiento DATE, 
    fechaInicioC DATE, 
    fechaFinalizacionC DATE,
    especialidad VARCHAR(50), 
    salario NUMERIC(8,2)
);
 
--Restricciones veterinario
--Dominio
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d1 
CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d2
CHECK(nombre <> '' and nombre SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d3
CHECK(apellidoP <> '' and apellidoP SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d4
CHECK(apellidoM <> '' and apellidoM SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d5
CHECK(calle <> '' and calle SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ0-9 ]+');
ALTER TABLE veterinario ALTER COLUMN numExt 
SET NOT NULL;
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d6
CHECK(colonia <> '' and colonia SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ0-9 ]+');
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d7
CHECK(estado <> '' and estado SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ0-9 ]+');
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d8
CHECK(genero = 'F' OR genero  = 'M');
ALTER TABLE veterinario ALTER COLUMN nacimiento
SET NOT NULL;
ALTER TABLE veterinario ALTER COLUMN fechaInicioC
SET NOT NULL;
ALTER TABLE veterinario ALTER COLUMN fechaFinalizacionC
SET NOT NULL;
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d9
CHECK(especialidad <> '' and especialidad SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE veterinario ALTER COLUMN salario 
SET NOT NULL;

--Entidad
ALTER TABLE veterinario ADD CONSTRAINT veterinario_pkey
PRIMARY KEY(rfc);

--COMMENT veterinario

COMMENT ON TABLE veterinario IS 'Tabla veterinario, contiene atributos del veterinario';
COMMENT ON COLUMN veterinario.rfc IS 'Id del veterinario (rfc)';
COMMENT ON column veterinario.nombre IS 'Nombre del veterinario';
COMMENT ON column veterinario.apellidoP IS 'Apellido Paterno del veterinario';
COMMENT ON column veterinario.apellidoM IS 'Apellido Materno del veterinario';
COMMENT ON column veterinario.calle IS 'Calle del veterinario';
COMMENT ON column veterinario.numExt IS 'Numero Externo del veterinario';
COMMENT ON column veterinario.numInt IS 'Numero Interno del veterinario';
COMMENT ON column veterinario.colonia IS 'Colonia del veterinario';
COMMENT ON column veterinario.estado IS 'Estado del veterinario';
COMMENT ON COLUMN veterinario.genero IS 'Genero del veterinario';
COMMENT ON COLUMN veterinario.nacimiento IS 'Nacimiento del veterinario';
COMMENT ON COLUMN veterinario.fechaInicioC IS 'Fecha de Inicio de contratacion del veterinario';
COMMENT ON COLUMN veterinario.fechaFinalizacionC IS 'Fecha de Finalizacion de contratacion del veterinario';
COMMENT ON column veterinario.especialidad IS 'Área en la que el veterinario es especialista';
COMMENT ON column veterinario.salario IS 'Salario que se le paga al veterinario';
COMMENT ON CONSTRAINT veterinario_d1 ON veterinario IS 'Limitamos y restringimos a que el rfc tenga un tamaño de 13';
COMMENT ON CONSTRAINT veterinario_d2 on veterinario IS 'Una restriccion check que nos asegura que el nombre no sea una cadena vacia';
COMMENT ON CONSTRAINT veterinario_d3 ON veterinario IS 'Una restriccion check que nos asegura que el Apellido Paterno no sea una cadena vacia';
COMMENT ON CONSTRAINT veterinario_d4 on veterinario IS 'Una restriccion check que nos asegura que el Apellido Materno no sea una cadena vacia';
COMMENT ON CONSTRAINT veterinario_d5 on veterinario IS 'Una restriccion check que nos asegura que el calle no sea una cadena vacia';
COMMENT ON CONSTRAINT veterinario_d6 on veterinario IS 'Una restriccion check que nos asegura que el colonia no sea una cadena vacia';
COMMENT ON CONSTRAINT veterinario_d7 on veterinario IS 'Una restriccion check que nos asegura que el estado no sea una cadena vacia';
COMMENT ON CONSTRAINT veterinario_d8 ON veterinario IS 'Una restriccion check que nos asegura que el genero no sea una cadena diferente a H: Hombre o M:Mujer';
COMMENT ON CONSTRAINT veterinario_d9 on veterinario IS 'Una restriccion check que nos asegura que la especialidad del veterinario es no vacía';
COMMENT ON CONSTRAINT veterinario_pkey ON veterinario IS 'La llave primaria id del veterinario (rfc) de la tabla veterinario';

CREATE TABLE evento (
    idEvento INT, 
    nombre VARCHAR(50), 
    fecha DATE,
    tipoEvento VARCHAR(50),       
    capacidad INT,
    numAsistentes INT
);

--Restricciones usuario
--Dominio
ALTER TABLE evento ADD CONSTRAINT evento_d1
CHECK(nombre <> '' and nombre SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE evento ALTER COLUMN fecha
SET NOT NULL;
ALTER TABLE evento ADD CONSTRAINT evento_d2
CHECK(tipoEvento <> '' and tipoEvento SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE evento ALTER COLUMN capacidad
SET NOT NULL;
ALTER TABLE evento ALTER COLUMN numAsistentes
SET NOT NULL;

--Entidad
ALTER TABLE evento ADD CONSTRAINT evento_pkey
PRIMARY KEY(idEvento);

--COMMENT evento

COMMENT ON TABLE evento IS 'Tabla evento, contiene atributos del evento';
COMMENT ON column evento.nombre IS 'Nombre del evento';
COMMENT ON column evento.fecha IS 'Fecha en que la que se realizará el evento';
COMMENT ON column evento.tipoEvento IS 'Categoría del evento a realizar';
COMMENT ON column evento.capacidad IS 'Capacidad del evento';
COMMENT ON column evento.numAsistentes IS 'Número de asistentes en el evento';
COMMENT ON CONSTRAINT evento_d1 ON evento IS 'Una restriccion check que nos asegura que el nombre no sea una cadena vacia';
COMMENT ON CONSTRAINT evento_d2 ON evento IS 'Una restriccion check que nos asegura que el tipo de evento no sea vacío';
COMMENT ON CONSTRAINT veterinario_pkey ON veterinario IS 'La llave primaria id del veterinario (rfc) de la tabla veterinario';

CREATE TABLE cliente (
    idCliente INT,
    nombre VARCHAR(50),
    apellidoP VARCHAR(50),
    apellidoM VARCHAR(50),
    genero CHAR(1),   
    nacimiento DATE
);

--Restricciones cliente
--Dominio
ALTER TABLE cliente ALTER COLUMN idCliente 
SET NOT NULL;
ALTER TABLE cliente ADD CONSTRAINT cliente_d1
CHECK(nombre <> '' and nombre SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE cliente ADD CONSTRAINT cliente_d2
CHECK(apellidoP <> '' and apellidoP SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE cliente ADD CONSTRAINT cliente_d3
CHECK(apellidoM <> '' and apellidoM SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE cliente ADD CONSTRAINT cliente_d4
CHECK(genero = 'F' OR genero  = 'M');
ALTER TABLE proveedor ALTER COLUMN nacimiento
SET NOT NULL;

--Entidad
ALTER TABLE cliente ADD CONSTRAINT cliente_pkey
PRIMARY KEY(idCliente);

--COMMENT cliente

COMMENT ON TABLE cliente IS 'Tabla cliente, contiene atributos del cliente';
COMMENT ON column cliente.nombre IS 'Nombre del cliente';
COMMENT ON column cliente.apellidoP IS 'Apellido Paterno del cliente';
COMMENT ON column cliente.apellidoM IS 'Apellido Materno del cliente';
COMMENT ON COLUMN cliente.genero IS 'Genero del cliente';
COMMENT ON COLUMN cliente.genero IS 'Nacimiento del cliente';
COMMENT ON CONSTRAINT cliente_d1 on cliente IS 'Una restriccion check que nos asegura que el nombre no sea una cadena vacia';
COMMENT ON CONSTRAINT cliente_d2 ON cliente IS 'Una restriccion check que nos asegura que el Apellido Paterno no sea una cadena vacia';
COMMENT ON CONSTRAINT cliente_d3 on cliente IS 'Una restriccion check que nos asegura que el Apellido Materno no sea una cadena vacia';
COMMENT ON CONSTRAINT cliente_d4 ON cliente IS 'Una restriccion check que nos asegura que el genero no sea una cadena diferente a H: Hombre o M:Mujer';
COMMENT ON CONSTRAINT cliente_pkey ON cliente IS 'La llave primaria id del cliente (idCliente) de la tabla cliente';

CREATE TABLE bioma (
    idBioma INT, 
    tipoBioma VARCHAR(50), 
    servicioVisitantes VARCHAR(50),        
    numJaulas INT
);

--Restricciones bioma
--Dominio
ALTER TABLE bioma ALTER COLUMN idBioma 
SET NOT NULL;
ALTER TABLE bioma ADD CONSTRAINT bioma_d1
CHECK(tipobioma <> '' and tipobioma SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE bioma ADD CONSTRAINT bioma_d2
CHECK(servicioVisitantes <> '' and servicioVisitantes SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE bioma ALTER COLUMN numJaulas
SET NOT NULL;

--Entidad
ALTER TABLE bioma ADD CONSTRAINT bioma_pkey
PRIMARY KEY(idBioma);

--COMMENT bioma

COMMENT ON TABLE bioma IS 'Tabla bioma, contiene atributos del bioma';
COMMENT ON column bioma.idbioma IS 'Id del Bioma';
COMMENT ON column bioma.tipoBioma IS 'Tipo del Bioma';
COMMENT ON column bioma.serviciovisitantes IS 'Servicio Visistante del Bioma';
COMMENT ON COLUMN bioma.numjaulas IS 'Numero de jaulas en el Bioma';
COMMENT ON CONSTRAINT bioma_d1 on bioma IS 'Una restriccion check que nos asegura que el tipoBioma no sea una cadena vacia';
COMMENT ON CONSTRAINT bioma_d2 ON bioma IS 'Una restriccion check que nos asegura que el servicio vicitante no sea una cadena vacia';
COMMENT ON CONSTRAINT bioma_pkey ON bioma IS 'La llave primaria id del Bioma (idBioma) de la tabla Bioma';

CREATE TABLE alimento (
    idInsumo INT, 
    nombre VARCHAR(50),
    refigeracion BOOL,
    fechaCad DATE,
    cantidad NUMERIC(5,2), 
    tipoAlimento VARCHAR(50)
);

--Restricciones alimento
--Dominio
ALTER TABLE alimento ALTER COLUMN idInsumo 
SET NOT NULL;
ALTER TABLE alimento ADD CONSTRAINT alimento_d1
CHECK(nombre <> '' and nombre SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE alimento ALTER COLUMN refigeracion
SET NOT NULL;
ALTER TABLE alimento ALTER COLUMN fechaCad
SET NOT NULL;
ALTER TABLE alimento ALTER COLUMN cantidad
SET NOT NULL;
ALTER TABLE alimento ADD CONSTRAINT alimento_d2
CHECK(tipoAlimento <> '' and tipoAlimento SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');

--Entidad
ALTER TABLE alimento ADD CONSTRAINT alimento_pkey
PRIMARY KEY(idInsumo);

--COMMENT alimento

COMMENT ON TABLE alimento IS 'Tabla alimento que contiene los datos de alimento';
COMMENT ON COLUMN alimento.idInsumo IS 'Id del Insumo';
COMMENT ON COLUMN alimento.nombre IS 'Nombre de la alimento';
COMMENT ON COLUMN alimento.refigeracion IS 'Refigeracion de la alimento';
COMMENT ON COLUMN alimento.fechaCad IS 'Fecha de caducidad de alimento';
COMMENT ON COLUMN alimento.cantidad IS 'Cantidad de alimento';
COMMENT ON COLUMN alimento.tipoAlimento IS 'Tipo de Alimento de alimento';
COMMENT ON CONSTRAINT alimento_d1 ON alimento IS 'Una restriccion check que nos asegura que el nombre no sea una cadena vacia';
COMMENT ON CONSTRAINT alimento_d2 ON alimento IS 'Una restriccion check que nos asegura que el tipo de Alimento no sea una cadena vacia';
COMMENT ON CONSTRAINT alimento_pkey ON alimento IS 'La llave primaria idinsumo de la tabla alimento';

CREATE TABLE medicina (
    idInsumo INT, 
    nombre VARCHAR(50),
    refigeracion BOOL,
    fechaCad DATE,
    cantidad NUMERIC(5,2), 
    lote INT, 
    labProcedencia VARCHAR(50)
);

--Restricciones medicina
--Dominio
ALTER TABLE medicina ALTER COLUMN idInsumo 
SET NOT NULL;
ALTER TABLE medicina ADD CONSTRAINT medicina_d1
CHECK(nombre <> '' and nombre SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE medicina ALTER COLUMN refigeracion
SET NOT NULL;
ALTER TABLE medicina ALTER COLUMN fechaCad
SET NOT NULL;
ALTER TABLE medicina ALTER COLUMN cantidad
SET NOT NULL;
ALTER TABLE medicina ALTER COLUMN lote
SET NOT NULL;
ALTER TABLE medicina ADD CONSTRAINT medicina_d2
CHECK(labProcedencia <> '' and labProcedencia SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');

--Entidad
ALTER TABLE medicina ADD CONSTRAINT medicina_pkey
PRIMARY KEY(idInsumo);

--COMMENT medicina

COMMENT ON TABLE medicina IS 'Tabla medicina que contiene los datos de Medicina';
COMMENT ON COLUMN medicina.idInsumo IS 'Id del Insumo';
COMMENT ON COLUMN medicina.nombre IS 'Nombre de la Medicina';
COMMENT ON COLUMN medicina.refigeracion IS 'Refigeracion de la Medicina';
COMMENT ON COLUMN medicina.fechaCad IS 'Fecha de caducidad de Medicina';
COMMENT ON COLUMN medicina.lote IS 'Lote de la Medicina';
COMMENT ON COLUMN medicina.labProcedencia IS 'Lab de procedencia d la Medicina';
COMMENT ON CONSTRAINT medicina_d1 ON medicina IS 'Una restriccion check que nos asegura que el nombre no sea una cadena vacia';
COMMENT ON CONSTRAINT medicina_d2 ON medicina IS 'Una restriccion check que nos asegura que el labProcedencia no sea una cadena vacia';
COMMENT ON CONSTRAINT medicina_pkey ON medicina IS 'La llave primaria idinsumo de la tabla medicina';

------------TABLAS CON LLAVES FORANEAS---------------

CREATE TABLE telefonoProveedor(
	rfc CHAR(13),
	telefono INT8
);

--Restricciones telefonoProveedor
--Dominio
ALTER TABLE telefonoProveedor ADD CONSTRAINT telefonoProveedor_d1 
 CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE telefonoProveedor ALTER COLUMN telefono
SET NOT NULL;

--Entidad
ALTER TABLE telefonoProveedor ADD CONSTRAINT telefonoProveedor_pkey
PRIMARY KEY(rfc,telefono);

--Referencial
ALTER TABLE telefonoProveedor ADD CONSTRAINT telefonoProveedor_fkey
FOREIGN KEY(rfc) REFERENCES proveedor(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT telefonoProveedor

COMMENT ON TABLE telefonoProveedor IS 'Tabla telefonoProveedor que contiene el telefono y una referencia a la tabla del Proveedor';
COMMENT ON COLUMN telefonoProveedor.rfc IS 'Id del Proveedor (rfc)';
COMMENT ON COLUMN telefonoProveedor.telefono IS 'Telefono de Proveedor';
COMMENT ON CONSTRAINT telefonoProveedor_d1 ON telefonoProveedor IS 'Limitamos y restringimos a que el rfc tenga un tamaño de 13';
COMMENT ON CONSTRAINT telefonoProveedor_pkey ON telefonoProveedor IS 'La llave primaria rfc, telefono de la tabla telefonoProveedor, por ser atributo multivaluado';
COMMENT ON CONSTRAINT telefonoProveedor_fkey ON telefonoProveedor IS 'La llave foranea RFC del Proveedor que hace referencia a la tabla Proveedor';

CREATE TABLE correoProveedor(
	rfc CHAR(13),
	correo VARCHAR(50)
);

--Restricciones correoProveedor
--Dominio
ALTER TABLE correoProveedor ADD CONSTRAINT correoProveedor_d1 
 CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE correoProveedor ADD CONSTRAINT correoProveedor_d2
CHECK(correo <> '');

--Entidad
ALTER TABLE correoProveedor ADD CONSTRAINT correoProveedor_pkey
PRIMARY KEY(rfc,correo);

--Referencial
ALTER TABLE correoProveedor ADD CONSTRAINT correoProveedor_fkey
FOREIGN KEY(rfc) REFERENCES proveedor(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT correoProveedor

COMMENT ON TABLE correoProveedor IS 'Tabla correoProveedor que contiene el correo y una referencia a la tabla del Proveedor';
COMMENT ON COLUMN correoProveedor.rfc IS 'Id del Proveedor (rfc)';
COMMENT ON COLUMN correoProveedor.correo IS 'Correo de Proveedor';
COMMENT ON CONSTRAINT correoProveedor_d1 ON correoProveedor IS 'Limitamos y restringimos a que el rfc tenga un tamaño de 13';
COMMENT ON CONSTRAINT correoProveedor_d2 ON correoProveedor IS 'Una restriccion check que nos asegura que el correo no sea una cadena vacia';
COMMENT ON CONSTRAINT correoProveedor_pkey ON correoProveedor IS 'La llave primaria rfc, correo de la tabla correoProveedor, por ser atributo multivaluado';
COMMENT ON CONSTRAINT correoProveedor_fkey ON correoProveedor IS 'La llave foranea RFC del Proveedor que hace referencia a la tabla Proveedor';

CREATE TABLE telefonoVeterinario(
	rfc CHAR(13),
	telefono INT8
);

--Restricciones telefonoVeterinario
--Dominio
ALTER TABLE telefonoVeterinario ADD CONSTRAINT telefonoVeterinario_d1 
 CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE telefonoVeterinario ALTER COLUMN telefono
SET NOT NULL;

--Entidad
ALTER TABLE telefonoVeterinario ADD CONSTRAINT telefonoVeterinario_pkey
PRIMARY KEY(rfc,telefono);

--Referencial
ALTER TABLE telefonoVeterinario ADD CONSTRAINT telefonoVeterinario_fkey
FOREIGN KEY(rfc) REFERENCES veterinario(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT telefonoVeterinario

COMMENT ON TABLE telefonoVeterinario IS 'Tabla telefonoVeterinario que contiene el telefono y una referencia a la tabla del Veterinario';
COMMENT ON COLUMN telefonoVeterinario.rfc IS 'Id del Veterinario (rfc)';
COMMENT ON COLUMN telefonoVeterinario.telefono IS 'telefono de Veterinario';
COMMENT ON CONSTRAINT telefonoVeterinario_d1 ON telefonoVeterinario IS 'Limitamos y restringimos a que el rfc tenga un tamaño de 13';
COMMENT ON CONSTRAINT telefonoVeterinario_pkey ON telefonoVeterinario IS 'La llave primaria rfc, telefono de la tabla telefonoVeterinario, por ser atributo multivaluado';
COMMENT ON CONSTRAINT telefonoVeterinario_fkey ON telefonoVeterinario IS 'La llave foranea RFC del Veterinario que hace referencia a la tabla Veterinario';

CREATE TABLE correoVeterinario(
	rfc CHAR(13),
	correo VARCHAR(50)
);

--Restricciones correoVeterinario
--Dominio
ALTER TABLE correoVeterinario ADD CONSTRAINT correoVeterinario_d1 
 CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE correoVeterinario ADD CONSTRAINT correoVeterinario_d2
CHECK(correo <> '' and correo ~* '^.+@.+$');

--Entidad
ALTER TABLE correoVeterinario ADD CONSTRAINT correoVeterinario_pkey
PRIMARY KEY(rfc,correo);

--Referencial
ALTER TABLE correoVeterinario ADD CONSTRAINT correoVeterinario_fkey
FOREIGN KEY(rfc) REFERENCES veterinario(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT correoVeterinario

COMMENT ON TABLE correoVeterinario IS 'Tabla correoVeterinario que contiene el correo y una referencia a la tabla del Veterinario';
COMMENT ON COLUMN correoVeterinario.rfc IS 'Id del Veterinario (rfc)';
COMMENT ON COLUMN correoVeterinario.correo IS 'Correo de Veterinario';
COMMENT ON CONSTRAINT correoVeterinario_d1 ON correoVeterinario IS 'Limitamos y restringimos a que el rfc tenga un tamaño de 13';
COMMENT ON CONSTRAINT correoVeterinario_d2 ON correoVeterinario IS 'Una restriccion check que nos asegura que el correo no sea una cadena vacia';
COMMENT ON CONSTRAINT correoVeterinario_pkey ON correoVeterinario IS 'La llave primaria rfc, correo de la tabla correoVeterinario, por ser atributo multivaluado';
COMMENT ON CONSTRAINT correoVeterinario_fkey ON correoVeterinario IS 'La llave foranea RFC del Veterinario que hace referencia a la tabla Veterinario';

CREATE TABLE telefonoCliente(
	idCliente INT,
	telefono INT8
);

--Restricciones telefonoCliente
--Dominio
ALTER TABLE telefonoCliente ALTER COLUMN idCliente 
SET NOT NULL;
ALTER TABLE telefonoCliente ALTER COLUMN telefono
SET NOT NULL;

--Entidad
ALTER TABLE telefonoCliente ADD CONSTRAINT telefonoCliente_pkey
PRIMARY KEY(idCliente, telefono);

--Referencial
ALTER TABLE telefonoCliente ADD CONSTRAINT telefonoCliente_fkey
FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT telefonoCliente

COMMENT ON TABLE telefonoCliente IS 'Tabla telefonoCliente que contiene el telefono y una referencia a la tabla del Cliente';
COMMENT ON COLUMN telefonoCliente.idCliente IS 'Id del Cliente';
COMMENT ON COLUMN telefonoCliente.telefono IS 'Telefono del Cliente';
COMMENT ON CONSTRAINT telefonoCliente_pkey ON telefonoCliente IS 'La llave primaria idCliente, telefono de la tabla telefonoCliente, por ser atributo multivaluado';
COMMENT ON CONSTRAINT telefonoCliente_fkey ON telefonoCliente IS 'La llave foranea idCliente del Cliente que hace referencia a la tabla Cliente';


CREATE TABLE correoCliente(
	idCliente INT,
	correo VARCHAR(50)
);

--Restricciones correoCliente
--Dominio
ALTER TABLE correoCliente ALTER COLUMN idCliente 
SET NOT NULL;
ALTER TABLE correoCliente ADD CONSTRAINT correoCliente_d1
CHECK(correo <> '');

--Entidad
ALTER TABLE correoCliente ADD CONSTRAINT correoCliente_pkey
PRIMARY KEY(idCliente,correo);

--Referencial
ALTER TABLE correoCliente ADD CONSTRAINT correoCliente_fkey
FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT correoCliente

COMMENT ON TABLE correoCliente IS 'Tabla correoCliente que contiene el correo y una referencia a la tabla del Cliente';
COMMENT ON COLUMN correoCliente.idCliente IS 'Id del Cliente';
COMMENT ON COLUMN correoCliente.correo IS 'Correo del Cliente';
COMMENT ON CONSTRAINT correoCliente_d1 ON correoCliente IS 'Una restriccion check que nos asegura que el correo no sea una cadena vacia';
COMMENT ON CONSTRAINT correoCliente_pkey ON correoCliente IS 'La llave primaria idCliente, correo de la tabla correoCliente, por ser atributo multivaluado';
COMMENT ON CONSTRAINT correoCliente_fkey ON correoCliente IS 'La llave foranea idCliente del Cliente que hace referencia a la tabla Cliente';

CREATE TABLE ticket (
    idCliente INT,
    numTicket INT,
    idBioma INT,
    costoParcial FLOAT8,
    fecha DATE, 
    porcentajeDesc INT
);

--Restricciones ticket
--Dominio
ALTER TABLE ticket ALTER COLUMN idCliente 
SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN numTicket 
SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN idBioma
SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN costoParcial 
SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN fecha
SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN porcentajeDesc 
SET NOT NULL;

--Entidad
ALTER TABLE ticket ADD CONSTRAINT ticket_pkey
PRIMARY KEY(idCliente, numTicket);

--Referencial
ALTER TABLE ticket ADD CONSTRAINT ticket_fkey1
FOREIGN KEY(idCliente) REFERENCES cliente(idCliente)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ticket ADD CONSTRAINT ticket_fkey2
FOREIGN KEY(idBioma) REFERENCES bioma(idBioma)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT ticket

COMMENT ON TABLE ticket IS 'Tabla ticket, contiene atributos del ticket';
COMMENT ON COLUMN ticket.idCliente IS 'Id del Cuidador (rfc)';
COMMENT ON COLUMN ticket.numTicket IS 'Numero del Ticket';
COMMENT ON column ticket.idBioma IS 'Id del Bioma';
COMMENT ON column ticket.costoParcial IS 'Costo Parcial del ticket';
COMMENT ON column ticket.fecha IS 'Fecha del ticket';
COMMENT ON column ticket.porcentajeDesc IS 'Porcentaje de Descuento del ticket';
COMMENT ON CONSTRAINT ticket_pkey ON ticket IS 'La llave primaria id del Cuidador (rfc), numTicket de la tabla Ticket';
COMMENT ON CONSTRAINT ticket_fkey1 ON ticket IS 'La llave foranea IdCliente de Cliente que hace referencia a la tabla Cliente';
COMMENT ON CONSTRAINT ticket_fkey2 ON ticket IS 'La llave foranea IdBioma de Bioma que hace referencia a la tabla Bioma';

CREATE table tipoServicio(
	idCliente INT,
	numTicket INT,
	tipoServicio VARCHAR(50)
);

--Restricciones tipoServicio
--Dominio 
ALTER TABLE tipoServicio ALTER COLUMN idCliente 
SET NOT NULL;
ALTER TABLE tipoServicio ALTER COLUMN numTicket 
SET NOT NULL;
ALTER TABLE tipoServicio ADD CONSTRAINT tipoServicio_d1
CHECK(TipoServicio IN ('Baños', 'Tienda', 'Comida'));

--Entidad
ALTER TABLE tipoServicio ADD CONSTRAINT tipoServicio_pkey
PRIMARY KEY(idCliente, numTicket,tipoServicio);

--Referencial
ALTER TABLE tipoServicio ADD CONSTRAINT tipoServicio_fkey
FOREIGN KEY(idCliente, numTicket) REFERENCES ticket(idCliente, numTicket)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT tipoServicio

COMMENT ON TABLE tipoServicio IS 'Tabla tipoServicio, contiene atributos del tipoServicio';
COMMENT ON COLUMN tipoServicio.idCliente IS 'Id del Cliente';
COMMENT ON COLUMN tipoServicio.numTicket IS 'Numero del Ticket';
COMMENT ON CONSTRAINT tipoServicio_d1 ON tipoServicio IS 'Una restriccion check que nos asegura que el tipo de Servicio no sea una cadena vacia';
COMMENT ON CONSTRAINT tipoServicio_pkey ON tipoServicio IS 'La llave foranea IdCliente, numticket, tipoServicio que hace referencia a la tabla tipoServicio';
COMMENT ON CONSTRAINT tipoServicio_fkey ON tipoServicio IS 'La llave foranea IdCliente, numTicket de tipoServicio que hace referencia a la tabla tipoServicio';


CREATE TABLE cuidador (
	rfc CHAR(13),
	idBioma INT,
	nombre VARCHAR(50),
    apellidoP VARCHAR(50), 
    apellidoM VARCHAR(50), 
    calle VARCHAR(50),
    numExt INT, 
    numInt INT, 
    colonia VARCHAR(50), 
    estado VARCHAR(50),
    genero CHAR(1), 
    nacimiento DATE, 
    fechaInicioC DATE, 
    fechaFinalizacionC DATE,
    diasTrabajo INT,
    horarioLaboral TIME, 
    salario NUMERIC(7,2)
);

--Restricciones cuidador
--Dominio
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d1 
 CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE cuidador ALTER COLUMN idBioma 
SET NOT NULL;
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d2
CHECK(nombre <> '' and nombre SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d3
CHECK(apellidoP <> '' and apellidoP SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d4
CHECK(apellidoM <> '' and apellidoM SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d5
CHECK(calle <> '' and calle SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ0-9 ]+');
ALTER TABLE cuidador ALTER COLUMN numExt 
SET NOT NULL;
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d6
CHECK(colonia <> '' and colonia SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ0-9 ]+');
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d7
CHECK(estado <> '' and estado SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ0-9 ]+');
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d8
CHECK(genero = 'F' OR genero  = 'M');
ALTER TABLE cuidador ALTER COLUMN nacimiento
SET NOT NULL;
ALTER TABLE cuidador ALTER COLUMN fechaInicioC
SET NOT NULL;
ALTER TABLE cuidador ALTER COLUMN fechaFinalizacionC
SET NOT NULL;
ALTER TABLE cuidador ALTER COLUMN diasTrabajo
SET NOT NULL;
ALTER TABLE cuidador ALTER COLUMN horarioLaboral
SET NOT NULL;
ALTER TABLE cuidador ALTER COLUMN salario 
SET NOT NULL;

--Entidad
ALTER TABLE cuidador ADD CONSTRAINT cuidador_pkey
PRIMARY KEY(rfc);

--Referencial
ALTER TABLE cuidador ADD CONSTRAINT cuidador_fkey
FOREIGN KEY(idBioma) REFERENCES bioma(idBioma)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT cuidador

COMMENT ON TABLE cuidador IS 'Tabla cuidador, contiene atributos del cuidador';
COMMENT ON COLUMN cuidador.rfc IS 'Id del Cuidador (rfc)';
COMMENT ON COLUMN cuidador.idBioma IS 'Id del Bioma';
COMMENT ON column cuidador.nombre IS 'Nombre del Cuidador';
COMMENT ON column cuidador.apellidoP IS 'Apellido Paterno del Cuidador';
COMMENT ON column cuidador.apellidoM IS 'Apellido Materno del Cuidador';
COMMENT ON column cuidador.calle IS 'Calle del Cuidador';
COMMENT ON column cuidador.numExt IS 'Numero Externo del Cuidador';
COMMENT ON column cuidador.numInt IS 'Numero Interno del Cuidador';
COMMENT ON column cuidador.colonia IS 'Colonia del Cuidador';
COMMENT ON column cuidador.estado IS 'Estado del Cuidador';
COMMENT ON COLUMN cuidador.genero IS 'Genero del Cuidador';
COMMENT ON COLUMN cuidador.nacimiento IS 'Nacimiento del Cuidador';
COMMENT ON COLUMN cuidador.fechaInicioC IS 'Fecha de Inicio de contratacion del Cuidador';
COMMENT ON COLUMN cuidador.fechaFinalizacionC IS 'Fecha de Finalizacion de contratacion del Cuidador';
COMMENT ON column cuidador.diasTrabajo IS 'Dias de trabajo del Cuidador';
COMMENT ON column cuidador.horarioLaboral IS 'Horario laboral del Cuidador';
COMMENT ON column cuidador.salario IS 'Salario del Cuidador';
COMMENT ON CONSTRAINT cuidador_d1 ON cuidador IS 'Limitamos y restringimos a que el rfc tenga un tamaño de 13';
COMMENT ON CONSTRAINT cuidador_d2 on cuidador IS 'Una restriccion check que nos asegura que el nombre no sea una cadena vacia';
COMMENT ON CONSTRAINT cuidador_d3 ON cuidador IS 'Una restriccion check que nos asegura que el Apellido Paterno no sea una cadena vacia';
COMMENT ON CONSTRAINT cuidador_d4 on cuidador IS 'Una restriccion check que nos asegura que el Apellido Materno no sea una cadena vacia';
COMMENT ON CONSTRAINT cuidador_d5 on cuidador IS 'Una restriccion check que nos asegura que el calle no sea una cadena vacia';
COMMENT ON CONSTRAINT cuidador_d6 on cuidador IS 'Una restriccion check que nos asegura que el colonia no sea una cadena vacia';
COMMENT ON CONSTRAINT cuidador_d7 on cuidador IS 'Una restriccion check que nos asegura que el estado no sea una cadena vacia';
COMMENT ON CONSTRAINT cuidador_d8 ON cuidador IS 'Una restriccion check que nos asegura que el genero no sea una cadena diferente a H: Hombre o M:Mujer';
COMMENT ON CONSTRAINT cuidador_pkey ON cuidador IS 'La llave primaria id del Cuidador (rfc) de la tabla Cuidador';
COMMENT ON CONSTRAINT cuidador_fkey ON cuidador IS 'La llave foranea IdBioma de Bioma que hace referencia a la tabla Bioma';

CREATE TABLE telefonoCuidador(
	rfc CHAR(13),
	telefono INT8
);

--Restricciones telefonoCuidador
--Dominio
ALTER TABLE telefonoCuidador ADD CONSTRAINT telefonoCuidador_d1 
 CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE telefonoCuidador ALTER COLUMN telefono
SET NOT NULL;

--Entidad
ALTER TABLE telefonoCuidador ADD CONSTRAINT telefonoCuidador_pkey
PRIMARY KEY(rfc,telefono);

--Referencial
ALTER TABLE telefonoCuidador ADD CONSTRAINT telefonoCuidador_fkey
FOREIGN KEY(rfc) REFERENCES cuidador(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT telefonoCuidador

COMMENT ON TABLE telefonoCuidador IS 'Tabla telefonoCuidador que contiene el telefono y una referencia a la tabla del Cuidador';
COMMENT ON COLUMN telefonoCuidador.rfc IS 'Id del Cuidador (rfc)';
COMMENT ON COLUMN telefonoCuidador.telefono IS 'Telefono de Cuidador';
COMMENT ON CONSTRAINT telefonoCuidador_d1 ON telefonoCuidador IS 'Limitamos y restringimos a que el rfc tenga un tamaño de 13';
COMMENT ON CONSTRAINT telefonoCuidador_pkey ON telefonoCuidador IS 'La llave primaria rfc, telefono de la tabla telefonoCuidador, por ser atributo multivaluado';
COMMENT ON CONSTRAINT telefonoCuidador_fkey ON telefonoCuidador IS 'La llave foranea RFC del Cuidador que hace referencia a la tabla Cuidador';

CREATE TABLE correoCuidador(
	rfc CHAR(13),
	correo VARCHAR(50)
);

--Restricciones correoCuidador
--Dominio
ALTER TABLE correoCuidador ADD CONSTRAINT correoCuidador_d1 
 CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE correoCuidador ADD CONSTRAINT correoCuidador_d2
CHECK(correo <> '');

--Entidad
ALTER TABLE correoCuidador ADD CONSTRAINT correoCuidador_pkey
PRIMARY KEY(rfc,correo);

--Referencial
ALTER TABLE correoCuidador ADD CONSTRAINT correoCuidador_fkey
FOREIGN KEY(rfc) REFERENCES cuidador(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT correoCuidador

COMMENT ON TABLE correoCuidador IS 'Tabla correoCuidador que contiene el correo y una referencia a la tabla del Cuidador';
COMMENT ON COLUMN correoCuidador.rfc IS 'Id del Cuidador (rfc)';
COMMENT ON COLUMN correoCuidador.correo IS 'Correo del Cuidador';
COMMENT ON CONSTRAINT correoCuidador_d1 ON correoCuidador IS 'Limitamos y restringimos a que el rfc tenga un tamaño de 13';
COMMENT ON CONSTRAINT correoCuidador_d2 ON correoCuidador IS 'Una restriccion check que nos asegura que el correo no sea una cadena vacia';
COMMENT ON CONSTRAINT correoCuidador_pkey ON correoCuidador IS 'La llave primaria rfc, correo de la tabla correoCuidador, por ser atributo multivaluado';
COMMENT ON CONSTRAINT correoCuidador_fkey ON correoCuidador IS 'La llave foranea RFC del Cuidador que hace referencia a la tabla Cuidador';

CREATE table animal (
    idAnimal INT,
    idBioma INT,
    rfc CHAR(13),
    nombre VARCHAR(50),
    especie VARCHAR(50),
    peso INT,
    altura INT,
    sexo CHAR(1),
    numJaulas INT
);

--Restricciones animal
--Dominio
ALTER TABLE animal ALTER COLUMN idAnimal 
SET NOT NULL;
ALTER TABLE animal ALTER column idBioma 
SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT animal_d1 
 CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE animal ADD CONSTRAINT animal_d2
CHECK(nombre <> '' and nombre SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE animal ADD constraint animal_d3
CHECK(especie <> '' and especie SIMILAR TO '[A-Za-zÁÉÍÓÚÜÑáéíóúüñ ]+');
ALTER TABLE animal ALTER COLUMN peso 
SET NOT NULL;
ALTER TABLE animal ALTER COLUMN altura 
SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT animal_d4
CHECK(sexo = 'F' OR sexo  = 'M');
ALTER TABLE animal ALTER COLUMN numJaulas 
SET NOT NULL;

--Entidad
ALTER table animal ADD CONSTRAINT animal_pkey
PRIMARY KEY(idAnimal);

--Referencial
ALTER TABLE animal ADD CONSTRAINT animal_fkey1
FOREIGN KEY(idBioma) REFERENCES bioma(idBioma)
ON UPDATE CASCADE ON DELETE CASCADE;
--Referencial
ALTER TABLE animal ADD CONSTRAINT animal_fkey2
FOREIGN KEY(rfc) REFERENCES cuidador(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT animal

COMMENT ON TABLE animal IS 'Tabla Alimentacion, dado que es un atributo multivaluado de la tabla Animal';
COMMENT ON COLUMN animal.idAnimal IS 'Id del Animal';
COMMENT ON COLUMN animal.idBioma IS 'Id del Bioma';
COMMENT ON COLUMN animal.rfc IS 'Id del veterinario (rfc)';
COMMENT ON COLUMN animal.nombre IS 'Nombre del Animal';
COMMENT ON COLUMN animal.especie IS 'Tipo de especie del Animal';
COMMENT ON COLUMN animal.peso IS 'Peso del Animal';
COMMENT ON COLUMN animal.altura IS 'Altura del Animal';
COMMENT ON COLUMN animal.sexo IS 'Sexo del Animal';
COMMENT ON COLUMN animal.numjaulas IS 'Numero de jaulas asignadas al Animal';
COMMENT ON CONSTRAINT animal_d1 ON animal IS 'Limitamos y restringimos a que el rfc tenga un tamaño de 13';
COMMENT ON CONSTRAINT animal_d2 ON animal IS 'Una restriccion check que nos asegura que el nombre no sea una cadena vacia';
COMMENT ON CONSTRAINT animal_d3 ON animal IS 'Una restriccion check que nos asegura que el especie no sea una cadena vacia';
COMMENT ON CONSTRAINT animal_d4 ON animal IS 'Una restriccion check que nos asegura que el genero no sea una cadena diferente a F:Mujer o M:Hombre';
COMMENT ON CONSTRAINT animal_pkey ON animal IS 'La llave primaria idAnimal de la tabla Animal';
COMMENT ON CONSTRAINT animal_fkey1 ON animal IS 'La llave foranea IdBioma de Animal que hace referencia a la tabla Animal';
COMMENT ON CONSTRAINT animal_fkey2 ON animal IS 'La llave foranea rfc  es el id del Veterinario  que hace referencia a la tabla Veterinario';

CREATE TABLE alimentacion(
	idAnimal INT,
	alimentacion VARCHAR(50)
);

--Restricciones Alimentación
--Dominio
ALTER TABLE alimentacion ALTER COLUMN idAnimal 
SET NOT NULL;
ALTER TABLE alimentacion ADD CONSTRAINT alimentacion_d1
CHECK(alimentacion <> '');

--Entidad
ALTER TABLE alimentacion ADD CONSTRAINT alimentacion_pkey
PRIMARY KEY(idAnimal, alimentacion);

--Referencial
ALTER TABLE alimentacion ADD CONSTRAINT alimentacion_fkey
FOREIGN KEY(idAnimal) REFERENCES animal(idAnimal)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT alimentacion

COMMENT ON TABLE alimentacion IS 'Tabla Animal, que contiene los atributos de los Animales, y una llave del Bioma y Veterinario debido a la relacion entre estos dos';
COMMENT ON COLUMN alimentacion.idAnimal IS 'Id del Animal';
COMMENT ON COLUMN alimentacion.alimentacion IS 'alimentacion atributo de la tabla Alimentoacion';
COMMENT ON CONSTRAINT alimentacion_pkey ON alimentacion IS 'La llave primaria alimento, idAlimento de la tabla Alimento, por ser atributo multivaluado';
COMMENT ON CONSTRAINT alimentacion_fkey ON alimentacion IS 'La llave foranea IdAnimal de Animal que hace referencia a la tabla Animal';

------------TABLAS CON LLAVES FORANEAS---------------

CREATE table asistir(
	idEvento INT,
	idCliente INT,
	tipoNotificacion VARCHAR(50)
);


--Restricciones asistir
--Referencial
ALTER TABLE asistir ADD CONSTRAINT asistir_fkey1
FOREIGN KEY(idEvento) REFERENCES evento(idEvento)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE asistir ADD CONSTRAINT asistir_fkey2
FOREIGN KEY(idCliente)  REFERENCES cliente(idCliente)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE asistir ADD CONSTRAINT asistir_d1
CHECK(tipoNotificacion <> '');

--COMMENT asistir

COMMENT ON TABLE asistir IS 'Tabla de la relacion asistir de Cliente a Evento';
COMMENT ON COLUMN asistir.idEvento IS 'Id del Evento';
COMMENT ON COLUMN asistir.idCliente IS 'Id del Cliente';
COMMENT ON COLUMN asistir.tipoNotificacion IS 'El tipo de notificacion';

COMMENT ON CONSTRAINT asistir_fkey1 ON asistir IS 'La llave foranea IdEvento del Evento que hace referencia a la tabla Evento';
COMMENT ON CONSTRAINT asistir_fkey2 ON asistir IS 'La llave foranea idCliente del Cliente que hace referencia a la tabla Cliente';

CREATE TABLE trabajar(
	idBioma INT,
	rfc CHAR(13)
);
--Restricciones trabajar
--Referencial
ALTER TABLE trabajar ADD CONSTRAINT trabajar_fkey1
FOREIGN KEY(idBioma) REFERENCES bioma(idBioma)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE trabajar ADD CONSTRAINT trabajar_fkey2
FOREIGN KEY(rfc)  REFERENCES veterinario(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT trabajar

COMMENT ON TABLE trabajar IS 'Tabla de la relacion trabajar de Bioma a Veterinario';
COMMENT ON COLUMN trabajar.idBioma IS 'Id del Bioma';
COMMENT ON COLUMN trabajar.rfc IS 'Id del Veterinario (rfc)';
COMMENT ON CONSTRAINT trabajar_fkey1 ON trabajar IS 'La llave foranea IdBioma del Bioma que hace referencia a la tabla Bioma';
COMMENT ON CONSTRAINT trabajar_fkey2 ON trabajar IS 'La llave foranea rfc que es el id del Veterinario de Veterinario que hace referencia a la tabla Veterinario';

CREATE TABLE atender(
	idAnimal INT,
	rfc CHAR(13),
	indicacionMedica VARCHAR(50)
);

--Restricciones atender
--Referencial
ALTER TABLE atender ADD CONSTRAINT atender_fkey1
FOREIGN KEY(idAnimal) REFERENCES animal(idAnimal)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE atender ADD CONSTRAINT atender_fkey2
FOREIGN KEY(rfc)  REFERENCES veterinario(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE atender ADD CONSTRAINT atender_d1
CHECK(indicacionMedica <> '');

--COMMENT atender

COMMENT ON TABLE atender IS 'Tabla de la relacion atender de Animal a Veterinario';
COMMENT ON COLUMN atender.idAnimal IS 'Id del Animal';
COMMENT ON COLUMN atender.rfc IS 'Id del Veterinario (rfc)';
COMMENT ON COLUMN atender.indicacionMedica IS 'La indicacion medica que el vterinario le asigne al animal';
COMMENT ON CONSTRAINT atender_fkey1 ON atender IS 'La llave foranea IdAnimal del Animal que hace referencia a la tabla Animal';
COMMENT ON CONSTRAINT atender_fkey2 ON atender IS 'La llave foranea rfc que es el id del Veterinario de Veterinario que hace referencia a la tabla Veterinario';

CREATE table distribuirAlimento(
	idBioma INT,
	idInsumo INT
);

--Restricciones distribuirAlimento
--Referencial
ALTER TABLE distribuirAlimento ADD CONSTRAINT distribuirAlimento_fkey1
FOREIGN KEY(idBioma) REFERENCES bioma(idBioma)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE distribuirAlimento ADD CONSTRAINT distribuirAlimento_fkey2
FOREIGN KEY(idInsumo) REFERENCES alimento(idInsumo)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT distribuirMedicina

COMMENT ON TABLE distribuirAlimento IS 'Tabla de la relacion distribuirAlimento de Alimento a Bioma';
COMMENT ON COLUMN distribuirAlimento.idBioma IS 'Id del Bioma';
COMMENT ON COLUMN distribuirAlimento.idInsumo IS 'Id del Insumo';
COMMENT ON CONSTRAINT distribuirAlimento_fkey1 ON distribuirAlimento IS 'La llave foranea IdBioma del Bioma que hace referencia a la tabla Bioma';
COMMENT ON CONSTRAINT distribuirAlimento_fkey2 ON distribuirAlimento IS 'La llave foranea IdInsumo de Alimento que hace referencia a la tabla Alimento';

CREATE table distribuirMedicina(
	idBioma INT,
	idInsumo INT
);

--Restricciones distribuirMedicina
--Referencial
ALTER TABLE distribuirMedicina ADD CONSTRAINT distribuirMedicina_fkey1
FOREIGN KEY(idBioma) REFERENCES bioma(idBioma)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE distribuirMedicina ADD CONSTRAINT distribuirMedicina_fkey2
FOREIGN KEY(idInsumo) REFERENCES medicina(idInsumo)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT distribuirMedicina

COMMENT ON TABLE distribuirMedicina IS 'Tabla de la relacion distribuirMedicina de Medicina a Bioma';
COMMENT ON COLUMN distribuirMedicina.idBioma IS 'Id del Bioma';
COMMENT ON COLUMN distribuirMedicina.idInsumo IS 'Id del Insumo';
COMMENT ON CONSTRAINT distribuirMedicina_fkey1 ON distribuirMedicina IS 'La llave foranea IdBioma del Bioma que hace referencia a la tabla Bioma';
COMMENT ON CONSTRAINT distribuirMedicina_fkey2 ON distribuirMedicina IS 'La llave foranea IdInsumo de Medicina que hace referencia a la tabla Medicina';


CREATE table proveerAlimento(
	idInsumo INT,
	rfc CHAR(13)
);

--Restricciones proveerAlimento
--Referencial
ALTER TABLE proveerAlimento ADD CONSTRAINT proveerAlimento_fkey1
FOREIGN KEY(idInsumo) REFERENCES alimento(idInsumo)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE proveerAlimento ADD CONSTRAINT proveerAlimento_fkey2
FOREIGN KEY(rfc) REFERENCES proveedor(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT proveerAlimento

COMMENT ON TABLE proveerAlimento IS 'Tabla de la relacion proveerAlimento de Proveedor a Alimento';
COMMENT ON COLUMN proveerAlimento.IdInsumo IS 'Id del Alimento';
COMMENT ON COLUMN proveerAlimento.rfc IS 'Id del Provedor (rfc)';
COMMENT ON CONSTRAINT proveerAlimento_fkey1 ON proveerAlimento IS 'La llave foranea IDInsumo siendo el insumo el Alimento que hace referencia a la tabla Alimento';
COMMENT ON CONSTRAINT proveerAlimento_fkey2 ON proveerAlimento IS 'La llave foranea RFC del Proveedor que hace referencia a la tabla Proveedor';

CREATE table proveerMedicina(
	idInsumo INT,
	rfc CHAR(13)
);

--Restricciones proveerMedicina
--Referencial
ALTER TABLE proveerMedicina ADD CONSTRAINT proveerMedicina_fkey1
FOREIGN KEY(idInsumo) REFERENCES medicina(idInsumo)
ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE proveerMedicina ADD CONSTRAINT proveerMedicina_fkey2
FOREIGN KEY(rfc) REFERENCES proveedor(rfc)
ON UPDATE CASCADE ON DELETE CASCADE;

--COMMENT proveerMedicina

COMMENT ON TABLE proveerMedicina IS 'Tabla de la relacion proveerMedicina de Proveedor a Medicina';
COMMENT ON COLUMN proveerMedicina.IdInsumo IS 'Id de la Medicina';
COMMENT ON COLUMN proveerMedicina.rfc IS 'Id del proveedor (rfc)';
COMMENT ON CONSTRAINT proveerMedicina_fkey1 ON proveerMedicina IS 'La llave foranea IDInsumo siendo el insumo el Medicina que hace referencia a la tabla Medicina';
COMMENT ON CONSTRAINT proveerMedicina_fkey2 ON proveerMedicina IS 'La llave foranea RFC del Proveedor que hace referencia a la tabla Proveedor';


