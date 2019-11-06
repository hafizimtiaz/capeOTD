function X = mySymmTensor(list, N, M)
% list - list of entries that will make the symmetric tensor
% N - dimension in each mode of the tensor
% M - number of modes of the tensor
% X - resulting symmetric tensor
% Author - Hafiz Imtiaz

if length(list) < nchoosek(N+M-1,M)
    disp('not enough entries in the input list');
    return;
end

temp_list = list;                   % back-up the input entries
dims = N*ones(1,M);
X = zeros(dims);
flag = zeros(size(X));              % flag for which entries I already entered

% first input the diagonal elements
diag_subs = diag(1:N)*ones(N,M);
diag_inds = tt_sub2ind(dims,diag_subs);
for n = 1:N
    X(diag_inds(n)) = temp_list(n);
    flag(diag_inds(n)) = 1;
end
temp_list(1:N) = [];
ids = find(flag==0);

% now off-diagonal entries
while numel(ids) > 0
    ind = ids(1);
    sub = tt_ind2sub(dims,ind);
    P = perms(sub);
    all_inds = tt_sub2ind(dims,P);
    [num_perms,~] = size(P);
    
    entr = temp_list(1);
    for p = 1:num_perms
        if flag(all_inds(p))==0
            X(all_inds(p)) = entr;
            flag(all_inds(p)) = 1;
        end
    end
    temp_list(1)=[];
    ids = find(flag==0);
end
% disp(['Entries left: ',num2str(find(flag==0))]);
% disp(['Is output symmetric: ',num2str(issymmetric(X))]);