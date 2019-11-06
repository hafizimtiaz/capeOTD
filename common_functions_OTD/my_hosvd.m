function [G,V] = my_hosvd (T, K, epsilon, delta)
% G - core tensor of dimension K1-byK2-by ... -by-KM
% V - cell struct containing orthogonal mode matrices of dimension N-by-K

% T - M-way tensor of dimension N-by-N-by N
% K - vector of size M-by-1, target rank of tensor T. If K is scalar then
% all mode will be reduced to K dimension
% epsilon/delta - privacy parameters

M = length(size(T)); % number of modes
N = zeros(M,1); % dimension of each mode
V = cell(M);

if length(K) == 1
    K = K*ones(M,1);
end

for m = 1:M
    N(m,1) = size(T,m);
    mode_col = 1:M;
    mode_col(m) = [];
    Tm = tens2mat(T,[],mode_col);
    [d,n] = size(Tm);
    Pm = (1/n)*(Tm*Tm');
    Pm_hat = Pm;
    if nargin == 3
        nsamples = d+1;
%         sigma = (N(2)/(2*n*epsilon))*eye(d);
        sigma = (1/(2*n*epsilon))*eye(d);
        E = wishrnd(sigma,nsamples);
        Pm_hat = Pm + E;
    elseif nargin == 4
%         sigma = (N(2)/epsilon)*sqrt(2*log(1.25/delta));
        sigma = (1/epsilon)*sqrt(2*log(1.25/delta));
        temp = normrnd(0,sigma,d,d);
        temp2 = triu(temp);
        temp3 = temp2';
        temp4 = tril(temp3,-1);
        E = temp2+temp4;
        Pm_hat = Pm + E;
    end
    [U,~,~] = svd(Pm_hat);
    V{m} = U(:,1:K(m));
end
if (nargin == 3) || (nargin == 4)
    E = myLaplace(sqrt(2*N(1)*N(2))/epsilon,K(1),N(2)*N(3));
else
    E = zeros(K(1),N(2)*N(3));
end
E_tens = mat2tens(E,[K(1) N(2) N(3)],1,2:N(2)*N(3));
G = tmprod(T,V{1}',1) + E_tens;
for m = 2:M
    G = tmprod(G,V{m}',m);
end

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