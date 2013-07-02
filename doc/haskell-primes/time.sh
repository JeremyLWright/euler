START=$(date +%s.%N)
./$1 100000
END=$(date +%s.%N)
echo -e "$1\t$START\t$END" >> compare.dat
