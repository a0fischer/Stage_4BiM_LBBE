rm(list = ls())

#################
###    GOAL   ###
#################
#This file aims at displaying correlations curves for C.intestinalis and C.robusta 

###################
###    DATA     ###
###################

#C.robusta recombination map
rob <- read.table(file = "./BedFiles/c.robusta_ldhat_recombi_map.bed", header = FALSE, sep = '\t', dec = ".")

#C.robusta recombination map
int <- read.table(file = "./BedFiles/c.intestinalis_ldhat_recombi_map.bed", header = FALSE, sep = '\t', dec = ".")

#C.robusta recombination map smoothed at 1Mb, 100kb, 1kb
rob_1Mb <- read.table(file = "./BedFiles/c.robusta_GC_bins_1Mb.bed", header = FALSE, sep = '\t', dec = ".")
rob_100kb <- read.table(file = "./BedFiles/c.robusta_GC_bins_100kb.bed", header = FALSE, sep = '\t', dec = ".")
rob_1kb <- read.table(file = "./BedFiles/c.robusta_GC_bins_1kb.bed", header = FALSE, sep = '\t', dec = ".")

#C.intestinalis recombination map smoothed at 1Mb, 100kb, 1kb
int_1Mb <- read.table(file = "./BedFiles/c.intestinalis_GC_bins_1Mb.bed", header = FALSE, sep = '\t', dec = ".")
int_100kb <- read.table(file = "./BedFiles/c.intestinalis_GC_bins_100kb.bed", header = FALSE, sep = '\t', dec = ".")
int_1kb <- read.table(file = "./BedFiles/c.intestinalis_GC_bins_1kb.bed", header = FALSE, sep = '\t', dec = ".")

#Fichiers C.robusta (j'ai pas trouvé plus efficace :/)
rob_chr1_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome1_summary.txt"
rob_chr2_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome2_summary.txt"
rob_chr3_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome3_summary.txt"
rob_chr4_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome4_summary.txt"
rob_chr5_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome5_summary.txt"
rob_chr6_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome6_summary.txt"
rob_chr7_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome7_summary.txt"
rob_chr8_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome8_summary.txt"
rob_chr9_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome9_summary.txt"
rob_chr10_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome10_summary.txt"
rob_chr11_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome11_summary.txt"
rob_chr12_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome12_summary.txt"
rob_chr13_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome13_summary.txt"
rob_chr14_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.robusta/c_robusta_chromosome14_summary.txt"

c_robusta <- c(rob_chr1_data, rob_chr2_data, rob_chr3_data, rob_chr4_data, rob_chr5_data, rob_chr6_data, rob_chr7_data, rob_chr8_data, rob_chr9_data, rob_chr10_data, rob_chr11_data, rob_chr12_data, rob_chr13_data, rob_chr14_data)

#Fichiers C.intestinalis
int_chr1_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome1_summary.txt"
int_chr2_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome2_summary.txt"
int_chr3_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome3_summary.txt"
int_chr4_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome4_summary.txt"
int_chr5_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome5_summary.txt"
int_chr6_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome6_summary.txt"
int_chr7_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome7_summary.txt"
int_chr8_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome8_summary.txt"
int_chr9_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome9_summary.txt"
int_chr10_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome10_summary.txt"
int_chr11_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome11_summary.txt"
int_chr12_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome12_summary.txt"
int_chr13_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome13_summary.txt"
int_chr14_data <- "/home/aureliefischer/Documents/Projet_Cione/RecRates/vcf_phasing/C.intestinalis/c_int_chromosome14_summary.txt"

c_intestinalis <- c(int_chr1_data, int_chr2_data, int_chr3_data, int_chr4_data, int_chr5_data, int_chr6_data, int_chr7_data, int_chr8_data, int_chr9_data, int_chr10_data, int_chr11_data, int_chr12_data, int_chr13_data, int_chr14_data)



#####################
### VISUALISATION ###
#####################

####### Test de corrélation n°1 : CORRELATION INTER ESPECE ####### 
# On note : colonne 4 = colonne contenant les taux de recombinaison dans les fichiers bed créés
par(mfrow = c(1,3), cex.main=1.5, cex.lab = 1.4, pch=4)
plot(rob_1Mb$V4, int_1Mb$V4, main = "C.intestinalis / C.robusta (Scale 1Mb)", xlab = "C.robusta rec. rate", ylab = "C.intestinalis rec. rate")
plot(rob_100kb$V4, int_100kb$V4, main = "C.intestinalis / C.robusta (Scale 100kb)", xlab = "C.robusta rec. rate", ylab = "C.intestinalis rec. rate")
plot(rob_1kb$V4, int_1kb$V4, main = "C.intestinalis / C.robusta (Scale 1kb)", xlab = "C.robusta rec. rate", ylab = "C.intestinalis rec. rate")


# Coefficients de Pearson et de Spearman
cor.test(int_1Mb$V4, rob_1Mb$V4, method = c("pearson"))
cor.test(int_1Mb$V4, rob_1Mb$V4, method = c("spearman"))
cor.test(int_100kb$V4, rob_100kb$V4, method = c("pearson"))
cor.test(int_100kb$V4, rob_100kb$V4, method = c("spearman"))

####### Test de corrélation n°2 : CORRELATION TAUX DE GC-TAUX DE RECOMBINAISON ####### 
# On note : colonne 4 = colonne contenant les taux de recombinaison dans les fichiers bed créés

