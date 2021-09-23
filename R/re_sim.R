#' Simulate Restriction Enzyme digestion
#'
#' @param fasta -DNAstring data, from re_pcr, PCR product or partial sequence
#' @param min.bp -numeric, minimum length of produced DNA fragment after enzyme digestion
#'
#' @return list containing digestion score and fragment number produced from enzyme digestion
#' @export
#'
#' @examples
#' #Homfasta<-read.fasta("P.homarus.fasta")
#' SimHom<-re_sim(fasta = Homfasta, min.bp = 150)

re_sim<-function(fasta, min.bp){
  data("enzdata")
  a <- enzdata[1]
  a<- a[-c(38,39,42,43,64,65,91,92,99,100,116,117,172,173,224,225,339,340,342,343,354,355,446,447,457,458,549,550,598,599,624,625,662,663,722,723,743,744),]
  result<-list()
  suppressWarnings(
    for (i in a) {
      z <- seqRFLP::frag.dat(fil = fasta, enznames = i, enzdata = enzdata)
      result[[i]] <- z
    })
  data2<- unlist(result)
  data2.1<-as.data.frame(data2)
  data4<- lapply(data2.1, matrix, nrow=6)
  data4 <- as.data.frame(t(as.matrix(data4$data2)))
  names(data4)[1] <- "enz"
  names(data4)[2] <- "recog"
  names(data4)[3] <- "Cut"
  names(data4)[4] <- "Fragmen"
  names(data4)[5] <- "T5"
  names(data4)[6] <- "T3"
  data4=subset(data4,select=-c(recog,  T5, T3))
  RE<-a
  data4<-cbind(RE,data4)
  data4=subset(data4,select=-c(enz,Cut))
  data5 <- splitstackshape::cSplit(data4, 'Fragmen', sep=",", stripWhite=TRUE, type.convert=FALSE)
  data5<- t(data5)
  colnames(data5) <- data5[1,]
  data5 = data5[-1,]
  Frag<- apply(data5, 2, function(x) length(which(!is.na(x))))
  data6<-as.numeric(data5)
  data6<-as.data.frame(split(data6, 1:nrow(data5)))
  data6<-t(data6)
  a<-t(colnames(data5))
  data7<-data6
  colnames(data7)<-a[1,]
  data7[is.na(data7)]<- 1000
  data8<-t(data7)
  data8[(rowSums(data8<min.bp))>0]<-1000
  data9<-t(data8)
  data9[data9 == 1000] <- NA
  Red<- ((data9/709)*data9)/709
  Red[is.na(Red)]<- 0
  Score<-colSums(Red)
  return(data.frame(Score, Frag))
}
