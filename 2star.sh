#!bash

#download genomes from ensembl GRCh38.114.release - primary assembly fa & gtf

#clean, remove rDNA
grep -v -i 'gene_biotype "rRNA";\|gene_biotype "Mt_rRNA";' Homo_sapiens.GRCh38.114.gtf > grch38_114_norRNA.gtf

#---------------------------------------------------------####################################
#build genome index
#sjdbOverhang parameter: https://github.com/alexdobin/STAR/issues/931 ; default = 100, otherwise set as read lenght - 1; Anna's data is likely 75bp PE but set 100 as max
STAR \
    --runThreadN 18 \
	--runMode genomeGenerate \
    --genomeDir /mnt/i/imolbioinf-e/references/GRCh38_primary_star-ref/ \
    --genomeFastaFiles Homo_sapiens.GRCh38.dna.primary_assembly.fa \
    --sjdbGTFfile grch38_114_norRNA.gtf \
    --sjdbOverhang 100 \

#---------------------------------------------------------####################################
#align
#when tried with gzipped fastq, fifo errors appear (would need to change tempdir partition to windows) - use decompressed fastq
ls *R1* | cut -d _ -f 1 | sort | uniq \
    | while read id; do \

STAR --genomeDir /mnt/i/imolbioinf-e/references/GRCh38_primary_star-ref/ \
--runMode alignReads \
--runThreadN 16 \
--readFilesIn ${id}_R1.fastq ${id}_R2.fastq \
--quantMode TranscriptomeSAM GeneCounts \
--twopassMode Basic \
--clip5pNbases 13 13 \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped None \
--outFileNamePrefix /mnt/i/imolbioinf-e/9ttseq-anna-data2/star/${id}_ \
--outSAMattributes Standard 

      done
