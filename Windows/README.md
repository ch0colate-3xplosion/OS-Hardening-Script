# Windows 10/11 Hardening Script
This PowerShell script is meant to harden the Windows 10/11 Operating System

### TO DO LIST
- Add PowerShell script to enable Antivirus
- Add BitLocker encryption and move recoveryfile key to USB key
- Add Enable SMB Signing
- Add Disable SMBv1 
- Add Enable SMBv2
- Add Continous Update Schedule
- Add Continous Virus Update Schedule
- Add Parameters to Windows Group Policy 
  a.) Monitor Changes to GPO
  b.) Prevent auto-restarts with logged on users during scheduled update installations
  c.) Do not store LAN Manager hash values
- Add Options for CIS Domain Windows Operating System Hardening
  I.) Prevent Kerberoasting
  II.) Do not allow users Control Panel Access
  III.) Do not allow users Command Prompt Access
  IV.) Do not allow users to access Registry Key
  V.) Do not allow users access to Security Account Information
  VI.) Do not allow users to change system time
  VII.) Do not allow users access to settings
  VIII.) Do not allow storage of passwords and credentials for network authentication
  XI.) Do not store Microsoft Edge/Fire Fox/Chrome Cache of History or Files
- Research on preventing Telemetry GPO
- Add options to uninstall bloatware software such as Xbox, Solitare, and any other software
