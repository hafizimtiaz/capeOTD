function [lambda,V] = my_orth_tensor_decomp_ver2 (T, C, K, randomization, epsilon, delta)
% lambda - vector of dimension K-by-1 with the eigenvalues of the tensor T
% V - orthogonal matrix of dimension N-by-K, columns are eigenvectors of T

% T - M-way tensor of dimension N-by-N-by N
% C - 2-dimensional covariance matrix
% K - target rank of tensor T or C
% radomization - true if random projection is required
% epsilon/delta - privacy parameters

[N,~] = size(T); %dimension of each mode
M = length(size(T)); %number of modes
V = zeros(N,K);
lambda = zeros(K,1);

% random projection
if randomization
    X = RandOrthMat(N, 1e-10);
else
    X = eye(N);
end

if nargin < 5
    T_tilde = my_multilinear_tensor(T,1,X);
elseif nargin < 6
    T_tilde = my_dp_multilinear_tensor(T,X,epsilon);
elseif nargin == 6
    T_tilde = my_dp_multilinear_tensor(T,X,epsilon,delta);
end
C_tilde = X'*C*X;

[U,D,~] = svd(C_tilde);
U = U(:,1:K);
D = D(1:K,1:K);
W = U*sqrt(inv(D));

T_tilde = my_multilinear_tensor(T_tilde,1,W);

% tensor power method
tol = 1e-6;
maxitr = 1000;
I = eye(K);
T_hat = T_tilde;

for k = 1:K
    flag = true;
    u = rand(K,1);
    itr = 1;
    if nargin < 4
        while flag
            u_hat = my_multilinear_tensor(T_hat,0,I,u,u);
            nrm = norm(u_hat);
            u_new = u_hat/nrm;
            change = norm(u_new-u);
            itr = itr+1;
            flag = (change > tol) && (itr <= maxitr);
            u = u_new;
        end
    elseif nargin < 5
        while flag
            u_hat = my_multilinear_tensor(T_hat,0,I,u,u);
            nrm = norm(u_hat);
            u_new = u_hat/nrm;
            change = norm(u_new-u);
            itr = itr+1;
            flag = (change > tol) && (itr <= maxitr);
            u = u_new;
        end
    else
        while flag
            u_hat = my_multilinear_tensor(T_hat,0,I,u,u);
            nrm = norm(u_hat);
            u_new = u_hat/nrm;
            change = norm(u_new-u);
            itr = itr+1;
            flag = (change > tol) && (itr <= maxitr);
            u = u_new;
        end
    end
    lambda(k) = (1/nrm)^2;
    V(:,k) = normc(X*U*sqrt(D)*u);
    T_hat = T_hat - nrm*outprod(u,u,u);
end

function T_tilde = my_dp_multilinear_tensor(T, U, epsilon, delta)
[N,~] = size(T); %dimension of each mode
if nargin < 4
% E = myLaplace(N*sqrt(2)/epsilon,N,N^2);
    E = myLaplace(sqrt(2*N)/epsilon,N,N^2);
else
%     D = (sqrt(2*N)/epsilon)*sqrt(2*log(1.25/delta));
    D = (sqrt(2)/epsilon)*sqrt(2*log(1.25/delta));
    E = normrnd(0,D,N,N^2);
end
E_tens = mat2tens(E,[N N N],1,2:N);
T1 = tmprod(T,eye(N),1) + E_tens;
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