# Windows Post Configuration Cookbook (optum_iaas_win_vmcfg)

### Windows Post Configuration Cookbook
Introduction:
  Windows 2012 R2 Self/Full-Support Post Configuration Cookbook.

### List of what gets configured
Virtual Machine Post Configurations
  1. Windows Services
    1a. wuauserv (Windows Update) - Sets to Manual
    b. NlaSvc (Network Location Awareness - Sets to Manual
    c. browser (Computer Browser) - Sets to disable
    d. BITS (Background Intelligent Transfer Service) - Sets to Manual
    e. hidserv (Human Interface Device Access) - Sets to disable
    f. PolicyAgent (IPsec Policy Agent Service) - Sets to Auto
    g. pla (Performance Logs & Alerts) - Sets to Auto
    h. Spooler (Print Spooler) - Sets to Manual
    i. RasAuto (Remote Access Auto Connection Manager) - Sets to Auto
    j. RasMan (Remote Access Auto Connection Manager) - Sets to Manual
    k. TapiSrv (Telephony) - Sets to Manual
    l. msiserver (Windows Installer) - Start service
  2. Boot Configuration Data Editor - Sets time to display list of OS to 5 seconds
  3. Sets hibernate off
  4. Set Day Light Saving
  5. Disables LUA

## Requirements

### Platforms

Windows Version                     
------------------------
Windows Server 2012                 
Windows Server 2012R2               

### Chef

- Chef 12.6+

### Cookbooks

Snow Inventory Client - Cookbook: snow-client
Add server to domain and OU - ad-join::
