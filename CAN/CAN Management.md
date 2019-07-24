<!-- CAN Management.md -->

# <img src="../.pics/Lexxeous/lexx_headshot_clear.png" width="100px"/> Lexxeous's CAN Management: <img src="../.pics/CAN/can_logo.png" width="100"/>

> For some details about CAN bus, time quanta explaination, and example CAN programming/configuration see the playlist [Controller Area Network (CAN) Programming Tutorial Step by Step](https://www.youtube.com/playlist?list=PLERTijJOmYrApVZqiI6gtA8hr1_6QS-cs) by **Fastbit Embedded Brain Academy**.

### What is a Controller Area Network (CAN)?
A Controller Area Network (CAN bus) is a robust vehicle bus standard designed to allow microcontrollers and devices to communicate with each other in applications without a host computer. It is a message-based protocol, designed originally for multiplex electrical wiring within automobiles to save on copper, but is also be used in many other contexts.

Development of the CAN bus started in 1983 at Robert Bosch GmbH. The protocol was officially released in 1986 at the Society of Automotive Engineers (SAE) conference in Detroit, Michigan. The first CAN controller chips, produced by Intel and Philips, came on the market in 1987. Released in 1991 the Mercedes-Benz W140 was the first production vehicle to feature a CAN-based multiplex wiring system.

Bosch published several versions of the CAN specification and the latest is CAN 2.0 published in 1991. This specification has two parts; part A is for the standard format with an 11-bit identifier, and part B is for the extended format with a 29-bit identifier. A CAN device that uses 11-bit identifiers is commonly called CAN 2.0A and a CAN device that uses 29-bit identifiers is commonly called CAN 2.0B. These standards are freely available from Bosch along with other specifications and white papers.

In 1993, the International Organization for Standardization (ISO) released the CAN standard ISO 11898 which was later restructured into two parts; ISO 11898-1 which covers the data link layer, and ISO 11898-2 which covers the CAN physical layer for high-speed CAN. ISO 11898-3 was released later and covers the CAN physical layer for low-speed, fault-tolerant CAN. The physical layer standards ISO 11898-2 and ISO 11898-3 are not part of the Bosch CAN 2.0 specification. These standards may be purchased from the ISO.

Bosch is still active in extending the CAN standards. In 2012, Bosch released CAN FD 1.0 or CAN with Flexible Data-Rate. This specification uses a different frame format that allows a different data length as well as optionally switching to a faster bit rate after the arbitration is decided. CAN FD is compatible with existing CAN 2.0 networks so new CAN FD devices can coexist on the same network with existing CAN devices.

CAN bus is one of five protocols used in the on-board diagnostics (OBD)-II vehicle diagnostics standard. The OBD-II standard has been mandatory for all cars and light trucks sold in the United States since 1996. The EOBD standard has been mandatory for all petrol vehicles sold in the European Union since 2001 and all diesel vehicles since 2004.

CAN bus was created to fill the need of a reliable, robust, multi-master communication network. With a communication network (especially in automotive) that has multiple nodes and sensors, a noisy environment is created. This eliminates any use of wireless comunications for increased risk of data corruption and loss. CAN bus is a simple protocol with unique features, but does not come without its disadvantages.


### Advantages of CAN Bus
  - High Noise Immunity
    - Immune to ambient noise from the application area
    - Differential signaling
    - Balanced signaling
      - current flowing in each signal line is equal but opposite in direction, resulting in electric field-canceling that is the key to low noise signal emissions (especially in twised pair cabling)
  - Error Confinement
  - Error Detection
  - Low Cost
  - Automatic Re-transmission of Faulty Messages
  - Automatic Disconnect from Faulty Nodes
  - Multi-Master Protocol
  - 1 Mbit/sec Communication Speed
  - Broadcast Network
    - Can add devices even when the CAN is in operation (hot-plugable)
    - May or may not be central control nodes
  - Zero-Driven
    - Priority dominant bit 0
    - Non-priority recessive bit 1
  - 120Ω Terminating Resistors
    - This is not an advantage, but rather a small disadvantage
  - Carrier-Sense Multiple-Access with Collision Detection and Arbitration on Message Priority
  - (CSMA/CD+AMP)
    - CSMA means that the nodes must wait for a specific period of bus inactivity (5 or more recessive bits in a row?) to start transmitting
    - CD+AMP means that collisions are resolved throuh bit-wise arbitration
      - Nodes also "hear-back" what they put on the bus. If they "hear" a potential difference of 2V (dominant 0) when they expect a potetial difference of 0V (recessive 1) then the node understand that it lost the arbitration from bit N and enters *listen only mode* and stops transmitting.

### Disadvantages of CAN Bus

### CAN Bus Physical Layer

### CAN 2.0A

### CAN 2.0B

### General CAN Bus Frame
  - IDE is 0 for 11 bit and 1 for 29 bit message IDs

### CAN Bus Frames

#### Data Frame

##### Start of Frame (SOF) Field
##### Arbitration Field
##### Control Field
##### Data Field
##### CRC Field
##### ACK Field
##### End of Frame (EOF) Field
##### Interframe Gap (ITM)

#### Remote Frame

#### Error Frame

#### Overload Frame

### Time Quanta
For time quanta table calculation/generation go [here](http://www.bittiming.can-wiki.info/).
SJW - Syncronization Jump Width = SYNC_SEG = 1 tq (for most applications)


### Acceptance Filter
  - Mask Mode
    - Apply compare bits in the mask register
    - Apply rule in the identifier register
  - List/ID Mode
    - List of exact message IDs you want to accept