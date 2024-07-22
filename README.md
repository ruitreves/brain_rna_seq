# brain_rna_seq

This repository contains data from a rna sequencing experiement on brain tissue from mice. 

## Overview

Tissue samples were processed using Illumina RNA-Seq 150bp. This step resulted in the generation of .fastq files. The fastq files were then trimmed using Trimmomatic version 0.39, and aligned to reference genome (Mus Musculus (mouse) release 39 version 112 with annotation provided by the dna primary assembly .fasta file) using STAR version 2.7.11b, this step resulted in the generation of .bam files. Next featureCounts version 2.0.6 was used to process the bam files and generate counts. These counts files are contained in the "counts" folder. 

The counts files were cleaned and organized using the "file_processing.R" file. The result of this code is a list named "res" which contains raw counts for the four study groups, bch, bint, bnpfc, and bpfc. 

Finally, the data was analyzed using DESeq2 and the results for each comparision are contained in the folders named accordingly. 

## Trimmomatic, STAR, and featureCounts

Trimmomatic: http://www.usadellab.org/cms/?page=trimmomatic

STAR: https://github.com/alexdobin/STAR

featureCounts: https://subread.sourceforge.net/featureCounts.html

The code used to process the data from this study is included here in this repository. Please note, however, that some files/directories have been omitted due to their size. 

For example, in the star.R file, the argument of the first line "trimmed" is a folder that contains trimmed fastq files (made by trimmomatic), and it is 259GB. There are other file names and file paths throughout the code provided here, and if they lead to nowhere within this repository, it is likely due to their size and they have been purposfully omitted. 

The parameters used by these softwares can of course be written by hand, but depending on the number of files that need processing, this can become quite tedious. The three .R files, trim.R, star.R, and fc.R are used to generate the parameters for their respective softwares. The code was writted to be malleable and can be changed as needed. 

The result of trim.R is all_trim.zsh, the result of star.R is all_star.zsh, and the result of fc.R is both bch_bint_fc.zsh and bnpfc_bpfc_fc.zsh, which were created seperately because of the way precursor directories were made, but this is not a necessity. 

Note: If not using a mac, change the argument of "fileConn" to whatever_you_want.bash. 

The generate_index.zsh file was used to generate STAR's reference genome using the genome and fasta annotation files listed above. 

## Analyzing the Counts

The raw counts file were processed by the "file_processing.R" file. The process involves reading all files from the folder "counts", dropping superfulous columns, organizing them in a coherent way, and then appending them to a list called "res". The counts for each group are then accessed as shown at the end of the file, if necessary. 

The "total_deseq.R" file was used to process all groupwise comparisons (i.e., bch vs bint, bch vs bnpfc, bch vs bpfc, bint vs bnpfc, bint vs bpfc, and bnpfc vs bpfc) using DESeq2. The make_de function included there works by creating a new DESeq data set for each comparision and then running the analysis. The results are extracted such that all information is preserved, but also made to be precise. You can see the results of these analysis in the folders named after each groupwise comparison. 