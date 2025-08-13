#!/bin/bash


###-------------------------------------------keep dups default----------------------------------#####
##-------------------------------------------------------------------------------------------------------###

#deeptools-bamcoverage as in cr-seq but with changes for spliced data, e.g.:
#skip extend-read parameter - not suitable for transcriptomic, spliced data
#use CPM normalization - tt-seq protocols suggest no normalization but spike-in in the data is strange and libraries look different

#needed to change conda env star to cutrun temporarily for deeptools - pin/python conflict (unsolved even when older version of deeptools were tried - must be python version of conda itself, might be solved with updated versions of deeptools)

#deeptools bam coverage - forward strand
ls *_fwd.bam | cut -d _ -f 1 | sort | uniq \
    | while read id; do \

      bamCoverage --bam ${id}_fwd.bam -o /mnt/i/imolbioinf-e/9ttseq-anna-data2/bamcoverage/${id}_noscale_cpm_fwd.bw \
    --scaleFactor 1 \
    --binSize 25 \
    --normalizeUsing CPM \
    --effectiveGenomeSize 2913022398 \
    --ignoreForNormalization chrX \
    --numberOfProcessors=18 \

      done &

#deeptools bam coverage - reverse strand
ls *_rev.bam | cut -d _ -f 1 | sort | uniq \
    | while read id; do \

      bamCoverage --bam ${id}_rev.bam -o /mnt/i/imolbioinf-e/9ttseq-anna-data2/bamcoverage/${id}_noscale_cpm_rev.bw \
    --scaleFactor 1 \
    --binSize 25 \
    --normalizeUsing CPM \
    --effectiveGenomeSize 2913022398 \
    --ignoreForNormalization chrX \
    --extendReads \
    --numberOfProcessors=18 \

      done


#-----------------------------------------no-normalization-bigwig-----------------------------------------###
##-------------------------------------------------------------------------------------------------------###
#deeptools bam coverage - reverse strand
ls *_rev.bam | cut -d _ -f 1 | sort | uniq \
    | while read id; do \

      bamCoverage --bam ${id}_rev.bam -o /mnt/i/imolbioinf-e/9ttseq-anna-data2/bamcoverage/nonorm/${id}_noscale_nonorm_rev.bw \
    --scaleFactor 1 \
    --binSize 25 \
    --normalizeUsing None \
    --effectiveGenomeSize 2913022398 \
    --ignoreForNormalization chrX \
    --extendReads \
    --numberOfProcessors=17 \

      done



###-------------------------------------------bin alternative----------------------------------#####
##-------------------------------------------------------------------------------------------------------###
#deeptools bam coverage - forward strand
ls *bam | cut -d _ -f 1 | sort | uniq \
    | while read id; do \

      bamCoverage --bam ${id}_fwd-rmvdup.bam -o /mnt/i/imolbioinf-e/9ttseq-anna-data2/bamcoverage/rmvdups/${id}_noscale_cpm_rmvdups_fwd.bw \
    --scaleFactor 1 \
    --binSize 25 \
    --normalizeUsing CPM \
    --effectiveGenomeSize 2913022398 \
    --ignoreForNormalization chrX \
    --numberOfProcessors=18 \

      done &

#deeptools bam coverage - reverse strand
ls *bam | cut -d _ -f 1 | sort | uniq \
    | while read id; do \

      bamCoverage --bam ${id}_rev-rmvdup.bam -o /mnt/i/imolbioinf-e/9ttseq-anna-data2/bamcoverage/rmvdups/${id}_noscale_cpm_rmvdups_rev.bw \
    --scaleFactor 1 \
    --binSize 25 \
    --normalizeUsing CPM \
    --effectiveGenomeSize 2913022398 \
    --ignoreForNormalization chrX \
    --extendReads \
    --numberOfProcessors=18 \

      done

