#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# But : Créer un fichier .bed à partir des cartes de recombinaison de LDhat.
#C INTESTINALIS VERSION

# Step 1 : créer un nouveau fichier qu'on va appeler ciona_ldhat_recombi_map.bed
bed_file = open("../2.Statistical_phasing_map/8.BedFiles/c.int_stat_ldhat_recombi_map.bed", "w")
chr_file = open("chromosome_fasta_id.txt", "r")

# Step 2 : boucle sur les 14 chromosomes
for i in range(1,15):

	## Step 2A : lire le fichier (read file)
	input_file = "../2.Statistical_phasing_map/6.LDhat_maps/C.intestinalis/c_int_stat_chromosome"+str(i)+"_summary.txt"
	map_file = open(input_file, "r")
	
	chromosome = chr_file.readline().rstrip('\n')
	## Step 2B : boucle sur chaque ligne du fichier
	map_lines = map_file.readlines()
	
	#Lancement de la boucle
	for line in map_lines[1:len(map_lines)]:
		line = line.split()
		
		if line[1] == '0.000000': #Premier SNP de chaque fichier
			### Step 2B.1 : écrire le nom du chromosome dans la 1e colonne + tabulation
			print("Chromosome",i," -> ", chromosome)
			bed_file.write(chromosome+"\t")
			### Step 2B.2 : écrire le 1er SNP dans la 2nde colonne + tab
			snp_1 = (round) ((float) (line[0]) * 1000)
			bed_file.write(str(snp_1)+"\t")	
			### Step 2B.3 : conserver le taux de recombinaison
			rate = line[2]
		
		else: #Les autres SNPs
			### Step 2B.4 : écrire le 2nd SNP dans la 3e colonne + tab
			snp_2 = (round) ((float) (line[0]) * 1000)
			bed_file.write(str(snp_2)+"\t")
			### Step 2B.4 : écrire le taux de recombinaison 4Ner/kb dans la 4e colonne + saut de ligne
			bed_file.write(rate+"\n")
			### ET C'EST REPARTI ###
			if line != map_lines[len(map_lines)-1].split():#Si ce n'est pas le dernier SNP
				### Step 2B.1 : écrire le nom du chromosome dans la 1e colonne + tabulation
				bed_file.write(chromosome+"\t")
				### Step 2B.2 : écrire le 1er SNP dans la 2nde colonne + tab
				snp_1 = snp_2
				bed_file.write(str(snp_1)+"\t")		
				### Step 2B.3 : conserver le taux de recombinaison
				rate = line[2]
				
	map_file.close()

bed_file.close()
chr_file.close()

## REMARQUE

# Il faudra peut-être changer le nom des chromosomes
# Et les nommer de la même manière que dans le fasta

## A PLUS

