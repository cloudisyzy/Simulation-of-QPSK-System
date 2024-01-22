clear
% 
% a = random_data(16)
% % a = double(a)
% a_modu = qpsk(a)
% a_demo = detect(a_modu)
% length(a) == sum(a == a_demo)

% Parameters for PN Sequence
n = 4; % Degree of the polynomial
seqLength = 100; % Length of the sequence

% Create a PN Sequence generator object
pnGen = comm.PNSequence('Polynomial', [n 0], 'SamplesPerFrame', seqLength, 'InitialConditions', [1,0,1,0]);

% Generate the PN Sequence
pnSeq = pnGen();
