#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Apr 26 10:21:30 2021

@author: julien_joseph
"""

from math import*
import numpy as np
from random import*
import os
import sys
import matplotlib.pyplot as plt
import argparse
import warnings



parser = argparse.ArgumentParser(
        description='This program allows you detect the hotspots from a recombination map in a bed format'
                    'For more information read the userguide',
        usage='python hotspot_detection.py -dirpath [WORKING DIRECTORY PATHWAY] -i [RECOMBINATION MAP] -o [OUTPUT NAME] -fld [Fold] -bck [Background size] -size [Hotspot size] -rcol [Recrate column] -sm -res [Resolution]',
        formatter_class=argparse.RawTextHelpFormatter, add_help=False)
parser.add_argument("-dirpath", "--directory_path", help="enter the path of the directory of the GFF and fasta file")
parser.add_argument("-i", "--bed_file", help="bed file")
parser.add_argument("-rcol", "--recrate_column", help="the column in which the recombination rate is stored", default=4,type=int)
parser.add_argument("-res", "--resolution", help="resolution for smoothing", default=100,type=int)
parser.add_argument("-h", "--help", help="help", action="store_true")
args = parser.parse_args()

def lissage(bed,window,rcol):
    print('Smoothing recombination map\n')
    name=list(bed)
    name.pop(-1)
    name.pop(-1)
    name.pop(-1)
    name.pop(-1)
    name="".join(name)
    sortie=open(name+'_'+str(window)+'.smoothed.bed','w')
    fichier=open(bed,'r')
    taillechro={}
    #make a list txt with all the elements of the first line
    txt = fichier.readline().split()
    while txt!=[]:
        if not txt[0].startswith('#'):
            if txt[0] not in taillechro:
                taillechro[txt[0]]=[]
            taillechro[txt[0]].append(int(txt[2]))
        del txt
        txt = fichier.readline().split()
    fichier.close()
    print(taillechro.keys())
    for chromosome in taillechro:
        fichier=open(bed,'r')
        txt = fichier.readline().split()
        print(chromosome)
        pos=np.zeros([1,max(taillechro[chromosome])])
        pos.fill(np.nan)
        pos=pos.tolist()[0]
        X=[]
        Y=[]
        Z=[]
        while txt!=[]:
            
            if txt[0]==chromosome:
                #print(chromosome)
                if txt[rcol-1]!='NA':
                    for i in range(int(txt[1]),int(txt[2])):
                        pos[i]=float(txt[rcol-1])
            del txt
            txt = fichier.readline().split()
        k=0
        fichier.close()
        for i in range(int(len(pos)/window)+1): # HERE LITTLE CHANGE : range(int(...))
            #if round(i/(round(len(pos)/window)+1)*100)!=k:
                #print(str(round(i/(round(len(pos)/window)+1)*100))+'%')
            k=round(i/(round(len(pos)/window)+1)*100)
            a=np.nanmean(np.asarray(pos[window*i:min(window*(i+1),len(pos))]))
            print(chromosome,a)
            Y.append(a)
            X.append(window*i)
            Z.append(window*(i+1))
        for i in range(len(X)):
            sortie.write(chromosome+'\t'+str(round(X[i]))+'\t'+str(round(Z[i]))+'\t'+str(Y[i])+'\n')
        del pos
        del X
        del Y
        del Z
    fichier.close()
    sortie.close()
    print()
    return(name+'_'+str(window)+'.smoothed.bed')

    
    
if args.help:
    print('This program allows you detect the hotspots from a recombination map in a bed format\n'
                    'For more information read the README.\n'
                    'usage=python hotspot_detection.py -dirpath [WORKING DIRECTORY PATHWAY] -i [RECOMBINATION MAP] -o [OUTPUT NAME] -fld [Fold] -bck [Background size] -size [Hotspot size] -rcol [Recrate column] -sm -res [Resolution]')
if not args.help:
    if not args.directory_path:
        raise Exception('Directory path missing')
    if not args.bed_file:
        raise Exception('bed file missing')
    os.chdir(args.directory_path)
    name=lissage(args.bed_file,args.resolution,args.recrate_column)
