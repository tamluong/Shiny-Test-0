# *******************************************#
# ***Name: Class 1 Presentation Code*********#
# ***Author: R Tutor*************************#
# ***Date: March 10, 2016********************#
# ***Require: baseballFull.csv***************#
# *******************************************#

#remove all existing objects from workspace
rm(list=ls())


####Introduction#####
  
  
  #Example Script
  1+1
  
  #create a very simple object, a, with numeric elements 1 and 2
  a <- c(1,2)
  a
  
  A

  #Setting Working Directory
  input <- "//AGBOSNAS1/DATA/SHARE/R/2016/Class 1/Code & Examples/Input"
  output <- "//AGBOSNAS1/DATA/SHARE/R/2016/Class 1/Code & Examples/Output"
  temp <- "//AGBOSNAS1/DATA/SHARE/R/2016/Class 1/Code & Examples/Temp"
  
  setwd(input)
  #assuming the "Code & Examples" folder has the 
  #following subfolders: Input, Output, and Temp
  baseball <- read.csv("baseballFULL.csv", header=TRUE)
  
  #Switch to another working directory by invoking those objects
  setwd(output)
  write.csv(baseball, file="baseball_out.csv", row.names=FALSE)


  #Example graphics
  
  install.packages("rgl", dependencies=TRUE)
  install.packages("MASS", dependencies=TRUE)
  library(rgl)
  library(MASS)
  
  #demo(rgl)
  #demo(abundance)
  
  demo(regression)
  demo(bivar)
  
  #install.packages("lattice",dependencies=TRUE)
  #library("lattice")
  #example(wireframe)
  
  #install.packages("knitr", dependencies=TRUE)
  #library("knitr")
  
  #Help Example
  ?lm
  
  #Tab example
  l


####Data Structure####



####Summary of Data Structures####



#### A. Scalars & Vectors ####


  #Vector Creation#
  pi
  is.vector(pi)
  
  #make object x with a vector containing elements 1,2,3,and 4
  x <- c(1,2,3,4)
  x
  
  #a more formal way to assign values is the asign function
  assign("x",c(1,2,3,4))
  x
  
  #using the combine function to create a vector from other vectors
  x1 <- c(3,2,1)
  x2 <- c(4,5,6)
  x3 <- c(7,8,9)
  x4 <- c(x1,x2,x3)
  x4
  
  #examples of using vectors with special properties
  
  #a vector of consecutive integers 
  y <- 1:4
  y
  
  #a vector with repeating values, using the rep() function
  x <- rep(1,10)
  x
  
  #a vector whose components are part of a sequence, using the seq() function
  x <- seq(1,20,2)
  x
  
  #note that R is case sensitive when defining the names of scalars, 
  #vectors, matrices, functions, and dataframes(unlike SAS)
  #example

  h <- c(1,2,3,4)
  H <- c(5,6,7,8)
  h
  H
  
  #vector with elements that are characters
  AG_Office <- c("Boston", "Chicago", "Dallas", 
                 "Denver", "Los Angeles", "Menlo Park",
                 "Montreal", "New York", "San Francisco", "Washington")
  AG_Office
  
  is_Boston_Office <- AG_Office=="Boston"
  is_Boston_Office
  
  #Indexing Elements of a vector; subvector <- Vector[index]#
  
    #a: Index vector of positive integers
      AG_Office[3]
      
      AG_Office[c(1,4)]
      y <- c(1,4)
      AG_Office[y]
      
    
      #gives us the second to last element of the vector AG_Office
      second_to_last <- AG_Office[length(AG_Office)-1]
      second_to_last
      

      #adding an office to the AG_office vector

      AG_Office <- c("Boston", "Chicago", "Dallas", 
                     "Denver", "Los Angeles", "Menlo Park",
                     "Montreal", "New York", "San Francisco", "Washington",
                     "Beijing")
      second_to_last <- AG_Office[length(AG_Office)-1]
      second_to_last
  
      #trying to use an index value greater than length(x)
      AG_Office[15]
  
    #b: index vector of negative integers; Subvector Returns all except 3rd element
      #all of AG_Office except for the third element

      AG_Office_Ex_Dallas <- AG_Office[-3]
      AG_Office_Ex_Dallas
  
    #c: vector of character string/names
      #first, change names of positons in the vector;
      #attach alphanumeric names to vector
      #elements
        
      fruit_prices <- c(1.1,3.5,5.4,2.3)
      fruit_prices
      names(fruit_prices) <- c("orange", "banana", "apple", "peach")
      fruit_prices
      lunch <- fruit_prices[c("apple", "orange")]
      lunch
  
    #d: logical Vector -- conditional indexing
    #vector that evaluates to boolean; Boston = #1 "AG_Office" so 1st position evaluates to True
      is_Boston_Office <- AG_Office=="Boston"
      is_Boston_Office
  
      AG_Office[is_Boston_Office]
  
