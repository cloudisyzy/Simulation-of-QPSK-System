% bhat = detect(r)
%
% Computes the received bits given a received sequence of (phase-corrected)
% QPSK symbols. Gray coding of the individual bits is assumed. Hence, the
% two bits for each symbol can be detected from the real and imaginary
% parts, respectively. The first of the two bits below is output first in
% the bhat-sequence.
%
% Assumed mapping:
%
%  10 x   |   x 00
%         |
%  -------+-------
%         |
%  11 x   |   x 01
%
% Input:
%   r  = sequence of complex-valued QPSK symbols
%
% Output:
%   bhat  = bits {0,1} corresponding to the QPSK symbols

function bhat = detect(r)
    % Compute # of symbols
    N = length(r);
    % Initialize the bit set
    bhat = zeros(1, 2*N);
    % Direct mapping using sign of real and imaginary parts
    bhat(1:2:end) = real(r) < 0; 
    bhat(2:2:end) = imag(r) < 0;
end



