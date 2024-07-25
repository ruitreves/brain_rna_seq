new_dat <- data.frame()
cols <- c()
for (i in 1:20) {
    n <- rnorm(1000, 0, 1)
    x <- paste("X", i, sep="")
    y <- paste("Y", i, sep="")
    cols <- append(cols, y)
    new_dat <- rbind(new_dat, n)
}

new_dat <- t(new_dat)

rows <- c()
for (i in 1:1000) {
    x <- paste("X", i, sep="")
    rows <- append(rows, x)
}

rownames(new_dat) <- rows
colnames(new_dat) <- cols

library(onewaytests)

sample_info <- data.frame(sample = colnames(new_dat), group = c(rep("Group1", 5), rep("Group2", 5), rep("Group3", 5), rep("Group4", 5)))

w <- welch.test(new_dat[1, ] ~ sample_info$group, data = as.data.frame(new_dat[1, ]))

welch_res <- run_welch(new_dat, sample_info$group)

w$p.value == welch_res[1, ]

###############
### Dunnett ###
###############

library(PMCMRplus)

new_dat <- data.frame()
cols <- c()
for (i in 1:20) {
    n <- rnorm(1000, 0, 1)
    x <- paste("X", i, sep="")
    y <- paste("Y", i, sep="")
    cols <- append(cols, y)
    new_dat <- rbind(new_dat, n)
}

new_dat <- t(new_dat)

rows <- c()
for (i in 1:1000) {
    x <- paste("X", i, sep="")
    rows <- append(rows, x)
}

rownames(new_dat) <- rows
colnames(new_dat) <- cols

sample_info <- data.frame(sample = colnames(new_dat), group = c(rep("Group1", 5), rep("Group2", 5), rep("Group3", 5), rep("Group4", 5)))

x <- run_dunnett(head(new_dat), sample_info$group)
for (i in 1:nrow(head(new_dat))) {
  d <- PMCMRplus::dunnettT3Test(unlist(new_dat[i, ]), g = as.factor(sample_info$group))
  p <- d$p.value

  pvals <- NULL
  for (i in p) {
      pvals <- cbind(pvals, i)
  }
  pvals <- pvals[, colSums(is.na(pvals)) == 0]
  pvals <- t(as.data.frame(pvals))

  for (j in 1:ncol(pvals)) {
    print(all.equal(pvals[[j]], x[i, j], tolerance = 0.0001))
  }
}

for (j in 1:ncol(pvals)) {
    print(pvals[[j]])
    print(x[6, j])
}
