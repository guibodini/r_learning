# Primeiro comentário
1 + 1 

#Atribuir valores
x <-1
y = 2
z <- 5

#listando objetos
ls()
rm(x) #remove
ls()

#listar e remover todos objetos
rm(list = ls())
ls()

#Lista o conteúdo de um pacote
ls("package:datasets")

#retorna os ambientes de trabalho
search()

#diretorio atual
getwd()

list.files()

#fazendo comandos bash
x = system("ls -lh", intern = T)

#install packages
install.packages("ggplot2")

# installing packages from another origin

# GitHub
remotes::install_github("usuario/repo") #gerenciamento de pacotes "remote"

#ajuda com ggplot2
help(package = "ggplot2")

#carregar pacote
library("ggplot2")

help("ggplot2")

z <- 1 + 1
z

round(pi, digits = 2)

a <- 1
b <- 2
a > b

#strings compare

"R" == "r"
"2" > "3"

####vetores
numeros <- c(1, 2, 3, 4)
numeros

#acessando posicoes
numeros[3]

#elemento da última posicao
numeros[length(numeros)]

#é numérico
is.numeric(numeros)

#é numérico
is.numeric(numeros[1])

vetor2 <- c('k', 'p', 1, 1)
vetor2

class(vetor2)

###datas

datas <- c("2021-01-01", "2025-02-01")
class(datas)

class(as.Date(datas))
datas_d = as.Date(datas)
datas_d

#methods
methods(class = "numeric")

#Vetor nomeado (dicionário)
altura <- c("J" = 1.85,
           "B" = 1.73)

### criando meus vetores
seq1 <- seq(10, 1, by = -2)
seq1

seq2 <- seq(1:10)
seq2

#numeros aletorios
vet1 <- round(runif(60, min = 1, max = 5000))
vet1

#amostra aleatória
sample(vet1, 10, replace = FALSE)

#selecao de vetores
numeros[1]
numeros[c(1,3)]

altura        
altura[altura > 1.8]
altura["B"]
altura["B"] <- 1.96
altura

#adicionar ao vetor
altura = append(altura,
                value = c("I" = 1.56))
altura

sum(altura)
vetor3 = c(10, 10, 20)
mean(vetor3)

summary(vetor3)
var(vetor3)
table(vetor3)


#matrizes 2x3(lxc)
matriz <- matrix(1:4, nrow = 2)
matriz

#matriz 3x2
matriz2 <- matrix(1:6, nrow = 2)
matriz2

matriz3 <- matrix(1:8, nrow=2, byrow = F)
matriz3

matriz3[1,1]
matriz3[2,]

matriz + matriz2
det(matriz)
crossprod(matriz) # A * t(A)
tcrossprod(matriz) # t(A) * A
dim(matriz)

t(matriz)

#Data Frames

df <- data.frame(
  nome = c('J', 'A', 'B'),
  idade = c(18, 25, 60),
  altura = c(1.80, 1.75, 1.92)
)
df

dim(df)
nrow(df)
ncol(df)
names(df)

df$idade
df$nome
class(df$idade)

df$peso <- c(70, 65, 89)
df

df$peso <- NULL #remove a coluna peso

#dentro do R informacao faltante é NA, esperando receber é nulo

#elementos de um Df
df[2,]
df[,2]
df[, 'idade']

df$idade
df$idade[1]
head(df, 1)

#filtrando
str(df)
df[df$idade > 25, ]
df[df$idade > 10 & df$altura > 1.7, ]

subset(df, altura > 1.75) ##way better
subset(df, altura > 1.75, select = nome) ##way better

summary(df)
summary(df$idade)
df

df[order(df$altura),]


#data table
library(data.table)

meu_data_table <- data.table(
  nome = c('J', 'A', 'B'),
  idade = c(18, 25, 60),
  altura = c(1.80, 1.75, 1.92)
)

meu_data_table
dim(meu_data_table)
length(meu_data_table)
meu_data_table$idade

#seleção de elementos
meu_data_table[idade > 20, .(nome)]
meu_data_table[], .(media_altura = mean(altura), by = xx]

#lendo

dados <- read.table("caminho.txt",
                    header = T,
                    sep = ',',
                    dec = '.')
dados <- read.csv('')
dados <- data.table::fread('caminho/arquivo.csv') #normalmente identifica separadores
  
)

#converting
as.data.table() #todo data.table é um data.frame

#salvando dados

write.table()


