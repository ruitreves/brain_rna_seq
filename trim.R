#read in the names of all files from folder 
a <- list.files("bch_bint")

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

#trimmomatic parameters 
param1 <- "java -jar Trimmomatic-0.39/trimmomatic-0.39.jar \\"
param2 <- "PE -threads 16 -phred33 \\"
param3 <- "ILLUMINACLIP:Trimmomatic-0.39/adapters/TruSeq3-PE-2.fa:2:30:10:2:TRUE LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 \\"
param4 <- "MINLEN:30 \\"
file_loc <- "bch_bint/"
file_dest <- "trimmed/"

paste0(param1, "\n", param2, file_loc, d[1, 1], " ", file_loc, d[1, 2], "\n", 
       file_dest, "trimmed_paired", d[1, 1], " ", file_dest, "trimmed_unpaired", d[1, 1], 
       "\n", file_dest, "trimmed_paired", d[1, 2], " ", file_dest, "trimmed_unpaired", d[1, 2], 
       "\n", param3, "\n", param4)

#list from which file will be written
m <- c()
#put all the parameters and files together
for (i in 1:nrow(d)) {
    x <- paste0(param1, "\n", "\t", param2, "\n", "\t", file_loc, d[i, 1], " ", file_loc, d[i, 2], " \\", "\n", "\t",
       file_dest, "trimmed_paired", d[i, 1], " ", file_dest, "trimmed_unpaired", d[i, 1], " \\",
       "\n", "\t", file_dest, "trimmed_paired", d[i, 2], " ", file_dest, "trimmed_unpaired", d[i, 2], " \\",
       "\n", "\t", param3, "\n", "\t", param4, "\n")
    m <- append(m, x)
}

#write file
fileConn <- file("maybe.zsh")
writeLines(m, fileConn)
close(fileConn)
