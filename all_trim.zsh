#!/bin/bash

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BCH-309_R1_001.fastq bch_bint/BCH-309_R2_001.fastq \
	trimmed/trimmed_pairedBCH-309_R1_001.fastq trimmed/trimmed_unpairedBCH-309_R1_001.fastq \
	trimmed/trimmed_pairedBCH-309_R2_001.fastq trimmed/trimmed_unpairedBCH-309_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BCH-313_R1_001.fastq bch_bint/BCH-313_R2_001.fastq \
	trimmed/trimmed_pairedBCH-313_R1_001.fastq trimmed/trimmed_unpairedBCH-313_R1_001.fastq \
	trimmed/trimmed_pairedBCH-313_R2_001.fastq trimmed/trimmed_unpairedBCH-313_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BCH-314_R1_001.fastq bch_bint/BCH-314_R2_001.fastq \
	trimmed/trimmed_pairedBCH-314_R1_001.fastq trimmed/trimmed_unpairedBCH-314_R1_001.fastq \
	trimmed/trimmed_pairedBCH-314_R2_001.fastq trimmed/trimmed_unpairedBCH-314_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BCH-317_R1_001.fastq bch_bint/BCH-317_R2_001.fastq \
	trimmed/trimmed_pairedBCH-317_R1_001.fastq trimmed/trimmed_unpairedBCH-317_R1_001.fastq \
	trimmed/trimmed_pairedBCH-317_R2_001.fastq trimmed/trimmed_unpairedBCH-317_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BInt-390_R1_001.fastq bch_bint/BInt-390_R2_001.fastq \
	trimmed/trimmed_pairedBInt-390_R1_001.fastq trimmed/trimmed_unpairedBInt-390_R1_001.fastq \
	trimmed/trimmed_pairedBInt-390_R2_001.fastq trimmed/trimmed_unpairedBInt-390_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BInt-391_R1_001.fastq bch_bint/BInt-391_R2_001.fastq \
	trimmed/trimmed_pairedBInt-391_R1_001.fastq trimmed/trimmed_unpairedBInt-391_R1_001.fastq \
	trimmed/trimmed_pairedBInt-391_R2_001.fastq trimmed/trimmed_unpairedBInt-391_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BInt-392_R1_001.fastq bch_bint/BInt-392_R2_001.fastq \
	trimmed/trimmed_pairedBInt-392_R1_001.fastq trimmed/trimmed_unpairedBInt-392_R1_001.fastq \
	trimmed/trimmed_pairedBInt-392_R2_001.fastq trimmed/trimmed_unpairedBInt-392_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BInt-398_R1_001.fastq bch_bint/BInt-398_R2_001.fastq \
	trimmed/trimmed_pairedBInt-398_R1_001.fastq trimmed/trimmed_unpairedBInt-398_R1_001.fastq \
	trimmed/trimmed_pairedBInt-398_R2_001.fastq trimmed/trimmed_unpairedBInt-398_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BNPFC-381_R1_001.fastq bch_bint/BNPFC-381_R2_001.fastq \
	trimmed/trimmed_pairedBNPFC-381_R1_001.fastq trimmed/trimmed_unpairedBNPFC-381_R1_001.fastq \
	trimmed/trimmed_pairedBNPFC-381_R2_001.fastq trimmed/trimmed_unpairedBNPFC-381_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BNPFC-382_R1_001.fastq bch_bint/BNPFC-382_R2_001.fastq \
	trimmed/trimmed_pairedBNPFC-382_R1_001.fastq trimmed/trimmed_unpairedBNPFC-382_R1_001.fastq \
	trimmed/trimmed_pairedBNPFC-382_R2_001.fastq trimmed/trimmed_unpairedBNPFC-382_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BNPFC-383_R1_001.fastq bch_bint/BNPFC-383_R2_001.fastq \
	trimmed/trimmed_pairedBNPFC-383_R1_001.fastq trimmed/trimmed_unpairedBNPFC-383_R1_001.fastq \
	trimmed/trimmed_pairedBNPFC-383_R2_001.fastq trimmed/trimmed_unpairedBNPFC-383_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BNPFC-389_R1_001.fastq bch_bint/BNPFC-389_R2_001.fastq \
	trimmed/trimmed_pairedBNPFC-389_R1_001.fastq trimmed/trimmed_unpairedBNPFC-389_R1_001.fastq \
	trimmed/trimmed_pairedBNPFC-389_R2_001.fastq trimmed/trimmed_unpairedBNPFC-389_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BPFC-384_R1_001.fastq bch_bint/BPFC-384_R2_001.fastq \
	trimmed/trimmed_pairedBPFC-384_R1_001.fastq trimmed/trimmed_unpairedBPFC-384_R1_001.fastq \
	trimmed/trimmed_pairedBPFC-384_R2_001.fastq trimmed/trimmed_unpairedBPFC-384_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BPFC-385_R1_001.fastq bch_bint/BPFC-385_R2_001.fastq \
	trimmed/trimmed_pairedBPFC-385_R1_001.fastq trimmed/trimmed_unpairedBPFC-385_R1_001.fastq \
	trimmed/trimmed_pairedBPFC-385_R2_001.fastq trimmed/trimmed_unpairedBPFC-385_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BPFC-386_R1_001.fastq bch_bint/BPFC-386_R2_001.fastq \
	trimmed/trimmed_pairedBPFC-386_R1_001.fastq trimmed/trimmed_unpairedBPFC-386_R1_001.fastq \
	trimmed/trimmed_pairedBPFC-386_R2_001.fastq trimmed/trimmed_unpairedBPFC-386_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \
	PE -threads 16 -phred33 \
	bch_bint/BPFC-387_R1_001.fastq bch_bint/BPFC-387_R2_001.fastq \
	trimmed/trimmed_pairedBPFC-387_R1_001.fastq trimmed/trimmed_unpairedBPFC-387_R1_001.fastq \
	trimmed/trimmed_pairedBPFC-387_R2_001.fastq trimmed/trimmed_unpairedBPFC-387_R2_001.fastq \
	ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \
	MINLEN:30 \

