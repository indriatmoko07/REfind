#' Keep restriction enzymes produced desired fragment number only
#'
#' @param EnzList -data.frame, list of enzyme after re_filter_target
#' @param SimTarget -data.frame, list of initial enzyme
#' @param FragNumb -numeric, maximum fragment number allowed
#'
#' @return data.frame containing list of restriction enzyme produced desired fragment number
#' @export
#'
#' @examples
#' ?re_filter_targetSpec
#' Filt3.2Frag<-re_filter_fragnumb(EnzList = Filt2.Target, SimTarget = SimHom, FragNumb = 2)

re_filter_fragnumb<-function(EnzList,SimTarget, FragNumb){
  Fm<-((as.data.frame(cbind(SimTarget[2],Enzyme =rownames(SimTarget))))[((as.data.frame(cbind(SimTarget[2],Enzyme =rownames(SimTarget))))$Enzyme %in% (as.data.frame(cbind(RE = rownames(EnzList))))$RE),])[!rowSums(((as.data.frame(cbind(SimTarget[2],Enzyme =rownames(SimTarget))))[((as.data.frame(cbind(SimTarget[2],Enzyme =rownames(SimTarget))))$Enzyme %in% (as.data.frame(cbind(RE = rownames(EnzList))))$RE),])[1] >FragNumb),]
  return(Fm)
}
