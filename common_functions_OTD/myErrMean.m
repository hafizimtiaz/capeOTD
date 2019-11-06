function err_out = myErrMean(err_in)
% this function takes in error or other performance measures (independent
% runs in rows and results in columns) and discards if any entry contains NaN


[nensemble, num_params] = size(err_in);
err_out = zeros(1,num_params);
for param = 1:num_params
    tmp = err_in(:,param);
    S = 0;
    cnt = 0;
    for n = 1:nensemble
        if ~isnan(tmp(n))
            S = S + tmp(n);
            cnt = cnt+1;
        end
    end
    err_out(param) = S/cnt;
end
return