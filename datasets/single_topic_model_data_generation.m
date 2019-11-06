clear all;clc;close all

K = 10;                      % number of topics
D = 50;                     % number of possible words
N_all = [50, 100, 200, 500, 800]' * 1e3;
num_sites = 5;
num_words = 3;              % number of words in each document (>=3)

for n_id = 1:length(N_all)
    N = N_all(n_id);                 % number of sample documents
    num_samples_per_site = N / num_sites;
    w = linspace(1,10*K,K);     % probability vector of selecting a topic
    w = w/sum(w);
    mu = RandOrthMat(D,1e-10);  % probability vectors of selecting words from topic
    mu = mu(:,1:K);
    mu(mu < 0) = 0;

    for k = 1:K
        mu(:,k) = mu(:,k)/sum(mu(:,k));
    end

    words = cell(num_sites, 1);
    M3 = cell(num_sites, 1);
    M2 = cell(num_sites, 1);
    for s = 1:num_sites
        tmp_M3 = 0;
        tmp_M2 = 0;
        tmp_W = zeros(num_words, num_samples_per_site); % book-keeping of words
        for n = 1:num_samples_per_site
            X = zeros(D, num_words);   % Tensor that have the sample documents
            k = randsample(K, 1, true, w);    
            for i = 1:num_words
                tmp_W(i,n) = randsample(D, 1, true, mu(:, k));
                temp = zeros(D,1);
                temp(tmp_W(i, n)) = 1;
                X(:,i) = temp;
            end
            x1 = squeeze(X(:,1));
            x2 = squeeze(X(:,2));
            x3 = squeeze(X(:,3));
            tmp_M2 = tmp_M2 + x1*x2';
            tmp_M3 = tmp_M3 + outprod(x1,x2,x3);
        end
        words{s} = tmp_W;
        M3{s} = tmp_M3 / num_samples_per_site;
        M2{s} = tmp_M2 / num_samples_per_site;
    end

    save(['STM_data_K_',num2str(K),'_D_',num2str(D), '_N_', num2str(N/1000),'k'],'K','N','w','mu','D','num_words','words','M2','M3','num_sites');   
end