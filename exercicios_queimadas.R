install.packages("data.table")

# Carregue o banco de dados.
queimadas <- data.table::fread('Queimadas.csv')

# Verifique as primeiras linhas do banco de dados.
head(queimadas)

# Verifique as últimas linhas do banco de dados.
tail(queimadas)

# Verifique o sumário das informações.
summary(queimadas)

# Verifique a estrutura do banco de dados.
str(queimadas)

# Verifique o nome das colunas.
names(queimadas)

# Verifique a quantidade de linhas e colunas.
dim(queimadas)

# Verifique a quantidade de valores ausentes na coluna bioma e na coluna avg_frp.
sum(is.na(queimadas$bioma))
sum(is.na(queimadas$avg_frp))

# Quantas observações existem no bioma Caatinga com avg_numero_dias_sem_chuva menor do que 30?
queimadas[bioma == 'Caatinga' & avg_numero_dias_sem_chuva < 30, .N]

# Quantas observações existem no bioma Cerrado com avg_numero_dias_sem_chuva maior do que 50 ou avg_precipitacao maior do que 10?
queimadas[bioma == 'Cerrado' & (avg_numero_dias_sem_chuva > 50 | avg_precipitacao >10), .N]

# Qual a média de avg_frp para o bioma Mata Atlântica?
queimadas[bioma == 'Mata Atlântica', .(media_avg_frp = mean(avg_frp, na.rm = T))]

# Qual a média de avg_frp para o bioma Pantanal e avg_numero_dias_sem_chuva maior do que 30?
queimadas[bioma == 'Pantanal' & avg_numero_dias_sem_chuva > 30, .(media_avg_frp = mean(avg_frp, na.rm = T))]
