"Postwork sesion # 8"

"Cargar Librerias necesarias"
library(dplyr)
library(DescTools)
library(ggplot2)
library(moments)

"Leer el archivo fuente de datos"
df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-08/Postwork/inseguridad_alimentaria_bedu.csv")
"Limpiar los datos de NA y datos no existentes"
df.limpio <- df[complete.cases(df),]
View(df.limpio)

"Formatea los datos de variables cualitativas a un formato más adecuado"
df.limpio$nse5f <- factor(df.limpio$nse5f, levels = c(1,2,3,4,5), labels = c("Bajo", "Medio Bajo", "Medio","Medio Alto","Alto"))
df.limpio$area <- factor(df.limpio$area, levels = c(0,1), labels = c("Rural", "Urbana"))
df.limpio$refin <- factor(df.limpio$refin, levels = c(0,1), labels = c("No", "Si"))
df.limpio$sexojef <- factor(df.limpio$sexojef, levels = c(0,1), labels = c("Hombre", "Mujer"))
df.limpio$IA <- factor(df.limpio$IA, levels = c(0,1), labels = c("No","Si"))
View(df.limpio)

summary(df)
str(df)
head(df)
tail(df)

# Nivel Socioeconomico
df$nse5f <- factor(df$nse5f, labels = c( "Bajo", "Medio Bajo", "Medio", "Medio alto", "Alto"), ordered = TRUE)
summary(df$nse5f)
"
      Bajo Medio Bajo      Medio Medio alto       Alto 
      8858       8560       8323       7903       7165 
"

# Area
df$area <- factor(df$area, labels = c("Zona urbana", "Zona rural"), ordered = TRUE)
summary(df$area)

"
Zona urbana  Zona rural 
      26591       14218 
"

# Recursos Financieros
df$refin <- factor(df$refin, labels = c("no", "si"), ordered = TRUE)
summary(df$refin)
"
   no    si 
33046  7763 
"

# Sexo del Jefe de Familia
df$sexojef <- factor(df$refin, labels = c("Hombre", "Mujer"), ordered = TRUE)
summary(df$sexojef)
"
Hombre  Mujer 
 33046   7763 
"

# Inseguridad Alimentaria en el Hogar
df$IA <- factor(df$IA, labels = c("No presenta IA", "Presenta IA"), ordered = TRUE)
summary(df$IA)
"
No presenta IA    Presenta IA 
         10781          30028 
"

df <- na.omit(df)
str(df)
summary(df)

attach(df)

ggplot(df, aes(x = nse5f)) + 
  geom_bar() +
  theme_classic()

ggplot(df, aes(x = df$area)) + 
  geom_bar() +
  theme_classic()

ggplot(df, aes(x = df$refin)) + 
  geom_bar() +
  theme_classic()

ggplot(df, aes(x = df$sexojef)) + 
  geom_bar() +
  theme_classic()

ggplot(df, aes(x = df$IA)) + 
  geom_bar() +
  theme_classic()

pairs(~ numpeho + edadjef + añosedu + ln_als + ln_alns, 
      data = df, gap = 0.4, cex.labels = 1.5)

df.select <- select(df, numpeho, edadjef, añosedu, ln_als, ln_alns)
summary(df.select)
round(cor(df.select),4)  

