package main

import (
	"os"
	"net"
	"fmt"
)

func main() {
	host := os.Args[1]
	lookup, _ := net.LookupHost(host)
	line := fmt.Sprintf("%s: %s", host, lookup[0])
	fmt.Println(line)
}
