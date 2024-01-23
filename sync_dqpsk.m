function t_samp = sync_dqpsk(mf, b_train, Q, t_start, t_end)
    % Modulate the training sequence
    dqpskmod = comm.DQPSKModulator;
    c = dqpskmod(double(b_train).').';
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