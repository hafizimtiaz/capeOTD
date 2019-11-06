function W = myDiagonalize(M1, M2, k)
    % M1 and M2 are the two matrices
    % k is the expected rank
    % see Goyal, Vempala, Xiao 2014 - Fourier PCA
    
    [V,~,~] = svd(M1);
    W = V(:,1:k);
    M = (W'*M1*W)/(W'*M2*W);
    [P,~] = eig(M);
    W = W*P;
return