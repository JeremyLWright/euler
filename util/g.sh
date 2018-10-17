for i in $(ls *.hs); do
	p=$(basename $i .hs)
	echo "  $p:\n    <<: *p001\n    main: $i\n"
done
