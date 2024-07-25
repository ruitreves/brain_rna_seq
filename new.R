library(onewaytests)
library(normtest)

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

w <- welch.test(new_dat[1, ] ~ sample_info$group, data = as.data.frame(new_dat[1, ]))

welch_res <- run_welch(new_dat, sample_info$group)

w$p.value == welch_res[1, ]

###############
### Dunnett ###
###############

library(PMCMRplus)

x <- data.frame()
cols <- c()
for (i in 1:20) {
    n <- rnorm(1000, 0, 1)
    c <- paste("Y", i, sep="")
    cols <- append(cols, c)
    x <- rbind(x, n)
}

x <- t(x)

rows <- c()
for (i in 1:1000) {
    a <- paste("X", i, sep="")
    rows <- append(rows, a)
}

rownames(x) <- rows
colnames(x) <- cols

sample_info <- data.frame(sample = colnames(x), group = c(rep("Group1", 5), rep("Group2", 5), rep("Group3", 5), rep("Group4", 5)))

z <- run_dunnett(head(x), sample_info$group)

test <- NULL
for (i in 1:nrow(head(x))) {
  d <- PMCMRplus::dunnettT3Test(unlist(x[i, ]), g = as.factor(sample_info$group))
  p <- d$p.value

  pvals <- NULL
  for (i in p) {
      pvals <- cbind(pvals, i)
  }
  pvals <- pvals[, colSums(is.na(pvals)) == 0]
  pvals <- t(as.data.frame(pvals))

  test <- rbind(test, pvals)
}

colnames(test) <- colnames(z)
rownames(test) <- rownames(z)

for (i in 1:nrow(test)) {
    print(all.equal(test[i, ], z[i, ], tolerance = 0.0001))
}

for (i in 1:nrow(test)) {
    for (j in 1:ncol(test)) {
        print(all.equal(test[i, j], z[i, j], tolerance = 0.0001))
    }
}

###
library(normtest)
library(PMCMRplus)
library(testthat)

d <- dummy_data(group_max = 6)
x <- d[[1]]
sample_info <- d[[2]]

z <- run_dunnett(x, sample_info$groups)

res <- NULL
for (i in 1:nrow(x)) {
  d <- PMCMRplus::dunnettT3Test(unlist(x[i, ]), g = as.factor(sample_info$group))
  p <- d$p.value

  pvals <- NULL
  for (i in p) {
      pvals <- cbind(pvals, i)
  }
  pvals <- pvals[, colSums(is.na(pvals)) == 0]
  pvals <- t(as.data.frame(pvals))

  res <- rbind(res, pvals)
}

colnames(res) <- colnames(z)
rownames(res) <- rownames(z)

for (i in 1:nrow(res)) {
    for (j in 1:ncol(res)) {
        print(all.equal(res[i, j], z[i, j], tolerance = 0.0002))
    }
}

###############
#### Tukey ####
###############

d <- dummy_data()
x <- d[[1]]
sample_info <- d[[2]]

tukey_res <- run_tukey(x, sample_info$groups)

mod <- aov(unlist(x[1, ]) ~ sample_info$groups)
tt <- TukeyHSD(mod)
res <- as.data.frame(tt[1])
res <- t(res)
res <- as.data.frame(res[4, ])
res <- t(res)

big_res <- NULL
for (i in 1:nrow(x)) {
    mod <- aov(unlist(x[i, ]) ~ sample_info$groups)
    tt <- TukeyHSD(mod)
    res <- as.data.frame(tt[1])
    res <- t(res)
    res <- as.data.frame(res[4, ])
    res <- t(res)
    big_res <- rbind(big_res, res)
}

for (i in 1:nrow(big_res)) {
    for (j in 1:ncol(big_res)) {
        print(all.equal(big_res[i, j], tukey_res[i, j]))
    }
}

################
##### Dunn #####
################

d <- dummy_data(group_max = 5)
x <- d[[1]]
sample_info <- d[[2]]

dunn_res <- run_dunn(x, sample_info$groups)

dunn_test <- NULL
for (i in 1:nrow(x)) {
    dunn <- Adunn.test(unlist(x[i, ]), g=sample_info$groups, method="bonferroni", table = FALSE, kw = FALSE, altp = TRUE)
    dunn_padj <- as.data.frame(dunn[4])
    dunn_padj <- t(dunn_padj)

    dunn_test <- rbind(dunn_test, dunn_padj)
}

grp_list <- unique(sample_info$groups)
grp_list <- grp_list[order(grp_list)]

col_names <- c()
counter <- 1
for (g in grp_list) {
    counter <- counter +  1
    if (counter <= length(grp_list)) {
        for (i in counter:length(grp_list)) {
        the_name <- paste0(g, " - ", grp_list[i])
        col_names <- append(col_names, the_name)
        }
    }
}

dunn_test <- dunn_test[, match(col_names, dunn$comparisons)]
colnames(dunn_test) <- col_names

for (i in 1:nrow(dunn_test)) {
    for (j in 1:ncol(dunn_test)) {
        print(all.equal(dunn_test[i, j], dunn_res[i, j]))
    }
}

###########################
### two_group_test_norm ###
###########################
library(normtest)
library(car)

d <- dummy_data()
x <- d[[1]]
sample_info <- d[[2]]

res <- two_group_test_norm(x, sample_info$groups)

pass_shap <- NULL
for (i in 1:nrow(x)) {
    rows <- rownames(x)
    mod <- glm(unlist(x[i, ]) ~ sample_info$groups)
    resids <- mod$residuals
    shap <- shapiro.test(resids)
    if (shap$p.value >= 0.05) {
        pass_shap <- rbind(pass_shap, rows[i])
    }
}
pass1 <- x[pass_shap, ]

pass_lev <- NULL
for (i in 1:nrow(pass1)) {
    rows <- rownames(pass1)
    mod <- glm(unlist(pass1[i, ]) ~ sample_info$groups)
    resids <- mod$residuals
    vari <- leveneTest(resids ~ sample_info$groups)
    if (vari$Pr[1] >= 0.05) {
        pass_lev <- rbind(pass_lev, rows[i])
    }
}
pass2 <- x[pass_lev, ]
#pass1 passed shapiro
#pass2 passed both shapiro and levene
all.equal(pass2, res[[1]])
#setdiff(pass1, pass2) passed shapiro and not levene
all.equal(setdiff(pass1, pass2), res[[2]], check.attributes = FALSE)
#setdiff(x, union(pass1, pass2)) passed neither shapiro nor levene
all.equal(setdiff(x, union(pass1, pass2)), res[[3]], check.attributes = FALSE)
