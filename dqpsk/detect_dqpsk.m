function bhat = detect_dqpsk(r)
    N = length(r);
    bhat = zeros(1, 2*N);
    prev_phase = 0; % Initial phase reference

    for k = 1:N
        current_phase = angle(r(k));
        phase_diff = mod(current_phase - prev_phase, 2*pi);
        bhat(2*k-1:2*k) = phase_diff_to_bits(phase_diff);
        prev_phase = current_phase;
    end
end

function bits = phase_diff_to_bits(phase_diff)
    % Map phase differences to bit pairs
    if phase_diff > -pi/4 && phase_diff <= pi/4
        bits = [0 0];
    elseif phase_diff > pi/4 && phase_diff <= 3*pi/4
        bits = [0 1];
    elseif (phase_diff > 3*pi/4 && phase_diff <= pi) || (phase_diff > -pi && phase_diff <= -3*pi/4)
        bits = [1 1];
    else % -3*pi/4 < phase_diff <= -pi/4
        bits = [1 0];
    end
end
