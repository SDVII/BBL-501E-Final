I = eye(25);
T = I - R;
M = S / T;

% PP is the stable markov state, constructed using M
Prob1 = PP * Init1;
Prob2 = PP * Init2;
