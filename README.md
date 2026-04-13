#  Data Warehouse ElectroHogar

Proyecto de Inteligencia de Negocios enfocado en el análisis de ventas mediante la implementación de un Data Warehouse en SQL Server.

---

## Objetivo

Diseñar e implementar una bodega de datos que permita integrar, limpiar y analizar la información de ventas para la toma de decisiones.

---

##  Modelo de Datos

Se implementó un modelo dimensional tipo estrella compuesto por:

- Dim_Clientes
- Dim_Productos
- Dim_Tiendas
- Dim_Tiempo
- Fact_Ventas

---

##  Proceso ETL

Se desarrolló un proceso de:

- **Extracción:** Datos provenientes de archivos Excel  
- **Transformación:** Limpieza de datos (eliminación de espacios, mayúsculas, valores nulos)  
- **Carga:** Inserción en el Data Warehouse  

---

## 📊 Métricas Analizadas

- Cantidad vendida  
- Total de ventas  
- Costo total  
- Margen total  

---

## 🧊 Cubo de Ventas

Se creó una vista (`Cubo_Ventas`) que permite análisis multidimensional por:

- Mes  
- Subcategoría  
- Región  
- Departamento  
- Ciudad  

---

## ⚙️ Tecnologías Utilizadas

- SQL Server  
- Excel  
- GitHub  

---

##  Contenido del Proyecto

- Script SQL completo (`DW_ElectroHogar.sql`)
- Modelo de Data Warehouse
- Procesos ETL
- Vista tipo cubo para análisis

---

##  Autor

Andrés – Estudiante de Ingeniería de Sistemas  
Enfocado en Análisis de Datos y Business Intelligence

---

## Notas

Este proyecto hace parte de un ejercicio académico enfocado en el desarrollo de soluciones BI aplicadas a escenarios reales.
