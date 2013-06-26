[compile_names, compile_times] = textread('dist/compile.dat', '%s %f');
[run_names, run_times] = textread('dist/times.dat', '%s %f');
[nothing, bench_time] = textread('dist/bench.dat', '%s %f');
subplot(3,1,1)
bar(run_times);
colormap(summer (64))
ylabel("Run Time (s)")
title("Jeremy's Project Euler Progress")

subplot(3,1,2)
bar(compile_times)
colormap(summer (64))
ylabel("Compile Time (s)")
xlabel("Problem Number")

subplot(3,1,3);
bar(bench_time);
set(gca, 'XTick', 1)
set(gca, 'xticklabel', "primes <1E6")
colormap(summer(65));
ylabel("Run Time (s)")
xlabel("Benchmark")
print -dpng euler.png;


