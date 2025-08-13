#!/bin/bash


#on bigwigs noscale cpm-normalized

###--------------keep-dups-default----------------------------#####
#fwd reads
multiBigwigSummary BED-file \
--BED /mnt/i/imolbioinf-e/references/multibwsumm-refs/plus-fwd_grch38_114_norRNA_gene-feature.bed \
--bwfiles /mnt/i/imolbioinf-e/9ttseq-anna-data2/bamcoverage/*_noscale_cpm_fwd.bw \
--numberOfProcessors max --smartLabels --verbose \
--outFileName /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_noscale_cpm_fwd-plus.npz \
--outRawCounts /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_noscale_cpm_fwd-plus.tab

#rev reads
multiBigwigSummary BED-file \
--BED /mnt/i/imolbioinf-e/references/multibwsumm-refs/minus-rev_grch38_114_norRNA_gene-feature.bed \
--bwfiles /mnt/i/imolbioinf-e/9ttseq-anna-data2/bamcoverage/*_noscale_cpm_rev.bw \
--numberOfProcessors max --smartLabels --verbose \
--outFileName /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_noscale_cpm_rev-minus.npz \
--outRawCounts /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_noscale_cpm_rev-minus.tab

###-------------- bin alternative--------------------------#####
#fwd reads
multiBigwigSummary bins \
--binSize 5000 \
--bwfiles /mnt/i/imolbioinf-e/9ttseq-anna-data2/bamcoverage/*_noscale_cpm_fwd.bw \
--numberOfProcessors 16 --smartLabels --verbose \
--outFileName /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_noscale_cpm_fwd-plus-bin5kb.npz \
--outRawCounts /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_noscale_cpm_fwd-plus-bin5kb.tab

#rev reads
multiBigwigSummary bins \
--binSize 5000 \
--bwfiles /mnt/i/imolbioinf-e/9ttseq-anna-data2/bamcoverage/*_noscale_cpm_rev.bw \
--numberOfProcessors 16 --smartLabels --verbose \
--outFileName /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_noscale_cpm_rev-minus-bin5kb.npz \
--outRawCounts /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_noscale_cpm_rev-minus-bin5kb.tab

###--------------enhancer reference--------------------------#####

#fwd reads - hela enhancers
multiBigwigSummary BED-file \
--BED /mnt/i/imolbioinf-e/references/enhancers/hela-enhanceratlas.bed \
--bwfiles /mnt/i/imolbioinf-e/9ttseq-anna-data2/bamcoverage/*_noscale_cpm_fwd.bw \
--numberOfProcessors max --smartLabels --verbose \
--outFileName /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_hela-enhancer_noscale_cpm_fwd-plus.npz \
--outRawCounts /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_hela-enhancer_noscale_cpm_fwd-plus.tab

#rev reads - hela enhancers
multiBigwigSummary BED-file \
--BED /mnt/i/imolbioinf-e/references/enhancers/hela-enhanceratlas.bed \
--bwfiles /mnt/i/imolbioinf-e/9ttseq-anna-data2/bamcoverage/*_noscale_cpm_rev.bw \
--numberOfProcessors max --smartLabels --verbose \
--outFileName /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_hela-enhancer_noscale_cpm_rev-minus.npz \
--outRawCounts /mnt/i/imolbioinf-e/9ttseq-anna-data2/multibwsumm/ttseq_hela-enhancer_noscale_cpm_rev-minus.tab