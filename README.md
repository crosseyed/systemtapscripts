# Examples

Trace system calls
```bash
stap strace.stp -c "cat /etc/passwd"
```

Trace glibc socket calls
```bash
stap trace-socket.stp execname wget
```
