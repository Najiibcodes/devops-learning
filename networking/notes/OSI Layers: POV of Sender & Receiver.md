# OSI Layers: POV of Sender & Receiver

### Introduction

In this example, we'll explore how a **POST request** sent by a client to an HTTPS web page traverses the **OSI layers**, both from the **sender’s** and **receiver’s** perspective. This will give you a clear understanding of how the **OSI model** is applied in real-world networking.

---

### Sender's Perspective: OSI Layers

Let's break down what happens at each layer when a **POST request** is sent:

1. **Application Layer** (Layer 7):
   - The client **sends a POST request** with some **JSON data** to an HTTPS server.
   - The **data** and **headers** are prepared for transmission.

2. **Presentation Layer** (Layer 6):
   - The **JSON data** is **serialized**, meaning it is converted into a format (like flat byte strings) that can be transmitted over the network.

3. **Session Layer** (Layer 5):
   - A **session** is established to handle the connection between the client and the server.
   - For secure communication via **HTTPS**, the **TLS** session is established.

4. **Transport Layer** (Layer 4):
   - The transport layer manages **reliable data transfer** using **TCP**.
   - A **TCP handshake** occurs (SYN → SYN-ACK → ACK) to establish a connection on **Port 443** (used for HTTPS).

5. **Network Layer** (Layer 3):
   - The **TCP segment** is placed into an **IP packet**.
   - This packet contains the **source and destination IP addresses**, ensuring the data knows where it is going and where it came from.

6. **Data Link Layer** (Layer 2):
   - The IP packet is encapsulated into a **frame**.
   - This frame contains the **source and destination MAC addresses**, helping the packet find its way across local networks.

7. **Physical Layer** (Layer 1):
   - The data is converted into a **physical signal** to be transmitted over the network.
   - Depending on the medium, this could be a **radio signal** (Wi-Fi), an **electric signal** (Ethernet), or **light** (Fiber Optics).

---

### Receiver's Perspective: OSI Layers

Now let’s look at what happens when the **receiver** gets the POST request:

1. **Physical Layer** (Layer 1):
   - The **incoming signal** (radio, electric, or light) is received and **converted** into **digital bits** that the computer can process.

2. **Data Link Layer** (Layer 2):
   - The digital bits are assembled into a **frame**.
   - This layer ensures the data can travel over the **local network**.

3. **Network Layer** (Layer 3):
   - The frame is converted into an **IP packet**.
   - The **source and destination IP addresses** are verified.

4. **Transport Layer** (Layer 4):
   - The IP packet is reassembled into **TCP segments**.
   - The **TCP handshake** confirms a valid and secure connection.

5. **Session Layer** (Layer 5):
   - The session layer ensures the session is valid and secure. This layer typically comes into play for managing ongoing sessions or handshakes.

6. **Presentation Layer** (Layer 6):
   - The data is prepared for the **application layer**.
   - **Decryption** occurs (if necessary), and the data is converted into a format like **JSON** that the application can use.

7. **Application Layer** (Layer 7):
   - The **POST request** reaches its intended application.
   - The content of the request is processed and handled by the service.

---

### Summary

This is a simplified view of how the **OSI layers** function when a **POST request** is sent and received. Starting at the **Application Layer** and working its way down to the **Physical Layer**, data is prepared for transmission and routed across the network. The receiving side reverses this process, working its way from the **Physical Layer** back up to the **Application Layer**.

While real-world scenarios can be more complex, this example provides a fundamental understanding of how the OSI model is applied to **network communication**.

---

### Key Takeaways
- The **sender** packages data layer by layer, ensuring it is ready for transmission over the network.
- The **receiver** reverses the process, unpacking data to ensure it reaches the correct application.
- This example illustrates the real-world use of **TCP**, **IP**, **MAC addresses**, and **physical transmission**, among other key concepts.
