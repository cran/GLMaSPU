% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Goeman_perm.R
\name{Goeman_perm}
\alias{Goeman_perm}
\title{Resample based Goeman test.}
\usage{
Goeman_perm(Y, X, cov = NULL, model = c("gaussian", "binomial"),
  n.perm = 1000)
}
\arguments{
\item{Y}{Response. It can be binary or continuous trait. A vector with length n (number of observations).}

\item{X}{Genotype or other data; each row for a subject, and each column for a variable of interest. An n by p matrix (n: number of observations, p: number of predictors).}

\item{cov}{Covariates. An n by q matrix (n: number of observations, q: number of covariates).}

\item{model}{corresponding to the Response. "gaussian" for a quantitative response; "binomial" for a binary response.}

\item{n.perm}{number of permutations or bootstraps.}
}
\value{
A list object, Ts : test statistics for the SPU tests and the aSPU test.
        pvs : p-values for the SPU and aSPU tests.
}
\description{
\code{Goeman_perm} returns resample based p-value for a test proposed by Goeman (2011).
}
\details{
\code{Goeman_perm} calculates the resample based p-value. You can calculate the asymptotic based p-value via using R package globaltest. Based on our experience, resample based p-value is often different from the asymptotic based one, except when the dimension of X is larger than the sample size n.
}
\examples{

p = 200
n = 100
beta = c(1,3,3)
s = 0.15
signal.r = 0.08
non.zero = floor(p * s)
seed = 2
alpha = c(rep(signal.r,non.zero),rep(0,p-non.zero))
dat = generate_data(seed, n = n, p = p, beta = beta,alpha = alpha)
cov = dat$Z
X = dat$X
Y = dat$Y
Goeman_perm(Y, X, cov = cov,model="gaussian", n.perm=1000)

}
\author{
Chong Wu and Wei Pan
}
\references{
Goeman, J. J., Van Houwelingen, H. C. and Finos, L. (2011). Testing against a high-dimensional
alternative in the generalized linear model asymptotic type 1 error control. Biometrika, 98(2), 381-390.
}

