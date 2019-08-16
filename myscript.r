```{r}
#read the input data
stat1_interactions_new <- read.csv("~/stat1_interactions.tsv",sep="\t")

#extract the first two and the last column
statsmallnew <- stat1_interactions_new[,c(1,2,15)]

#extract the interactions with more than 0.5 score
statsmallnewfiltered <- subset(statsmallnew, combined_score >= 0.5)

#write the filtered interactions in to a file
write.table(statsmallfiltered, "statsmallfiltered.txt", sep = "\t", quote = FALSE, row.names = FALSE)

#print the score distribution graph
png('statsmallnew.png')
plot(statsmallnew$combined_score)
dev.off()

message("Script ran successfully, all outputs are in the working director")

#If the above script is named as "interaction-data-process-script.r", run the script in the console using the following command;
#source('~/interaction-data-process-script.r')
```


### 2.5 RMarkdown
*RMarkdown* allows to create documents that serve as a neat and reproducible documentation of an analysis. *RMarkdown* is a very simple 'markup' language which provides methods for creating documents with headers, images, links etc. from plain text files, while keeping the code alongside its output (graphs, tables, etc.) with conventional text to explain it, a bit like a notebook. Markdown documents can be converted to other file types like .html , .pdf, or .doc

**To create a new RMarkdown file (.Rmd), select File -> New File -> R Markdown in RStudio, then choose the file type (HTML here)**
  
  - Table
```{r }
load("C://Users/YO/Documents/example_data.RData")
tab = dat_chol

library(DT)
datatable(tab, colnames=names(tab), options = list(scrollX = FALSE, keys = TRUE, pageLength = 10),  caption=paste("Table 1"), rownames = TRUE)

```

- Figure
```{r fig.width=2, fig.height=2, dpi=300}
load("C://Users/YO/Documents/data_shapes.rda")
dat = dat_wide2
cormat = cor(dat)
library(heatmaply)
heatmaply(cormat, cexRow = 0.5, cexCol=0.5)
```