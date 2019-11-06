function [V, VDP, VDP_conv, VDP_local, lambda, lambdaDP, lambdaDP_conv, lambdaDP_local] = myCAPEAGN(M2, M3, K, maxitr, tol, epsilon, delta, del2, del3)
    % code for computing distributed differentially-private OTD using the
    % CAPE protocol
    % inputs --------------------------------------------------------------
    % M2 - cell of M2 in different sites
    % M3 - cell of M3 in different sites
    % K - target dimension
    % maxitr - maximum allowed iterations for tensor power method
    % tol - tolerance for tensor power method
    % epsilon, delta - privacy parameters
    % del2, del3 - sensitivities of M2 and M3 for pooled data case
    % outputs -------------------------------------------------------------
    % V, lambda - non-private subspace and coefficients
    % VDP, lambdaDP - capeAGN subspace and coefficients
    % VDP_conv, lambdaDP_conv - conventional distributed DP subspace and coefficients
    % VDP_local, lambdaDP_local - DP subspace and coefficients using only local data
    %----------------------------------------------------------------------
    
    num_sites = length(M2);
    tmpM2 = 0;
    tmpM3 = 0;
    for s = 1:num_sites
        tmpM2 = tmpM2 + M2{s};
        tmpM3 = tmpM3 + M3{s};
    end
    M2_ag = tmpM2 / num_sites;
    M3_ag = tmpM3 / num_sites;
    
    % compute the non-private OTD =========================================
    num_words = 3;
    [D, ~] = size(M2_ag);
    lambda = zeros(K,1);
    V = zeros(D, K);
    [Um,Dm,~] = svd(M2_ag);
    Um = Um(:, 1:K);
    Dm = Dm(1:K, 1:K);
    W = Um / sqrt(Dm);
    M3_tilde = my_multilinear_tensor(M3_ag, 1, W);
    
    I = eye(K);
    
    for k = 1:K
        flag = true;
        u = rand(K,1);
        u = u / norm(u);
        itr = 1;
        while flag
            u_hat = my_multilinear_tensor(M3_tilde,0,I,u,u);
            nrm = norm(u_hat);
            u_new = u_hat/nrm;
            change = norm(u_new-u);
            itr = itr+1;
            flag = (change > tol) && (itr <= maxitr);
            u = u_new;
        end
        lambda(k) = (1/nrm)^2;
        V(:,k) = normc(Um*sqrt(Dm)*u);
        M3_tilde = M3_tilde - nrm*outprod(u,u,u);
    end
    
    
    % compute capeAGN =====================================================
    lambdaDP = zeros(K,1);
    VDP = zeros(D, K);
    epsilon1 = epsilon/2;
    epsilon2 = epsilon - epsilon1;
    delta1 = delta/2;
    delta2 = delta - delta1;
    
    % for M2
    tau = (del2/epsilon1)*sqrt(2*log(1.25/delta1));
    temp = normrnd(0, tau, D, D);
    temp2 = triu(temp);
    temp3 = temp2';
    temp4 = tril(temp3,-1);
    E = temp2+temp4;
    
    M2_hat = M2_ag + E;
    
    [Um,Dm,~] = svd(M2_hat);
    Um = Um(:,1:K);
    Dm = Dm(1:K,1:K);
    W = Um/sqrt(Dm);
    
    % for M3
    tau = (del3/epsilon2)*sqrt(2*log(1.25/delta2));
    nsamples = nchoosek(D + num_words - 1, num_words);
    list_noise = normrnd(0, tau, nsamples, 1);
    tensE = mySymmTensor(list_noise, D, num_words);
    M3_tilde = my_multilinear_tensor(M3_ag + tensE, 1, W);
    
    I = eye(K);
    
    for k = 1:K
        flag = true;
        u = rand(K,1);
        u = u/norm(u);
        itr = 1;
        while flag
            u_hat = my_multilinear_tensor(M3_tilde,0,I,u,u);
            nrm = norm(u_hat);
            u_new = u_hat/nrm;
            change = norm(u_new-u);
            itr = itr+1;
            flag = (change > tol) && (itr <= maxitr);
            u = u_new;
        end
        lambdaDP(k) = (1/nrm)^2;
        VDP(:,k) = normc(Um*sqrt(Dm)*u);
        M3_tilde = M3_tilde - nrm*outprod(u,u,u);
    end
    
    % compute local DP AGN ================================================
    lambdaDP_local = zeros(K,1);
    VDP_local = zeros(D, K);
    
    % for M2
    tau = (del2 * num_sites / epsilon1)*sqrt(2*log(1.25/delta1));
    temp = normrnd(0, tau, D, D);
    temp2 = triu(temp);
    temp3 = temp2';
    temp4 = tril(temp3,-1);
    E = temp2+temp4;
    
    M2_hat = M2{s} + E;
    
    [Um,Dm,~] = svd(M2_hat);
    Um = Um(:,1:K);
    Dm = Dm(1:K,1:K);
    W = Um/sqrt(Dm);
    
    % for M3
    tau = (del3 * num_sites / epsilon2)*sqrt(2*log(1.25/delta2));
    nsamples = nchoosek(D + num_words - 1, num_words);
    list_noise = normrnd(0, tau, nsamples, 1);
    tensE = mySymmTensor(list_noise, D, num_words);
    M3_tilde = my_multilinear_tensor(M3{s} + tensE, 1, W);
    
    I = eye(K);
    
    for k = 1:K
        flag = true;
        u = rand(K,1);
        u = u/norm(u);
        itr = 1;
        while flag
            u_hat = my_multilinear_tensor(M3_tilde,0,I,u,u);
            nrm = norm(u_hat);
            u_new = u_hat/nrm;
            change = norm(u_new-u);
            itr = itr+1;
            flag = (change > tol) && (itr <= maxitr);
            u = u_new;
        end
        lambdaDP_local(k) = (1/nrm)^2;
        VDP_local(:,k) = normc(Um*sqrt(Dm)*u);
        M3_tilde = M3_tilde - nrm*outprod(u,u,u);
    end
    
    % compute conventional distributed DP OTD =============================
    lambdaDP_conv = zeros(K,1);
    VDP_conv = zeros(D, K);
    tmpM2 = 0;
    tmpM3 = 0;
    for s = 1:num_sites
        tau = (del2 * num_sites / epsilon1)*sqrt(2*log(1.25/delta1));
        temp = normrnd(0, tau, D, D);
        temp2 = triu(temp);
        temp3 = temp2';
        temp4 = tril(temp3,-1);
        E2 = temp2+temp4;
        tmpM2 = tmpM2 + M2{s} + E2;
        
        tau = (del3 * num_sites / epsilon2)*sqrt(2*log(1.25/delta2));
        nsamples = nchoosek(D + num_words - 1, num_words);
        list_noise = normrnd(0, tau, nsamples, 1);
        E3 = mySymmTensor(list_noise, D, num_words);
        tmpM3 = tmpM3 + M3{s} + E3;
    end
    M2_ag = tmpM2 / num_sites;
    M3_ag = tmpM3 / num_sites;
    
    [Um,Dm,~] = svd(M2_ag);
    Um = Um(:, 1:K);
    Dm = Dm(1:K, 1:K);
    W = Um / sqrt(Dm);
    M3_tilde = my_multilinear_tensor(M3_ag, 1, W);
    
    I = eye(K);
    
    for k = 1:K
        flag = true;
        u = rand(K,1);
        u = u / norm(u);
        itr = 1;
        while flag
            u_hat = my_multilinear_tensor(M3_tilde,0,I,u,u);
            nrm = norm(u_hat);
            u_new = u_hat/nrm;
            change = norm(u_new-u);
            itr = itr+1;
            flag = (change > tol) && (itr <= maxitr);
            u = u_new;
        end
        lambdaDP_conv(k) = (1/nrm)^2;
        VDP_conv(:,k) = normc(Um*sqrt(Dm)*u);
        M3_tilde = M3_tilde - nrm*outprod(u,u,u);
    end
    
return;