function s = d_qpsk(b)
    % Ensure that the length of b is even
    assert(mod(length(b), 2) == 0, 'Bitstream length must be even');

    % Differential encoding
    N = length(b)/2;
    s = zeros(1, N);
    prev_phase = 0; % Initial phase reference

    for i = 1:2:length(b)
        bits = b(i:i+1);
        delta_phase = phase_mapping(bits);
        current_phase = mod(prev_phase + delta_phase, 2*pi);
        s((i+1)/2) = exp(1i*current_phase);
        prev_phase = current_phase;
    end
end

function delta_phase = phase_mapping(bits)
    % Map bit pairs to phase changes
    if isequal(bits, [0 0])
        delta_phase = pi/4;
    elseif isequal(bits, [0 1])
        delta_phase = 3*pi/4;
    elseif isequal(bits, [1 1])
        delta_phase = -3*pi/4;
    else % [1 0]
        delta_phase = -pi/4;
    end
end
