# instalando os recursos necessarios

install.packages("Benchmarking")
install.packages("ucminf")
install.packages("lpSolveAPI")
install.packages("dplyr")
install.packages("xlsx")


# Usando so recursos instalados
library(Benchmarking)
library(ucminf)
library(lpSolveAPI)
library(dplyr)
library(xlsx)
#Para remover todos os data.frame
#rm(saida_dea_2015)


# Manual DEA - Piter Borgetorf
# https://cran.r-project.org/web/packages/Benchmarking/Benchmarking.pdf

# lendo a base de dados

library(readxl)
dados_dea <- dados_dea <- read_excel("Consultorias/Karen_UnB/base_completa.xlsx", 
                                     sheet = "sul")

####################################################################
# Segregando dos dados por ano para calculo do DEA

#Input
nome<-subset(dados_dea,dados_dea$ano==2012, select = c("DMU"))

dados_2012_inp<-subset(dados_dea, dados_dea$ano==2012,
                   select = c("VALOR_TOTAL_ESCOLAS_PNAE"))
#Output
dados_2012_out<-subset(dados_dea, dados_dea$ano==2012,
                   select = c("QT_ALUNOS_PNAE"))
                              

# Transformando os dados em numericos - para estimar
dados_2012_inp<-data.frame(dados_2012_inp)
dados_2012_out<-data.frame(dados_2012_out)

# resultado de 2015
dea_2012<-dea(dados_2012_inp, dados_2012_out, RTS = "vrs", ORIENTATION = "out")

# salvando os resultados da eficiencia 
saida_dea_2012<-1/dea_2012$eff
saida_dea_2012<-data_frame(saida_dea_2012)
saida_dea_2012<-cbind(saida_dea_2012, nome)

# calculando os benchimark
bench_2012<-print(peers(dea_2012, NAMES = T), quote = F)
bench_2012<-data_frame(bench_2012)
bench_2012<-cbind(bench_2012,nome)
resultado_2012<-merge(saida_dea_2012,bench_2012, 
                      by=c("DMU"))

# na pasta em que está os dados irá aparecer uma planilha com o nome resultado
write.xlsx(resultado_2012,"Consultorias/Karen_UnB/dados_regiao/resultado_sul_2012_vrs.xlsx")


############################  2013     ##########################
# Input
dados_2013_inp<-subset(dados_dea, dados_dea$ano==2013,
                       select = c("VALOR_TOTAL_ESCOLAS_PNAE"))
#Output
dados_2013_out<-subset(dados_dea, dados_dea$ano==2013,
                       select = c("QT_ALUNOS_PNAE"))

# Transformando os dados em numericos - para estimar
dados_2013_inp<-data.frame(dados_2013_inp)
dados_2013_out<-data.frame(dados_2013_out)

# resultado de 2013
dea_2013<-dea(dados_2013_inp, dados_2013_out, RTS = "vrs", ORIENTATION = "out")

# salvando os resultados da eficiencia 
saida_dea_2013<-1/dea_2013$eff
saida_dea_2013<-data_frame(saida_dea_2013)
saida_dea_2013<-cbind(saida_dea_2013, nome)

# calculando os benchimark
bench_2013<-print(peers(dea_2013, NAMES = T), quote = F)
bench_2013<-data_frame(bench_2013)
bench_2013<-cbind(bench_2013,nome)
resultado_2013<-merge(saida_dea_2013,bench_2013, by=c("DMU"))

# na pasta em que está os dados irá aparecer uma planilha com o nome resultado
write.xlsx(resultado_2013,"Consultorias/Karen_UnB/dados_regiao/resultado_sul_2013_vrs.xlsx")


############################  2014    ##########################
# Input
dados_2014_inp<-subset(dados_dea, dados_dea$ano==2014,
                       select = c("VALOR_TOTAL_ESCOLAS_PNAE"))
#Output
dados_2014_out<-subset(dados_dea, dados_dea$ano==2014,
                       select = c("QT_ALUNOS_PNAE"))

# Transformando os dados em numéricos - para estimar
dados_2014_inp<-data.frame(dados_2014_inp)
dados_2014_out<-data.frame(dados_2014_out)

# resultado de 2014
dea_2014<-dea(dados_2014_inp, dados_2014_out, RTS = "vrs", ORIENTATION = "out")

# salvando os resultados da eficiencia 
saida_dea_2014<-1/dea_2014$eff
saida_dea_2014<-data_frame(saida_dea_2014)
saida_dea_2014<-cbind(saida_dea_2014, nome)

# calculando os benchimark
bench_2014<-print(peers(dea_2014, NAMES = T), quote = F)
bench_2014<-data_frame(bench_2014)
bench_2014<-cbind(bench_2014,nome)
resultado_2014<-merge(saida_dea_2014,bench_2014, by=c("DMU"))

# na pasta em que está os dados irao aparecer uma planilha com o nome resultado
write.xlsx(resultado_2014,"Consultorias/Karen_UnB/dados_regiao/resultado_sul_2014_vrs.xlsx")


############################  2015   ##########################
# Input
dados_2015_inp<-subset(dados_dea, dados_dea$ano==2015,
                       select = c("VALOR_TOTAL_ESCOLAS_PNAE"))
