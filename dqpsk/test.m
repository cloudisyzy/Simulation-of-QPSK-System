clear

% dqpskmod = comm.DQPSKModulator(BitInput=true);
% dqpskdemod = comm.DQPSKDemodulator(BitOutput=true);
% 
% a = [1,0,0,1,0,1,0,0]'
% a_modu = dqpskmod(a);
% a_demodu = dqpskdemod(a_modu)

a = random_data(20)
a_modu = d_qpsk(a)
a_demodu = detect_dqpsk(a_modu)
sum(a==a_demodu)