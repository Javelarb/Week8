#!/bin/bash 
#SBATCH --job-name=test ## Name of the job. 
#SBATCH -A ecoevo283 ## account to charge 
#SBATCH -p standard ## partition/queue name 
#SBATCH --cpus-per-task=2 ## number of cores the job needs, can the programs you run make use of multiple cores?

module load java/1.8.0 
module load gatk/4.1.9.0 

ref="ref/dmel-all-chromosome-r6.13.fasta"

# another dirty shell trick, you can't printf -V...
/opt/apps/gatk/4.1.9.0/gatk CombineGVCFs -R $ref $(printf -- '-V %s ' DNASeq_out/*.g.vcf.gz) -O allsample.g.vcf.gz
## and merge gVCFs
