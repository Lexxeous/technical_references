<!-- DNS Management -->

# <img src="../../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's DNS Management: <img src="../../.pics/Protocols/DNS/dns_logo.png" width="130"/>
### Manage DNS Server Infastructure.

#### General DNS Information.

DNS stands for "Domain Naming System".<br>
<br>
A **registrar** is a commercial entity that verifies the uniqueness of a domain name and enters the domain name into the DNS database. Prior to 1999, a single registrar (Network Solutions) had a monopoly on domain name registration. Now the Internet Corporation for Assigned Names and Numbers (ICANN) manages and accredits many different registrars. A full list is avaliable [here](https://www.internic.net).

#### DNS Hierarchy.

No single DNS server has all the mappings for all the hosts connected to the Internet. Instead, the mappings are distributed across all DNS servers.

 * Root
 * Top-Level Domain (TLD)
 * Authoritative
 * Local (default name server)

**Root DNS servers** are separated by countries and provide the IP addresses of the TLD DNS servers.<br>
**TLD DNS servers** are separated by common extensions such as: `.com`, `.org`, `.edu`, `.net`, & `.gov`. As well as country specific extentions such as: `uk`, `fr`, `ca`, & `jp`. TLD DNS servers provide the IP addresses for Authoritative DNS servers.<br>
**Authoritative DNS servers** are separated by organizations that provide publically accessible hosts such as Web (all types of Web applications) and mail servers. Most companies and universities implement and maintain their own primary and secondary (backup) authoritative DNS server(s).<br>
**Local DNS servers** don't explicitly belong to the heirarchy of DNS servers. Each ISP (resedential and institutional) has a local DNS server. When a host connects to an ISP, the ISP provides provides the host with the IP address of one or more of its local DNS servers (typically through Dynamic Host Configuration Protocol (DHCP)).

<img src="../../.pics/Protocols/DNS/dns_hierarchy.png" width="500"/>

#### Recursive Queries.

**Recursive queries** run a full "loop" through a defined path from requesting host to response host (endsystem to endsystem); the path passes forward and back though other DNS servers before returning back to the requesting host and its local DNS server.

<img src="../../.pics/Protocols/DNS/recursive_query.png" width="300"/>

#### Iterative Queries.

**Iterative queries** pass information from the DNS heirarchy to the requesting host's local DNS server one at a time.

<img src="../../.pics/Protocols/DNS/iterative_query.png" width="300"/>

#### DNS Message Format.

Both the query and reply messages have the same format.

 * Headers
 * Questions
 * Answers
 * Authorities
 * Additionals

The **headers section** is the first 12 bytes of a DNS message. Each header is 2 bytes large (one word, 16 bits). The DNS message identifier (ID) is also copied into the reply message to a query.<br>
The **questions section** contains information about the query that is being made: the name and type that is being queried.<br>
The **answers section**, in a reply to the DNS server query, contains the RRs for the name that was originally queried. A reply can return multiple RRs in the answer, since a hostname can have multiple IP addresses.<br>
The **additionals section** can contain other helpful records that are relative to the reply's answers section.<br>

<img src="../../.pics/Protocols/DNS/dns_message_format.png" width="500"/>


#### Resource Records (RRs).

(Name, Value, Type, TLL)

**Type A:** Name is a hostname and Value is the IP address for the hostname.

 * (relay1.bar.foo.com, 145.37.93.126, A)

**Type NS:** Name is a domain (such as foo.com) Value is the host name of an authoritative DNS server that knows how to obtain the IP addresses for hosts in the domain.

 * (foo.com, dns.foo.com, NS)

**Type CNAME:** Value is a canonical hostname for the alias hostname Name.

 * (foo.com, relay.bar.foo.com, CNAME)

**Type MX:** Value is a canonical name of a mail server that has an alias hostname Name. MX records allow the hostnames of mail servers to have simple aliases.

 * (foo.com, mail.bar.foo.com, MX)