#### Vector Functions ####  
  
  #functions are performed on vectors element by element -- like an internal loop
      a <- 1:10
      a
      a+1

  #summary statistics
  #Create a vector of 100 random normally distributed values with mean 0 and standard deviation 1
  x <- rnorm(n=100,mean=0,sd=1)
  length(x)
  
  summary(x)
     
  mean(x)
  
  sd(x)

  #arithmetic operations

  x <- c(1,2,3)
  y <- c(4,5,6)
  x+1
  
  x+y
  
  y-x
  
  x*y
  
  y/x
  
  x <- c(2,3,4,5,6)
  x^2

  #The any() and all() functions
  y <- c(6,0,9,20,22,23)
  any(y>3)
  
  all(y>3)

  #sample error 
  x <- c(1,2,3,4)
  y <- c(6,0,9,20,22,23)
  x+y

  #using NA
  x <- c(1,2, NA, 4)
  x>1
  
  x<3

  #try to take the mean of a vector which contains a single NA value
  x <- c(100, NA, 200, 300, 400)
  x
  
  mean(x)
  
  mean(x, na.rm=TRUE)

  #modes
  #functional equivalent of variable types from SAS and Stata 
  x <- c(100, NA, 200, 300, 400)
  mode(x[1])
  
  mode(x[2])
  
  y <- c("abc", "def", NA)
  mode(y[1])
  
  mode(y[3])
  
  #Using NULL
  x <- c(100, NA, 200, 300, 400)
  y <- c(100, NULL, 200, 300, 400)
  length(x)
  
  length(y)

  #users normally do not need to instruct functions to ignore NULL values
  
  x <- c(100, NA, 200, 300, 400)
  mean(x)
  
  mean(x, na.rm=TRUE)
  
  y <- c(100, NULL, 200, 300, 400)
  mean(y)


  #if we run the for() loop without ever creating an object h
  for (i in 1:2) {p[i]<-i}

  #We can rectify this error by first initialize h as a NULL object
  p <- NULL
  for (i in 1:2) {p[i]<-i}
  p
  
#### B. Matrices ####

  #creation of a two-by-two matrix from a four-element vector
  X <- matrix(c(1,2,3,4), nrow=2,ncol=2)
  X
  
  #byrow argument in the matrix() function 
  X <- matrix(c(1,2,3,4),nrow=2,byrow=TRUE)
  X
  
  is.matrix(X)
  
  #combine the same three vectors first using rbind()
  x1 <- c(1,2,3)
  x2 <- x1+3
  x3 <- x1+4
  y <- rbind(x1,x2,x3)
  y
  
  #using cbind() to create these two different matrices
  x1 <- c(1,2,3)
  x2 <- x1+3
  x3 <- x1+4
  y <- cbind(x1,x2,x3)
  y
  
  #combine vector x of numeric values with vector y of character values 
  #into a matrix called M
  x <- c(1,2,3)
  y <- c("one", "two", "three")
  M <- cbind(x,y)
  M
  N <- rbind(x,y)
  N
  
  is.character(M[,"x"])
  is.character(N["x",])
  
  #general syntax: matrix[row index vector,column index vector]
  #redefine y for example
  x1 <- c(1,2,3)
  x2 <- x1+3
  x3 <- x1+4
  y <- cbind(x1,x2,x3)
  y
  
  #Select the first row and third column of matrix y
  y[1,3] 
  
  #Select the entire first row of matrix y
  y[1,]
  
  #Select the entire third column of matrix y
  y[,3]
  
  #Select the column of y with the column name "x2"
  y[,"x2"]
  
  #Subset matrices in y by the values in column "x1"
    #Ordinary Subsetting
  y[x1>1,]
  
  #Using the subset function#
  subset(y,x1>1)
  
  #Arithmetic operations
  y
  
  x1 <- c(2,3,4)
  x2 <- x1+3
  x3 <- x2+1
  z <- cbind(x1,x2,x3)
  z
  
  #Addition
  y+z
  
  #Subtraction
  y-z
  
  #Multiplication
  y*z
  
  #Matrix multiplication
  y%*%z
  
  #specifying custom names using the colnames() and rownames() functions
  colnames(y) <- c("Column 1", "Column 2", "Column 3")
  rownames(y) <- c("Row 1", "Row 2", "Row 3")
  y


#### C. Lists ####

  #creating a list
  x <- c("one","two","three")
  y
  
  L <- list(x,y)
  L
  
  #we can refer to list components by using one of the 
  #four types of index vectors 
  #requires double brackets instead of single ones
  L <- list(vector=x,matrix=y)
  L
  
  L[[1]]
  
  L[["vector"]]
  
  #refer to list components by their names using the $ sign
  L$vector
  
  L$vector[1]
  
  L$matrix
  
  L$matrix[,2]
  
  #R saves regression results into a list with many components
  #regress salary on years, runs
  reg1 <- lm(salary~years+runs, data = baseball)
  reg1_summary <- summary(reg1)
  
  #seeing if reg1 and reg1_summary is a list
  is.list(reg1)
  
  is.list(reg1_summary)
  
  #use the names() function to get a list of reg1's components 
  #list of reg1 and reg1_summary components using the names() function
  names(reg1)
          
  names(reg1_summary)
  
  #get the matrix of coefficients
  reg1_coef <- reg1_summary$coefficients
  reg1_coef
  
  
