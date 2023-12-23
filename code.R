trim = function(x) {
  tmp = gsub(".*_(.*)", "\\1", x)
#  hasm = grep("meth", tmp)
#  if (length(hasm)>0)
  tmp = gsub("meth", "Methylation_meth", tmp)
  tmp = gsub("AllBy", "GISTIC_AllBy", tmp)
  tmp = gsub("Thresh", "GISTIC_Thresh", tmp)
  tmp = gsub("Peaks", "GISTIC_Peaks", tmp)
  tmp
}
common_assays = function(mael) {
  tmp =  lapply(mael, function(x)trim(names(experiments(x))))
  if (length(mael)==1) return(tmp[[1]])
  c1 = intersect(tmp[[1]], tmp[[2]])
  if (length(mael)==2) return(c1)
  for (i in 3:length(mael)) c1 = intersect(c1, tmp[[i]])
  c1
}
if (!exists("br")) br = getcur("BRCA")
if (!exists("gb")) gb = getcur("GBM")
if (!exists("lu")) lu = getcur("LUAD")
cass = common_assays(list(br, gb, lu))
kpass = lapply(c("BRCA", "GBM", "LUAD"), function(x) paste0(x, "_", cass))
bas = list(br, gb, lu)
lim = lapply(1:3, function(x) bas[[x]][,,kpass[[x]]])
nc = sapply(lim, function(x) sapply(experiments(x), ncol))
library(TCGAutils)
nc2 = sapply(lim, function(x) sapply(experiments(TCGAprimaryTumors(x[,,-9])), ncol))

ans = cbind(nc2, nc[-9,]- nc2)
rownames(ans) = gsub("BRCA_", "", rownames(ans))
rownames(ans) = gsub("-.*", "", rownames(ans))
ans = ans[,c(1,4,2,5,3,6)]
colnames(ans) = c("BRCA", "BRCAnormal", "GBM", "GBMnormal", "LUAD", "LUADnormal")
ans