#Output
dados_2015_out<-subset(dados_dea, dados_dea$ano==2015,
                       select = c("QT_ALUNOS_PNAE"))

# Transformando os dados em numericos - para estimar
dados_2015_inp<-data.frame(dados_2015_inp)
dados_2015_out<-data.frame(dados_2015_out)

# resultado
dea_2015<-dea(dados_2015_inp, dados_2015_out, RTS = "vrs", ORIENTATION = "out")

# salvando os resultados da eficiencia 
saida_dea_2015<-1/dea_2015$eff
saida_dea_2015<-data_frame(saida_dea_2015)
saida_dea_2015<-cbind(saida_dea_2015, nome)

# calculando os benchimark
bench_2015<-print(peers(dea_2015, NAMES = T), quote = F)
bench_2015<-data_frame(bench_2015)
bench_2015<-cbind(bench_2015,nome)
resultado_2015<-merge(saida_dea_2015,bench_2015, by=c("DMU"))

# na pasta em que está os dados irao aparecer uma planilha com o nome resultado
write.xlsx(resultado_2015,"Consultorias/Karen_UnB/dados_regiao/resultado_sul_2015_vrs.xlsx")
########################################## 

############################  2016   ##########################
# Input
dados_2016_inp<-subset(dados_dea, dados_dea$ano==2016,
                       select = c("VALOR_TOTAL_ESCOLAS_PNAE"))
#Output
dados_2016_out<-subset(dados_dea, dados_dea$ano==2016,
                       select = c("QT_ALUNOS_PNAE"))

# Transformando os dados em numericos - para estimar
dados_2016_inp<-data.frame(dados_2016_inp)
dados_2016_out<-data.frame(dados_2016_out)

# resultado
dea_2016<-dea(dados_2016_inp, dados_2016_out, RTS = "vrs", ORIENTATION = "out")

# salvando os resultados da eficiencia 
saida_dea_2016<-1/dea_2016$eff
saida_dea_2016<-data_frame(saida_dea_2016)
saida_dea_2016<-cbind(saida_dea_2016, nome)

# calculando os benchimark
bench_2016<-print(peers(dea_2016, NAMES = T), quote = F)
bench_2016<-data_frame(bench_2016)
bench_2016<-cbind(bench_2016,nome)
resultado_2016<-merge(saida_dea_2016,bench_2016, by=c("DMU"))

# na pasta em que estarao os dados irao aparecer uma planilha com o nome resultado
write.xlsx(resultado_2016,"Consultorias/Karen_UnB/dados_regiao/resultado_sul_2016_vrs.xlsx")


############################  2017   ##########################
# Input
dados_2017_inp<-subset(dados_dea, dados_dea$ano==2017,
                       select = c("VALOR_TOTAL_ESCOLAS_PNAE"))
#Output
dados_2017_out<-subset(dados_dea, dados_dea$ano==2017,
                       select = c("QT_ALUNOS_PNAE"))

# Transformando os dados em numericos - para estimar
dados_2017_inp<-data.frame(dados_2017_inp)
dados_2017_out<-data.frame(dados_2017_out)

# resultado
dea_2017<-dea(dados_2017_inp, dados_2017_out, RTS = "vrs", ORIENTATION = "out")

# salvando os resultados da eficiencia 
saida_dea_2017<-1/dea_2017$eff
saida_dea_2017<-data_frame(saida_dea_2017)
saida_dea_2017<-cbind(saida_dea_2017, nome)

# calculando os benchimark
bench_2017<-print(peers(dea_2017, NAMES = T), quote = F)
bench_2017<-data_frame(bench_2017)
bench_2017<-cbind(bench_2017,nome)
resultado_2017<-merge(saida_dea_2017,bench_2017, by=c("DMU"))

# na pasta em que estrao os dados irao aparecer uma planilha com o nome resultado
write.xlsx(resultado_2017,"Consultorias/Karen_UnB/dados_regiao/resultado_sul_2017_vrs.xlsx")


############################  2018   ##########################
# Input
dados_2018_inp<-subset(dados_dea, dados_dea$ano==2018,
                       select = c("VALOR_TOTAL_ESCOLAS_PNAE"))
#Output
dados_2018_out<-subset(dados_dea, dados_dea$ano==2018,
                       select = c("QT_ALUNOS_PNAE"))

# Transformando os dados em numericos - para estimar
dados_2018_inp<-data.frame(dados_2018_inp)
dados_2018_out<-data.frame(dados_2018_out)

# resultado
dea_2018<-dea(dados_2018_inp, dados_2018_out, RTS = "vrs", ORIENTATION = "out")

# salvando os resultados da eficiencia 
saida_dea_2018<-1/dea_2018$eff
saida_dea_2018<-data_frame(saida_dea_2018)
saida_dea_2018<-cbind(saida_dea_2018, nome)

# calculando os benchimark
bench_2018<-print(peers(dea_2018, NAMES = T), quote = F)
bench_2018<-data_frame(bench_2018)
bench_2018<-cbind(bench_2018,nome)
resultado_2018<-merge(saida_dea_2018,bench_2018, by=c("DMU"))

# na pasta em que estrao os dados irao aparecer uma planilha com o nome resultado
write.xlsx(resultado_2018,"Consultorias/Karen_UnB/dados_regiao/resultado_sul_2018_vrs.xlsx")
############################  FIM   ##########################
