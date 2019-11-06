function [lambda,V] = my_orth_symm_decomp (T, K, randomization)
% lambda - vector of dimension K-by-1 with the eigenvalues of the tensor T
% V - orthogonal matrix of dimension N-by-K, columns are eigenvectors of T
% T - M-way tensor of dimension N-by-N-by N
% K - target rank of tensor T
% radomization - true if random projection is required

[N,~] = size(T); %dimension of each mode
M = length(size(T)); %number of modes

% random projection
if randomization
    U = RandOrthMat(N, 1e-10);
else
    U = eye(N);
end
T_tilde = my_multilinear_tensor(T,1,U);

flag = false;

while ~flag
    gamma = rand(N,1);
    gamma = gamma/sum(gamma(:));
    Y = 0;
    for n = 1:N
        Y = Y + gamma(n)*T_tilde(:,:,n);
    end
    [X,D,~] = svd(Y);
    flag = all(diag(D)>0);
end
X = X(:,1:K);
D = D(1:K,1:K);
% W = X*diag(1./sqrt(diag(D)));
W = X*sqrt(inv(D));
% W = X*diag(sqrt(diag(D)));
T_hat = my_multilinear_tensor(T,1,W);

beta = rand(K,1);
beta = beta/sum(beta(:));

Z = 0;
for k = 1:K
    Z = Z + beta(k)*T_hat(:,:,k);
end

[V_hat,~] = svd(Z);
V = U*X*sqrt(D)*V_hat;
for k = 1:K
	lambda(k) = my_multilinear_tensor(T,1,V(:,k));
end
    