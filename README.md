# Active Directory Toolset

A curated collection of essential tools for Active Directory enumeration, exploitation, lateral movement, and post-exploitation. This toolset aggregates PowerShell scripts, C# binaries, and Python utilities commonly used in Red Team operations and Penetration Testing.

## 📂 Setup
```bash
chmod +x setup.sh
./setup.sh
```

## 📂 Tool Inventory

| Tool Name | Location | Category & Description |
| :--- | :--- | :--- |
| **ADExplorer** | `./ADExplorer.exe` | **Enumeration:** Microsoft Sysinternals tool used to visualize the AD structure, navigate objects, and create snapshots for offline analysis. |
| **ADModule** | `./ADModule/` | **Management:** A DLL library used to run Active Directory PowerShell commands (e.g., `Get-ADUser`) on systems where RSAT is not installed. |
| **Ghostpack** | `./Ghostpack/` | **Post-Exploitation (C#):** A collection of compiled C# binaries including:<br>• **Rubeus:** Kerberos attacks (AS-REP Roasting, Ticket requests).<br>• **Certify:** ADCS abuse and enumeration.<br>• **Seatbelt:** Safety checks and system enumeration.<br>• **SharpUp:** Privilege escalation checks.<br>• **SharpDump:** LSASS memory dumping. |
| **Internal-Monologue** | `./Internal-Monologue/` | **Credential Access:** Retrieves NetNTLMv1 challenge-response hashes from memory without injecting code, often avoiding AV detection compared to Mimikatz. |
| **Kerbrute** | `./kerbrute_*` | **Enumeration:** A tool to quickly brute-force and enumerate valid Active Directory accounts through Kerberos Pre-Authentication (faster and stealthier). |
| **Krbrelayx** | `./Krbrelayx/` | **Relay Attacks:** Toolkit for Kerberos relaying. Includes `dnstool.py` for DNS manipulation and `printerbug.py` for coercion. |
| **Ligolo-ng** | `./Ligolo-ng/` | **Pivoting/Tunneling:** An advanced tunneling tool using TUN interfaces. Contains Agents (Windows/Linux) and Proxy servers to facilitate lateral movement across network segments. |
| **Mimikatz** | `./Mimikatz/` | **Credential Access:** The standard tool for extracting plain-text passwords, hashes, PIN codes, and Kerberos tickets from memory (LSASS). |
| **PassTheCert** | `./PassTheCert/` | **ADCS Abuse:** A tool (Python & C#) that allows authenticating to a Domain Controller using stolen or forged certificates. |
| **PetitPotam** | `./PetitPotam/` | **Coercion:** Exploits the MS-EFSRPC protocol to coerce a target (usually a DC) to authenticate to an attacker-controlled machine (NTLM relaying). |
| **Powermad** | `./Powermad/` | **Exploitation:** PowerShell tools for exploiting MachineAccountQuota (adding machine accounts) and dynamic DNS updates. |
| **PowerSploit** | `./PowerSploit/` | **Framework:** A comprehensive PowerShell penetration testing framework. Includes:<br>• **PowerView:** (`Recon/`) The industry standard for AD reconnaissance.<br>• **PowerUp:** (`Privesc/`) Local privilege escalation checks. |
| **PsExec** | `./PsExec/` | **Lateral Movement:** A PowerShell implementation of the Sysinternals PsExec tool. Executes commands on remote systems via SMB. |
| **SharpHound** | `./SharpHound/` | **Reconnaissance:** The data collector for **BloodHound**. It gathers permissions, sessions, and trust relationships from the domain. |
| **SpoolSample** | `./SpoolSample/` | **Coercion:** Known as the "Printer Bug". Forces a Windows host to authenticate to an arbitrary target via the MS-RPRN protocol. |
| **OpenSSL** | `./Win64OpenSSL...` | **Utility:** Windows binary for OpenSSL, useful for certificate conversion and cryptographic operations during ADCS attacks. |

⚠️ Disclaimer
For Educational and Authorized Security Testing Purposes Only. Usage of these tools for attacking targets without prior mutual consent is illegal. It is the end user's responsibility to obey all applicable local, state and federal laws. Developers assume no liability and are not responsible for any misuse or damage caused by this program.
