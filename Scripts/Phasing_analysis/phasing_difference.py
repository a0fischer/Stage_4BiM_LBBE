#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# But : Calcul du pourcentage d'erreur entre le phasage par trio et le phasage statistique, sur la base des positions de SNPs dont on connaît le phasage par trio.

###   FONCTIONS   ###

def diff_rate(line1, line2):
	
	count = sum(1 for a, b in zip(line1, line2) if a != b)
	
	return (count/len(line1))

### FIN FONCTIONS ###

species_option = input("For which species do you want the phasing comparison ? C.intestinalis or C.robusta ?")

if species_option == "C.intestinalis":
	#C. INTESTINALIS VERSION
	nb_individus = 13
	indv_list = ["ad13", "ad15", "ad19", "ad24", "ad25", "ad26", "ad27", "ad29", "ad30", "ad3", "ad4", "ad7", "ad9"]
	small_id = "int"
	big_id = "intestinalis"
elif species_option == "C.robusta":
	#C.ROBUSTA VERSION
	nb_individus = 11
	indv_list = ["ad10", "ad11", "ad12", "ad16", "ad22", "ad23", "ad32", "ad33", "ad34", "ad35", "ad6"]
	big_id = "robusta"
	small_id = big_id
	

	

#Step 0 : Création d'un fichier d'output
output_file = open("./c_"+big_id+"_phasing_comparion.txt","w")

#ECRITURE : première ligne avec les noms de colonne
output_file.write("CHROMOSOME \t ")
for indv in indv_list:
	output_file.write(indv+" \t ")
output_file.write("|| %MEAN \n")

mean = 0

#Step 1 : Boucle sur les 14 chromosomes
for i in range(1,15):

	#ECRITURE : Nom du chromosome dans la 1e colonne
	output_file.write("Chromosome "+str(i)+" \t")
	
	#Step 1A : Ouverture du fichier de phasage par trio
	trio_phasing = open("/home/aureliefischer/Documents/Projet_Cione/Analyse_2_C."+big_id+"/c_"+big_id+"_chromosome"+str(i)+".ldhat.sites","r")
	trio_phasing.readline()

	#Step 1B : Ouverture du fichier de phasage statistique
	stat_phasing = open("./C."+big_id+"/c_"+small_id+"_stat_compa_chromosome"+str(i)+".ldhat.sites","r")
	stat_phasing.readline()
	
	#Step 1C : Boucle sur les individus [NB : Individus Diploïdes]
	for j in range(nb_individus):
	
		#Step 1C.1 : On lit la ligne ID de l'individu
		trio_phasing.readline()
		stat_phasing.readline()
		
		#Step 1C.2 : On compare les lignes de phasage des deux fichiers (fonction)
		line_trio = trio_phasing.readline()
		line_stat = stat_phasing.readline()
		
		diff_pct = diff_rate(line_trio, line_stat) * 100
		mean += diff_pct
		
		#ECRITURE : On écrit pour chaque individu le pourcentage de différence
		output_file.write("{0:.2f}% \t ".format(diff_pct))
		
		#Step 1C.3 : On zappe le second haplotype qui a le même taux d'erreur
		for k in range(2):
			trio_phasing.readline()
			stat_phasing.readline()
		
	#ECRITURE : on va à la ligne pour le nouveau chromosome
	mean = mean/14
	output_file.write("|| {0:.2f}% \n".format(mean))
	
	#Last Step : Fermeture des fichiers
	trio_phasing.close()
	stat_phasing.close()
	
output_file.close()




