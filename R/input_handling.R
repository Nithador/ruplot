data_constructor <- function(df_data) {
  tmp <- as.list(df_data)
  out <- unname(tmp)

  return(out)
}
