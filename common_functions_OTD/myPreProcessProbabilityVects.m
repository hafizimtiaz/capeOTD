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