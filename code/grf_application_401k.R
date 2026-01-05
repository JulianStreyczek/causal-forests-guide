# GRF application

library(grf)
library(foreign)

rm(list = ls())
# Seed
set.seed(05012022)
# Import data
data  <- read.dta("sipp1991.dta");
# Outcome Variable
y      <- unlist(data["net_tfa"])
# Treatment Indicator
d      <- unlist(data["e401"])  
# Controls
x_df   <- data[c("age","inc","educ","fsize","marr","twoearn","db","pira","hown")]
x      <- as.matrix(x_df)
# Causal forest
tau.forest <- causal_forest(x, y, d, num.trees = 12000)
# ATET
average_treatment_effect(tau.forest, target.sample = "all")
# Treatment effects - histogram
tau.hat.oob <- predict(tau.forest)
png("outputs/CATEdistribution.png", width=800, height=600)
hist(tau.hat.oob$predictions, breaks=40, main="" , xlab="CATE")
dev.off()

# Prediction
a <- sort(unique(x_df$age))
al <- length(a)
x.avg  <- colMeans(x)
X.test <- matrix(x.avg, al, 9, byrow = TRUE)
X.test[, 1] <- a

# Plots
tau.hat <- predict(tau.forest, X.test)
plot(X.test[, 1], tau.hat$predictions, xlab = "x", ylab = "tau", type = "l")

# Plots w/CI
tau.hat   <- predict(tau.forest, X.test, estimate.variance = TRUE)
sigma.hat <- sqrt(tau.hat$variance.estimates)
X         <- X.test[, 1]
CIupper   <- tau.hat$predictions + 1.96 * sigma.hat
CIlower   <- tau.hat$predictions - 1.96 * sigma.hat
png("outputs/CATEbyAge.png", width=800, height=600)
plot(X, tau.hat$predictions,
     ylim = range(tau.hat$predictions + 1.96 * sigma.hat, tau.hat$predictions - 1.96 * sigma.hat, 0, 2),
     xlab = "age", ylab = "CATE", main="", type = "l", lwd=2, col="black")
lines(X, CIupper, lty = 2, lwd=1, col="grey")
lines(X, CIlower, lty = 2, lwd=1, col="grey")
polygon(c(X, rev(X)), c(CIupper, rev(CIlower)), col = "lightgrey")
lines(X, tau.hat$predictions, type = "l", lwd=1, col="black")
lines(X, CIupper, lty = 2, lwd=1, col="grey")
lines(X, CIlower, lty = 2, lwd=1, col="grey")
abline(h=0, lty=3)
dev.off()





