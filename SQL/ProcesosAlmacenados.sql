/* Un Proceso Almacenado que se encarga de eliminar un veterinario a traves de su RFC,
   Eliminaremos todas las referencias del veterinario de las demas tablas.*/
CREATE OR REPLACE PROCEDURE eliminarVeterinario(IN BuscadoRFCVeterinario VARCHAR(13)) AS 
$$
BEGIN
  -- Verifica si el RFC del veterinario existe en la tabla veterinario
  IF NOT EXISTS (SELECT 1 FROM Veterinario WHERE rfc = BuscadoRFCVeterinario) THEN
    RAISE EXCEPTION 'El veterinario con RFC % no existe en la base de datos', BuscadoRFCVeterinario
    USING hint = 'Verifica que el RFC ingresado sea el correcto';
   
  ELSE
  	 -- Elimina de Veterinario, por el mantenimiento de llaves foraneas, las tablas que contengan
  	-- a ese Veterinario se eliminaran tambien
    DELETE FROM Veterinario WHERE rfc = BuscadoRFCVeterinario;
   	
  END IF;
	      
END;
$$
LANGUAGE plpgsql;

-- Obtenemos la informacion de la tabla veterinario con un RFC que si existe 
SELECT * FROM Veterinario WHERE rfc = 'AOIR3363837M1';
SELECT * FROM trabajar WHERE rfc = 'AOIR3363837M1';
SELECT * FROM atender WHERE rfc = 'AOIR3363837M1';
SELECT * FROM telefonoVeterinario WHERE rfc = 'AOIR3363837M1';
SELECT * FROM correoVeterinario WHERE rfc = 'AOIR3363837M1';

-- Llamamos al RFC aplicandole el proceso almacenado
CALL eliminarVeterinario('AOIR3363837M1');

-- Verificamos que ya no tengamos los datos relacionados con el Veterinario o en cualquiera
-- donde se encuentra el RFC de este Veterinario 
SELECT * FROM Veterinario WHERE rfc = 'AOIR3363837M1';
SELECT * FROM trabajar WHERE rfc = 'AOIR3363837M1';
SELECT * FROM atender WHERE rfc = 'AOIR3363837M1';
SELECT * FROM telefonoVeterinario where rfc = 'AOIR3363837M1';
SELECT * FROM correoVeterinario WHERE rfc = 'AOIR3363837M1';

-------------------------------------------------------------------------------------------------------------------------

-- Procedimiento almacenado que calcula el costo total de cada ticket aplicando descuentos si los hay.
-- La fórmula utilizada es: CostoTotal - (CostoUnitario * Descuento / 100), ajustando así el costo unitario restando el descuento correspondiente.
-- El objetivo es obtener el costo total de un servicio después de aplicar cualquier descuento asociado.

-- Agregamos el Costo Toatal a la tabla Ticket ya que este no esta definido como tal ya que es calculado 
ALTER TABLE Ticket
ADD COLUMN CostoTotal decimal;

-- Crear o reemplazar el procedimiento almacenado
CREATE OR REPLACE FUNCTION calcular_costoTotal()
RETURNS VOID AS $$
BEGIN
    -- Actualizar el atributo "CostoTotal" en la tabla "Ticket"
    UPDATE Ticket
    SET CostoTotal = CostoParcial - (CostoParcial * porcentajedesc / 100);
END;
$$ LANGUAGE plpgsql;

-- Llamar al procedimiento para calcular y actualizar el "CostoTotal"
SELECT calcular_costoTotal();

-- Consulta para ver la tabla "Ticket" completa
SELECT * FROM Ticket;

-------------------------------------------------------------------------------------------------------------------------

/*Un proceso almacenado que cuanta los ticket por biomas*/
CREATE OR REPLACE FUNCTION contar_tickets_en_bioma(p_bioma_id INT)
RETURNS TABLE (cantidad_tickets INT) AS $$
BEGIN
    -- Contar la cantidad de tickets en el bioma dado
    SELECT COUNT(*) INTO cantidad_tickets
    FROM ticket
    WHERE idBioma = p_bioma_id;

    -- Devolver el resultado
    RETURN QUERY SELECT cantidad_tickets;
END;
$$
LANGUAGE plpgsql;

-- Verificamos que funcione nuestro SP
SELECT idBioma, tipoBioma, contar_tickets_en_bioma(3) AS cantidad_tickets 
FROM bioma
WHERE idBioma = 3;
