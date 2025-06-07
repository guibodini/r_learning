#exercicios aula 2

#1.Crie um vetor com 10 números 
vet10 <- round(runif(10, 
                     min = 1, 
                     max = 100))
vet10

#2.Calcule a média, mediana, variância e desvio padrão do vetor criado
mean(vet10)
median(vet10)
var(vet10)
sd(vet10)

#3.Crie uma matriz 3x3 com números inteiros de 1 a 9.
matriz_3x3 <- matrix(1:9, nrow = 3)
matriz_3x3

#4.Selecione o elemento da segunda linha e terceira coluna da matriz criada
matriz_3x3[2, 3]

#5.Calcule a soma dos elementos da primeira linha da matriz
sum(matriz_3x3[1,])

#6.Crie uma matriz 3x3 com números aleatórios de 1 a 10
r_number <- round(runif(9, min = 1, max = 10))
matriz_r <- matrix(r_number, nrow = 3)
matriz_r

#7.Calcule a transposta da matriz criada
transp = t(matriz_r)
transp

#8.Matriz * sua transposta
matriz_r %*% transp
