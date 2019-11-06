function [lambda,mu] = myFindWU(u,nrm,v,W)
    mu = (W * u) / nrm;
    mu = mu / norm(mu);
    tmp = v' * mu;
    gamma = (1/(nrm * tmp))^2;
    lambda = gamma / tmp;
return
