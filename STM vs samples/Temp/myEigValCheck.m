function err = myEigValCheck(w, w_rec)
% this function computes the error in estimating a set of eigenvalues. the
% error is computed in the following way: pick one entry of w_rec, compare it
% with each entry of w and find the one with minimum absolute difference. this
% difference is the score for this entry of w_rec. sum all scores to get err.


% w - original set of eigenvalues. K-by-1
% w_rec - recovered eigenvalues (to be tested). K-by-1
% err - error between w and w_rec
% Author - Hafiz Imtiaz

K = length(w);
score = zeros(K,1);
for k = 1:K
    test = w_rec(k);
    d = w - repmat(test,K,1);
    scores = abs(d);
    score(k) = min(scores);
end
err = sum(score);
    