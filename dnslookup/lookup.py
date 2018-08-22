#!/usr/bin/env python

import socket
import sys

hostname = sys.argv[1]
print hostname + ': ' +  socket.gethostbyname(hostname)
