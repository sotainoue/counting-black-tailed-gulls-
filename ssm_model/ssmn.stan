data {
    //logger part
    int<lower=0> T; //number of step
    
    int<lower=0> n_obs; //number of step where logger data exist
    int<lower=0> t[n_obs]; // time step at logger data exist
    int<lower=0> y[n_obs]; // individuals in kabushima observed by logger
    int<lower=0> total_logger[n_obs]; // total individuals with logger in kabushima
    
    //Drone part
    int<lower=0> n_session; //number of session
    int<lower=0> t_session[n_session]; //time at drone session
    real<lower=0> drone[n_session];
}

parameters {
    real<lower=0> s_z;
    real<lower=0> s_v;
    real<lower=17000> N;
    vector[T] theta;
}

transformed parameters{
    vector<lower=0, upper=1>[T] p;
    for (t_i in 1:T)
        p[t_i] = inv_logit(theta[t_i]); // logit link function
}

model {
    theta[1] ~ uniform(0, 1);
    theta[2] ~ uniform(0, 1);
    
    //state change along time
    for(i in 3:T){
        theta[i] ~ normal(2*theta[i-1] - theta[i-2], s_z);
    }
    
    
    for (i in 1:n_obs){
        y[i] ~ binomial(total_logger[i], p[t[i]]); 
    }
    
    for(i in 1:n_session){
        drone[i] ~ normal(0.92*N*p[t_session[i]],s_v);
    }
}