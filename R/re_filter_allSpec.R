#' Eliminate restriction enzyme produced non-unique DNA fragmentation to all species
#'
#' @param SimScore -data.frame, containing score value from re_sim
#'
#' @return data.frame containing list of restriction enzyme which are unique to all species
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
#' dat<- re_filter_allSpec(SimScore = MergeScore)
re_filter_allSpec<-function(SimScore){
  AllSpeciesSpecific<-subset(data.frame(SimScore,data.frame(unique=c(apply(SimScore, 1, function(x)length(unique(x))))))
                             , unique==ncol(SimScore))
  return(AllSpeciesSpecific)
}
