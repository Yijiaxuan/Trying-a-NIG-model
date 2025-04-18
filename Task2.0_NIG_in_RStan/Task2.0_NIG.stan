data {
  int<lower=0> N;          
  vector [N] y; // here I canceled y's limited interval [0,1]
  real<lower=0> B0;
  real<lower=4> alpha0;          
  real<lower=0> delta0;
  real<lower=0> mu0;
}

parameters{
  real<lower=0> mu; // here I canceled mu's limited interval [0,1]
  real<lower=0> sigma2;
}

model{
  mu ~ normal(mu0,sqrt(sigma2*B0));  //prior
  sigma2 ~ inv_gamma(alpha0/2, delta0/2); //prior
  y ~ normal(mu,sqrt(sigma2));  //Likelihood
}
