# brain_rna_seq

This repository contains data from a rna sequencing experiement on brain tissue from mice. 

## Overview

Tissue samples were processed using Illumina RNA-Seq 150bp, which resulted in the generation of .fastq files. The fastq files were then trimmed using Trimmomatic version 0.39, and aligned to reference genome (Mus Musculus (mouse) release 39 version 112 with annotation provided by the dna primary assembly .fasta file) using STAR version 2.7.11b, and this step resulted in the generation of .bam files. Next, featureCounts version 2.0.6 was used to process the bam files and generate counts, which are contained in the "counts" folder. 

The counts files were cleaned and organized using the "file_processing.R" file, and the result of this code is a list named "res" which contains raw counts for the four study groups, bch, bint, bnpfc, and bpfc. 

Finally, the data was analyzed using DESeq2 and the results for each groupwise comparision (i.e., bch vs bint, bch vs bnpfc, bch vs bpfc, bint vs bnpfc, bint vs bpfc, and bnpfc vs bpfc) are contained in the folders named accordingly. 

## Trimmomatic, STAR, and featureCounts

CAUTION! There is a lot to know about all three of these softwares. This repo is not meant to be a guide for using them but rather only to demonstrate some of their usage. Make sure to read about them and understand their system requirements and how they work.

Trimmomatic: http://www.usadellab.org/cms/?page=trimmomatic

A note on trimmomatic: For ease of use, I typically copy the whole trimmomatic folder into the directory where the rest of the code is. This allows easy access to the .jar file (the actual executable thing) and to the adapter sequence trimmers. 

STAR: https://github.com/alexdobin/STAR

featureCounts: https://subread.sourceforge.net/featureCounts.html

The code used to process the data from this study is included here in this repository. Please note, however, that some files/directories have been omitted due to their size. 

For example, in the star.R file, the argument of the first line "trimmed" is a folder that contains trimmed fastq files (made by trimmomatic), and it is 259GB. There are other file names and file paths throughout the code provided here, and if they lead to nowhere within this repository, it is likely due to their size and they have been purposfully omitted. 

The parameters used by these softwares can of course be written by hand, but depending on the number of files that need processing, this can become quite tedious. The three .R files, trim.R, star.R, and fc.R are used to generate the parameters for their respective softwares. The code was written to be malleable and can be changed as needed. 

Note: Be sure to change file paths in the parameters! These are usually named file_loc and file_dest, but depending on where you have trimmomatic on your computer, you may need to change that one, too. 

The result of trim.R is all_trim.zsh, the result of star.R is all_star.zsh, and the result of fc.R is both bch_bint_fc.zsh and bnpfc_bpfc_fc.zsh, which were created seperately because of the way precursor directories were made, but this is not a necessity. The way all three of these files work is by reading the names of the files in whatever folder you specify, and then it sticks the parameters and the filenames together into the order that the software can read it. 

Note: If not using z shell (zsh, usually mac), change the argument of "fileConn" from "whatever_it_is.zsh" to "whatever_you_want.bash". 

The generate_index.zsh file was used to generate STAR's reference genome using the following genome and fasta annotation files from ensembl.org:
genome: Mus_musculus.GRCm39.112.gtf
fasta: Mus_musculus.GRCm39.dna.primary_assembly.fa

## Analyzing the Counts

The raw counts files were processed by the "file_processing.R" file. The process involves reading all files from the folder "counts", dropping superfulous columns, organizing them in a coherent way, and then appending them to a list called "res". The counts for each group are then accessed as shown at the end of the file, if necessary. 

The "total_deseq.R" file was used to process all groupwise comparisons using DESeq2. The make_de function included there works by creating a new DESeq data set for each comparision and then running the analysis. The results are extracted such that all information is preserved, but also made to be precise. You can see the results of these analysis in the folders named after each groupwise comparison. The goal of the analyses was to identify significantly differentially expressed genes (DEGS) between groups. This was done by considering a absolute value log2FoldChange cut off of 1, and a padjusted value cut off of 0.05.  

You can read more about DESeq2 here: https://www.bioconductor.org/packages/release/bioc/vignettes/DESeq2/inst/doc/DESeq2.html