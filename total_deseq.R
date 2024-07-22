library(DESeq2)

genes <- read.table("geneInfo.tab", header = TRUE, col.names = c("ENS", "gene", "function"))
gene_names <- genes[, -3]
gene_names <- cf(gene_names)

make_de <- function(my_data, p = 0.05, f = 1, smallest_group_size = 0) {
    counter <- 1
    for (i in 1:length(my_data)) {
        counter = counter + 1
        if (counter <= length(my_data)) {
            for (j in counter:length(my_data)) {
                d <- merge(my_data[[i]], my_data[[j]], by = 0)
                d <- cf(d)
                #now we build dds
                metadata <- data.frame(samples = colnames(d), condition = gsub("_.*", "", colnames(d)))
                
                dds <- DESeqDataSetFromMatrix(countData = d, colData = metadata, design = ~ condition)
                keep <- rowSums(counts(dds) > 10) >= smallest_group_size
                dds <- dds[keep, ]

                dds <- DESeq(dds)
                res <- results(dds)
                print(res)
                res <- as.data.frame(res)
                conds <- unique(metadata$condition)
                write.csv(res, paste0(conds[1], "_vs_", conds[2], "_extended_info.csv"))

                sig <- res[complete.cases(res), ]
                sig <- sig[sig$padj < p, ]
                sig <- sig[abs(sig$log2FoldChange) > 1, ]
                print(head(sig))
                write.csv(sig, paste0(conds[1], "_vs_", conds[2], "_SIG_DEGS_extended_info.csv"))

                nc <- counts(dds, normalized = TRUE)
                nc <- merge(nc, gene_names, by = 0)
                nc <- cf(nc)
                print(head(nc))
                write.csv(nc, paste0(conds[1], "_vs_", conds[2], "_normalized_counts.csv"))

                deg_results <- res[, c(2, 5, 6)]
                deg_results <- merge(deg_results, nc, by = 0)
                deg_results <- cf(deg_results)
                print(head(deg_results))
                write.csv(deg_results, paste0(conds[1], "_vs_", conds[2], "_DEG_results.csv"))

                sig_degs <- sig[, c(2, 5, 6)]
                sig_degs <- merge(sig_degs, nc, by = 0)
                sig_degs <- cf(sig_degs)
                print(head(sig_degs))
                write.csv(sig_degs, paste0(conds[1], "_vs_", conds[2], "_Significant_DEGS.csv"))
            }
        }
    }
}

make_de(res, smallest_group_size = 4)
