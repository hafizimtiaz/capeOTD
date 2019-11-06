function V = myTensorDecomposition(Tu, Tl, k)
    % Tu and Tl are the two tensor
    % k is the expected rank
    % see Goyal, Vempala, Xiao 2014 - Fourier PCA
    
    [D,~] = size(Tu);
    Mu = myTens2Matr(Tu);
    Ml = myTens2Matr(Tl);
    WP = myDiagonalize(Mu, Ml, k);
    [~,C] = size(WP);
    V = zeros(D,k);
    for c = 1:C
        theta_all = linspace(0,2*pi,1000);
        param = norm(real(exp(1i*theta_all)*WP(:,c)));
        [~,id] = max(param);
        theta = theta_all(id);
        WP_new = real(exp(1i*theta)*WP(:,c))/norm(real(exp(1i*theta)*WP(:,c)));
        M = myVect2Matr(WP_new);
        [Um,~,~] = svd(M);
        V(:,c) = Um(:,1);
    end
return

function M = myTens2Matr(T)
    [D,~] = size(T);
    M = zeros(D^2, D^2);
    for a = 1:D^2
        for b = 1:D^2
            indx1 = [ceil(a/D), a-(ceil(a/D)-1)*D];
            indx2 = [ceil(b/D), b-(ceil(b/D)-1)*D];
            indx = [indx1,indx2];
            M(a,b) = T(indx);
        end
    end
return

function M = myVect2Matr(V)
    L = length(V);
    M = zeros(sqrt(L));
    for k = 1:L
        r = ceil(k/sqrt(L));
        c = k - (ceil(k/sqrt(L))-1)*sqrt(L);
        M(r,c) = V(k);
    end
return