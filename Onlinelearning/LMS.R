

##Online learning Algorithms

#Least-Mean-Square

x <- rnorm(1000,0,2)

beta <- 3

y <- beta*x + rnorm(1000,0,0.5)

betaest <- 0
alpha <- 0.1

for(i in 1:1000){
betaest <- betaest + alpha*(x[i]*betaest - y[i])
}


##Variational Bayes

x <- rnorm(10000)

beta <- 3

y <- beta*x + rnorm(10000,0,0.5)

#Online algorithm

mu.sigma <- 5
yty <- 0
xty <- 0
xtx <- 0
n <- 0

#Hyper-parameters
sigma.b <- sqrt(10^10)
A <- 10^5

mu.b.record <- rep(NA,10000)

for(i in 1:10000){
  n <- n + 1
  yty <- yty + y[i]^2
  xty <- xty + x[i]*y[i]
  xtx <- xtx + x[i]*x[i]
  Sigma.b <- (mu.sigma * xtx + (sigma.b)^(-1))^(-1)
  mu.b <- mu.sigma * Sigma.b * xty 
  mu.a <- (mu.sigma + A^(-2))^(-1)
  mu.sigma <- (n+1)/(2*mu.a + yty - 2*mu.b*xty + xtx*(Sigma.b + mu.b^2))
  mu.b.record[i] <- mu.b
}

plot(mu.b.record,type="s")














