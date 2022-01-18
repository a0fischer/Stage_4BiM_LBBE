#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# BUT : construire les fichiers contenant les positions de SNPs pouvant être phasés par trio
# Chromosome1 - pour chaque espèce - positions de snps qui sont phasés par vcftools (qu'on retrouve dans le .locs)
output_file = open("./c_intestinalis_chr1_ref_pos.txt", "w")

loc_file = open("../1.Per_trio_phased_snps/c_intestinalis_chromosome1.ldhat.locs", "r")
loc_lines = loc_file.readlines()

for line in loc_lines[1:len(loc_lines)]:
	line = line.split()
	
	#Conversion de la position de kb -> bp
	pos = (round) ((float) (line[0]) * 1000)
	
	output_file.write("chromosome1\t"+str(pos)+"\n")

output_file.close()
loc_file.close() 