# Chez C.intestinalis
plot(int_1Mb$V4, int_1Mb$V5, main = "C.intestinalis / GCcontext (Scale 1Mb)", xlab = "C.intestinalis rec. rate", ylab = "GCcontext")
plot(int_100kb$V4, int_100kb$V5, main = "C.intestinalis / GCcontext (Scale 100kb)", xlab = "C.intestinalis rec. rate", ylab = "GCcontext")
plot(int_1kb$V4, int_1kb$V5, main = "C.intestinalis / GCcontext (Scale 1kb)", xlab = "C.intestinalis rec. rate", ylab = "GCcontext")
#Beaucoup de Nan pour la dernière échelle
# Coefficients de Pearson et de Spearman
cor.test(int_1Mb$V4, int_1Mb$V5, method = c("pearson"))
cor.test(int_1Mb$V4, int_1Mb$V5, method = c("spearman"))
cor.test(int_100kb$V4, int_100kb$V5, method = c("pearson"))
cor.test(int_100kb$V4, int_100kb$V5, method = c("spearman"))

#Chez C.robusta
plot(rob_1Mb$V4, rob_1Mb$V5, main = "C.robusta / GCcontext (Scale 1Mb)", xlab = "C.robusta rec. rate", ylab = "GCcontext")
plot(rob_100kb$V4, rob_100kb$V5, main = "C.robusta / GCcontext (Scale 100kb)", xlab = "C.robusta rec. rate", ylab = "GCcontext")
plot(rob_1kb$V4, rob_1kb$V5, main = "C.robusta / GCcontext (Scale 1kb)", xlab = "C.robusta rec. rate", ylab = "GCcontext")
#Beaucoup de Nan pour la dernière échelle
# Coefficients de Pearson et de Spearman
cor.test(rob_1Mb$V4, rob_1Mb$V5, method = c("pearson"))
cor.test(rob_1Mb$V4, rob_1Mb$V5, method = c("spearman"))
cor.test(rob_100kb$V4, rob_100kb$V5, method = c("pearson"))
cor.test(rob_100kb$V4, rob_100kb$V5, method = c("spearman"))



####### Test de corrélation n°3 : CORRELATION LONGUEUR DE CHROMOSOME-TAUX DE RECOMBINAISON ####### 
# On note : colonne 4 = colonne contenant les taux de recombinaison dans les fichiers bed créés

#Liste de la longueur des chromosomes
chr_size <- c(10041005, 7758925, 6703989, 5505748, 5035970, 2365711, 6125209, 6398795, 6586237, 4880875, 5152901, 5356124, 1792679, 4591987)

#Chez C.intestinalis
#La moyenne du taux de recombinaison par chromosome (à l'aide de la carte de recombinaison "originelle" sous LDhat)
mean_rate <- c()
# Step 1 : Boucle sur les 14 chromosomes
for (i in 1:14){
  # Lecture du fichier du chromosome
  map_chr <- read.table(file = c_intestinalis[i], header = TRUE, sep = '\t', dec = ".")
  # Calcul du taux de recombinaison moyen du chromosome
  last_genetic_pos <- map_chr$X4Ner[length(map_chr$X4Ner)]
  first_snp_pos <- map_chr$Position.kb.[1]
  last_snp_pos <- map_chr$Position.kb.[length(map_chr$Position.kb.)]
  
  mean_rate_chr <- ( last_genetic_pos )/( last_snp_pos - first_snp_pos )
  # Ajout à la liste de mean_rates de tous les chromosomes 
  mean_rate <- rbind(mean_rate, mean_rate_chr)
}
# Affichage du graphe de la corrélation
par(mfrow = c(1,2), cex.main=1.5, cex.lab = 1.4, pch=4)
plot(chr_size, mean_rate, main = "C.intestinalis / Chromosome size", xlab = "Chromosome size", ylab = "C.intestinalis rec. rate")

# Coefficients de Pearson et de Spearman
cor.test(mean_rate, chr_size, method = c("pearson"))
cor.test(mean_rate, chr_size, method = c("spearman"))


#Chez C.robusta
mean_rate <- c()
# Step 1 : Boucle sur les 14 chromosomes
for (i in 1:14){
  # Lecture du fichier du chromosome
  map_chr <- read.table(file = c_robusta[i], header = TRUE, sep = '\t', dec = ".")
  # Calcul du taux de recombinaison moyen du chromosome
  last_genetic_pos <- map_chr$X4Ner[length(map_chr$X4Ner)]
  first_snp_pos <- map_chr$Position.kb.[1]
  last_snp_pos <- map_chr$Position.kb.[length(map_chr$Position.kb.)]
  
  mean_rate_chr <- ( last_genetic_pos )/( last_snp_pos - first_snp_pos )
  # Ajout à la liste de mean_rates de tous les chromosomes 
  mean_rate <- rbind(mean_rate, mean_rate_chr)
}
# Affichage du graphe de la corrélation
plot(chr_size, mean_rate, main = "C.robusta / Chromosome size", xlab = "Chromosome size", ylab = "C.robusta rec. rate")
# Coefficients de Pearson et de Spearman
cor.test(mean_rate, chr_size, method = c("pearson"))
cor.test(mean_rate, chr_size, method = c("spearman"))


####### UTILES ####### 


####### Compte du nombre de NA dans le .bed des taux de recombinaison à l'échelle 1kb ####### 
na_c_rob <- sum(is.na(rob_1kb$V4))
na_c_int <- sum(is.na(int_1kb$V4))

####### Compte du nombre de NA dans le .bed des GC à l'échelle 1kb ####### 
na_GC_rob <- sum(is.na(rob_1kb$V5))
na_GC_int <- sum(is.na(int_1kb$V5))

####### Calcul du taux moyen de recombinaison sur l'ensemble du génome de la Cione ####### 
#C.intestinalis
mean(int$V4)
#C.robusta
mean(rob$V4)


####### UTILES ####### 
