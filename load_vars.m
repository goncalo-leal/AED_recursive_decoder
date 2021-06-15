
results = readcell('results.txt');

n_seeds = [results{:, 1}];
n_call_per_symbol_min = [results{:, 2}];
n_call_per_symbol_avg = [results{:, 3}];
n_call_per_symbol_med = [results{:, 4}];
n_call_per_symbol_max = [results{:, 5}];
lookahead_symb_min = [results{:, 6}];
lookahead_symb_avg = [results{:, 7}];
lookahead_symb_med = [results{:, 8}];
lookahead_symb_max = [results{:, 9}];


plot(n_seeds, n_call_per_symbol_min, 'r--');
hold on;
plot(n_seeds, n_call_per_symbol_avg, 'g-x');
hold on;
plot(n_seeds, n_call_per_symbol_max, 'b-o');
hold off;

xlabel('Number of seeds');
ylabel('Number of calls');
title('Number of calls to the recursive function by number of seeds');
legend('min', 'avg', 'max');
% este é logaritmico

%------------------------------------------------
figure(2);
plot(n_seeds, lookahead_symb_min, 'r--');
hold on;
plot(n_seeds, lookahead_symb_avg, 'g-x');
hold on;
plot(n_seeds, lookahead_symb_max, 'b-o');
hold off;

xlabel('Number of seeds');
ylabel('Number of lookahead symbols');
title('Number of lookahead symbols by number of seeds');
legend('min', 'avg', 'max');


T1 = table(n_seeds', n_call_per_symbol_min', n_call_per_symbol_avg', n_call_per_symbol_med', n_call_per_symbol_max');
T1.Properties.VariableNames = {'N Seeds' 'Min Calls Per Symbol' 'Avg Calls Per Symbol' 'Med Calls Per Symbol' 'Max Calls Per Symbol'};
T1
filename = 'tabela1.xlsx';
writetable(T1,filename,'Sheet',1);

T2 = table(n_seeds', lookahead_symb_min', lookahead_symb_avg', lookahead_symb_med', lookahead_symb_max');
T2.Properties.VariableNames = {'N Seeds' 'Min Lookahead Symbols' 'Avg Lookahead Symbols' 'Med Lookahead Symbols' 'Max Lookahead Symbols'};
T2
filename = 'tabela2.xlsx';
writetable(T2,filename,'Sheet',1);
