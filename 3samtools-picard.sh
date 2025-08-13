#!bash

####---------------------------------------------------------------#######################################

#without picard no marked dups
#rna-seq and tt-seq should have dups kept - multiple transcript copies from the same allele, even in short tt-seq labelling (tt-seq protocols suggest duplicates kept)
#forward strand samtools
#see https://github.com/crickbabs/DRB_TT-seq/blob/master/bigwig.md 

ls *.bam | cut -d _ -f 1 | sort | uniq \
    | while read id; do \
	
samtools view -b -f 128 -F 16 --threads 17 ${id}_Aligned.sortedByCoord.out.bam > /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_fwd1.bam
samtools view -b -f 80  --threads 17  ${id}_Aligned.sortedByCoord.out.bam > /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_fwd2.bam
samtools merge --threads 17 -f /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_fwd.bam /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_fwd1.bam /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_fwd2.bam

samtools index /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_fwd.bam

done

#reverse strand samtools
ls *.bam | cut -d _ -f 1 | sort | uniq \
    | while read id; do \
	
samtools view -b -f 144 --threads 17 ${id}_Aligned.sortedByCoord.out.bam > /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_rev1.bam
samtools view -b -f 64 -F 16  --threads 17  ${id}_Aligned.sortedByCoord.out.bam > /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_rev2.bam
samtools merge --threads 17 -f /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_rev.bam /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_rev1.bam /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_rev2.bam

samtools index /mnt/i/imolbioinf-e/9ttseq-anna-data2/samtools-picard/${id}_rev.bam

done &


####---------------------------------------------------------------#######################################



