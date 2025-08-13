#!/bin/bash
#!/bin/sh


#input filename at the end of the command

for file in *fastq.gz; do

fastqc -f fastq -t 17  -o /mnt/i/imolbioinf-e/9ttseq-anna-data2/fastQC $file

done

#then summarize all with multiqc
#navigate to fast-qc dir, then (dot is working dir)
multiqc .


#decompress
for file in *fastq.gz; do

gzip -d -k $file

done

