#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Nov 11 15:42:33 2020

@author: julien_joseph
"""

from math import*
import numpy as np
from random import*
import os
import sys
import matplotlib.pyplot as plt
import argparse


parser = argparse.ArgumentParser(
        description='This program allows your to annotate your SNPs in function if they are'
                    'located in non coding sequenceif they are synonymous or non-synonymous'
                    'For more information read the userguide',
        usage='python annotate_SNPs.py -dirpath [WORKING DIRECTORY PATHWAY] -g [REFERENCE GENOME] -gff [ANNOTATION FILE] -snps [SNPS FILE] -o [OUTPUT NAME] -tkey [TRANSCRIPT KEY] -gkey [GENE KEY]',
        formatter_class=argparse.RawTextHelpFormatter, add_help=False)
parser.add_argument("-dirpath", "--directory_path", help="enter the path of the directory of the GFF and fasta file")
parser.add_argument("-bed", "--bed_file", help="bed file")
parser.add_argument("-fasta", "--fasta_file", help="fasta file")
parser.add_argument("-o", "--output_file", help="output file")
parser.add_argument("-win", "--window", help="window for GCcontext",type=int, default=4)
args = parser.parse_args()


def read_genome(fasta,chro):
    fas=open(fasta,'r')
    tmp=open(chro+'.tmp','w')
    txt=fas.readline()
    while not txt.startswith('>'+chro) and txt!='':
        del txt
        txt=fas.readline()
    del txt
    txt=fas.readline()
    while txt!='':
        if txt.startswith('>'):
            break
        tmp.write(txt)
        del txt
        txt=fas.readline()
    tmp.close()
    tmp=open(chro+'.tmp','r')
    chromosome=list(tmp.read().replace('\n',''))
    chromosome=['N']+chromosome
    os.remove(chro+'.tmp')
    return(chromosome)


def getGC_context(bed,fasta,output,window):
    fichier=open(bed,'r')
    chro=[]
    #make a list txt with all the elements of the first line
    txt = fichier.readline().split()
    while txt!=[]:
        if not txt[0].startswith('#'):
                  chro.append(txt[0])
        del txt
        txt = fichier.readline().split()
    chro=list(set(chro))
    chro.sort()
    print()
    print('List of chromosomes in annotation file',chro)
    print()
    fichier.close()
    sortie=open(output,'w')
    #create a dictionnary transcripts, which will contain for each transcripts, the nucleotide sequence, the phase sequence, and the corresponding genomic position of each nucleotide of the transcript
    for chromosome in chro:
        print(chromosome)
        genome=read_genome(fasta,chromosome)
        #open the GFF
        fichier=open(bed,'r')
        txt=fichier.readline().split()
        while txt!=[]:
            if txt[0]==chromosome:
                start=int(txt[1])
                end=int(txt[2])
                seq=genome[max(1,start-round(window/2)):min(end+round(window/2),len(genome))]
                G=seq.count('G')+seq.count('g')
                C=seq.count('C')+seq.count('c')
                A=seq.count('A')+seq.count('a')
                T=seq.count('T')+seq.count('t')
                if A+G+C+T!=0:
                    GC_context=(G+C)/(G+C+A+T)
                else:
                    GC_context='NA'
                sortie.write(txt[0]+'\t'+txt[1]+'\t'+txt[2]+'\t'+txt[3]+'\t'+str(GC_context)+'\n')
            del txt
            txt=fichier.readline().split()
        fichier.close()
    sortie.close()
    return()

os.chdir(args.directory_path)
getGC_context(args.bed_file,args.fasta_file,args.output_file,args.window)