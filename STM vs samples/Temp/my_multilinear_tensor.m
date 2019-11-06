function T_new = my_multilinear_tensor( T , rep , varargin)
% T - input tensor, M-way N-by-N-by ... -by-N
% varargin - multiplying vectors or matrices in each mode

% rep - set to 1 if you want to multiply T with V in every mode, set to 0
% and list all different V's if different matrix should be used in
% different modes

% T_new = T(V_1, V_2, ..., V_M)
% requires "tensorlab toolbox"

[N,~] = size(T);
M = length(size(T)); %number of modes
V = varargin;
if M > (nargin-2)
    for m = (nargin-2+1):M
        if rep
            V{m} = V{1};
        else
            V{m} = eye(N);
        end
    end
end

temp = T;
for m = 1:M
    temp = tmprod(temp,V{m}',m);
end
T_new = temp;