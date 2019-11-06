clear all;clc;close all

K = 5;                  % number of components
D = 10;                 % sample dimension
num_sites = 5;

w = linspace(1,10*K,K);  % probability vector of selecting a component
w = w'/sum(w);
mu = RandOrthMat(D, 1e-10);    % component mean vectors
mu = mu(:, 1:K);
sigma = 0.05;                  % noise variance

N_all = [50, 100, 200, 500, 800]' * 1e3;
for n_id = 1:length(N_all)
    N = N_all(n_id);
    num_samples_per_site = N / num_sites;
    X = zeros(D, N);             % matrix that have the samples
    z = my_rand_data_generator(zeros(D,1), sigma * eye(D), N);
    for n = 1:N
        k = randsample(K,1,true,w);    
        X(:, n) = mu(:, k) + z(:, n); 
    end
    
    
    st_id = 1;
    en_id = num_samples_per_site;
    M2 = cell(num_sites,1);
    M3 = cell(num_sites,1);
    for s = 1:num_sites
        tmpX = X(:, st_id:en_id);
        nrms = zeros(num_samples_per_site,1);
        for n = 1:num_samples_per_site
            nrms(n) = norm(tmpX(:, n));
        end
        max_nrm = max(nrms);
        tmp_M3 = 0;
        for n = 1:num_samples_per_site
            tmpX(:, n) = tmpX(:, n) / max_nrm;
            tmp_M3 = tmp_M3 + outprod(tmpX(:, n), tmpX(:, n), tmpX(:, n));
        end
        sample_mean = mean(tmpX, 2);
        sample_cov = (1/num_samples_per_site) * (tmpX * tmpX') - sample_mean*sample_mean';
        [~, S, ~] = svd(sample_cov);
        sample_sigma = min(diag(S));

        tmp_M2 = (1/num_samples_per_site) * (tmpX * tmpX') - sample_sigma * eye(D);

        temp = 0;
        for d = 1:D
            ed = zeros(D, 1);
            ed(d) = 1;
            temp = temp + outprod(sample_mean,ed,ed) + outprod(ed,sample_mean,ed) + outprod(ed,ed,sample_mean);
        end
        tmp_M3 = (1/num_samples_per_site) * tmp_M3 - sample_sigma*temp;
        M2{s} = tmp_M2;
        M3{s} = tmp_M3;
        
        %% test of correctness
        M2_orig = 0;
        M3_orig = 0;
        for k = 1:K
            M2_orig = M2_orig + w(k)*(mu(:,k)*mu(:,k)');
            M3_orig = M3_orig + w(k)*outprod(mu(:,k),mu(:,k),mu(:,k));
        end
        M2_orig = M2_orig/max_nrm^2;
        M3_orig = M3_orig/max_nrm^3;
        norm(tmp_M2 - M2_orig,'fro')*100/norm(M2_orig,'fro')
        frob(tmp_M3 - M3_orig)*100/frob(M3_orig)
    end
 
    save(['MOG_data_K_',num2str(K),'_D_',num2str(D),'_N_',num2str(N/1000),'k'],'K','N','w','mu','D','X','M2','M3','max_nrm', 'sample_sigma');    
end