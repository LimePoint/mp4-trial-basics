cpu_count=$(grep -c '^processor' /proc/cpuinfo)
echo "$cpu_count"

cpu_count="$1"
echo "Number of CPUs: $cpu_count"


action :getcpu do
  result = exec_command 'cat /scripts/get_cpu.sh'
 echo "Number of CPUs: $cpu_count"