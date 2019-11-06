function [lambda, V] = myDProbustTPM(T, K, L, R, epsilon, delta)

% this code implements the recently proposed differentially-private robust
% tensor power method by Wang & Anandkumar 2016
% lambda - recovered eigenvalues (K-by-1)
% V - matrix of eigenvectors, each column is an eigenvector (N-by-K)
% T - input tensor (should be orthogonally decomposable symmetric)
% K - desired rank
% L,R - number of iterations
% epsilon,delta - privacy parameters

N = size(T,1);              % dimension
M = length(size(T));        % mode

% initialization
lambda = zeros(K,1);
V = zeros(N,K);
D = zeros(size(T));
capK = K*L*(R+1);
eps = epsilon/sqrt(capK*(4+log(2/delta)));
del = delta/(2*capK);
neu = (2/eps)*sqrt(2*log(1.25/del));

for k = 1:K
    U = rand(N,L);
    nrms = diag(U'*U);
    U = U*diag(1./nrms);
    U_new = zeros(N,L);
    
    for r = 1:R
        for l = 1:L
            U_new(:,l) = my_multilinear_tensor(T-D,0,eye(N),U(:,l),U(:,l));
            z = randn(N,1);
            U_new(:,l) = U_new(:,l) + neu*norm(U(:,l),Inf)^2*z;
            U_new(:,l) = U_new(:,l)/norm(U_new(:,l));
        end
        U = U_new;
    end
    lam = zeros(L,1);
    for l = 1:L
        lam(l) = my_multilinear_tensor(T-D,0,U(:,l),U(:,l),U(:,l)) + neu*norm(U(:,l),Inf)^3*randn(1);
    end
    [~,l_opt] = max(lam);
    lambda(k) = lam(l_opt);
    V(:,k) = U(:,l_opt);
    D = D + lambda(k)*outprod(V(:,k),V(:,k),V(:,k));
end
        