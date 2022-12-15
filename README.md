Ciencia de Datos BEDU
Postwork Sesión 8
Equipo 16
- Del Muro Bracho, Rodrigo
- Franco Meléndez, Gerardo
- Macías Díaz, Miguel Ángel
- Mayén Vázquez, Roberto Carlo
- Romero Arellano, Fernando

Este archivo contiene:
- Introducción
- 1. Planteamiento del problema
- 2. Análisis descriptivo de la información
- 3. Cálculo de probabilidades que permitan entender el problema
- 4. Planteamiento de hipótesis estadísticas y conclusiones
- 5. Modelo de regresión lineal, determinantes de inseguridad alimentaria en México
- 6. Código en R y archivo README.MD en repositorio de Github.

Introducción
Un centro de salud nutricional está interesado en analizar estadística y probabilísticamente los patrones de gasto en alimentos saludables y no saludables en los hogares mexicanos con base en su nivel socioeconómico, en si el hogar tiene recursos financieros extras al ingreso y en si presenta o no inseguridad alimentaria. Además, está interesado en generar un modelo que le permita identificar los determinantes socioeconómicos de la inseguridad alimentaria.

La base de datos es un extracto de la Encuesta Nacional de Salud y Nutrición (2012) levantada por el Instituto Nacional de Salud Pública en México. La mayoría de las personas afirman que los hogares con menor nivel socioeconómico tienden a gastar más en productos no saludables que las personas con mayores niveles socioeconómicos y que esto, entre otros determinantes, lleva a que un hogar presente cierta inseguridad alimentaria.

La base de datos contiene las siguientes variables:
- nse5f (Nivel socioeconómico del hogar): 1 "Bajo", 2 "Medio bajo", 3 "Medio", 4 "Medio alto", 5 "Alto"
- area (Zona geográfica): 0 "Zona urbana", 1 "Zona rural"
- numpeho (Número de persona en el hogar)
- refin (Recursos financieros distintos al ingreso laboral): 0 "no", 1 "sí"
- edadjef (Edad del jefe/a de familia)
- sexoje (Sexo del jefe/a de familia): 0 "Hombre", 1 "Mujer"
- añosedu (Años de educación del jefe de familia)
- ln_als (Logaritmo natural del gasto en alimentos saludables)
- ln_alns (Logaritmo natural del gasto en alimentos no saludables)
- IA (Inseguridad alimentaria en el hogar): 0 "No presenta IA", 1 "Presenta IA“

1. Planteamiento del problema
Un centro de salud nutricional quiere realizar un análisis estadístico y de probabilidad para entender y determinar la tendencia de gasto en alimentos, de los hogares en la población Mexicana, así como generar un modelo que permita identificar los determinantes socioeconómicos de la inseguridad alimentaria. 
	
Se tiene interés en conocer:
- Patrones de gasto en alimentos saludables y no saludables con base en el nivel socioeconómico
- Si hay recursos financieros extras, adicionales al ingreso
- Si existe inseguridad alimentaria en la población

Origen de los datos:
- Extracto de la Encuesta Nacional de Salud y Nutrición (2012) levantada por el Instituto Nacional de Salud Pública en México.

Supuesto:
- Los hogares con menor nivel socioeconómico tienden a gastar más en productos no saludables que las personas con mayores niveles socioeconómicos y que esto, entre otros determinantes, lleva a que un hogar presente cierta inseguridad alimentaria.

2. Realiza un análisis descriptivo de la información
Análisis descriptivo y gráfico
- Existen 5 variables cuantitativas a las que se les puede correr un análisis descriptivo; estas variables son:
	1.- numpeho (Número de persona en el hogar)
	2.- edadjef (Edad del jefe/a de familia
	3.- añosedu (Años de educación del jefe de familia)
	4.- ln_als (Logarítmo natural del gasto en alimentos saludables)
	5.- ln_alns (Logarítmo natural del gasto en alimentos no saludables“

Resumen de variables:
- Nivel Socioeconomico
      Bajo Medio Bajo      Medio Medio alto       Alto 
      8858       8560       8323       7903       7165

- Area
Zona urbana  Zona rural 
      26591       14218 
       no    si 
33046  7763 

- Sexo del Jefe de Familia
Hombre  Mujer 
 33046   7763 

- Inseguridad Alimentaria en el Hogar
No presenta IA    Presenta IA 
         10781          30028 

Promedios y desviaciones estándar
-mean (df.limpio$numpeho)			 # [1] 3.99073
-mean (df.limpio$edadjef)			 # [1] 47.31534
-mean (df.limpio$añosedu)			 # [1] 10.89896
-mean (exp(df.limpio$ln_als))	 # [1] 593.989
-mean (exp(df.limpio$ln_alns)) # [1] 107.8948

-sd (df.limpio$numpeho)			 # [1] 1.8559
-sd (df.limpio$edadjef)			 # [1] 15.10541
-sd (df.limpio$añosedu)			 # [1] 4.695239
-sd (exp(df.limpio$ln_als))	 # [1] 359.0136
-sd (exp(df.limpio$ln_alns)) # [1] 145.7636

3. Calcula probabilidades que nos permitan entender el problema en México
#

4. Plantea hipótesis estadísticas y concluye sobre ellas para entender el problema en México
#

5. Estima un modelo de regresión, lineal o logístico, para identificar los determinantes de la inseguridad alimentaria en México


