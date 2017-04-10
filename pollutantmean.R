pollutantmean <- function(directory,pollutant,id=1:332) {
  all_rows <- data.frame()
  for(i in id) {
    f_path <- file.path(directory,sprintf("%03d.csv", i))
    all_rows <- rbind(all_rows, read.csv(f_path));
  }
  val <- mean(all_rows[,pollutant], na.rm = TRUE);
  round(val, digits=3)
}

complete <- function(directory,id=1:332) {
  all_rows <- data.frame(id=numeric(0),nobs=numeric(0))
  for(i in id) {
    f_path <- file.path(directory,sprintf("%03d.csv", i))
    f_rows <- nrow(na.omit(read.csv(f_path)))
    all_rows <- rbind(all_rows, data.frame(id=i,nobs=f_rows));
  }
  all_rows
}