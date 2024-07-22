#!/bin/bash

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bch_bint_counts/BCH_309counts.txt bch_bint_bam/BCH_309Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bch_bint_counts/BCH_313counts.txt bch_bint_bam/BCH_313Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bch_bint_counts/BCH_314counts.txt bch_bint_bam/BCH_314Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bch_bint_counts/BCH_317counts.txt bch_bint_bam/BCH_317Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bch_bint_counts/BInt_390counts.txt bch_bint_bam/BInt_390Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bch_bint_counts/BInt_391counts.txt bch_bint_bam/BInt_391Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bch_bint_counts/BInt_392counts.txt bch_bint_bam/BInt_392Aligned.sortedByCoord.out.bam

featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o bch_bint_counts/BInt_398counts.txt bch_bint_bam/BInt_398Aligned.sortedByCoord.out.bam

