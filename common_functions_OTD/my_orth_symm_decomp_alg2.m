function [lambda,V] = my_orth_symm_decomp_alg2 (T, K, randomization, epsilon, delta)
% lambda - vector of dimension K-by-1 with the eigenvalues of the tensor T
% V - orthogonal matrix of dimension N-by-K, columns are eigenvectors of T
% T - M-way tensor of dimension N-by-N-by N
% K - target rank of tensor T
% radomization - true if random projection is required
% epsilon/delta - privacy parameters

[N,~] = size(T); %dimension of each mode
M = length(size(T)); %number of modes

% random projection
if randomization
    U = RandOrthMat(N, 1e-10);
else
    U = eye(N);
end

if nargin < 4
    T_tilde = my_multilinear_tensor(T,1,U);
elseif nargin < 5
    T_tilde = my_dp_multilinear_tensor(T,U,epsilon);
else
    T_tilde = my_dp_multilinear_tensor(T,U,epsilon,delta);
end

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
T_hat = my_multilinear_tensor(T_tilde,1,W);

beta = rand(K,1);
beta = beta/sum(beta(:));

Z = 0;
for k = 1:K
    Z = Z + beta(k)*T_hat(:,:,k);
end

[V_hat,~] = svd(Z);
V = normc(U*X*sqrt(D)*V_hat);
for k = 1:K
	lambda(k) = abs(my_multilinear_tensor(T_tilde,1,U'*V(:,k)));
end
    

function T_tilde = my_dp_multilinear_tensor(T,U,epsilon, delta)
[N,~] = size(T); %dimension of each mode
if nargin<4
% E = myLaplace(N*sqrt(2)/epsilon,N,N^2);
    E = myLaplace(sqrt(2*N)/epsilon,N,N^2);
else
%     D = (sqrt(2*N)/epsilon)*sqrt(2*log(1.25/delta));
    D = (sqrt(2)/epsilon)*sqrt(2*log(1.25/delta));
    E = normrnd(0,D,N,N^2);
end
E_tens = mat2tens(E,[N N N],1,2:N);
T1 = tmprod(T,U',1) + E_tens;
T_tilde = my_multilinear_tensor(T1,0,eye(N),U,U);

function sample = myLaplace(b,m,n)

% variance sigma^2 = 2*b^2
% m = number of rows in output sample
% n = number of cols in output sample
lambda=1/b;
siz=[m n];

zz = rand(siz);
xx = zeros(siz);
in = zz <=.5;
ip = zz > .5;
xx(in) =  1/lambda *log(2*zz(in));
xx(ip) = -1/lambda *log(2*(1-zz(ip)));

sample=xx;