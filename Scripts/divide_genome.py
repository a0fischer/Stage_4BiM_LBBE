#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#But : Diviser le génome de référence en 1 fichier par chromosome :)

#Step 1 : On ouvre le fichier de génome de référence
genome_file = open("../../Genome/ncbi-genomes-2021-06-04/GCF_000224145.1_KH_genomic.fna", "r")

#Step 2 : On lit la première ligne du fichier
line = genome_file.readline()

#Step 3 : On boucle sur les 14 chromosomes
for i in range(1,15):
	
	#Step 3A : On crée un fichier de sortie par chromosome qui contiendra le génome de référence associé
	chr_file = open("./ref_genome_chromosome"+str(i)+".fasta","w")
	#ECRITURE : 1e ligne du fichier = ligne avec le chevron
	chr_file.write(">chromosome"+str(i)+"\n")
	
	#Step 3B : On boucle sur les lignes du fichier
	line = genome_file.readline()
	while line[0] != ">":
		chr_file.write(line.upper())
		line = genome_file.readline()
		
	#Step 3C : On ferme le fichier
	chr_file.close()

genome_file.close()
