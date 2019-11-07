clear;clc;close all
path = '../datasets/';
load([path, 'MOG_data_K_10_D_50_N_100k.mat'])
% w = w';
nensemble = 10;
epsilon_all = [1e-3 5e-3 1e-2 5e-2 1e-1 5e-1 1 5 10]';
delta = 0.01;
sigma = 0.05;
num_words = 3; % number of modes
num_sites = 5;
num_samples_per_site = N / num_sites;
del2 = 1 / N;
del3 = 2 / N + 6 * D * sample_sigma / N;

tol = 1e-6;
maxitr = 1000;

% initializations
err = zeros(nensemble,1);
errCAPE = zeros(nensemble, length(epsilon_all));
errCONV = zeros(nensemble, length(epsilon_all));
errLOCAL = zeros(nensemble, length(epsilon_all));

err_vec = zeros(nensemble,1);
err_vecCAPE = zeros(nensemble, length(epsilon_all));
err_vecCONV = zeros(nensemble, length(epsilon_all));
err_vecLOCAL = zeros(nensemble, length(epsilon_all));

VNDP = zeros(D, K);
VDP_AG = zeros(D, K, length(epsilon_all));
VDP_AG_conv = zeros(D, K, length(epsilon_all));
VDP_AG_local = zeros(D, K, length(epsilon_all));

lam_final = zeros(K,1);
lam_finalDPAG = zeros(K, length(epsilon_all));
lam_finalDP_conv = zeros(K, length(epsilon_all));
lam_finalDP_local = zeros(K, length(epsilon_all));

    
%% estimating model parameters
% [lambda,V] = my_orth_tensor_decomp_ver2 (M3/D, M2/D, K, false);
for n_itr = 1:nensemble
    disp(["Iteration: ", num2str(n_itr)])

    for eps_id = 1:length(epsilon_all)
        epsilon = epsilon_all(eps_id);
        
        [V, VDP, VDP_conv, VDP_local, lambda, lambdaDP, lambdaDP_conv, lambdaDP_local] = myCAPEAGN(M2, M3, K, maxitr, tol, epsilon, delta, del2, del3);
        
        lam_final(1:K,1) = sort(lambda / sum(lambda), 'ascend');
        err(n_itr) = norm(w - lam_final);
        err_vec(n_itr) = myEigVecCheck(mu, V);
        
        VDP_AG(:, :, eps_id) = VDP;
        lam_finalDPAG(1:K, eps_id) = sort(lambdaDP / sum(lambdaDP), 'ascend');
        errCAPE(n_itr, eps_id) = norm(w - lam_finalDPAG(1:K, eps_id));
        err_vecCAPE(n_itr, eps_id) = myEigVecCheck(mu, VDP_AG(:,:, eps_id));
        
        VDP_AG_conv(:, :, eps_id) = VDP_conv;
        lam_finalDP_conv(1:K, eps_id) = sort(lambdaDP / sum(lambdaDP_conv), 'ascend');
        errCONV(n_itr, eps_id) = norm(w - lam_finalDP_conv(1:K, eps_id));
        err_vecCONV(n_itr, eps_id) = myEigVecCheck(mu, VDP_AG_conv(:,:, eps_id));
        
        VDP_AG_local(:, :, eps_id) = VDP_local;
        lam_finalDP_local(1:K, eps_id) = sort(lambdaDP / sum(lambdaDP_local), 'ascend');
        errLOCAL(n_itr, eps_id) = norm(w - lam_finalDP_local(1:K, eps_id));
        err_vecLOCAL(n_itr, eps_id) = myEigVecCheck(mu, VDP_AG_local(:,:, eps_id));

        
    end
end

save('MOG_vs_epsilon_K_10_D_50_N_100k','V','lam_final','VDP_AG', 'lam_finalDPAG', ...
                                                'VDP_AG_conv', 'lam_finalDP_conv', ...
                                                'VDP_AG_local','lam_finalDP_local', ...
                                                'err','errCAPE','errCONV','errLOCAL', ...
                                                'epsilon_all','delta', ...
                                                'err_vec','err_vecCAPE','err_vecCONV','err_vecLOCAL');
