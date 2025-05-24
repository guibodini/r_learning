#estruturas condicionais

#Switch - tipo case

## Versões vetoriais - if else

# Notas
notas <- c("João" = 7.3,
           "Maria" = 5.1, 
           "Pedro" = 8.9, 
           "Ana" = 6.5)

# ifelse
ifelse(notas >= 7, "Aprovado", 
       ifelse(notas >= 4, 
              "Recuperação", "Reprovado"))

## Versões vetoriais - case when
# Utilizando o case_when
dplyr::case_when(notas >= 7 ~ "Aprovado",
                 notas >= 4 ~ "Recuperação",
                 TRUE ~ "Reprovado")

x <- 5
y <- 6
  
if (x > 0 & y > 0) {
  print("Você está no primeiro quadrante")
} else if (x < 0 & y > 0){
  print("Você está no segundo quadrante")
} else if (x < 0 & y < 0){
  print("Você está no terceiro quadrante")
} else if (x > 0 & y < 0){
  print("Você está no quarto quadrante")
}


numero <- 13

if (numero %% 2 == 0){
  print("O número é par")
} else {
  print("O número é ímpar")
}


#estruturas de repetição

for (i in 1:20){
  print(i)
}

pares = seq(from = 2, to = 10, by = 2)
pares
vetor = numeric(length(pares))
for(j in pares){
  print(j)
  vetor[j]
}

# Número de lançamentos
n <- 100
soma <- numeric(n)
for (i in 1:n) {
  # Lançamento dos dados
  dado1 <- sample(1:6, 1, replace = FALSE)
  dado2 <- sample(1:6, 1, replace = FALSE)
  
  # Soma dos valores
  soma[i] <- dado1 + dado2
}
table(soma)

#exercício fibonacci

n =10
fibo <- numeric(n)
fibo[1] <- 1
fibo[2] <- 1
for (i in 3:n){
    fibo[i] <- fibo[i -1] + fibo[i -2]
}
fibo

#exercico matriz

l <- 3
c <- 3
tam = round(runif(l*c, min=1, max=50))
print(tam)
matriz <- matrix(tam, nrow = 3)
matriz
matriz_resultado <- matrix(NA, nrow = 3)

for(i in 1:n){
  for(j in 1:n){
    if(matriz[i, j] %% 2 == 0){
      print("o elemento é par")
      matriz_resultado[i, j] == 'P'
    }
    else{
      print("o elemento é ímpar")
      matriz_resultado[i, j] == 'I'
    }
  }
}

i <- 1
while (i <= 5) {
  print(i)
  i <- i + 1
}

soma <- 0
n <- 0

while (soma <= 5) {
  dado1 <- sample(1:6, 1, replace = FALSE)
  dado2 <- sample(1:6, 1, replace = FALSE)
  soma <- dado1 + dado2
  n <- n + 1
}
n
soma


# Inicialização dos dois primeiros números

Fibonacci <- c(1, 1)
i <- 3
while (Fibonacci[i - 1] + Fibonacci[i - 2] <= 10000) {
  Fibonacci[i] <- Fibonacci[i - 1] + Fibonacci[i - 2]
  i <- i + 1
}
Fibonacci


### ex bactérias

bacterias <- 100
ciclo <- 0

while(bacterias*2 < 10000000){
  bacterias <- bacterias * 2
  ciclo = ciclo + 1
  print(paste("Ciclo atual é ", ciclo))
  print(paste("Número de bactérias: ", bacterias))
}

bacterias
ciclo

##repeat
i <- 1
repeat {
  print(i)
  i <- i + 1
  if (i > 5) {
    break
  }
}

soma <- 0
n <- 0

repeat {
  dado1 <- sample(1:6, 1, replace = FALSE)
  dado2 <- sample(1:6, 1, replace = FALSE)
  soma <- dado1 + dado2
  n <- n + 1
  if (soma < 5) {
    break
  }
}
n
soma


##funcoes
cv <- function(x) {
  "aa"
  desvio <- sd(x)
  media <- mean(x)
  cv <- desvio / media
  return(list(cv = cv, 
              desvio = desvio,
              media = media))
}

y <- c(10, 20, 30, 40, 50)
cv(y)

#exercicios aula3
#1
classifica_combustivel <- function(name){
  if(name == 'Carro'){
    return("Gasolina, Diesel")
  } else if(name == 'Moto'){
    return('Gasolina')
  } else{
    print("Valor desconhecido")
  }
                
}
classifica_combustivel(name='Carro')

