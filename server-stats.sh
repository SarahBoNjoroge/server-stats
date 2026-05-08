#!/bin/bash

echo "============================="
echo "   SERVER PERFORMANCE STATS  "
echo "============================="
echo ""

echo "--- CPU USAGE ---"
top -bn1 | grep "Cpu(s)" | awk '{print "Used: " $2 "%" "  |  Idle: " $8 "%"}'
echo ""

echo "--- MEMORY USAGE ---"
free -h | awk 'NR==2 {print "Total: " $2 "  |  Used: " $3 "  |  Free: " $4}'
echo ""

echo "--- DISK USAGE ---"
df -h / | awk 'NR==2 {print "Total: " $2 "  |  Used: " $3 "  |  Free: " $4 "  |  Use%: " $5}'
echo ""

echo "--- TOP 5 PROCESSES BY CPU ---"
ps aux --sort=-%cpu | awk 'NR<=6 {printf "%-10s %-6s %-6s %s\n", $1, $2, $3, $11}' | column -t
echo ""

echo "--- TOP 5 PROCESSES BY MEMORY ---"
ps aux --sort=-%mem | awk 'NR<=6 {printf "%-10s %-6s %-6s %s\n", $1, $2, $4, $11}' | column -t
echo ""

echo "============================="
echo "        DONE"
echo "============================="
