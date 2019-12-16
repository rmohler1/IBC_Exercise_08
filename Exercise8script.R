rm(list=ls())
setwd("IBC_Exercise_08/")
library(ggplot2)

#1 score graph
game=read.csv("UWvMSU_1-22-13.txt", header=TRUE, sep= "\t", stringsAsFactors = FALSE)
library(ggplot2)
game=read.csv("UWvMSU_1-22-13.txt", header=TRUE, sep= "\t", stringsAsFactors = FALSE)
scorematrix= matrix(data=NA, nrow=51, ncol=3, byrow=FALSE)
scorematrix[1,]=0
for (i in 1:length(game)) {
  if (game$team[i]=="UW") {
    scorematrix[i+1,2]=scorematrix[i,2]+ game$score
    scorematrix[i+1,1]=scorematrix[i,1]
  } else (game$team[i]=="MSU") {
    scorematrix[i+1,1]=scorematrix[i,1]+ game$score
    scorematrix[i+1,2]=scorematrix[i,2]
  }
}
a=ggplot (data=scorematrix, aes(x= score, y=time)) + geom_line()

#2 guessing game
readinteger <- function()
{
  x <- readline(prompt="What is your guess? ")
  return(as.integer(x))
}

n=sample(1:100, size=1)

cat("I am going to think of a number between 1 and 100. Try to guess it")
guess = (readinteger() )

#guess= readline (prompt= "What is your guess? ")

#if (guess>=1 && guess<=100){
#then guess is valid input 

#if (guess !=n){
while (guess != n) {
  #guess= readline (prompt= "What is your guess? ")
  if (n>guess){
    cat(("Higher"))
    guess <-readinteger()
  } else if (n<guess){
    cat("Lower")
    guess <-readinteger()
  } 
}
#else if (guess=n){
cat("Correct!")
}

