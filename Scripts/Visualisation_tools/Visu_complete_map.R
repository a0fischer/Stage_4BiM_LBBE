rm(list = ls())

#################
###    GOAL   ###
#################
#This file aims at visualizing C.robusta and C.intestinalis recombination maps for their 14 chromosomes

#################
### FUNCTIONS ###
#################

#Fonction pour afficher la map de recombinaison et la map de des hotspots 
recombi_map <- function(file1, file2, chr) {
  #Lecture du fichier 1
  hotspot_data <- read.table(file = file1, header = TRUE, sep = '\t', dec = ".")
  #Variables
  rec_rate <- hotspot_data$X4Ner
  rec_rate_per_kb <- hotspot_data$X4Ner.kb
  position <- hotspot_data$Position.kb.
  hotspot <- hotspot_data$Hotspot_Density
    #Affichage graphique
  plot(rec_rate_per_kb~position, type = "l", main = chr, xlab = "Position (kb)", ylab = "Recombination rate (4Ner/kb)")
  
  #Lecture du fichier 2
  hotspot_data <- read.table(file = file2, header = TRUE, sep = '\t', dec = ".")
    #Variables
  rec_rate <- hotspot_data$X4Ner
  rec_rate_per_kb <- hotspot_data$X4Ner.kb
  position <- hotspot_data$Position.kb.
  hotspot <- hotspot_data$Hotspot_Density
  #Affichage graphique
  lines(rec_rate_per_kb~position, type = "l", col = "red")
  legend("topleft", legend = c("C.robusta", "C.intestinalis"), col = c("black", "red"), lty=1, cex=0.8)
}

recombi_map_pos <- function(file1, file2, chr, start, end) {
  #Lecture du fichier 1
  hotspot_data <- read.table(file = file1, header = TRUE, sep = '\t', dec = ".")
  #Variables
  rec_rate <- hotspot_data$X4Ner
  rec_rate_per_kb <- hotspot_data$X4Ner.kb
  position <- hotspot_data$Position.kb.
  hotspot <- hotspot_data$Hotspot_Density
  #Affichage graphique
  plot(rec_rate_per_kb~position, type = "l", main = chr, xlab = "Position (kb)", ylab = "Recombination rate (4Ner/kb)", cex.lab = 0.8, xlim = c(start, end))
  
  #Lecture du fichier 2
  hotspot_data <- read.table(file = file2, header = TRUE, sep = '\t', dec = ".")
  #Variables
  rec_rate <- hotspot_data$X4Ner
  rec_rate_per_kb <- hotspot_data$X4Ner.kb
  position <- hotspot_data$Position.kb.
  hotspot <- hotspot_data$Hotspot_Density
  #Affichage graphique
  lines(rec_rate_per_kb~position, type = "l", col = "coral")
  abline(h=mean(rec_rate_per_kb), col = "brown", lty = 2)
  legend("topleft", legend = c("C.robusta", "C.intestinalis"), col = c("black", "coral"), lty=1, cex=0.8)
  
  
}

#####################
### VISUALISATION ###
#####################

#Carte n°1 de recombinaison de C.intestinalis et C.robusta 
#Résolution : 1 SNP tous les 1.5kb
#Filtre des SNPs : biallélique, sans indels, 50% max de génotype manquant, MAF > 0.1, phasé
#Méthode : LDhat, programme rhomap

#Etape suivante : L'afficher pour tous les chromosomes 
#Fichiers C.robusta (j'ai pas trouvé plus efficace :/)
rob_chr1_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome1_summary.txt"
rob_chr2_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome2_summary.txt"
rob_chr3_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome3_summary.txt"
rob_chr4_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome4_summary.txt"
rob_chr5_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome5_summary.txt"
rob_chr6_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome6_summary.txt"
rob_chr7_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome7_summary.txt"
rob_chr8_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome8_summary.txt"
rob_chr9_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome9_summary.txt"
rob_chr10_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome10_summary.txt"
rob_chr11_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome11_summary.txt"
rob_chr12_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome12_summary.txt"
rob_chr13_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome13_summary.txt"
rob_chr14_data <- "/home/aureliefischer/LDhat-master/Cione/C.robusta/c_robusta_chromosome14_summary.txt"

c_robusta <- c(rob_chr1_data, rob_chr2_data, rob_chr3_data, rob_chr4_data, rob_chr5_data, rob_chr6_data, rob_chr7_data, rob_chr8_data, rob_chr9_data, rob_chr10_data, rob_chr11_data, rob_chr12_data, rob_chr13_data, rob_chr14_data)

#Fichiers C.intestinalis
int_chr1_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome1_summary.txt"
int_chr2_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome2_summary.txt"
int_chr3_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome3_summary.txt"
int_chr4_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome4_summary.txt"
int_chr5_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome5_summary.txt"
int_chr6_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome6_summary.txt"
int_chr7_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome7_summary.txt"
int_chr8_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome8_summary.txt"
int_chr9_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome9_summary.txt"
int_chr10_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome10_summary.txt"
int_chr11_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome11_summary.txt"
int_chr12_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome12_summary.txt"
int_chr13_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome13_summary.txt"
int_chr14_data <- "/home/aureliefischer/LDhat-master/Cione/C.intestinalis/c_int_chromosome14_summary.txt"

c_intestinalis <- c(int_chr1_data, int_chr2_data, int_chr3_data, int_chr4_data, int_chr5_data, int_chr6_data, int_chr7_data, int_chr8_data, int_chr9_data, int_chr10_data, int_chr11_data, int_chr12_data, int_chr13_data, int_chr14_data)

#Les chromosomes
chromosome <- c("Chromosome1", "Chromosome2", "Chromosome3", "Chromosome4", "Chromosome5", "Chromosome6", "Chromosome7", "Chromosome8", "Chromosome9", "Chromosome10", "Chromosome11", "Chromosome12", "Chromosome13", "Chromosome14")
#Afficher les maps de recombinaison C.intestinalis superposées à celles de C.robusta

for (i in 1:14){
  print(i)
  recombi_map(c_robusta[i], c_intestinalis[i], chromosome[i])
}

#Introgression de C.robusta > C.intestinalis
recombi_map_pos(c_robusta[5], c_intestinalis[5], chromosome[5], 400, 1200)

###################
### CORRELATION ###
###################

#Corrélation entre les deux espèces
#Je veux la corrélation entre c_int rate per kb et c_rob rate per kb
#Chromosome 1
rob_data <- read.table(file = rob_chr1_data, header = TRUE, sep = '\t', dec = ".")
int_data <- read.table(file = int_chr1_data, header = TRUE, sep = '\t', dec = ".")

#Je crée une matrice contenant les deux mesures
#Petit problème : j'ai pas le taux de recombinaison pour les mêmes positions de SNPs chez les deux espèces.

#Je calcule la corrélation entre les deux colonnes (hopefully ça marche)
#mcor <- cor(whole_data)
