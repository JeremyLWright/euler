[compile_names, compile_times_s, compile_times_e] = textread('dist/compile.dat', '%s %f %f');
compile_times = compile_times_e - compile_times_s
[run_names, run_times] = textread('dist/times.dat', '%s %f');
[nothing, bench_time] = textread('dist/bench.dat', '%s %f');
subplot(3,2,1)
stem(run_times);
colormap(summer (64))
%set(gca, 'yscale', 'log');
ylabel("Run Time (s)")

subplot(3,2,2)
title("Jeremy's Project Euler Progress")
stem(run_times);
colormap(summer (64))
set(gca, 'yscale', 'log');
ylabel("Run Time (s)")

subplot(3,2,3)
stem(compile_times)
%set(gca, 'yscale', 'log');
ylabel("Compile Time (s)")
xlabel("Problem Number")

subplot(3,2,4)
stem(compile_times)
set(gca, 'yscale', 'log');
ylabel("Compile Time (s)")
xlabel("Problem Number")

subplot(3,2,5);
stem(bench_time);
set(gca, 'XTick', 1)
set(gca, 'xticklabel', "primes <1E6")
%set(gca, 'yscale', 'log');
ylabel("Run Time (s)")
xlabel("Benchmark")

subplot(3,2,6);
stem(bench_time);
set(gca, 'XTick', 1)
set(gca, 'xticklabel', "primes <1E6")
set(gca, 'yscale', 'log');
ylabel("Run Time (s)")
xlabel("Benchmark")

print -dpng dist/euler.png;

