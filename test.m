clear

a = random_data(16)
% a = double(a)
a_modu = qpsk(a)
a_demo = detect(a_modu)
length(a) == sum(a == a_demo)