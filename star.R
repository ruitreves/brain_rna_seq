#read in the names of all files from folder 
a <- list.files("trimmed")

#two lists, one for R1, one for R2
col1 <- c()
col2 <- c()
#Assign all R1s to col1, all R2s to col2
for (i in 1:length(a)) {
    if (i %% 2 == 1) {
        col1 <- append(col1, a[i])
    }
    if (i %% 2 == 0) {
        col2 <- append(col2, a[i])
    }
}
#make dataframe, col1 is all R1s, col2 is all R2s. We'll do something like take row1 col1, row1 col2, etc 
#in order to put read pairs next to each other
d <- data.frame(R1 = col1, R2 = col2)

param1 <- "STAR --runThreadN 8 \\"
param2 <- "--readFilesIn "
param3 <- "--genomeDir data/index_39 \\"
param4 <- "--outSAMtype BAM SortedByCoordinate"
param5 <- "--outFileNamePrefix "
file_loc <- "trimmed/"
file_dest <- "trimmed_bch_bint/"
file_pref <- gsub("trimmed_paired", "", a)
file_pref <- gsub("_R.*", "", file_pref)
file_pref <- unique(file_pref)
file_pref <- gsub("-", "_", file_pref)

m <- c()
for (i in 1:nrow(d)) {
    x <- paste0(param1, "\n", param2, file_loc, d[i, 1], " ", file_loc, d[i, 2], " \\", "\n", param3, "\n", param4, " \\", "\n", 
                param5, file_dest, file_pref[i], " ", "\\", "\n")
    m <- append(m, x)
}

fileConn <- file("all_star.zsh")
writeLines(m, fileConn)
close(fileConn)