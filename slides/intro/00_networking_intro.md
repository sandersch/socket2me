!SLIDE

# Socket to Me

## Networking Programming with Ruby

### Charlie Sanders

STL Ruby - June 10, 2013

!SLIDE

# Introduction to Networking Vocabulary

!SLIDE incremental

# Endpoints

  * **Servers** - listen (passive)
  * **Clients** - connect (active)

!SLIDE

# IP Addresses

 * Example: `4.2.2.2`
 * An IP address is an identifier used to route messages to specific hosts

!SLIDE incremental

# Binding to an IP address

 * `0.0.0.0` - every address
 * `127.0.0.1` - only local connections
 * `1.2.3.4` - a specific interface's IP

.notes Usually you want `0.0.0.0`. This means listen on every address. In some cases it makes sense to only accept connections from the server itself, or the "localhost". In that case, you would bind to `127.0.0.1`. Binding to this address will not allow any remote machines to connect to the socket.

!SLIDE

# IPv6

 * Example: `2001:0db8:85a3:0042:1000:8a2e:0370:7334`
 * Newer, alternative number system with support for many more hosts

.notes Newer, alternative number system. IPv4 space is limited, needed to be greatly expanded. IPv4 offers 4 x 8 = 32 bits of addresses, or about 4.3b. IPv6 uses 128 bit addressing, offering 3.4 x 10^38 unique addresses. Using the tools available through Ruby, this is mostly an implementation hidden behind DNS that we don't need to worry too much about.

!SLIDE

# DNS

 * Example: `nslookup github.com`
 * Maps an alphanumeric hostname to an IP address

.notes DNS maps alphanumeric hostnames to IP address. IP address are great for machines, but not so great for humans. DNS provides an extra layer of abstraction separating a system's name from its IP address. Like the phonebook that lets you look up someone's phone number if you know their name.

!SLIDE

# Ports

  * Example: `0.0.0.0:443`
  * Specifies a unique "channel" for each connection

.notes Like the unit number of an apartment building. The IP address defines which building to enter, the port number which door to knock on. Or extension in a phone number. Each socket requires a unique combination of IP and port. Two sockets could listen on same IP address on different ports, or on IPv4 and IPv6 sockets on the same port number.

!SLIDE small incremental

# Picking a port number

  * **0-1024**: Reserved for system use. Most of the "well-known" ports belong to this range. Usually require root access to bind.
  * **49,000-65,535**: The "ephemeral" ports. Typically range for client ports and other ports used on a temporary basis. Using these can cause problems, so servers should avoid binding to them.
  * **1025-48,999**: Generally available for use, though it is worthwhile to check that the port selected does not conflict with other programs.

[List of TCP Port Numbers on Wikipedia](http://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)

!SLIDE left

# Port numbers are not magical

Other than the previously described general classes of ports, there is nothing special about a port number. 

.notes For example, although HTTP servers typically bind to port 80, any TCP protocol can use any port number.
