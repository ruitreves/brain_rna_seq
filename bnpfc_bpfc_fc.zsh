#!/bin/bash

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bnpfc_bpfc_counts/BNPFC_381counts.txt bnpfc_bpfc_bam/BNPFC_381Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bnpfc_bpfc_counts/BNPFC_382counts.txt bnpfc_bpfc_bam/BNPFC_382Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bnpfc_bpfc_counts/BNPFC_383counts.txt bnpfc_bpfc_bam/BNPFC_383Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bnpfc_bpfc_counts/BNPFC_389counts.txt bnpfc_bpfc_bam/BNPFC_389Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bnpfc_bpfc_counts/BPFC_384counts.txt bnpfc_bpfc_bam/BPFC_384Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bnpfc_bpfc_counts/BPFC_385counts.txt bnpfc_bpfc_bam/BPFC_385Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bnpfc_bpfc_counts/BPFC_386counts.txt bnpfc_bpfc_bam/BPFC_386Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bnpfc_bpfc_counts/BPFC_387counts.txt bnpfc_bpfc_bam/BPFC_387Aligned.sortedByCoord.out.bam

