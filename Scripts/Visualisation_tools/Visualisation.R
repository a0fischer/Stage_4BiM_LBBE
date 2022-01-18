rm(list = ls())

#################
###    GOAL   ###
#################
#This file aims at visualizing C.robusta and C.intestinalis both recombination and hotspot maps (only chromosome 1)

#################
### FUNCTIONS ###
#################

#Fonction pour afficher la map de recombinaison et la map de des hotspots 
recombi_map <- function(file, title_map, title_hotspot) {
  #Lecture du fichier
  hotspot_data <- read.table(file = file, header = TRUE, sep = '\t', dec = ".")
  
  #Variables
  rec_rate <- hotspot_data$X4Ner
  rec_rate_per_kb <- hotspot_data$X4Ner.kb
  position <- hotspot_data$Position.kb.
  hotspot <- hotspot_data$Hotspot_Density

  #Affichage graphique
  par(mfrow = c(1,1))
  
  plot(rec_rate_per_kb~position, type = "l", main = title_map, xlab = "Position (kb)", ylab = "Recombination rate (4Ner/kb)")
  
  plot(hotspot~position, type = "l", main = title_hotspot, xlab = "Position (kb)", ylab = "Hotspot Density")
  
  return(hotspot_data)
}

compa_recombi_map <- function(file1, title_map1, title_hotspot1, file2, title_map2, title_hotspot2, main) {
  #Lecture du fichier
  hotspot_data_1 <- recombi_map(file1, title_map1, title_hotspot1)
  hotspot_data_2 <- recombi_map(file2, title_map2, title_hotspot2)
  
  #Affichage comparaison des 2 cartes
  plot(hotspot_data_1$Position.kb., hotspot_data_1$X4Ner.kb, type = "l", main = main, xlab = "Position (kb)", ylab = "Recombination rate (4Ner/kb)")
  
  lines(hotspot_data_2$Position.kb., hotspot_data_2$X4Ner.kb*10, type = "l", col = "red", xlim = c(0,10000))
  legend("topleft", legend=c("Statistical phasing", "Per trio phasing"), col=c("black", "red"), lty=1, cex=0.8)
  
}

#####################
### VISUALISATION ###
#####################

#Carte n°1 de recombinaison de C.intestinalis et C.robusta 
#Résolution : 1 SNP tous les 1.5kb
#Filtre des SNPs : biallélique, sans indels, 50% max de génotype manquant, MAF > 0.1, phasé
#Méthode : LDhat, programme rhomap

#Visualisation du chromosome 1 de C.intestinalis /stat_phasing
int_chr1_data <- "/home/aureliefischer/LDhat-master/Cione/Phasage_statistique/C.intestinalis/c_int_stat_chromosome1_summary.txt"
title_map1 <- "C.intestinalis chromosome 1 : recombination map (stat phasing)"
title_hotspot1 <- "C.intestinalis chromosome 1 : hotspot map"
#LDhat doc : Hotspot density = the number of hotspots per kb per iteration

#Visualisation du chromosome 1 de C.intestinalis /per trio phasing
int_chr1_data2 <- "/home/aureliefischer/LDhat-master/Cione/Phasage_par_trio/C.intestinalis/c_int_chromosome1_summary.txt"
title_map2 <- "C.intestinalis chromosome 1 : recombination map (per trio phasing)"
title_hotspot2 <- "C.intestinalis chromosome 1 : hotspot map"

main_title = "C.intestinalis chromosome 1 : recombination map"

compa_recombi_map(int_chr1_data, title_map1, title_hotspot1, int_chr1_data2, title_map2, title_hotspot2, main_title)

#Etape suivante : L'afficher pour tous les chromosomes (cf Visu_complete_map.R)


