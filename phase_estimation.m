% phihat = phase_estimation(r, b_train)
%
% Phase estimator using the training sequence. The phase estimate is
% obtained by minimizing the norm of the difference between the known
% transmitted QPSK-modulated training sequence and the received training
% part. NB! There are other ways of estimating the phase, this is just
% one example.
%
% Input:
%   r       = received baseband signal
%   b_train = the training sequence bits
%
% Output:
%   phihat     = estimated phase

function phihat = phase_estimation(r, b_train)
    % Modulate the training sequence
    d_train = qpsk(b_train);
    % Compute # of symbols in the training sequence
    N = length(d_train);
    % Extract the corresponding part within the received signal
    r_train = r(1:N);
    % Compute the phase difference between received and expected symbols,
    % based on formula (30)
    phase_diff = angle(d_train .* conj(r_train));
    % Take the Average value
    phihat = mean(phase_diff);
end



