#Readme
#@SISS, 2017
#Functions suitable for computing correspondence analysis:
#CA() [FactoMineR package],
#ca() [ca package],
#dudi.coa() [ade4 package],
#corresp() [MASS package],
#and epCA() [ExPosition package]

#####CA Package####
pop_prop<-prop.table(pop_2012v)

install.packages("ca")
library(ca)
ca(pop_2012v)
names(ca(pop_2012v))
plot(ca(pop_2012v), mass = TRUE, contrib = "absolute", 
     map = "symmetric", arrows = c(TRUE, TRUE))

help(ca)

####Factor Miner
library(FactoMineR)
library(factoextra)
res.ca <- CA(pop_2012v, graph = TRUE)

####MASS
library(MASS)
res.ca <- corresp(pop_2012v, nf=2)
res.ca2 <- corresp(pop_prop, nf=2)
fviz_ca_biplot(res.ca, repel = TRUE)
fviz_ca_biplot(res.ca2, repel = TRUE)


#epCA() [ExPosition]
install.packages("ExPosition")
library("ExPosition")
res.ca3 <- epCA(pop_prop, graph=TRUE)


#########  2012 DATASET #library("ade4")
##OVERALL
library(ade4)
library("corrplot")
res.ca_ade <- dudi.coa(pop_prop,scannf = FALSE, nf=2)
fviz_eig(res.ca_ade, addlabels = TRUE)

##rows analysis (with factoextra)
rows_2012 <- get_ca_row(res.ca_ade)
rows_2012$coord
rows_2012$contrib
rows_2012$cos2


col_2012 <- get_ca_col(res.ca_ade)
corrplot(as.matrix(col_2012$cos2), is.corr = F,  method = "color", tl.col = "black",
         tl.cex = 0.8, cl.pos = "n" )

as.matrix(col_2012$cos2)

#viz rows
fviz_ca_row(res.ca_ade, repel = TRUE)
fviz_ca_row(res.ca_ade, col.row = "cos2",
            gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
            repel = TRUE)

corrplot(as.matrix(rows_2012$cos2), is.corr = F, method = "color", tl.col = "black",
         tl.cex = 0.8, cl.pos = "n" )

as.matrix(rows_2012$cos2)

#(not as cool as the above one)
fviz_ca_biplot(res.ca_ade, 
               map ="symbiplot", arrow = c(TRUE, TRUE),
               repel = TRUE, )

#columns
fviz_ca_col(res.ca_ade, repel = TRUE)
fviz_ca_col(res.ca_ade, col.col = "cos2",
            gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
            repel = TRUE)


as.matrix(rows_2012$cos2)

####2014 dataset

#overall
res.ca2014 <- CA(pop_2014v, graph = TRUE,ncp = 2)

#rowss
rows_2014 <- get_ca_row(res.ca2014)


corrplot(as.matrix(rows_2014$cos2), is.corr = F, method = "color", tl.col = "black",
         tl.cex = 0.8, cl.pos = "n")

fviz_ca_row(res.ca2014, repel = TRUE)
fviz_ca_row(res.ca2014, col.row = "cos2",
            gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
            repel = TRUE, )

#columns 
col_2014 <- get_ca_col(res.ca2014)
corrplot(as.matrix(col_2012$cos2), is.corr = F,  method = "color", tl.col = "black",
         tl.cex = 0.8, cl.pos = "n" )


####2016 dataset
pop_2016v <- read.csv("~/Desktop/NOVA IMS/DataAnalysis/projeto/pop_factorial/pop_2016v", header=T, row.names = 2)
View(pop_2016v)
pop_2016v <- subset(pop_2016v, select = -c (X))

fviz_eig(res_ca2016, addlabels = TRUE)

#overall
res.ca2016 <- CA(pop_2016v, graph = TRUE,ncp = 2)

rows_2016 <- get_ca_row(res.ca2016)

corrplot(as.matrix(rows_2016$cos2), is.corr = F, method = "color", tl.col = "black",
         tl.cex = 0.8, cl.pos = "n")

#columns 
col_2016 <- get_ca_col(res.ca2016)
corrplot(as.matrix(col_2016$cos2), is.corr = F,  method = "color", tl.col = "black",
         tl.cex = 0.8, cl.pos = "n" )


