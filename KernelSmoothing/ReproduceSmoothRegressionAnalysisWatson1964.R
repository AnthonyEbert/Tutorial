
##Reproducing results: G Watson, 1964, Smooth Regression Analysis
x <- rnorm(1000,0,10)
y <- rnorm(1000,3*x^2,1)

deltaest <- function(z,delta = 5){
  if(abs(z) <= 1/delta){
    output <- delta*(1 - delta*abs(z))
  }else{
    output <- 0
  }
  return(output)
}

deltaest(0.01)

mest <- function(z,x.=x,y.=y,...){
  summand <- rep(NA,length(x.))
  for(i in 1:length(x.)){
    summand[i] <- y.[i] * deltaest(z - x.[i],...)
  }
  summand2 <- rep(NA,length(x.))
  for(i in 1:length(x.)){
    summand2[i] <- deltaest(z - x.[i],...)
  }
  output <- sum(summand)/sum(summand2)
  return(output)
}

curve(Vectorize(mest)(x),from=-20,to=20)
curve(3*x^2,col="red",add=TRUE)