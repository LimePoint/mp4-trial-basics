cpu_count=$(grep -c '^processor' /proc/cpuinfo)
echo "$cpu_count"
