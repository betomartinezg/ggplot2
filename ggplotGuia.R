## Guía Ggplot 

#Ggplot consiste en adición de capas. Sus componentes principales son data (dataframe), Aesthetics (Se usa para definir X y Y. También permite definir color, size o shape de puntos, height de barras, etc...) y Geometry (Corresponde al tipo de grafico; histogram, box plot, line plot, density plot, etc...)

### Instalar y cargar el paquete ggplot2 

###install.packages('ggplot2') #Instalar paquete

library(ggplot2) #Cargar paquete

### Datos

# Cargar datos
data(iris)
# Iris : Contiene datos sobre 3 especies de plantas del género Iris: iris setosa, iris versicolor e iris virginica. 

head(iris) #Revisar qué contiene iris


##########################################################################################
### GRAFICA BASE: Definimos el tema base
# Aún no graficamos puntos, líneas o áreas


ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + #Graficar solo la base del gráfico (Ejes y etiqueta de ejes)
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white")) +## Definimos el tema (fondo, bordes...)
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el título
       subtitle = "Data: Iris") + #Definimos subtítulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes
 
#########################################################################################
### GRAFICA PUNTOS

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + #Grafico base 
  geom_point() + # Añadimos la capa de puntos
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el título
       subtitle = "Data: Iris con puntos") + #Definimos subtítulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes

####### Ahora definimos el color por especie

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + #Grafico base 
  geom_point(shape=21) + # Añadimos la capa de puntos
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el título
       subtitle = "Data: Iris con puntos y color") + #Definimos subtítulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 
  

#Podemos usar cualquier forma que queramos, ejemplo:

#ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + 
 # geom_point(shape = 11) + # Usamos la forma de la estrella de David
  #theme_bw() + theme(panel.border = element_blank(), 
   #                panel.grid.major = element_blank(), 
    #               panel.grid.minor = element_blank(), 
     #              axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  #scale_colour_discrete(name = "Especies")+
  #labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el título
   #    subtitle = "Data: Iris con la estrella de David y color") + #Definimos subtítulo
  #labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes

#ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color= Species)) + 
 # geom_point(shape = 64) + #Usamos la forma del arroba (@)
  #theme_bw() + theme(panel.border = element_blank(), 
   #             panel.grid.major = element_blank(), 
    #           panel.grid.minor = element_blank(), 
     #         axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  #scale_colour_discrete(name = "Especies")+
  #labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el título
   # subtitle = "Data: Iris con arroba y color") + #Definimos subtítulo
  #labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes



#########################################################################################
### GRAFICA BARRAS 


ggplot(data=iris, aes(x=Species, y=Sepal.Length, fill=Species)) + 
  geom_col()+ #Grafico de barras basico, color por especie
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo por especie", #Definimos el título
       subtitle = "Data: Iris grafico de barras") + #Definimos subtítulo
  labs(x = "Especies", y = "Longitud del sepalo")#Definimos los nombres de los ejes 

### GRAFICA HISTOGRAMAS


ggplot(data=iris) + 
  geom_histogram(aes(x = Sepal.Width, fill = Species), 
                 bins = 12, position = "identity", alpha = 0.4) + # Ya que las columnas se sobrelapan usamos un alpha para trasparentar
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  labs(title = "Longitud del sepalo por especie", #Definimos el título
       subtitle = "Data: Iris histograma") + #Definimos subtítulo
  labs(x = "Especies", y = "Ancho del sepalo")#Definimos los nombres de los ejes 


#Podemos graficar dado variables discretas como especies? Revisar facet_wrap
ggplot(data=iris) + 
  geom_histogram(aes(x = Sepal.Width, fill = Species), bins = 12) + 
  facet_wrap(~Species, ncol = 1)+
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  labs(title = "Longitud del sepalo por especie", #Definimos el título
       subtitle = "Data: Iris histograma") + #Definimos subtítulo
  labs(x = "Ancho del sepalo", y = "Conteo")#Definimos los nombres de los ejes 


#########################################################################################
### GRAFICA LÍNEAS (Smooth)

#Graficamos con el método loess y el intervalo de confianza

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) +  
  geom_smooth(method = "loess", se=TRUE) + #  Método loess y con el intervalo
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el título
       subtitle = "Data: Iris con líneas e intervalo de confianza") + #Definimos subtítulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 

## Podemos quitar el intervalo de confianza

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) +  
  geom_smooth(method = "loess",se = FALSE) + # Con método loess y sin el intervalo de confianza
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el título
       subtitle = "Data: Iris con líneas y sin intervalo de confianza") + #Definimos subtítulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 

### Existen otros métodos para graficar, por ejemplo lm
## Revisar otros métodos como: "auto", "glm", "gam"


ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width)) + 
  geom_point()+ #Podemos también incluir los puntos de dispersión
  geom_smooth(method = "lm",se = TRUE) + # Con método lm y con el intervalo de confianza
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el título
       subtitle = "Data: Iris con lm e intervalo de confianza") + #Definimos subtítulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 

# Podemos graficar una línea de regresión por especie?

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + 
  geom_point()+ #Podemos también incluir los puntos de dispersión
  geom_smooth(method = "lm",se = TRUE) + # Con método lm y con el intervalo de confianza
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el título
       subtitle = "Data: Iris con lm e intervalo de confianza") + #Definimos subtítulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 



##################################################################################################
############################ Actividades adicionales #############################################
##################################################################################################
# 1. Construyan su propio tema

# 2. Usando el paquete "emoGG" y "ggplot2" definir un emoji por especie en un grafico de dispersión
#devtools::install_github("dill/emoGG") #Instalar el paquete emoGG

# 3. Construir una grafica con las líneas de regresión por especie, pero modificar en itálica los nombres de las especies en la leyenda

# 4. Construir una gráfica con las líneas de regresión por especie, incluir el p, r2 y formula (Pista: Usar la función stat_poly_eq del paquete "ggpmisc")


##################################################################################################
############################# Literatura recomendada #############################################
##################################################################################################

# 1. http://www.ievbras.ru/ecostat/Kiril/R/Biblio_N/R_Eng/Wickham2016.pdf
# 2. https://stat545.com/graphics-overview.html
# 3. https://github.com/jennybc/ggplot2-tutorial
# 4. http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
