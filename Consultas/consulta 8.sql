--El gerente de RRHH necesita saber si la edad y el sexo del empleado tienen
--relaci�n con el monto de ventas.CREATE VIEW consulta8 asSELECT
CASE
WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 18 AND 30 THEN '18-30'
  WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 30 AND 40 THEN '30-40'
  WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 40 AND 50 THEN '40-50'
  WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 50 AND 60 THEN '50-60'
  WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 60 AND 70 THEN '60-70'
  WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 70 AND 80 THEN '70-80'
  ELSE '+80'
  END AS rango_etario,

E.Genero, 
ROUND(SUM(fact.QUANTITY * fact.Price),2) AS monto

FROM Fact_Sales_G15 fact
JOIN Employee_G15 AS E
ON E.Key_Employee = fact.Key_Employee

GROUP BY
CASE
WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 18 AND 30 THEN '18-30'
  WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 30 AND 40 THEN '30-40'
  WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 40 AND 50 THEN '40-50'
  WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 50 AND 60 THEN '50-60'
  WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 60 AND 70 THEN '60-70'
  WHEN DATEDIFF(YEAR, E.Fecha_Nac, GETDATE()) BETWEEN 70 AND 80 THEN '70-80'
  ELSE '+80'
  END,
E.Genero

--order by monto desc, rango_etario