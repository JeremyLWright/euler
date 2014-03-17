[compile_names, compile_times_s, compile_times_e] = textread('dist/compile.dat', '%s %f %f');
compile_times = compile_times_e - compile_times_s;
[run_names, run_times] = textread('dist/times.dat', '%s %f');
[nothing, bench_time] = textread('dist/bench.dat', '%s %f');
memory = load('dist/memory.dat');

subplot(3,3,1);
stem(bench_time*1000);
set(gca, 'XTick', 1);
set(gca, 'xticklabel', "primes <1E6")
ylabel("Run Time (ms)");
xlabel("Benchmark");

%hist(memory(:,2));
%xlabel("Garbage Collection Cycles")

subplot(3,3,2:3);
plot(log2(memory(:,4)), '.');
ylabel("Memory Usage (log_2(bytes))");



subplot(3,3,4);
plot(run_times, '.');
colormap(summer)
set(gca, 'yscale', 'log');
ylabel("Run Time (s)")

subplot(3,3,5:6);
t = [nnz(run_times(run_times<=1)), nnz(run_times(run_times>1 & run_times <10)), nnz(run_times(run_times>=10))];
bar(t)
set(gca, 'XTick', [1 2 3])
set(gca, 'xticklabel', "<= 1 sec |1 sec < t < 10 sec | > 10 sec")
xlabel("Run Times (s)");


subplot(3,3,7);
plot(compile_times*1000, '.');
ylabel("Compile Time (ms)");
xlabel("Problem Number");

subplot(3,3,8:9);
hist(compile_times*1000);
xlabel("Compile Times (ms)");


# equivalent to "orient tall" 
papersize = get (gcf, "papersize"); # presently the paper units must be inches 
border = 0.25; 
set (gcf, "paperposition", [border, border, (papersize - 2*border)]) 

# To change orientation 
orientation = get (gcf, "paperorientation"); 
papersize = get (gcf, "papersize"); 
paperposition = get (gcf, "paperposition"); 
print -landscape -dpdf dist/euler.pdf;


