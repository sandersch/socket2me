# Networking Vocabulary

## Endpoints

  * **Servers** &ndash; listen (passive)
  * **Clients** &ndash; connect (active)

### IP Addresses

 * Example: `4.2.2.2`

A IP address is an identifier used to route messages to specific hosts. You can think of this as something similar to a phone number for the machine.

#### IPv6

 * Example: `2001:0db8:85a3:0042:1000:8a2e:0370:7334`

Newer, alternative number system. IPv4 space is limited, needed to be greatly expanded. IPv4 offers 4 x 8 = 32 bits of addresses, or about 4.3b. IPv6 uses 128 bit addressing, offering 3.4 x 10^38 unique addresses. Using the tools available through Ruby, this is mostly an implementation hidden behind DNS that we don't need to worry too much about.

### DNS

 * Example: `nslookup github.com`

DNS maps alphanumeric hostnames to IP address. IP address are great for machines, but not so great for humans. DNS provides an extra layer of abstraction separating a system's name from its IP address. Like the phonebook that lets you look up someone's phone number if you know their name.

### Ports

Like the unit number of an apartment building. The IP address defines which building to enter, the port number which door to knock on. Or extension in a phone number. Each socket requires a unique combination of IP and port. Two sockets could listen on same IP address on different ports, or on IPv4 and IPv6 sockets on the same port number.
