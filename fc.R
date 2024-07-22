a <- list.files("bnpfc_bpfc_bam")

param1 <- "featureCounts --largestOverlap -a data/ref/Mus_musculus.GRCm39.112.gtf -t exon -g gene_id -s 0 -p --countReadPairs -T 8 -o"
file_loc <- "bnpfc_bpfc_bam/"
file_dest <- "bnpfc_bpfc_counts/"
file_pref <- gsub("Aligned.*", "", a)

m <- c()
for (i in 1:length(a)) {
    x <- paste0(param1, " ", file_dest, file_pref[i], "counts.txt", " ", file_loc, a[i], "\n")
    m <- append(m, x)
}

fileConn <- file("bnpfc_bpfc_fc.zsh")
writeLines(m, fileConn)
close(fileConn)