CREATE MATERIALIZED VIEW Vista_sucursal3 AS 
select 
(department.nombre_dpto) as Nombre_DPTO,
(position1.nombre_position1) as Cargo,
branchoffice.nombre_branch
from department,position1,branchoffice,employee
where department.id_departament = employee.departmentid_employee
and  position1.id_position = employee.positionid_employee
and branchoffice.id_branch = employee.branchid_employee
and branchoffice.nombre_branch='Tienda'
order by (department.nombre_dpto);

select * from Vista_sucursal3;