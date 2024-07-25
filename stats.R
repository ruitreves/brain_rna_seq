library(normtest)

norm_counts <- read.csv("BCH_vs_BPFC/BCH_vs_BPFC_normalized_counts.csv")
norm_counts <- cf(norm_counts)

norm_counts <- norm_counts[, -9]

sample_info <- data.frame(samples = colnames(norm_counts), group = c(rep("BCH", 4), rep("BPFC", 4)))

two_group_rui(norm_counts, sample_info$group)

x <- read.csv("t_test_results.csv")
x <- cf(x)
y <- read.csv("two_group_welch_results.csv")
y <- cf(y)
z <- read.csv("wilcox_results.csv")
z <- cf(z)

sigs <- read.csv("BCH_vs_BPFC/BCH_vs_BPFC_extended_info.csv")
sigs <- cf(sigs)
sigs <- sigs[sigs$pvalue < 0.05, ]
sigs <- sigs[, -c(1,3,4)]

id_deg <- function(x, p = 0.05, f = 1) {
    x <- x[x[, 1] < p, ]
    x <- x[abs(x[, 2]) > f, ]
    return(x)
}

x_sig <- id_deg(x, f = 0)
y_sig <- id_deg(y, f = 0)
z_sig <- id_deg(z, f = 0)

rui <- rbind(x_sig, y_sig, z_sig)
xyz <- rbind(x, y, z)

a <- merge(sigs, xyz, by = 0)
a <- cf(a)
a <- a[, -1]
a$test <- a$log2FoldChange_BCH_vs_BPFC - a$log2FoldChange
a$test2 <- log2(abs(a$test))
