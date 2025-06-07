## Visualização de dados 
# GGPLOT - a ordem importa!
data(mpg)
require(ggplot)

#dispersão - duas variáveis numéricas, observar o comportamento de uma na presença da outra

ggplot(data = mpg) +
  aes(x = displ, y = hwy) +
  geom_point() +
  scale_x_continuous(limits = c(0, 10)) +
  scale_y_continuous() +
  stat_summary(aes(color = 'red')) +
  coord_flip() +
  xlab("Engine displacement") +
  ylab("Highway miles per gallon") +
  facet_wrap(~class) +
  theme_bw()+
  theme(text = element_text((size =20)))


iris %>% 
  ggplot() +
  aes(x = Petal.Length, 
      y = Petal.Width,
      colour = Species,
      size = Sepal.Length,
      alpha = Sepal.Width) + 
  geom_point() +
  scale_size(range = c(0.1, 3)) + 
  labs(x = 'Petal Length', 
       y = 'Petal Width',
       title = 'Gráfico de dispersão',
       caption = 'Dados:Iris') +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = 'bold'),
        legend.position = 'bottom',
        text = element_text(size = 20))


#gráfico de linhas

iris %>% 
  ggplot() +
  aes(x = Petal.Length, 
      y = Petal.Width,
      colour = Species,
      linetype = Species) + 
    geom_line() +
   # geom_point() +
  scale_size(range = c(0.1, 3)) + 
  labs(x = 'Petal Length', 
       y = 'Petal Width',
       title = 'Gráfico de Linha',
       caption = 'Dados:Iris') +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = 'bold'),
        legend.position = 'bottom',
        text = element_text(size = 20))

# Gráficos de barras
iris %>% 
  count(Species) %>% 
  ggplot() +
  aes(x = Species, 
      y = n, 
      color = Species, 
      fill = Species) +
  geom_bar(stat = "identity")

# Histograma

iris %>% 
  ggplot() +
  aes(x = Sepal.Length) +
  geom_histogram(color = "red", 
                 fill = "salmon", 
                 bins = 15)

hist(iris$Sepal.Length)

# Densidade

iris %>% 
  ggplot() +
  aes(x = Sepal.Length, 
      color = Species, 
      fill = Species) +
  geom_density(alpha = 0.55)

# Boxplot e violin

iris %>% 
  ggplot() +
  aes(x = Species, y = Sepal.Length, fill = Species) +
  geom_boxplot()

iris %>%
  ggplot() +
  aes(x = Species, y = Sepal.Length, fill = Species) +
  geom_violin() + 
  geom_boxplot(width = 0.1, fill = "white")

iris %>% 
  ggplot() +
  aes(x = Species, y = Sepal.Length, fill = Species) +
  geom_violin() + 
  geom_boxplot(width = 0.1, fill = "white") +
  labs(title = "Distribuição do comprimento das sépalas por espécie",
       x = "Espécie",
       y = "Comprimento das sépalas") +
  scale_y_continuous(limits = c(4, 8)) +
  theme(legend.position = "bottom",
        plot.background = element_rect(fill = "lightblue"), 
        panel.background = element_rect(fill = "lightblue"),
        panel.grid = element_line(color = ""),
        legend.background = element_rect(fill = "lightblue"),
        legend.title = element_text(color = "blue", 
                                    size = 15),
        text = element_text(color = "blue", 
                            size = 15))

p1 = ggplot(palmerpenguins::penguins) +
  aes(
    x = body_mass_g,
    y = flipper_length_mm,
    colour = species,
    shape = sex
  ) +
  geom_point(size = 2.75) +
  scale_color_viridis_d(option = "viridis", direction = 1) +
  labs(
    x = "mass (kg)",
    y = "tamanho da asa (mm)",
    title = "Gráfico de dispersão",
    subtitle = "Peso x tamanho da asa",
    caption = "Dados palmer pinguins",
    color = "species",
    shape = "sex"
  ) +
  ggthemes::theme_stata() +
  theme(
    plot.title = element_text(face = "bold",
                              hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5)
  ) +
  facet_wrap(vars(species))

p2 = ggplot(palmerpenguins::penguins) +
  aes(
    x = body_mass_g,
    y = flipper_length_mm,
    colour = species,
    shape = sex
  ) +
  geom_line(size = 2.75) +
  scale_color_viridis_d(option = "viridis", direction = 1) +
  labs(
    x = "mass (kg)",
    y = "tamanho da asa (mm)",
    title = "Gráfico de dispersão",
    subtitle = "Peso x tamanho da asa",
    caption = "Dados palmer pinguins",
    color = "species",
    shape = "sex"
  ) +
  ggthemes::theme_stata() +
  theme(
    plot.title = element_text(face = "bold",
                              hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5)
  ) +
  facet_wrap(vars(species))

require(patchwork)
p1 + p2
p1 / p2 + patchwork::plot_annotation(tag_levels = 'A')

pdf("DSBD_20251/export_fig.pdf", width = 10, height = 10)

Cairo::CairoPDF("export_fig.pdf",  width = 10, height = 10)
p1 + p2
dev.off()

# Exercícios

mtcars %>%
  ggplot() +
  aes(x = mpg, 
      y = wt, 
      colour = cyl,
      size = hp) +
  geom_point() + 
  scale_size(range = c(0.1, 3))
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = 'bold'),
        legend.position = 'bottom',
        text = element_text(size = 20))
  
  mtcars %>%
    ggplot() +
    aes(x = mpg, 
        y = wt, 
        colour = cyl) +
    geom_line() + 
  theme_minimal()
  
  
  