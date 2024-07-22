#helper function, column fix
cf <- function(x, col_idx = 1) {
    rownames(x) <- x[, col_idx]
    x[, col_idx] <- NULL
    return(x)
}
#process function
proc <- function(dat) {
    dat <- dat[, c(1, 7)]
    dat <- cf(dat)
    return(dat)
}
#assigned according to file names in "folder"
file_prefixes <- c("BCH", "BInt", "BNPFC", "BPFC")
#will create a list of dataframes (dfs) for analysis
f <- function(folder, prefixes) {
    #list which will contain dfs 
    res <- c()
    for (i in 1:length(prefixes)) {
        #for each file prefix
        files <- list.files(folder, pattern = prefixes[i], full.names = TRUE)
        #read in files
        read_files <- lapply(files, read.table, header = TRUE)
        #apply the proc function
        proc_files <- lapply(read_files, proc)
        #cbind them 
        d <- do.call(what = cbind, args = proc_files)
        #make column names precise
        column_names <- gsub(".*bam.", "", colnames(d))
        column_names <- gsub("Aligned.*", "", column_names)
        colnames(d) <- column_names
        #append them to list "res"
        res[[i]] <- d
    }
    return(res)
}

#call function f on folder "counts", res is a list
res <- f(folder = "counts", prefixes = file_prefixes)
#assign groups
bch <- res[[1]]
bint <- res[[2]]
bnpfc <- res[[3]]
bpfc <- res[[4]]

