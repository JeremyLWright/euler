#!/usr/bin/env python2

import sys, time, subprocess
import json
import argparse
import pdb
import os

def main():
    parser = argparse.ArgumentParser(description='Verify Project Euler Solutions')
    parser.add_argument('programs', metavar='P', type=str, nargs='*', help='solutions to run')
    parser.add_argument('--file', required=True, help="file to write times to")
    parser.add_argument('--answers', required=True, help="json file describing the answers")
    
    args = parser.parse_args()

    answers = json.load(open(args.answers, "r"))
    ftime = open(args.file, "w")

    for prog in args.programs:
        p = os.path.basename(prog)
        wd = os.path.dirname(os.path.abspath(prog))
        a = answers[p]
        start_time = time.time()
        proc = subprocess.Popen("./"+p, cwd=wd, stdout=subprocess.PIPE)
        result = proc.stdout.read().strip()
        end_time = time.time() - start_time
        if result == a:
            print "[{0}] Passed {1} seconds".format(p, end_time)
        else:
            print "[{0}] Failed Expected: {1} Got: {2}".format(p, a, result)
        ftime.write(p+"\t"+str(end_time)+"\n")

if __name__ == "__main__":
    main()

