#' Estimate the PCR product
#'
#' @param x -DNAstring data from re_prep, complete genome
#' @param Forward -character, forward primer 5' direction
#' @param Reverse -character, Reverse primer 5' direction
#' @param id -character, species identity
#' @param out.fasta -character, file name of the output fasta file
#'
#' @return print of the DNAstring and fasta file output
#' @export
#'
#' @examples
#' Fwd<- "GGTCAACAAATCATAAAGATATTG"
#' Rev<-"TAAACTTCAGGGTGACCAAAAAATCA"
#' mtDNAHom<-re_prep("NC_016015.1", fasta.out = "mtDNAHom.fasta")
#' HomAmpl<-re_pcr(mtDNAHom, Fwd,Rev, "P.homarus","P.homarus.fasta")


re_pcr<-function(x,Forward,Reverse,id, out.fasta){
  a<-as.numeric(min((which(data.matrix(Biostrings::alignedSubject((Biostrings::pairwiseAlignment(x, (Biostrings::DNAString((as.character(Biostrings::aligned(Biostrings::pattern((Biostrings::pairwiseAlignment(x, (Biostrings::DNAString(Forward)), type = "local-global")))))))), type = "global"))))!="-", arr.ind=TRUE)[,2])))
  b<- as.numeric(max((which(data.matrix(Biostrings::alignedSubject(Biostrings::pairwiseAlignment(x, (Biostrings::DNAString((as.character(Biostrings::aligned(Biostrings::pattern((Biostrings::pairwiseAlignment(x, (Biostrings::reverseComplement(Biostrings::DNAString(Reverse))), type = "local-global")))))))), type = "global")))!="-", arr.ind=TRUE)[,2])))
  amplicon <- XVector::subseq(x, start = a, end = b)
  seqinr::write.fasta(sequences = amplicon, names = id, file.out = out.fasta)
  return(amplicon)
}