#### D. Data Frames ####
  #Basic Data Frame
   x1 <- c(1,2,3)
   x2 <- c("AB","BC","CD")
   D <- data.frame(x1,x2)
   D

  #Reading in Dataframes
    #1. General command: read.table()
    input <- "//AGBOSNAS1/DATA/SHARE/R/2016/Class 1/Code & Examples/Input"
    setwd(input)
    mytable <- read.table("baseballFull.csv", header=TRUE,sep=",")
    
    #2. Specialized command: read.csv()
    baseball <- read.csv("baseballFull.csv")

  #Saving / Reading an R data frame
    #save permanent R dataset called BaseballDataset
    temp <- "//agbosnas1/data/Share/R/2016/Class 1/Code & Examples/Temp"
    setwd(temp)
    save( baseball, file = "BaseballDataset.Rda" )
    
    #read in BaseballDataset
    load("BaseballDataset.Rda")
    
  #Accessing Data within Dataframes
   
  #Method A: Similarly to a vector/matrix
    #Access row 1, column 5
    baseball[1,5]
  
    #Access columns 2 and 3
    baseball[ , c(2,3)]
  
    #Access all rows except for row 2
    baseball[-c(2),]
  
  #Method B: Using dataframe properties
    #Find the names of the dataframe's variables
    names(baseball)
  
    #Once we know the names, we can index datasets using the name
    baseball[,"team"]
    
    #...or we can use the $ syntax
    baseball$team
  
    #Tab example
      #if multiple possible variables, will provide a list
      baseball$h

      #if only one possible variable, will auto fill
      baseball$n
  
  #Creating variables in a Dataframe
    baseball$combined_runs <- baseball$runs + baseball$homer
    baseball$combined_runs

  #creating new variables with conditions based on existing variables
  #will be covered in Class 2
  
  #Renaming variables
    #create a small example data frame
    Var1 <- c(1,2,3,4)
    Var2 <- c("A","B","C","D")
    Example_Data <- data.frame(Var1,Var2)
    
    #rename variables in data frame
    names(Example_Data) <- c("Numbers","Letters")
    Example_Data

    #install and load reshape package
    install.packages("reshape")
    library("reshape")
    
    #view syntax for rename
    rename
    #rename the "Numbers" variable
    Example_Data <- rename(Example_Data, c(Numbers="Numbers_new"))
    Example_Data

  #Subsetting a Dataframe
    #Method A: Index Syntax
      #Select all obs whose team is BOS
      baseballBOS <- baseball[baseball$team == "BOS", ]

      which( baseball$team == "BOS" )
            
      baseballBOS <- baseball[which( baseball$team == "BOS" ), ]
      
      #Select all obs whose team is not BOS
      baseballNoBOS <- baseball[-which( baseball$team == "BOS" ), ]

    #Method B: Subset function

      #subset to observations whose team is BOS
      baseballBOS <- subset( baseball, baseball$team == "BOS"  )
      
      #subset to observations whose team is BOS and only keep name, team, position, and hits variables
      baseballBOS2 <- subset( baseball, baseball$team == "BOS", c(name, team, position, hits) )


    #variable dropping using subset
    baseball_sub <- subset(baseball, select=-c(name, salary))


#### Factors ####
  #Creating a factor from a numeric vector
  x <- c(1,2,3,3,4,5,5,6)
  xf <- factor(x)
  x
  xf

  #Creating a factor from a character vector
  clothing <- c("shirt", "shirt", "jeans", "hat", 
                "vests", "jackets", "vests")
  clothingf <- factor(clothing)
  clothing
  clothingf
  
  #View levels of a factor object
  levels(clothingf)
  
  #importance of factors: used very often in categorical analysis
  #summary statistics by group: aggregate(), by(), tapply() covered in Class 2
  #categorical analyses: ANOVA, Chi-Square Test

  #Factors v Character Variables
    #create vectors - one character, and one factor
    character_vector <- c("BIRD","MOLE","FISH","MYNOCK")
    factor_vector <- as.factor(c("SKY","EARTH","SEA","SPACE"))
    
    character_vector
    factor_vector
       
    #concatenating these vectors returns the expected results 
    paste(character_vector,factor_vector)

    #attempt to create matrix with these two vectors
    matrix <- cbind(character_vector,factor_vector)
    matrix

    #to combine as a matrix while keeping the desired strings
    matrix2 <- cbind(character_vector,as.character(factor_vector))
    matrix2

