CREATE OR REPLACE FUNCTION TriggerParcialPractico()
RETURNS TRIGGER
  LANGUAGE PLPGSQL
  AS
$$
DECLARE 
ciudadConsultar varchar (35);
IDCiudad int;
IDcountry int;
Consultarcountry varchar (40);
BEGIN 

  Select id_address_city into IDCiudad from address where id_address = id_address;

  Select nombre_city into ciudadConsultar from city where IDCiudad = city.id_city;

  Select id_country_city into IDcountry from city where IDCiudad = id_country_city;

  Select country.nombre_country into Consultarcountry from country where IDcountry = country.id_country;

  INSERT INTO employeeaudit values(old.id_employee, old.fullname, 
								   old.branchid_employee, old.departmentid_employee, old.supervisorid_employee, 
								   old.positionid_employee, old.addressid_employee, 
								   ciudadConsultar,Consultarcountry, 'DELETE', NOW());
RETURN NEW;
END;
$$

CREATE TRIGGER TriggerParcial_tr
  AFTER INSERT OR DELETE OR UPDATE
  ON employee
  FOR EACH ROW
  EXECUTE PROCEDURE TriggerParcialPractico();


  DELETE FROM employee 
  Where employee.id_employee = '23141771';
  
  UPDATE employee 
  set fullname = 'Pablo Rojas'
  where id_employee = '23141771';
