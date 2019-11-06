clear all;clc;close all

path = '../Database/';
nensemble = 10;
epsilon = 2;
delta = 0.01;
D = 10;
K = 5;
N_all = [50 100 200 500 800]*1000'; %sample size in thousands
num_sites = 5;
tol = 1e-6;
maxitr = 1000;

% initializations
err = zeros(nensemble, length(N_all));
errCAPE = zeros(nensemble, length(N_all));
errCONV = zeros(nensemble, length(N_all));
errLOCAL = zeros(nensemble, length(N_all));

err_vec = zeros(nensemble, length(N_all));
err_vecCAPE = zeros(nensemble, length(N_all));
err_vecCONV = zeros(nensemble, length(N_all));
err_vecLOCAL = zeros(nensemble, length(N_all));

VNDP = zeros(D, K, length(N_all));
VDP_AG = zeros(D, K, length(N_all));
VDP_AG_conv = zeros(D, K, length(N_all));
VDP_AG_local = zeros(D, K, length(N_all));

lam_final = zeros(K, length(N_all));
lam_finalDPAG = zeros(K, length(N_all));
lam_finalDP_conv = zeros(K, length(N_all));
lam_finalDP_local = zeros(K, length(N_all));


    
%% estimating model parameters
% [lambda,V] = my_orth_tensor_decomp_ver2 (M3/D, M2/D, K, false);
for n_itr = 1:nensemble
    disp(["Iteration: ", num2str(n_itr)])
    
    for n_id = 1:length(N_all)
        N = N_all(n_id);
        
        load([path,'MOG_data_K_5_D_10_N_',num2str(N/1000),'k']);
        num_samples_per_site = N / num_sites;
        del2 = 1 / N;
        del3 = 2 / N + 6 * D * sample_sigma / N;
        
        [V, VDP, VDP_conv, VDP_local, lambda, lambdaDP, lambdaDP_conv, lambdaDP_local] = myCAPEAGN(M2, M3, K, maxitr, tol, epsilon, delta, del2, del3);
        
        VNDP(:, :, n_id) = V;
        lam_final(:, n_id) = sort(lambda / sum(lambda), 'ascend');
        err(n_itr, n_id) = norm(w - lam_final(:, n_id));
        err_vec(n_itr, n_id) = myEigVecCheck(mu, VNDP(:, :, n_id));
        
        
        VDP_AG(:, :, n_id) = VDP;
        lam_finalDPAG(:, n_id) = sort(lambdaDP / sum(lambdaDP), 'ascend');
        errCAPE(n_itr, n_id) = norm(w - lam_finalDPAG(K, n_id));
        err_vecCAPE(n_itr, n_id) = myEigVecCheck(mu, VDP_AG(:, :, n_id));
        
%         
        VDP_AG_conv(:, :, n_id) = VDP_conv;
        lam_finalDP_conv(:, n_id) = sort(lambdaDP / sum(lambdaDP_conv), 'ascend');
        errCONV(n_itr, n_id) = norm(w - lam_finalDP_conv(:, n_id));
        err_vecCONV(n_itr, n_id) = myEigVecCheck(mu, VDP_AG_conv(:, :, n_id));
        
        VDP_AG_local(:, :, n_id) = VDP_local;
        lam_finalDP_local(:, n_id) = sort(lambdaDP / sum(lambdaDP_local), 'ascend');
        errLOCAL(n_itr, n_id) = norm(w - lam_finalDP_local(:, n_id));
        err_vecLOCAL(n_itr, n_id) = myEigVecCheck(mu, VDP_AG_local(:, :, n_id));
        
    end
end

save('MOG_vs_samples_K_5_D_10_eps_2','V','lam_final','VDP_AG', 'lam_finalDPAG', ...
                                                'VDP_AG_conv', 'lam_finalDP_conv', ...
                                                'VDP_AG_local','lam_finalDP_local', ...
                                                'err','errCAPE','errCONV','errLOCAL', ...
                                                'N_all', 'epsilon', 'delta', ...
                                                'err_vec','err_vecCAPE','err_vecCONV','err_vecLOCAL');