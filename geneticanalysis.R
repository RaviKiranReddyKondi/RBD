#remove everything by using this command
rm(list=ls())
#load variability package
library(variability)
# name imported data as a for your convince
a=PM.DATA.2017.SET4.R
#write object name and apply function and run, in this a is data and the analysis run on 3-10 column variables in the data
geneticpar=gen.var(a[3:10],a$VARITIES,a$REPLICATIONS)
# after running view the results
View(geneticpar)
# saving the results 
sink('geneticpar.doc')
print(geneticpar)
sink()

##########correlations################
#import data set
rm(list=ls())
a=PM.DATA.2017.SET4.R
#load package
library(variability)
#assign a name for running genotypic correlation by using geno.corr function, here a is the data name and varieties and rep as factors
geneticcorr=geno.corr(a[3:10],a$VARITIES,a$REPLICATIONS)
#saving the output
fgeneticcorr=geneticcorr$GenotypicCorrelation
fgeneticcorr=as.matrix(fgeneticcorr)
fgeneticcorr
write.csv(fgeneticcorr,file="corgen.csv",row.names = TRUE)
#phenotypic correlation same as genotypic correlations but use pheno.cor function
phenotypiccor=pheno.corr(a[3:10],a$VARITIES,a$REPLICATIONS)
fphenotypiccor=phenotypiccor$PhenotypicCorrelation
fphenotypiccor=as.matrix(fphenotypiccor)
write.csv(fphenotypiccor,file='phenotypic corr.csv',row.names = TRUE,col.names = TRUE)
##### genetic path analysis by using geno path and here a[10] shows dependent variable and a[3:9] shows independent variable
genopath=geno.path(a[10],a[3:9],a$VARITIES,a$REPLICATIONS)
#saving the results
fgenopath=genopath$Effects
fgenopath=as.matrix(fgenopath)
write.csv(fgenopath,file="genopath.csv",row.names = TRUE,col.names = TRUE)
#pheno path same as geno path but by using pheno.path function
phenopath=pheno.path(a[10],a[3:9],a$VARITIES,a$REPLICATIONS)
fphenopath=phenopath$Effects
fphenopath=as.matrix(fphenopath)
write.csv(fphenopath,file='phenopath.csv',row.names = TRUE,col.names = TRUE)
View(genopath)
View(phenopath)
#####thanks to the creator of variability package####
