#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# But : Créer des fichiers .ldhat.sites associés aux SNPs phasés statistiquement par ShapeIt. Uniquement sur les positions dont on connaît le phasage par trio.

### FONCTIONS ###

def snp_phasing(haps_file, snps):
	ref_file = open(haps_file, "r")
	ref_lines = ref_file.readlines()
	
	#On ne veut que les lignes correspondant aux SNPs mis en entrée
	j = 0
	haps_list = []
	
	for line in ref_lines:
		line = line.split()
		
		current_checked_snp = snps[j]
		
		if j < len(snps) and (int) (line[2]) == current_checked_snp:
			haps_list.append(line)
			if j != len(snps)-1 :
				j = j+1
	
	ref_file.close()
	
	return haps_list

### FIN FONCTIONS ###


#C. ROBUSTA VERSION
nb_individus = 11

#Step 1 : Boucle sur les 14 chromosomes
for i in range(1,15):

	print("\nTHIS IS CHROMOSOME "+str(i)+"\n")
	
	#Step 1A : Création du fichier d'output
	output_file = open("./C.robusta/c_robusta_stat_compa_chromosome"+str(i)+".ldhat.sites","w")
	
	#Step 1B : Je récupère les positions des SNPs phasés par vcftools en kb
	loc_file = open("/home/aureliefischer/Documents/Projet_Cione/Analyse_2_C.robusta/c_robusta_chromosome"+str(i)+".ldhat.locs", "r")
	loc_lines = loc_file.readlines()
	#Step 1B.1 : On boucle sur chaque position de snps pour avoir une liste complète des positions de SNPs
	snp_list = []
	for snp in loc_lines[1:len(loc_lines)]:
		#Step 1B.2 : on convertit la position du snp kb -> bp
		pos = (round) ((float) (snp) * 1000)
		snp_list.append(pos)
	#La snp_list est prête
	
	# ECRITURE
	#Step 1C : Ecriture de la première ligne du .sites
	output_file.write(str(2*nb_individus)+"\t"+loc_lines[0].split()[0]+"\t1\n")
	
	loc_file.close()
	
	#Step 1D : On récupère les phasages de chaque snps pour chaque chromosome. (faire une fonction)
	haplotypes = snp_phasing("/home/aureliefischer/Documents/Projet_Cione/ShapeIt/C.robusta/c_robusta_phased_snps_chromosome"+str(i)+".haps",snp_list)
	#C'est ALRIGHT
	
	#Step 2 : LE CONTENU (allez ça va boucler)
	#Step 2A : Boucle sur les individus
	indv_file = open("/home/aureliefischer/Documents/Projet_Cione/indv_C.robusta.txt","r")
	indv_lines = indv_file.readlines()
	
	for num,indv in enumerate(indv_lines):
		
		indv = indv.split()
		
		## FIRST HAPLOTYPE ##
		#ECRITURE : identifiant de l'indvidu
		output_file.write(">"+indv[0]+"-0\n")
		
		#Step 2B : Boucle sur les SNPs
		for k in range(len(snp_list)):
			#ECRITURE : haplotype de tel snp tel individu #RAHH comment que faire x_x
			output_file.write(haplotypes[k][5+2*num])
		output_file.write("\n")
		
		## SECOND HAPLOTYPE ##
		#ECRITURE : identifiant de l'indvidu
		output_file.write(">"+indv[0]+"-1\n")
	
		#Step 2B : Boucle sur les SNPs
		for k in range(len(snp_list)):
			#ECRITURE : haplotype de tel snp tel individu #RAHH comment que faire x_x
			output_file.write(haplotypes[k][5+2*num+1])
		output_file.write("\n")

	indv_file.close()
	output_file.close()
## REMARQUES 

#On va créer un fichier d'ouput par chromosome, qui se base sur le modèle des fichiers .ldhat.sites
#EH BAH VOALA
