##UpperTriangleHist.r

args <- commandArgs() 

distMatrix <- args[6]
nnode <- as.numeric(args[7])

#read the file into a matrix
mi <- matrix(scan(distMatrix), nnode, nnode+1, byrow=TRUE)

#delete the first column, which is the node list
mi <- mi[, -1]

#Extract the upper triangular part in to a vector
upp <- mi[upper.tri(mi)]

#draw the histgram
hist(upp)