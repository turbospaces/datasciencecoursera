source("complete.R")

corr <- function(directory,threshold=0) {
  id_count_data_frame <- complete(directory)
  id_indices <- which(id_count_data_frame$nobs>threshold)
  correlation <- c()
  inc <- 1
  if (length(id_indices) == 0)
  {
    correlation
  }
  
  for(i in id_indices) {
    f_path <- file.path(directory,sprintf("%03d.csv", i))
    data_for_corr <- na.omit(read.csv(f_path))
    correlation[inc] <- cor(data_for_corr[,"sulfate"], data_for_corr[,"nitrate"])
    inc <- inc + 1
  }
  correlation
}