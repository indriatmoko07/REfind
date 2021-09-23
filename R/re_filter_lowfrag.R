#' Removing restriction enzyme producing low fragment
#'
#' @param x -data.frame, list of score value from multiple species
#'
#' @return data frame containing list of restriction enzymes and score
#' @export
#'
#' @examples
#' Homfasta<-read.fasta("P.homarus.fasta")
#' SimHom<-re_sim(fasta = Homfasta, min.bp = 150)
#'
#' Ornfasta<-read.fasta("P.ornatus.fasta")
#' SimOrn<-re_sim(fasta = Ornfasta, min.bp = 150)
#'
#' Polfasta<-read.fasta("P.polyphagus.fasta")
#' SimPol<-re_sim(fasta = Polfasta, min.bp = 150)
#'
#' MergeScore<- data.frame(SimHom$Score, SimOrn$Score, SimPol$Score)
#' rownames(MergeScore)<-rownames(SimHom)
#'
#'Filt1.DataMerge<-re_filter_lowfrag(MergeScore)

re_filter_lowfrag<-function(x){
  filtLow<-x[!rowSums(x==0),]
  return(filtLow)
}
