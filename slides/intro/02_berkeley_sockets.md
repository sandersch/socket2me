!SLIDE

# Berkeley Sockets API

!SLIDE

# Overview

  * Originally developed in BSD 4.2 as a C interface to the TCP/IP protocol suite
  * API has approximately two dozen functions
  * A _socket_ is a file handle created by the OS that is associated with the end point of a communication channel

!SLIDE

# Features of the Socket API

!SLIDE small

# Local Context Management

  * `socket()` - factory function that allocates & initializes a socket handle & returns it to the caller
  * `close()` - Deallocates a socket handle, making it available for reuse
  * `bind()` - Associates a socket handle with a local ore remote address
  * `getsockname()` - Returns the local address to which a socket is bound
  * `getpeername()` - Returns the remote address to which a socket is bound

!SLIDE small

# Connection Establishment and Termination

  * Functions to set up and tear down connections _actively_ or _passively_
  * `listen()` - Indicates willingness to listen _passively_ for incoming client connection requests
  * `connect()` - Establishes a connection _actively_ on an initialized socket handle
  * `accept()` - A factory function that creates a new communication endpoint to service client requests
  * `shutdown()` - Selectively terminates the read-side and/or write-side stream of a bidirectional connection

!SLIDE small

# Data Transfer Mechanisms

  * Provides functions to send and receive data via socket handles
  * `send()`,`recv()` - Transmit and receive buffers of data via particular I/O handle
  * `sendto()`,`recvfrom()` - Exchanges connectionless datagrams, where each `sendto()` call provides the networking address of the recipient
  * `read()`,`write()` - Receive and transmit buffers of data via a particular handle
  * `readv()`,`writev()` - Supports scatter-read and gather-write semantics, respectively, to optimize mode switching and simplify memory management
  * `sendmsg()`,`recvmsg` - General-purpose functions that subsume the behavior of other data transfer functions

!SLIDE small

# Network Addressing

  * `gethostbyname()`,`gethostbyaddr()` - Handle network address mapping between hostnames and IPv4 addresses
  * `getipnodebyname()`,`getipnodebyaddr()` - Handle network address mapping between hostnames and IPv4/IPv6 addresses
  * `getservbyname()` - Identifies services by their humanly readable names

!SLIDE small

# Portability and Availability

  * Written in C but most languages have bindings
  * Nearly ubiquitous OS support
  * API operates one layer above the protocol implementation
  * **You can use sockets without having to know the details of the underlying protocol**
