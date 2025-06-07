## Aula 04

## Tidy verse
install.packages("tidyverse")
install.packages("magrittr")

## Carregando tidyverse
library(tidyverse)
dados <- readr::read_csv("Mental Health Dataset.csv")
head(dados,2)
glimpse(dados)

# Operador pipe para encadear funções
x <- c(-2:2)
require(magrittr)
y = x %>% #é equivalente a f(x)
  unique() %>%
  cos() %>%
  sort(decreasing = T)

# Pipe atribuição
x <- 1:10
x
x %<>% log()
x
y %<>% multiply_by(4)
y


## Mutate
dados <- dados %>% 
  mutate(mercosul = ifelse(Country %in%
                             c("Argentina", "Brazil", "Paraguay", "Uruguay"),
                           "Mercosul", "Não Mercosul"))
glimpse(dados)


# Select (colunas/variaveis)
dados2 <- dados %>% 
  select(Country, Timestamp, Days_Indoors, mercosul)
glimpse(dados2)

dados3 <- dados %>% 
  select(3:5)
glimpse(dados3)

dados6 <- dados %>% 
  select(starts_with("t"))
glimpse(dados6)

dados7 <- dados %>%
  select(ends_with("s"))
glimpse(dados7)

dados12 <- dados %>% 
  select_if(is.character)
glimpse(dados12)

dados13 <- dados %>%
  select(any_of("treatment"))
glimpse(dados13)

dados14 <- dados %>%
  select(-c(Timestamp))

# Filtrar (observações/linhas)

library(data.table)
car_crash <- fread("Brazil Total highway crashes 2010 - 2023.csv.gz")

car_crash2 <- car_crash %>% 
  filter(tipo_de_ocorrencia == "sem vítima")
glimpse(car_crash2)

car_crash3 <- car_crash %>% 
  filter(tipo_de_ocorrencia == "sem vítima" & automovel >= 3)

car_crash4 <- car_crash %>%
  filter(between(automovel, 3, 5))
glimpse(car_crash4)

## %IN%
car_crash5 <- car_crash %>% 
  filter(tipo_de_ocorrencia %in% c("sem vítima", "com vítima"))

`%ni%` <- Negate(`%in%`)

car_crash10 = car_crash %>%
  select(automovel) %>%
  arrange(desc(automovel)) %>%
  na.exclude()
head(car_crash10)

car_crash %>%
  rename(numero_automoveis = automovel)

# Exercícios
# 1
storms %>% View()

storms %>%
  filter(status == 'tropical depression') %>%
  nrow()

storms %>%
  filter(status == 'tropical depression' & wind >= 40) %>%
  nrow()

storms %>%
  select_if(is.numeric) %>%
  arrange(pressure)

# Sumarizando
car_crash13 = car_crash %>% 
  summarise(total_automoveis = sum(automovel, na.rm = TRUE))
car_crash13

# Group by
car_crash %>%
  filter(tipo_de_ocorrencia %ni% c("sem vítima", "com vítima")) %>%
  mutate(ano = year(dmy(data))) %>%
  group_by(ano) %>%
  summarise(n = n(), 
            n_automoveis = sum(automovel, na.rm = T))

# Exercícios 2
starwars %>% view()
starwars %>%
  summarise(species_unique = n_distinct(species))

starwars %>%
  group_by(species) %>%
  summarise(freq = n())

starwars %>%
  group_by(gender) %>%
  summarise(altura_media = mean(height, na.rm = T))
  
starwars %>%
  filter(sex == "male") %>%
  group_by(species) %>%
  summarise(n = n(), peso_medio= mean(mass, na.rm = T))
  
starwars %>%
  select(name, species, mass) %>%
  group_by(species) %>%
  mutate(max_peso = max(mass, na.rm = T)) %>%
  filter(max_peso == mass)

# Datas

car_crash %>% 
  mutate(data = dmy(data)) %>%
  mutate(ano = year(data),
         mes = month(data),
         dia = day(data)) %>%
  select(data, ano, mes, dia) %>%
  head()

car_crash %>% 
  mutate(data = dmy(data)) %>%
  mutate(dias_desde_acidente = difftime(Sys.Date(), data, units = "days")) %>%
  select(data, dias_desde_acidente) %>%
  head()


# Exercícios
car_crash %>%
  mutate(data = dmy(data)) %>%
  mutate(mes = month(data)) %>%
  group_by(mes)

tabela1 <- data.frame(id = c(1, 2, 3, 4),
                      nome = c("João", "Maria", "José", "Ana"))
tabela1

tabela2 <- data.frame(id = c(1, 2, 5, 6),
                      idade = c(20, 25, 30, 35))
tabela2

library(dplyr)
library(nycflights13)

require(nycflights13)
glimpse(flights)
glimpse(weather)

flights %>%
  filter(arr_delay > 12*60 | dep_delay > 12*60) %>%
  inner_join(weather, by = c("time_hour")) %>%
  group_by(month) %>% 
  summarise(total_atrasos = n(),
            mean_temp = mean(temp, na.rm = T),
            mean_dewp = mean(dewp, na.rm = T),
            mean_humid = mean(humid, na.rm = T),
            mean_wind_speed = mean(wind_speed, na.rm = T),
            mean_precip = mean(precip, na.rm = T)
  ) %>% 
  arrange(desc(total_atrasos))
  

flights %>% 
  group_by(dest) %>% 
  summarise(total_voos = n()) %>% 
  arrange(desc(total_voos)) %>% 
  head(20) %>% 
  inner_join(airports, by = c("dest" = "faa"))


# Tidy data
table1 %>% 
  pivot_longer(cols = c(cases, population), 
               names_to = "variable", 
               values_to = "total")

stringr::str_splt(table3$rate, "/", simplify = T) %>%
  as.data.frame()
