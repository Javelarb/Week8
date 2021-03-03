#!/bin/bash 
#SBATCH --job-name=read_alignment ## Name of the job. 
#SBATCH -A ecoevo283 ## account to charge 
#SBATCH -p standard ## partition/queue name 
#SBATCH --cpus-per-task=16

module load subread/2.0.1 
gtf="ref/dmel-all-r6.13.gtf" 
myfile=`cat RNA_prefixes.txt | sed 's/$/.sorted.bam/' | sed 's/^/RNASeq_out\//'`

featureCounts -p -T 16 -t exon -g gene_id -Q 30 -F GTF -a $gtf -o fly_counts.txt $myfile
