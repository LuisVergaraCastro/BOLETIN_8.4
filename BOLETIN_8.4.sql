--Boletin 8.4
--Consultas AdventureWorks
GO
USE AdventureWorksLT2012
--1.Nombre completo (Tratamiento, nombre, inicial del segundo nombre,
--apellidos de todos los clientes que en los nombres de sus compa��as aparezcan las palabras "cycle�  o "bike�.
SELECT * FROM SalesLT.Customer
SELECT CONCAT(Title,' ',FirstName,' ',MiddleName,' ',LastName) AS NOMBRE_COMPLETO FROM SalesLT.Customer WHERE CompanyName LIKE ('% Cycle %') OR CompanyName LIKE ('& Bike &')
--2.Repite la consulta anterior sin incluir la inicial del nombre.
--�Obtienes el mismo n�mero de filas? �A qu� es debido? La respuesta es si.
SELECT CONCAT(Title,' ',FirstName,' ',LastName) AS NOMBRE_COMPLETO FROM SalesLT.Customer WHERE CompanyName LIKE ('% Cycle %') OR CompanyName LIKE ('& Bike &')
--3.Explica c�mo podr�as solucionar el problema detectado en el ejercicio anterior.
--Pista: Busca la funci�n ISNULL() en la ayuda.

--4.N�mero de productos de cada color.
SELECT * FROM SalesLT.Product
SELECT Color, COUNT(*) AS [N� DE PRODUCTOS] FROM SalesLT.Product GROUP BY Color
--5.El margen de un producto es la diferencia entre su precio de venta (ListPrice) y
--su precio de coste (StandardPrice). Crea una consulta que obtenga nombre y n�mero del producto, margen y categor�a.
SELECT * FROM SalesLT.Product
SELECT DISTINCT Name, ProductNumber, (ListPrice - StandardCost) AS [MARGEN DEL PRODUCTO], ProductCategoryID FROM SalesLT.Product
--6.ID de categor�a y margen medio de los productos de esa categor�a.
--Ten l cuenta que el margen medio es la media de los m�rgenes.
SELECT * FROM SalesLT.Product
SELECT ProductCategoryID, AVG(ListPrice - StandardCost) AS [MARGEN MEDIO DEL PRODUCTO]  FROM SalesLT.Product GROUP BY ProductCategoryID
--7.Consulta cuantas direcciones diferentes tenemos de cada pa�s
SELECT * FROM SalesLT.Address
SELECT CountryRegion, COUNT(*) AS [N� DE DIRECCIONES] FROM SalesLT.Address GROUP BY CountryRegion
--8.Consulta cuantas direcciones diferentes tenemos de cada pa�s y estado
SELECT CountryRegion, StateProvince, COUNT(*) AS [N� DE DIRECCIONES] FROM SalesLT.Address GROUP BY CountryRegion, StateProvince
--9.Consulta cuantas direcciones diferentes tenemos de cada pa�s, estado y ciudad
SELECT CountryRegion, StateProvince, City, COUNT(*) AS [N� DE DIRECCIONES] FROM SalesLT.Address GROUP BY CountryRegion, StateProvince, City