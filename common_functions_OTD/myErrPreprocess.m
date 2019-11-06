function [err_out,optional] = myErrPreprocess(err_in,ind)
% this function takes in error or other performance measures (independent
% runs in rows and results in columns) and discards if any row contains NaN

if (nargin<2) || (ind == 0)
    ind = 0;
else
    ind = 1;
end

[nensemble, ~] = size(err_in);
indicator = [1:nensemble]';
for n_itr = 1:nensemble
    temp = err_in(n_itr,:);
    if sum(isnan(temp))
        indicator(n_itr) = 0;
    end
end
indicator(indicator == 0) = [];
if ~ind
    err_out = err_in(indicator,:);
    optional = [];
else
    [err_out,optional] = myErrStat(err_in);
end



function [err_mean,err_std] = myErrStat(err_in)

[nensemble,params] = size(err_in);
err_mean = zeros(1,params);
err_std = zeros(1,params);
for k = 1:params
    temp = err_in(:,k);
    temp_ids = 1:nensemble;
    ids = temp_ids(~isnan(temp));
    err_mean(k) = mean(temp(ids));
    err_std(k) = std(temp(ids));
end