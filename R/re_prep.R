#' Fetch DNA sequences from NCBI and prepare the DNAstring data
#'
#' @param x -character, NCBI accesion number of the targeted sequence or NCBI advanced search keyword
#' @param fasta.out -character, file name of the output fasta file
#'
#' @return print of the DNAstring and fasta file output
#' @export
#'
#' @examples
#' mtDNAHom<-re_prep("NC_016015.1", fasta.out = "mtDNAHom.fasta")

re_prep<-function(x, fasta.out){
  write(rentrez::entrez_fetch(db="nuccore", id=(rentrez::entrez_search(db="nuccore", term=x))$ids, rettype="fasta"), fasta.out)
  mtDNAseq<- Biostrings::DNAStringSet(Biostrings::readDNAStringSet(fasta.out, format="fasta",
                                                                   nrec=-1L, skip=0L, seek.first.rec=FALSE, use.names=TRUE))
  return(mtDNAseq)
}
