##UpperTriangleHist.r

args <- commandArgs() 

distMatrix <- args[6]
outfile <- args[7]

#nnode <- as.numeric(args[8])	#this parameter is not necessary if using read.table

#read the file into a matrix
#mi <- matrix(scan(distMatrix), nnode, nnode+1, byrow=TRUE)	#every element has to be a real (use scan)
mi <- read.table(distMatrix)

#delete the first column, which is the node list
mi <- mi[, -1]

#Extract the upper triangular part in to a vector
upp <- mi[upper.tri(mi)]

pdf(outfile)

#draw the histgram
hist(upp, 
	right=FALSE, # intervals closed on the left
	main="Histogram of Distance", # the main title
	xlab="Distance")	# x-axis label

dev.off()
