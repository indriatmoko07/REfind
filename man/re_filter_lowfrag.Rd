% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/re_filter_lowfrag.R
\name{re_filter_lowfrag}
\alias{re_filter_lowfrag}
\title{Removing restriction enzyme producing low fragment}
\usage{
re_filter_lowfrag(x)
}
\arguments{
\item{x}{-data.frame, list of score value from multiple species}
}
\value{
data frame containing list of restriction enzymes and score
}
\description{
Removing restriction enzyme producing low fragment
}
\examples{
Homfasta<-read.fasta("P.homarus.fasta")
SimHom<-re_sim(fasta = Homfasta, min.bp = 150)

Ornfasta<-read.fasta("P.ornatus.fasta")
SimOrn<-re_sim(fasta = Ornfasta, min.bp = 150)

Polfasta<-read.fasta("P.polyphagus.fasta")
SimPol<-re_sim(fasta = Polfasta, min.bp = 150)

MergeScore<- data.frame(SimHom$Score, SimOrn$Score, SimPol$Score)
rownames(MergeScore)<-rownames(SimHom)

Filt1.DataMerge<-re_filter_lowfrag(MergeScore)
}
