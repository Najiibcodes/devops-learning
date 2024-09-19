# How Does DNS Work?

### Introduction to DNS Processes

In this section, we’ll go through **DNS processes**, including **domain resolution**, the **DNS hierarchy**, and how DNS queries walk through the DNS tree. Understanding this is crucial for troubleshooting and managing DNS effectively.

---

### DNS Resolution

**DNS resolution** is the process of converting **domain names** (like `www.google.com`) into **IP addresses** (like `142.250.180.14`).

---

### DNS Hierarchy

The **DNS hierarchy** operates from the **top** (the DNS root) to the **bottom** (the specific domain). Here’s how DNS works, step-by-step:

1. **DNS Root**:
   - The **DNS root** is at the top of the hierarchy. It doesn’t store details about specific domains but keeps high-level information about where to find the **Top-Level Domains (TLDs)** below it.
   
2. **TLDs (Top-Level Domains)**:
   - TLDs are domain extensions like **.com**, **.org**, and **.net**. For example, **.com** is managed by **VeriSign**. TLDs store information about domains within their scope, like employees in a department.

3. **Authoritative Name Servers**:
   - These servers store **detailed DNS records** for specific domains (e.g., `google.com` and `example.com`).
   - Authoritative name servers hold the DNS zone files that contain the domain’s **IP addresses**, **mail servers**, and other information.

4. **Domains**:
   - A domain like `google.com` has its own **zone file**, which includes all the DNS records for the domain, such as **A records** and **MX records**.

---

### Example: What Happens When You Type `google.com` into a Browser?

1. **User Action**:
   - You type `google.com` into your browser.
