### Matrices
#To locate within matrices: A[row,column]

##Building Matrix

#matrix(data,#rows,#columns)
#rbind(): combine rows into matrix
#cbind(): combine columns into matrix

#matrix()
my.data <- 1:20
my.data
A <- matrix(my.data,4,5) #order num by the column
A

B <- matrix(my.data,4,5,byrow=T) #order num by row
B

#rbind()
r1 <- c("I","am","happy")
r2 <- c("What","a","day")
r3 <- c(1,2,3)
C <- rbind(r1,r2,r3)
C

#cbind()
c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1,c2)
D

#########################
##Naming vectors/matrix

#Name vector:
Charlie <- 1:5
Charlie
#Give name
names(Charlie) <- c("a","b","c","d","e")
Charlie
#locate
Charlie["d"]
names(Charlie)

#clear name:
names(Charlie) <- NULL
Charlie

#Naming matrix

temp.vec <- rep(c("a","B","zZ"),each=3)
temp.vec

Bravo <- matrix(temp.vec,3,3)
Bravo
#give name
rownames(Bravo) <- c("How","are","you?")
colnames(Bravo) <- c("x","y","z")
Bravo
#locate
Bravo["are","y"]
#change value in matrix
Bravo["are","y"] <- 0
Bravo
