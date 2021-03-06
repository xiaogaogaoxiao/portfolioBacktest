% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/backtestSummary.R
\name{backtestTable}
\alias{backtestTable}
\title{Portfolio Backtest Results in Table form}
\usage{
backtestTable(res, portfolio_names = NA, portfolio_indexs = NA,
  show_benchmark = TRUE, selector = NULL)
}
\arguments{
\item{portfolio_names}{the names of a portfolio}

\item{portfolio_indexs}{the indexs of a portfolio}

\item{show_benchmark}{logical value indicating whether to show benchmark in the portfolio}

\item{selector}{a vector of required performance}

\item{res_table}{the results from function `portfolioBacktest()`}
}
\value{
a list of desired results
}
\description{
Show the results from portfolio backtest in tables
}
\author{
Daniel P. Palomar and Rui Zhou
}
