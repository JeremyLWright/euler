ts = dlmread("dist/compile.dat");

cs=ts(:,2); %Compile Start Times
cf=ts(:,3); % Compile Stop Times
rs=ts(:,4); % Run Start Times
rf=ts(:,5); % Run Stop Times
c = cf-cs;     % Compile times
r = rf - rs;  % Run times

lr = sum(r);
lc = sum(c);
slc = sprintf("%.2f s", lc);
slr = sprintf("%.2f s", lr);
total = sprintf("Total: %.2f s", lr + lc)
subplot(2,2,1);
pie([lr, lc], labels={slr, slc});
title("Jeremy's Project Euler");
xlabel(total);
legend("Runtime", "Compile");

subplot(2,2,2);
t = [nnz(r(r<=0.1)), nnz(r(r>0.1 & r<=1)), nnz(r(r>1 & r <10)), nnz(r(r>=10))];
bar(t)
set(gca, 'XTick', [1 2 3 4])
set(gca, 'xticklabel', "<= 100ms | <= 1 s | <= 10 s | > 10 s")
xlabel("Runtimes (s)");

subplot(2,2,3);
t = [1:size(r)(1)];
plot(t, r, '.', t, c, '-');
legend("Run", "Compile");
colormap(summer (64))
set(gca, 'yscale', 'log');
ylabel("Runtime (s)")
xlabel("Problem #")

subplot(2,2,4);
offset = cs(1,1);
cum=sort([cs-offset;rs-offset;rf(size(rf)(1))-offset]);
t=linspace(1,size(r),size(cum)(1))';
plot(t, cum);
legend("Compile -> Run");
xlabel("Problem #");
ylabel("Cumulative Time (s)");


# equivalent to "orient tall" 
papersize = get (gcf, "papersize"); # presently the paper units must be inches 
border = 0.25; 
set (gcf, "paperposition", [border, border, (papersize - 2*border)]) 

# To change orientation 
orientation = get (gcf, "paperorientation"); 
papersize = get (gcf, "papersize"); 
paperposition = get (gcf, "paperposition"); 
print -landscape -dpdf dist/euler.pdf;
