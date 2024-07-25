library(normtest)

x <- read.csv("multigroup/anova_results.csv")
x <- cf(x)

a <- seq.int(1:100)
#counter <- 0
counter <- 1
for (i in 1:length(a)) {    
    #counter <- counter + 1
    if (counter <= length(a)) {   
        for (j in counter:(counter + 1)) {
            cat(a[j])
        }
    cat("\n")
    #counter <- counter + 1
    counter <- counter + 2
    }
}

take2 <- function(x) {
    counter <- 1
    for (i in 1:(length(x) / 2)) {
        for (j in counter:(counter + 1)) {
            cat(x[j])
        }
        cat("\n")
        counter <- counter + 2        
    }
}

take2(colnames(x)[4:ncol(x)])

chop(x)

temp <- x[, 4:ncol(x)]

sig1 <- temp[, 1:2]
sig1 <- sig1[sig1[, 1] < 0.05, ]
sig1 <- sig1[abs(sig1[, 2]) > 1, ]


res <- c()
counter <- 1
for (i in 1:(ncol(temp) / 2)) {
    x <- head(temp)[, counter:(counter + 1)]
    res[[i]] <- x
    counter <- counter + 2
}
sig_res <- c()
for (j in 1:length(res)) {
    x <- res[[j]]
    x_sig <- x[x[, 1] < 0.05, ]
    x_sig <- x_sig[abs(x_sig[, 2]) > 1, ]
    sig_res[[j]] <- x_sig
}

chop <- function(x, p = 0.05, f = 1) {
    chopped <- c()
    res <- c()
    counter <- 1
    for (i in 1:(ncol(x) / 2)) {
        pfc <- x[, counter:(counter + 1)]
        res[[i]] <- pfc
        counter <- counter + 2
    }
    sig_res <- c()
    for (j in 1:length(res)) {
        cur <- res[[j]]
        sigs <- cur[cur[, 1] < p, ]
        sigs <- sigs[abs(sigs[, 2]) > f, ]
        sig_res[[j]] <- sigs
    }
    #chopped <- c(res, sig_res)
    chopped[[1]] <- res
    chopped[[2]] <- sig_res
    return(chopped)
}

chopped <- chop(temp)
res <- chopped[[1]]
res1 <- res[[1]]
sigs <- chopped[[2]]
sigs1 <- sigs[[6]]

y <- read.csv("multigroup/multi_group_welch_results.csv")
y <- cf(y)
temp <- y[, -1]

y_chopped <- chop(y)
y1 <- y_chopped[[1]]
y11 <- y1[[1]]
y2 <- y_chopped[[2]]
y21 <- y2[[1]]

x <- read.csv("t_test_results.csv")
x <- cf(x)
chopped <- chop(x)

sig <- chopped[[2]][[1]]

a <- c(1:50)
take2(a)

takeN <- function(x, n = 1, sep = "") {
    counter <- 1
    for (i in 1:(ceiling(length(x) / n))) {
        for (j in counter:(counter + (n-1))) {
            cat(x[j])
            cat(sep)
        }
        cat("\n")
        counter <- counter + n        
    }
}

takeN(a, n = 100, sep = " ")

chopped <- chop(x)
length(chopped)
