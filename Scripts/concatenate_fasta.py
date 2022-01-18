#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#But : Concaténer les fichiers .fasta des individus en 1 fichier .fasta par chromosome

#C.ROBUSTA VERSION

#Step 1 : Boucle sur les 14 chromosomes
for i in range(1,15):

	#Step 1A : On ouvre un fichier pour chaque chromosome où on va copier les séquences
	whole_chr_file = open("./C.robusta/c.robusta_chromosome"+str(i)+".fa", "w")
	
	#Step 1B : On boucle sur chaque individu de l'espèce
	indv_file = open("../../indv_C.robusta.txt", "r")
	indv_lines = indv_file.readlines()
	
	for line in indv_lines:
		line = line.split()
		
		#Step 1B.1 : On ouvre le fichier correspondant à l'individu, au chromosome : HAPLOTYPE 0 et HAPLOTYPE 1
		hap_0 = open("./C.robusta/c.robusta_chromosome"+str(i)+"_"+line[0]+"_chromosome"+str(i)+":0.fa", "r")
		hap_1 = open("./C.robusta/c.robusta_chromosome"+str(i)+"_"+line[0]+"_chromosome"+str(i)+":1.fa", "r")
		#Step 1B.2 : On copie le contenu du fichier dans le fichier total du chromosome
		whole_chr_file.write(hap_0.read())
		whole_chr_file.write(hap_1.read())
		#Fermeture des fichiers
		hap_0.close()
		hap_1.close()
		
	#Step 1C : Fermeture des fichiers
	indv_file.close()
	whole_chr_file.close()
