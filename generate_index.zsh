#!/bin/bash

#DON'T RUN THIS UNLESS YOU ARE CERTAIN YOU NEED TO
#run on 3/27/24 start: 14:17:46 end: 22:02:57
#4/5/24 start 12:42:30 end 4/7/24 3:06:23

#run on 7/11/24. Start: 14:31:18 End: 14:42:56
#generate genome from files:
#Mus_musculus.GRCm38.dna.primary_assembly.fa
#Mus_musculus.GRCm38.102.gtf

#run on 7/15/24. Start: 11:29:30 End: 11:4
#generate genome from files:
#Mus_musculus.GRCm38.dna.primary_assembly.fa
#Mus_musculus.GRCm38.102.gtf
#added parameter : --sjdbOverhang 149 \

STAR --runThreadN 8 \
--runMode genomeGenerate \
--genomeDir data/index_39 \
--genomeFastaFiles data/ref/Mus_musculus.GRCm39.dna.primary_assembly.fa \
--sjdbGTFfile data/ref/Mus_musculus.GRCm39.112.gtf \
--sjdbOverhang 149 \