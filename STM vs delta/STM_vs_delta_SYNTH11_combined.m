clear; clc; close all
path = '../Database/';
load([path,'STM_data_K_5_D_10_N_100k.mat'])
w = w';
nensemble = 10;
epsilon = 0.1;
delta_all = [1e-4, 5e-4, 1e-3, 5e-3, 1e-2, 5e-2];


num_sites = 5;
num_samples_per_site = N / num_sites;
del2 = sqrt(2) / N;
del3 = sqrt(2) / N;

tol = 1e-6;
maxitr = 1000;

% initializations
err = zeros(nensemble,1);
errCAPE = zeros(nensemble, length(delta_all));
errCONV = zeros(nensemble, length(delta_all));
errLOCAL = zeros(nensemble, length(delta_all));

err_vec = zeros(nensemble,1);
err_vecCAPE = zeros(nensemble, length(delta_all));
err_vecCONV = zeros(nensemble, length(delta_all));
err_vecLOCAL = zeros(nensemble, length(delta_all));

VDP_AG = zeros(D, K, length(delta_all));
VDP_AG_conv = zeros(D, K, length(delta_all));
VDP_AG_local = zeros(D, K, length(delta_all));

lam_final = zeros(K,1);
lam_finalDPAG = zeros(K, length(delta_all));
lam_finalDP_conv = zeros(K, length(delta_all));
lam_finalDP_local = zeros(K, length(delta_all));


    
%% estimating model parameters
% [lambda,V] = my_orth_tensor_decomp_ver2 (M3/D, M2/D, K, false);
for n_itr = 1:nensemble
    disp(["Iteration: ", num2str(n_itr)])

    for del_id = 1:length(delta_all)
        delta = delta_all(del_id);
        [V, VDP, VDP_conv, VDP_local, lambda, lambdaDP, lambdaDP_conv, lambdaDP_local] = myCAPEAGN(M2, M3, K, maxitr, tol, epsilon, delta, del2, del3);
    
        lam_final(1:K,1) = sort(lambda / sum(lambda), 'ascend');
        err(n_itr) = norm(w - lam_final);
        err_vec(n_itr) = myEigVecCheck(mu, V, 1);
        
        VDP_AG(:, :, del_id) = myPreProcessProbabilityVects(VDP);
        lam_finalDPAG(1:K, del_id) = sort(lambdaDP / sum(lambdaDP), 'ascend');
        errCAPE(n_itr, del_id) = norm(w - lam_finalDPAG(1:K, del_id));
        err_vecCAPE(n_itr, del_id) = myEigVecCheck(mu, VDP_AG(:,:, del_id), 1);
        
        VDP_AG_conv(:, :, del_id) = myPreProcessProbabilityVects(VDP_conv);
        lam_finalDP_conv(1:K, del_id) = sort(lambdaDP / sum(lambdaDP_conv), 'ascend');
        errCONV(n_itr, del_id) = norm(w - lam_finalDP_conv(1:K, del_id));
        err_vecCONV(n_itr, del_id) = myEigVecCheck(mu, VDP_AG_conv(:,:, del_id), 1);
        
        VDP_AG_local(:, :, del_id) = myPreProcessProbabilityVects(VDP_local);
        lam_finalDP_local(1:K, del_id) = sort(lambdaDP / sum(lambdaDP_local), 'ascend');
        errLOCAL(n_itr, del_id) = norm(w - lam_finalDP_local(1:K, del_id));
        err_vecLOCAL(n_itr, del_id) = myEigVecCheck(mu, VDP_AG_local(:,:, del_id), 1);

    end
end
save('STM_vs_delta_K_5_D_10_N_100k_eps_0_1','V','lam_final','VDP_AG', 'lam_finalDPAG', ...
                                                'VDP_AG_conv', 'lam_finalDP_conv', ...
                                                'VDP_AG_local','lam_finalDP_local', ...
                                                'err','errCAPE','errCONV','errLOCAL', ...
                                                'epsilon','delta_all', ...
                                                'err_vec','err_vecCAPE','err_vecCONV','err_vecLOCAL');