#!/bin/bash
top -b -n 1 | grep "Cpu(s)"
awk '/cpu /{u=$2+$4; t=$2+$4+$5; if (NR>1){printf "CPU usage: %.2f%%\n", 100*(u-pu)/(t-pt);}; pu=u; pt=t}' <(grep 'cpu >
df -h / | awk 'NR==2 {print "Использовано:", $3, "($5)", "| Свободно:", $4}'
ps -Ao user,pid,pcpu,comm --sort=-pcpu | head -n 6
ps -eo pid,comm,%mem,rss --sort=-%mem | head -n 6
