#!/bin/bash
# Commande pour estimer le taux de GC au niveau des fenêtres des cartes de recombinaison : 10kb, 100kb, 1Mb


#declare -a bedfiles=("../5.LDHelmet_stat_phasing/8.BedFiles/c.intestinalis_stat_bins_10kb.bed" "../5.LDHelmet_stat_phasing/8.BedFiles/c.intestinalis_stat_bins_100kb.bed" "../5.LDHelmet_stat_phasing/8.BedFiles/c.intestinalis_stat_bins_1Mb.bed" "../5.LDHelmet_stat_phasing/8.BedFiles/c.robusta_stat_bins_10kb.bed" "../5.LDHelmet_stat_phasing/8.BedFiles/c.robusta_stat_bins_100kb.bed" "../5.LDHelmet_stat_phasing/8.BedFiles/c.robusta_stat_bins_1Mb.bed");
#declare -a outputs=("../5.LDHelmet_stat_phasing/8.BedFiles/c.intestinalis_stat_GC_bins_10kb.bed" "../5.LDHelmet_stat_phasing/8.BedFiles/c.intestinalis_stat_GC_bins_100kb.bed" "../5.LDHelmet_stat_phasing/8.BedFiles/c.intestinalis_stat_GC_bins_1Mb.bed" "../5.LDHelmet_stat_phasing/8.BedFiles/c.robusta_stat_GC_bins_10kb.bed" "../5.LDHelmet_stat_phasing/8.BedFiles/c.robusta_stat_GC_bins_100kb.bed" "../5.LDHelmet_stat_phasing/8.BedFiles/c.robusta_stat_GC_bins_1Mb.bed");
#for i in "${!bedfiles[@]}"
#do
#	python3 getGCcontext.py -dirpath . -bed ${bedfiles[$i]} -fasta /home/aureliefischer/Documents/Projet_Cione/Genome/ncbi-genomes-2021-06-04/GCF_000224145.1_KH_genomic.fna -win 0 -o ${outputs[$i]};
#done

declare -a scales=("10kb" "100kb" "1Mb");
for i in {1..3}
do
	for scale in ${scales[*]}
	do
		python3 getGCcontext.py -dirpath . -bed ../6.Maps_replicates/8.BedFiles/C.robusta/LDhat/c.robusta_ldhat_v"$i"_bins_"$scale".bed -fasta /home/aureliefischer/Documents/Projet_Cione/Genome/ncbi-genomes-2021-06-04/GCF_000224145.1_KH_genomic.fna -win 0 -o ../6.Maps_replicates/8.BedFiles/C.robusta/LDhat/c.robusta_ldhat_v"$i"_GC_bins_"$scale".bed;
	done
done
