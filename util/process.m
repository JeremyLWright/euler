[compile_names, compile_times_s, compile_times_e] = textread('dist/compile.dat', '%s %f %f');
compile_times = compile_times_e - compile_times_s
[run_names, run_times] = textread('dist/times.dat', '%s %f');
[nothing, bench_time] = textread('dist/bench.dat', '%s %f');


subplot(3,3,1);
plot(run_times, '.');
text(48,12,"Jeremy's Project Euler Progress")
colormap(summer (64));
ylabel("Run Time (s)");

subplot(3,3,2);
plot(run_times, '.');
colormap(summer (64))
set(gca, 'yscale', 'log');
ylabel("Run Time (s)")

subplot(3,3,3);
plot(bench_time, '.');
set(gca, 'XTick', 1)
set(gca, 'xticklabel', "primes <1E6")
ylabel("Run Time (s)");
xlabel("Benchmark");



subplot(3,3,4);
plot(compile_times, '.');
ylabel("Compile Time (s)");
xlabel("Problem Number");

subplot(3,3,5:6);
hist(run_times);
xlabel("Run Times (s)");


subplot(3,3,7);
plot(compile_times, '.');
set(gca, 'yscale', 'log');
ylabel("Compile Time (s)");
xlabel("Problem Number");

subplot(3,3,8:9);
hist(compile_times);
xlabel("Compile Times (s)");
%set(gca, 'xscale', 'log');


# equivalent to "orient tall" 
papersize = get (gcf, "papersize"); # presently the paper units must be inches 
border = 0.25; 
set (gcf, "paperposition", [border, border, (papersize - 2*border)]) 

# To change orientation 
orientation = get (gcf, "paperorientation"); 
papersize = get (gcf, "papersize"); 
paperposition = get (gcf, "paperposition"); 
print -landscape -dpdf dist/euler.pdf;


