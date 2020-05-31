#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo "Need root privilege!!"
    exit 0
fi

for ((i=0; i<50; i++)); do
    start=$(date +%s.%N)
    echo ${1:2:-3}
    perf record -e intel_pt/ptw/u $1
    perf script -D > ${1:2:-3}.dump
    python ../PtwriteTNT.py -i ${1:2:-3}.dump -o ${1:2:-3}.txt
    end=$(date +%s.%N)
    runtime=$( echo "$end - $start" | bc -l )
    echo $runtime >> ${1:2:-3}-time.txt
done

#echo ${1:2:-3}
#perf record -e intel_pt/ptw/u $1
#perf script -D > ${1:2:-3}.dump
#python ../PtwriteTNT.py -i ${1:2:-3}.dump -o ${1:2:-3}.txt
