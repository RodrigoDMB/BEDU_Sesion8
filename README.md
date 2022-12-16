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
- mean (df.limpio$numpeho)			 # [1] 3.99073
- mean (df.limpio$edadjef)			 # [1] 47.31534
- mean (df.limpio$añosedu)			 # [1] 10.89896
- mean (exp(df.limpio$ln_als))	 # [1] 593.989
- mean (exp(df.limpio$ln_alns)) # [1] 107.8948

- sd (df.limpio$numpeho)			 # [1] 1.8559
- sd (df.limpio$edadjef)			 # [1] 15.10541
- sd (df.limpio$añosedu)			 # [1] 4.695239
- sd (exp(df.limpio$ln_als))	 # [1] 359.0136
- sd (exp(df.limpio$ln_alns)) # [1] 145.7636

3. Calcula probabilidades que nos permitan entender el problema en México
#

4. Plantea hipótesis estadísticas y concluye sobre ellas para entender el problema en México

PLANTEAMIENTO DE LA HIPÓTESIS
Los hogares con menor nivel socioeconómico tienden a gastar más en productos no saludables que las personas con mayores niveles socioeconómicos.
Estimar cuanto gasto cada nivel socioecomico en alimentos saludables

1) ln_als = beta0 + beta1* nse5f + e  =>   lm(formula = ln_als ~ nse5f)
Hipótesis:
- Ho: beta0 = 0 y beta1 = 0
- Ha: beta0 ≠ 0 y beta1 ≠ 0
Usando Mínimos Cuadrados Ordinarios (OLS) obtenemos la TABLA 1

Como se observa en la tabla 1, el valor de p-value de cada variable es menor a 0.05 o a 0.01 (significancia estadística); por lo tanto se rechaza Ho y se acepta Ha. Se observa también que nse5fBajo no aparece, por lo que se interpreta que en este nivel socioeconómico no se gasta en alimentos saludables.

2) ln_als = beta0 + beta1* ln_alns + beta2* nse5f + e  =>   lm(formula = ln_als ~ ln_alns + nse5f)
Usando Mínimos Cuadrados Ordinarios (OLS) obtenemos la TABLA 2

En la tabla 2, R2 ajustada es = 0.1826 y en la tabla 1, R2 ajustada es = 0.1279, por lo que podemos dejar el modelo con las 2 variables (ln_alns y nse5f) en lugar de una (nse5f).

CONCLUSIÓN:
Los valores de las betas de acuerdo a la hipótesis planteada se aceptan, y se observa que los coeficientes (betas) se incrementan cuando el nivel socioeconómico es mayor. Por lo tanto, de acuerdo a los datos, los hogares de mas bajo nivel socioeconómico gastan menos en alimentos saludables que los de mayor nivel socioeconómico.

5. Estima un modelo de regresión, lineal o logístico, para identificar los determinantes de la inseguridad alimentaria en México

Se genera un primer modelo inicial de regresión logística para analizar como influye en la inseguridad alimentaria.

- logistic.general <- glm(IA ~ nse5f + área + numpeho + refin + edadjef + sexojef + añosedu +
                          ln_als + ln_alns, data = df.limpio, family = binomial)	

Conclusiones primer modelo: 
De este primer modelo de regresión lineal, podemos concluir que a un intervalo de confianza del 95%, la variable edadjef NO es significativa para explicar a inseguridad alimentaria. 

Por lo tanto, procedemos a quitarla del modelo.
- logistic.ajustado <- glm(IA ~ nse5f + área + numpeho + refin + sexojef + añosedu +
                          ln_als + ln_alns, data = df.limpio, family = binomial)	
                          
CONCLUSIONES MODELO AJUSTADO:
De este modelo ajustado podemos concluir la siguiente ecuación de predicción siendo “y” la inseguridad alimentaria:

	y = 2.9874 - 0.3703*nse5f - 0.1025*area + 0.1740*numpeho +
		0.3975*refin + 0.1556*sexojef - 0.0547*añosedu - 
		0.0910*ln_als - 0.1032*ln_alns + epsilon

De aquí se tienen las siguientes observaciones:
- 1.- Por cada unidad en la que aumenta el nivel socioeconómica DISMINUYE exp(0.3703) veces la probabilidad de IA
- 2.- Por vivir en área urbana DISMINUYE exp(0.1025) veces la probabilidad de IA
- 3.- Por cada integrante adicional en el hogar AUMENTA exp(0.1740) veces la probabilidad de IA
- 4.- Por contar con ingreso adicional al laboral AUMENTA exp(0.3975) veces la probabilidad de IA
- 5.- Por cada año adicional en la edad del jefe de familia AUMENTA exp(0.1556) veces la probabilidad de IA
- 6.- Por cada año adicional de educación del jefe de familia DIMINUYE exp(0.0547) veces la probabilidad de IA
- 7 y 8 .- El gasto en alimentos saludables o no saludables DISMINUYEN la probabilidad de IA

6. Escribe tu análisis en un archivo README.me y tu código en un script de R y publica ambos en un repositorio de Github.

Desde interfaz de Posit Cloud, se crea directorio de trabajo “Sesion8”, script de R “PW_Sesion8.R” y archivo “README.md”

Identificación y configuración de variables globales
- /cloud/project$ git config --global user.name "RodrigoDMB"
- /cloud/project$ git config --global user.email "bbrorro@gmail.com"

Validación de variables globales
- /cloud/project$ git config --list
	
Cambio al directorio de trabajo “Sesion8”
- /cloud/project$ cd Sesion8
	
Inicializar repositorio
- /cloud/project/Sesion8$ git init

Obtener estatus del repositorio
- /cloud/project/Sesion8$ git status

Agregar archivos
- /cloud/project/Sesion8$ git add .

Se realiza commit
- /cloud/project/Sesion8$ git commit -m "Postwork Sesion8 - DS Equipo 16"

Agregar origen remoto del repositorio
- /cloud/project/Sesion8$ git remote add origin https://github.com/RodrigoDMB/BEDU_Sesion8.git

Cargar contenido del repositorio local al repositorio remoto
- /cloud/project/Sesion8$ git push -u origin main
	
URL del repositorio
- https://github.com/RodrigoDMB/BEDU_Sesion8

