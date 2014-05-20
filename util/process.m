
compile_times = textread('dist/compile_times')
total_compile_time = compile_times(2)-compile_times(1);

run_times = textread('dist/run_times')
total_run_time = run_times(2)-run_times(1);

run_compile_data = [total_compile_time, total_compile_time, total_run_time;total_run_time, 0 0];


run_times = dlmread('dist/benchmark.dat', ',')(2:end,2)
util_times = dlmread('dist/utilities.dat', ',')(2:end,2)


subplot(3,3,1);
plot(run_times, '.');
text(48,18,"Jeremy's Project Euler Progress")
colormap(summer (64));
ylabel("Run Time (s)");

#subplot(3,3,2);

#subplot(3,3,3);
stem(util_times*1000);
set(gca, 'XTick', 1)
set(gca, 'xticklabel', "primes <1E6")
ylabel("Run Time (ms)");
xlabel("Util Benchmark");



subplot(3,3,4);
plot(run_times, '.');
colormap(summer (64))
set(gca, 'yscale', 'log');
ylabel("Run Time (s)")
xlabel("Problem Number")

subplot(3,3,5:6);
t = [nnz(run_times(run_times<=1)), nnz(run_times(run_times>1 & run_times <10)), nnz(run_times(run_times>=10))];
bar(t)
set(gca, 'XTick', [1 2 3])
set(gca, 'xticklabel', "<= 1 sec |1 sec < t < 10 sec | > 10 sec")
xlabel("Run Times (s)");


#subplot(3,3,7);
#plot(compile_times, '.');
#set(gca, 'yscale', 'log');
#ylabel("Compile Time (s)");
#xlabel("Problem Number");
#
subplot(3,3,8:9);
barh(run_compile_data', 'stacked');
set(gca, 'YTick', [1 2 3]);
set(gca, 'yticklabel', "Total | Runtime | Compile Time" );
xlabel("Time (seconds)")


# equivalent to "orient tall" 
papersize = get (gcf, "papersize"); # presently the paper units must be inches 
border = 0.25; 
set (gcf, "paperposition", [border, border, (papersize - 2*border)]) 

# To change orientation 
orientation = get (gcf, "paperorientation"); 
papersize = get (gcf, "papersize"); 
paperposition = get (gcf, "paperposition"); 
print -landscape -dpdf dist/euler.pdf;


