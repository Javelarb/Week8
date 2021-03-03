# Advanced informatics

This is a repo for week 8 lab for ecoevo283.

[Home](https://github.com/Javelarb/Advanced_Informatics_2021)

I began by creating the prefix.txt file manually since it was 4 entries.  
If it was more samples, I think I could do a `basename` command, or some combo of echo or printf.  

`$(printf 'I=%s ' ${prefix}*.RG.bam)` lists all the files begining with whatever string matches the $prefix variable, like ADL06_1,2,3,..n.  
Then it printf prints that in place of $s, using the formula provided within quotes.  
So the output would look like this `I=ADL06_1.RG.bam,ADL06_2.RG.bam,ADL06_3.RG.bam`.  
This is great because it eliminates the need to create a temporary variable or file.  

Checking the `--help` command of each of the functions for the SNP calling script, it doesn't look like any of them are multi-threaded.  
The exception is a thread caching option for the MergeSamFiles.jar, which I set to true.  
This is not true parallelization though and it only cites a speed increase of 20%.  


For the merge vcf step, I did not see any ability to multithread.  
`$(printf -- '-V %s ' DNASeq_out/*.g.vcf.gz)` prints all 4 vcf files from each sample following -V.  

GenotypeGVCFs went well.  
I did not see multithreading capabilities here either.  
The solution is to split vcf file into segments and then re-merge after running.

DESeq2 and the remaining packages installed nicely using the provided code.  
I did not use conda to install.  

Featurecounts went well.  
I used 16 cores to run my job.  
My RNA seq names were a bit different so I modified the `myfile=...` command to add the directory path and a suffix to end in .sorted.bam.  

