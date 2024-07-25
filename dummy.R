group_num <- floor(runif(1, min = 3, max = 100))

group_names <- c()
for (i in 1:group_num) {
    group_name <- paste0("group", i)
    group_names <- append(group_names, group_name)
}

dims <- ceiling(runif(2, min = 1, max = 100))

col_num <- dims[1] * group_num
row_num <- dims[2]

parms <- ceiling(runif(2, min = 0, max = 20))

m <- parms[2]
v <- parms[1]

x <- data.frame()
cols <- c()
for (i in 1:col_num) {
    n <- rnorm(row_num, m, v)
    c <- paste0("Y", i)
    cols <- append(cols, c)
    x <- rbind(x, n)
}

x <- t(x)

rows <- c()
for (i in 1:row_num) {
    r <- paste0("X", i)
    rows <- append(rows, r)
}

rownames(x) <- rows
colnames(x) <- cols

sample_info <- data.frame(samples = colnames(x), groups = group_names)

dummy_data <- function(group_min = 3, group_max = 20, dim_min = 1, dim_max = 50, param_min = 0, param_max = 20) {
    group_num <- floor(runif(1, min = group_min, max = group_max))

    group_names <- c()
    for (i in 1:group_num) {
        group_name <- paste0("group", i)
        group_names <- append(group_names, group_name)
    }

    dims <- ceiling(runif(2, min = dim_min, max = dim_max))
    col_num <- dims[1] * group_num
    row_num <- dims[2]

    parms <- ceiling(runif(2, min = param_min, max = param_max))
    m <- parms[2]
    v <- parms[1]

    x <- data.frame()
    cols <- c()
    for (i in 1:col_num) {
        n <- rnorm(row_num, m, v)
        c <- paste0("Y", i)
        cols <- append(cols, c)
        x <- rbind(x, n)
    }

    x <- t(x)

    rows <- c()
    for (i in 1:row_num) {
        r <- paste0("X", i)
        rows <- append(rows, r)
    }

    rownames(x) <- rows
    colnames(x) <- cols

    sample_info <- data.frame(samples = colnames(x), groups = group_names)

    dum <- c()
    dum[[1]] <- x
    dum[[2]] <- sample_info

    return(dum)
}

d <- dummy_data()
x <- d[[1]]
sample_info <- d[[2]]



