#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# But : Créer le fichier .bed à partir des cartes de recombinaison LDhelmet.

#C INTESTINALIS VERSION

# Step 1 : créer un nouveau fichier qu'on va appeler ciona_ldhat_recombi_map.bed
bed_file = open("./c.robusta_ldhelmet_recombi_map.bed", "w")
chr_file = open("../../chromosome_fasta_id.txt", "r")

# Step 2 : boucle sur les 14 chromosomes
for i in range(1,15):

	## Step 2A : lire le fichier (read file)
	input_file = "../9.LDhelmet_maps/C.robusta/c_robusta_chromosome"+str(i)+"_rates.txt"
	map_file = open(input_file, "r")
	
	chromosome = chr_file.readline().rstrip('\n')
	print("Chromosome",i," -> ", chromosome)
	## Step 2B : boucle sur chaque ligne du fichier
	map_lines = map_file.readlines()

	#Lancement de la boucle
	for line in map_lines[3:len(map_lines)]:
		line = line.split()
		
		### Step 2B.1 : écrire le nom du chromosome dans la 1e colonne + tabulation
		bed_file.write(chromosome+"\t")
		### Step 2B.2 : écrire le 1er SNP dans la 2nde colonne + tab
		snp_1 = (int) (line[0])
		bed_file.write(str(snp_1)+"\t")	
		### Step 2B.3 : écrire le 2nd SNP dans la 3e colonne + tab
		snp_2 = (int) (line[1])
		bed_file.write(str(snp_2)+"\t")
		### Step 2B.4 : écrire le taux de recombinaison 1/bp dans la 4e colonne + saut de ligne
		rate = (float) (line[2])
		bed_file.write(str(rate)+"\n")

	map_file.close()

bed_file.close()
chr_file.close()

## REMARQUE

# Il faudra peut-être changer le nom des chromosomes
# Et les nommer de la même manière que dans le fasta

## A PLUS

