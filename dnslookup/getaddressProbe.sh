#!/bin/bash

system_stap="/usr/bin/stap"

_getaddrInfo () {
  /usr/bin/stap -e '
probe process("/lib/x86_64-linux-gnu/libc.so.6").function("getaddrinfo"),
      process("/lib/x86_64-linux-gnu/libc.so.6").function("gethostbyname")
{
  printf("| %-15s| %-15s| %-7d| %-35s |\n", execname(), probefunc(), pid(), kernel_string(pointer_arg(1)))
}'
}

echo ""
printf "| %-15s| %-15s| %-7s| %-35s |\n" "Process" "Function" "PID" "Destination Name"
echo "|----------------|----------------|--------|-------------------------------------|"


while true ; do
  _getaddrInfo
done
