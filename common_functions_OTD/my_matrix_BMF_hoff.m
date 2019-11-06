function sample = my_matrix_BMF_hoff(A, Xinit)

    % A - autocorrelation matrix of the data; A= (1/n) X*X'; n - number of
    % samples
    % maxiter - number of iteration for each sampling
    % Xinit - m x R size, initialization for the sampling,
    % should have orthonormal columns
    
    Xold = Xinit;
    [~,R] = size(Xold);

    %% matrix-Bingham sampling starts from here
    rnd_order = randsample(R,R);
    for kk = 1:length(rnd_order)
        k = rnd_order(kk);
        Xn = Xold;
        Xn(:,k) = [];
        N = null(Xn');
        z = N'*Xold(:,k);
        An = N'*A*N;
        zn = my_vector_BMF_hoff(An,z);
        Xold(:,k) = N*zn;
    end
    sample = Xold;

return;

function sample = my_vector_BMF_hoff(A,xinit)
    % A - m x m autocorrelation matrix of the data; A= (1/n) X*X'
    % m - length of each sample, n -number of samples
    % maxiter - number of iteration for each sampling
    % xinit - initialization for the sampling

    xold=xinit(:);
    m=size(A,1);

    [V,S] = eig(A);
    lambda=diag(S);

    y=V'*xold;
    sample=V*ry_bing(y,lambda,length(y));
    sample=sample/norm(sample);
return;

% support functions %
function y = ry_bing(y,l,n)
  
    k=.5*(n-1.0);

    for i=1:n
        omyi=1.0/(1.0-y(i)^2);
        smyi=sqrt(omyi);
        a=l(i)+l(i)*y(i)^2*omyi;
        for j=1:n
            a=a-l(j)*y(j)^2*omyi;
        end    
        theta=rtheta_bing(k,a) ;

        for j=1:n
            y(j)=y(j)*sqrt(1.0-theta)*smyi;
        end
        y(i)=sqrt(theta)*((-1.0)^round(rand(1)));
    end
return;

function th = rtheta_bing(k,a) 
    u=2;
    g=k; 
    lrth=0.0;
    lrmx=0.0;

    if a>0
        g= max([1.0/(1.0+log(2.0+a)),k-a]); 
        lrmx= a - k + g + (k-g)*log((k-g)/a);
    end

    while log(u)>lrth-lrmx
        u=rand(1);
        th=betarnd(.5,real(g));
        lrth=a*th+(k-g)*log(1-th);
    end
return;

