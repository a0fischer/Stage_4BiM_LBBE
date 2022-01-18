#!/bin/bash
# Commande pour le lissage des map de recombinaison à trois échelles : 10kb, 100kb, 1Mb


#declare -a bedfiles=("../5.LDHelmet_stat_phasing/8.BedFiles/c.intestinalis_stat_ldhelmet_recombi_map.bed" "../5.LDHelmet_stat_phasing/8.BedFiles/c.robusta_stat_ldhelmet_recombi_map.bed");
declare -a scales=(10000 100000 1000000);
for i in {1..3}
do
	for scale in ${scales[1]}
	do
		python3 smooth_map.py -dirpath . --bed_file ../6.Maps_replicates/8.BedFiles/C.intestinalis/LDhat/c.intestinalis_ldhat_v"$i".bed -rcol 4 -res $scale;
		#if [ $scale -eq 10000 ]
		#then
		#	mv ../6.Maps_replicates/8.BedFiles/C.intestinalis/LDhat/c.intestinalis_ldhat_v"$i"_"$scale".smoothed.bed ../6.Maps_replicates/8.BedFiles/C.intestinalis/LDhat/c.intestinalis_ldhat_v"$i"_bins_10kb.bed
		#elif [ $scale -eq 100000 ]
		#then
		#	mv ../6.Maps_replicates/8.BedFiles/C.intestinalis/LDhat/c.intestinalis_ldhat_v"$i"_"$scale".smoothed.bed ../6.Maps_replicates/8.BedFiles/C.intestinalis/LDhat/c.intestinalis_ldhat_v"$i"_bins_100kb.bed
		#else
		#	mv ../6.Maps_replicates/8.BedFiles/C.intestinalis/LDhat/c.intestinalis_ldhat_v"$i"_"$scale".smoothed.bed ../6.Maps_replicates/8.BedFiles/C.intestinalis/LDhat/c.intestinalis_ldhat_v"$i"_bins_1Mb.bed
		#fi
	done
done


