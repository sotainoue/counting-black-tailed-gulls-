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
    //vector[T] mu;
    //vector[T] gamma;
    real<lower=0> s_z;
    //real<lower=0> s_s;
    real<lower=0> s_v;
    real<lower=17000> N;
    vector<lower=0, upper=1>[T] p;
}

model {
    //mu[1] ~ uniform(0, 1); // 初期値の事前分布
    //mu[2] ~ uniform(1, 2); // 初期値の事前分布
    p[1] ~ uniform(0, 1); // 初期値の事前分布
    p[2] ~ uniform(0, 1); // 初期値の事前分布
    //gamma[1:23] ~ uniform(0, 1); // 初期値の事前分布
    
    //state change along time
    for(i in 3:T){
        //mu[i] ~ normal(2*mu[i-1] - mu[i-2], s_z);
        p[i] ~ normal(2*p[i-1] - p[i-2], s_z);
    }
    
    //for (i in 24:T) {
    //    gamma[i] ~ normal(-sum(gamma[(i-23):(i-1)]),s_s);
    //}
    
    for (i in 1:n_obs){
        y[i] ~ binomial(total_logger[i], p[t[i]]); 
    }
    
    for(i in 1:n_session){
        drone[i] ~ normal(0.92*N*p[t_session[i]],s_v);
    }
}