#!/usr/bin/env python3
# -*- coding: utf-8 -*-

#But : Créer la matrice de mutation de chaque espèce de Cione à partir des .vcf répertoriant les singletons 

#C.INTESTINALIS

#Step 1 : On crée un dico pour chaque ligne de la matrice
mut_matrix = {'A' : {'A' : 0, 'C' : 0, 'G' : 0, 'T' : 0}, \
			  'C' : {'A' : 0, 'C' : 0, 'G' : 0, 'T' : 0}, 
			  'G' : {'A' : 0, 'C' : 0, 'G' : 0, 'T' : 0}, 
			  'T' : {'A' : 0, 'C' : 0, 'G' : 0, 'T' : 0}}

#Step 2 : On ouvre le fichier des singletons
singletons_file = open("./c_intestinalis_singletons.vcf", "r")
singletons_lines = singletons_file.readlines()


#Step 3 : On boucle sur les lignes du fichier en enlevant les lignes de header
for line in singletons_lines[156:len(singletons_lines)]:
	line = line.split()
	
	#Step 3A : La 3e colonne = L'allèle de référence
	ref = line[3]
	#Step 3B : La 4e colonne = L'allèle alternative
	alt = line[4]
	#Step 3C : COMPTAGE - On remplit la case de la liste correspondante 
	mut_matrix[ref][alt] += 1
		
#Step 4 : On crée un fichier de sortie
output_file = open("./c_intestinalis_mutation_matrix.txt", "w")

#Step 5 : On le remplit de la matrice de mutation

for ref in mut_matrix:
	sum_line = sum(mut_matrix[ref].values())
	for alt in mut_matrix[ref]:
		output_file.write("{:.3f} ".format(mut_matrix[ref][alt]/sum_line))
	output_file.write("\n")

#Step 6 : Fermeture des fichiers
output_file.close()
singletons_file.close()

