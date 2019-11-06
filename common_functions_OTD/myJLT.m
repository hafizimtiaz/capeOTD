function W = myJLT(dim_in, eps, prob, num_samples)
    % implementation of JL-transform
    % dim_in - ambient dimension of the samples
    % eps - required epsilon or error [see https://nickhar.wordpress.com/2012/01/23/lecture-6-dimensionality-reduction-by-the-johnson-lindenstrauss-lemma/]
    % prob - required probability that the error is achieved
    % num_samples - number of samples in the input dataset
    % dim_out - target dimension computed according to [https://www.math.ucdavis.edu/~strohmer/courses/180BigData/180lecture_jl.pdf]
    % W - dim_in \times dim_out subspace defining the JL projection
    
    alpha = - log(1 - prob) / log(num_samples);
    dim_out = ceil( (4 + 2 * alpha) / (eps^2/2 - eps^3/3) * log(num_samples) );
    W = randn(dim_in, dim_out) / sqrt(dim_out);
return;
    

