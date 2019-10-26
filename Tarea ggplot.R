##################################################
############     Ggplot2  ########################
##################################################

# Ggplot2   -------------------------------------------------

## Utilizando los datos de iris

## Ejercicio 1. Usando el paquete "emoGG" y "ggplot2" definir un emoji por especie en un grafico de dispersión
#devtools::install_github("dill/emoGG") #Instalar el paquete emoGG

ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, color = Species)) + 
  theme_bw() +
  geom_emoji(data = iris[iris$Species == "setosa", ], emoji = "1f337",size=0.03) + #Tulipan
  geom_emoji(data = iris[iris$Species == "virginica", ], emoji = "1f33a", size=0.03)+ # Hibiscus
  geom_emoji(data = iris[iris$Species == "versicolor", ], emoji = "1f338", size=0.03) # cherry_blossom


## Ejercicio 2. Construir una grafica con las líneas de regresión por especie, pero modificar en itálica los nombres de las especies en la leyenda

ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + 
  geom_point()+ #Podemos también incluir los puntos de dispersión
  geom_smooth(method = "lm",se = TRUE) + # Con método lm y con el intervalo de confianza
  scale_color_brewer(name = "Especies", palette = "Set2",labels=c(expression(paste(italic("I. setosa"))),expression(paste(italic("I. versicolor"))),expression(paste(italic("I. virginica"))))) +
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "grey"))+## Definimos el tema (fondo, bordes...)
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el título
       subtitle = "Data: Iris con lm e intervalo de confianza") + #Definimos subtítulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 


## Ejercicio 3. Construir una gráfica con las líneas de regresión por especie, incluir el valor de p, r2 y formula (Pista: Usar la función stat_poly_eq)


ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + 
  geom_point()+ #Podemos también incluir los puntos de dispersión
  geom_smooth(method = lm, se = TRUE, formula = y~x, alpha= 0.18, size = 1.1) + # Con método lm y con el intervalo de confianza
  stat_poly_eq(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               label.x.npc = "right", label.y.npc = 0.9,
               formula = y~x, parse = TRUE, size = 4, position = "identity")+
  scale_color_brewer(name = "Especies", palette = "Set2",labels=c(expression(paste(italic("I. setosa"))),expression(paste(italic("I. versicolor"))),expression(paste(italic("I. virginica"))))) +
  theme_bw() + theme(panel.border = element_blank(), 
                     panel.grid.major = element_blank(), 
                     panel.grid.minor = element_blank(), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  labs(title = "Longitud del sepalo Vs. Ancho del sepalo", #Definimos el título
       subtitle = "Data: Iris regresión") + #Definimos subtítulo
  labs(x = "Longitud del sepalo", y = "Ancho del sepalo")#Definimos los nombres de los ejes 


## Ejercicio 4. Cree su propio theme donde las majorgrid sean verdes, las minorgrid de color rosado, el fondo de la grafica de color azul, el margen derecho y el margen superior no apa

mi_tema

ggplot(data=mi_tema, aes(x=Cuerda_alar, y=Longitud_total, color=Especie)) + 
  geom_point()+ #Podemos también incluir los puntos de dispersión
  geom_smooth(method = "lm",se = TRUE) + # Con método lm y con el intervalo de confianza
  theme_bw() + theme(panel.background = element_rect(fill = "blue", colour = "white"),
                     panel.border = element_blank(),
                     panel.grid.major = element_line(colour = "green"), 
                     panel.grid.minor = element_line(colour = "pink"), 
                     axis.line = element_line(colour = "white"))+## Definimos el tema (fondo, bordes...)
  scale_colour_discrete(name = "Especies")+
  labs(title = "Cuerda alar Vs. Longitud total", #Definimos el título
       subtitle = "Data: Mi tema") + #Definimos subtítulo
  labs(x = "Cuerda alar (cm)", y = "Longitud total (cm)")#Definimos los nombres de los ejes 



