action :use_logging do                                 
        cpu_count=$(grep -c '^processor' /proc/cpuinfo)
        echo "$cpu_count" 
  end