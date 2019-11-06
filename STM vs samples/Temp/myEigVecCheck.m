function err = myEigVecCheck(V, V_rec, preprocess)
% this function computes the error in estimating a set of eigenvectors. the
% error is computed in the following way: pick one col of V_rec, compare it
% with each col of V and find the one with minimum Euclidean distance. this
% distance is the score for this col of V_rec. sum all scores to get err.


% V - original set of eigenvectors. each eigenvector is in a column. N-by-K
% V_rec - recovered eigenvectors (to be tested). N-by-K
% preprocess - 1 for normalization of columns of V_rec treating those as
% probability vectors
% err - error between V and V_rec
% Author - Hafiz Imtiaz

[~,K] = size(V);
score = zeros(K,1);
if (nargin == 3)
    V_rec = myPreProcessProbabilityVects(V_rec);
end

for k = 1:K
    test = V_rec(:,k);
    d = V - repmat(test,1,K);
    scores = sqrt(sum(d.^2));
    score(k) = min(scores);
end
err = (1/K)*sum(score);



function Vout = myPreProcessProbabilityVects(Vin)
% this function takes in a matrix with probability vectors as columns and
% checks if all elements in a column is >= 0. It also ensures the column
% sum is 1.


[N,K] = size(Vin);
Vout = zeros(N,K);
for k = 1:K
    temp = Vin(:,k);
    temp(temp<0) = 0;
    temp = temp/sum(temp);
    Vout(:,k) = temp;
end