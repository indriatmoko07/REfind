#' Eliminate restriction enzyme produced non-unique DNA fragmentation to the target species
#'
#' @param x -data.frame from re_filter_lowfrag or score data from re_sim
#'
#' @return data.frame containing list of restriction enzyme produced unique DNA fragmentation  to the target species
#' @export
#'
#' @examples
#' ?re_filter_lowfrag
#' Filt2.Target<-re_filter_target(Filt1.DataMerge)

re_filter_targetSpec<- function(x){
  df<-x
  df1<-df[-1]
  df2<-df[1]
  df1.1<-as.numeric(as.matrix(df1))
  row<-nrow(df1)
  col<-ncol(df1)
  df1.2<-matrix(df1.1,row,col)
  df2.1<-as.numeric(as.matrix(df2))
  res<-Rfast::rowCountValues(df1.2,df2.1)
  merge<-cbind(df,res)
  merge<-merge[merge$res==0,]
  merge<-merge[,1:ncol(df)]
  return(merge)
}
