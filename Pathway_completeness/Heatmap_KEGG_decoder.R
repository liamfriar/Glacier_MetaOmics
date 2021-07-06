library(gplots)
library(gplots)
library(RColorBrewer)
KEGG_palette<-colorRampPalette(c("white", "dodgerblue", "black"))(n=299)
#across all samples
mags_ko<-read.csv("Functions_out_zeros_removed.csv") #removed columns with 0s for all MAGs and amino acid biosynthesis
head(mags_ko)
names<-mags_ko[,1] #assign pathway names names as labels
matrix<-data.matrix(mags_ko[,2:ncol(mags_ko)]) #make the dataframe into a matrix
View(matrix)
rownames(matrix) <-names #assign row names for matrix

nrow(matrix)
heatmap.2(matrix,
          main = "MAG functional pathway completions", # heat map title
          notecol="black",      # change font color of cell labels to black
          colsep=1:nrow(matrix),
          rowsep=1:nrow(matrix),
          sepcolor = "black", #gridline color
          density.info="histogram",  # turns off density plot inside color legend
          trace="none",         # turns off trace lines inside the heat map
          scale = c("none"), na.rm=TRUE,
          margins =c(20,15),     # widens margins around plot
          col=KEGG_palette,  # use on color palette defined earlier
          dendrogram ='row', #column = functions, row = gneomes
          #srtCol=45,  
          cexRow=1.0,
          cexCol=1.0,
          Rowv=, #with this set to "=" only, sorts rows
          Colv=FALSE) #with this set to "=" only, sorts columns
