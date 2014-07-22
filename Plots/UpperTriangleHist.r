##UpperTriangleHist.r
##Date:	07/21/2014
##Function:
##	Read the distance matrix and plot the histogram of distance
##Command-line Parameters:
##	1. path of the distance matrix
##	2. paht of output histogram

args <- commandArgs() 

distMatrix <- args[6]
outfile <- args[7]

#nnode <- as.numeric(args[8])	#this parameter is not necessary if using read.table

#read the file into a data frame
#mi <- matrix(scan(distMatrix), nnode, nnode+1, byrow=TRUE)	#every element has to be a real (use scan)
mi <- read.table(distMatrix)

#delete the first column, which is the node list
mi <- mi[, -1]

#Extract the upper triangular part in to a vector
upp <- mi[upper.tri(mi)]

#get the max of distance
nbins <- max(upp)

pdf(outfile)

#draw the histogram
hist(upp,
	breaks = nbins,	# number of bins 
	right = FALSE, # intervals closed on the left
	main = "Histogram of Distance", # the main title
	xlab = "Distance")	# x-axis label

dev.off()
