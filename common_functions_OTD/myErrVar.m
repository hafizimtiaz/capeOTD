function err_out = myErrVar(err_in)
% this function takes in error or other performance measures (independent
% runs in rows and results in columns) and discards if any entry contains NaN


[nensemble, num_params] = size(err_in);
err_out = zeros(1,num_params);
for param = 1:num_params
    tmp = err_in(:,param);
    S1 = 0;
    S2 = 0;
    cnt = 0;
    for n = 1:nensemble
        if ~isnan(tmp(n))
            S1 = S1 + tmp(n);
            S2 = S2 + tmp(n)^2;
            cnt = cnt+1;
        end
    end
    err_out(param) = (1/cnt)*S2 - ((1/cnt)*S1)^2;
end
return