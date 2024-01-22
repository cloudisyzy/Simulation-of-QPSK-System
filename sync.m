% t_samp = sync(mf, b_train, Q, t_start, t_end)
%
% Determines when to sample the matched filter outputs. The synchronization
% algorithm is based on cross-correlating a replica of the (known)
% transmitted training sequence with the output from the matched filter
% (before sampling). Different starting points in the matched filter output
% are tried and the shift yielding the largest value of the absolute value
% of the cross-correlation is chosen as the sampling instant for the first
% symbol.
%
% Input:
%   mf            = matched filter output, complex baseband, I+jQ
%   b_train       = the training sequence bits
%   Q             = number of samples per symbol
%   t_start       = start of search window
%   t_end         = end of search window
%
% Output:
%   t_samp = sampling instant for first symbol

function t_samp = sync(mf, b_train, Q, t_start, t_end)
    % Modulate the training sequence
    c = qpsk(b_train);
    % Initialize correlation set
    corr = zeros(1, t_end-t_start+1);
    % Iterate over the range to find the best t_samp
    for t = t_start:t_end
        % According to (28), we have the critical two lines of code below
        kQ_t = [0:length(c)-1] * Q + t;
        mf_downsamp = mf(kQ_t);
        % t-t_start+1 since matlab index starts at 1, c' is the conjugate
        % transprose
        corr(t-t_start+1) = mf_downsamp * c';
    end
    [max_val, arg_max] = max(abs(corr));
    t_samp = t_start + (arg_max - 1); % Also because matlab index starts at 1
%     
%     stem(t_samp, max_val, "b")
%     sprintf("argmax = %d", arg_max-1)
%     hold on

%     stem(0:length(corr)-1, abs(corr),"filled")
%     xlabel("k")
%     ylabel("Correlation R(k)")
%     set(gca, 'YTickLabel', {});
end