"Existen entonces 5 variables cuantitativas a las que se les puede correr un análisis descriptivo
Estas variables son:
1.- numpeho (Número de persona en el hogar)
2.- edadjef (Edad del jefe/a de familia
3.- añosedu (Años de educación del jefe de familia)
4.- ln_als (Logarítmo natural del gasto en alimentos saludables)
5.- ln_alns (Logarítmo natural del gasto en alimentos no saludables
"
"crear histogramas de las variables cuantitativas"

par(mfrow=c(3, 2))

mean (df.limpio$numpeho)
mean (df.limpio$edadjef)
mean (df.limpio$añosedu)
mean (exp(df.limpio$ln_als))
mean (exp(df.limpio$ln_alns))

sd (df.limpio$numpeho)
sd (df.limpio$edadjef)
sd (df.limpio$añosedu)
sd (exp(df.limpio$ln_als))
sd (exp(df.limpio$ln_alns))


hist(df.limpio$numpeho,
     col="blue",
     main = "Número de personas en el hogar", 
     sub = "Con mu=3.99 y sd = 1.85 ",
     xlab = "# de Personas",
     ylab = "Frecuencia")

hist(df.limpio$edadjef,
     col="yellow",
     main = "Edad del Jefe de Familia", 
     sub = "Con mu = 47.32 y sd = 15.11",
     xlab = "Años",
     ylab = "Frecuencia")

hist(df.limpio$añosedu,
     col="red",
     main = "Años de educación Jefe de Familia", 
     sub = "Con mu = 10.90 y sd = 4.70",
     xlab = "Años de educacion",
     ylab = "Frecuencia")

hist(exp(df.limpio$ln_als),
     col="gray",
     main = "Gasto en Alimentos Saludables", 
     sub = "Con mu = 593.99 y sd = 359.01",
     xlab = "$ Gasto",
     ylab = "Frecuencia")

hist(exp(df.limpio$ln_alns),
     col="purple",
     main = "Gasto en Alimentos NO Saludables", 
     sub = "Con mu = 107.89 y sd= 145.76",
     xlab = "$ Gasto",
     ylab = "Frecuencia")

# 2. Realiza un análisis descriptivo de la información
# Análisis descriptivo y gráfico
# Crear histogramas de las variables cuantitativas
hist(df.limpio$numpeho, col="blue", 
     main = "Número de personas en el hogar", 
     sub = "Con mu=3.99 y sd = 1.85 ", xlab = "# de Personas",
     ylab = "Frecuencia")

hist(df.limpio$edadjef, col="yellow",
     main = "Edad del Jefe de Familia", 
     sub = "Con mu = 47.32 y sd = 15.11",
     xlab = "Años", ylab = "Frecuencia")

hist(df.limpio$añosedu, col="red",
     main = "Años de educación Jefe de Familia", 
     sub = "Con mu = 10.90 y sd = 4.70",
     xlab = "Años de educacion", ylab = "Frecuencia")

hist(exp(df.limpio$ln_als), col="gray",
     main = "Gasto en Alimentos Saludables", 
     sub = "Con mu = 593.99 y sd = 359.01",
     xlab = "$ Gasto", ylab = "Frecuencia")

hist(exp(df.limpio$ln_alns), col="purple",
     main = "Gasto en Alimentos NO Saludables", 
     sub = "Con mu = 107.89 y sd= 145.76",
     xlab = "$ Gasto", ylab = "Frecuencia")

# Análisis descriptivo y gráfico
pairs(~ numpeho + edadjef + añosedu + ln_als +
        ln_alns, data = df, gap = 0.4, cex.labels = 1.5)  #

df.select <- select(df, numpeho, edadjef, añosedu, 
                    ln_als, ln_alns)	# Seleccionar variables significativas

summary(df.select)	# Resumen

round(cor(df.select),4) # Correlación

# 4. Plantea hipótesis estadísticas y concluye sobre ellas para entender el problema en México
# Preparación para calcular la estimación del gasto

#Elimina filas que contengan NA en alguna columna
df_SinNa.2 <- df_SinNa <- df[complete.cases(df),]		
View(df_SinNa)   					# Enmascarar las variables

#Categorizar las variables cualitativas
df_SinNa$nse5f <- factor(df_SinNa$nse5f,levels= c(1:5),
                         labels = c("Bajo","MedioBajo","Medio", "MedioAlto", "Alto") )

df_SinNa$area <- factor(df_SinNa$area, levels= c(0:1), 
                        labels = c("ZonaUrbana", "ZonaRural") )

df_SinNa$refin <- factor(df_SinNa$refin, levels= c(0:1), 
                         labels = c("No","Si") )

df_SinNa$sexojef <- factor(df_SinNa$sexojef, levels= c(0:1), 
                           labels = c("Hombre","Mujer") )

df_SinNa$IA <- factor(df_SinNa$IA, levels= c(0:1), 
                      labels = c("NoP_IA","P_IA") )

attach(df_SinNa)					# Agregar variables a la ruta de búsqueda

# Estimar cuanto gasto cada nivel socioeconómico en alimentos saludables 
# utilizando el método de Mínimos Cuadrados Ordinarios (OLS)

#ln_als = beta0 + beta1*nse5f + e 				#ln_als = beta0 + beta1*n_alns + beta2*nse5f + e 

m1 <- lm(ln_als ~ nse5f) ;					m3 <- lm(ln_als ~ ln_alns + nse5f)

summary(m1)		;				summary(m3)


#Modelo de Regresión logística

"Se genera un modelo inicial de regresión logística para analizar como influye en la inseguridad
alimentaria" 

df <- read.csv("https://raw.githubusercontent.com/beduExpert/Programacion-R-Santander-2022/main/Sesion-08/Postwork/inseguridad_alimentaria_bedu.csv")
"Limpiar los datos de NA y datos no existentes"
df.limpio <- df[complete.cases(df),]

attach(df.limpio)
logistic.general <- glm(IA ~ nse5f+area+numpeho+refin+edadjef+sexojef+añosedu+
                          ln_als+ln_alns,data = df.limpio, family = binomial)
summary(logistic.general)


"De este modelo podemos concluirla que a un intervalo de confianza del 95% sólo la
variable edadjef no es significativa pa explicar a inseguridad alimentaria. 

Procedemos a quitarla del modelo"

logistic.ajustado <- glm(IA ~ nse5f+area+numpeho+refin+sexojef+añosedu+
                           ln_als+ln_alns,data = df.limpio, family = binomial)
summary(logistic.ajustado)


"De este modelo ajustado podemos concluir la siguiente ecuación de predicción siendo Y la
inseguridad alimentaria:
y = 2.9874 - 0.3703*nse5f - 0.1025*area + 0.1740*numpeho + 0.3975*refin + 0.1556*sexojef - 0.0547*añosedu - 
0.0910*ln_als - 0.1032*ln_alns + epsilon
Es decir que:
1.- Por cada unidad en la que aumenta el nivel socioeconómica DISMINUYE exp(0.3703) veces la probabilidad de IA
2.- Por vivir en area urbana DISMINUYE exp(0.1025) veces la probabilidad de IA
3.- Por cada integrante adicional en el hogar AUMENTA exp(0.1740) veces la probabilidad de IA
4.- Por contar con ingreso adicional al laboral AUMENTA exp(0.3975) veces la probabilidad de IA
5.- Por cada año adicional en la edad del jefe de familia AUMENTA exp(0.1556) veces la probabilidad de IA
6.- Por cada año adicional de educación del jefe de familia DIMINUYE exp(0.0547) veces la probabilidad de IA
7 y 8 .- El gasto en alimentos saludables o no saludables DISMINUYEN la probabilidad de IA
"

"Calculamos la pseudo r2"
pseudo_r2 <- (logistic.ajustado$null.deviance - logistic.ajustado$deviance)/logistic.ajustado$null.deviance
pseudo_r2

"La pseudo R2 genera un valor de 0.0909" 