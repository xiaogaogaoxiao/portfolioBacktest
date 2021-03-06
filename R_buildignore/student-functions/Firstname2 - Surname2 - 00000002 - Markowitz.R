library(CVXR)

# Markowitz mean-variance
portfolio_fun <- function(data) {
  mu <- colMeans(data$adjusted)
  Sigma <- cov(data$adjusted)
  lmd = 0.5
  w <- Variable(nrow(Sigma))
  prob <- Problem(Maximize(t(mu) %*% w - lmd*quad_form(w, Sigma)),
                  constraints = list(w >= 0, sum(w) == 1))
  result <- solve(prob)
  return(as.vector(result$getValue(w)))
}
